/*caExample.c*/
#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <stdint.h>
#include <unistd.h>
#include <math.h>
#include <time.h>
#include "cadef.h"

#define FAMAX  100000
#define FASCALE 0.00195
#define PREFIX "lab-BI{BPM:1}"

chid inPV[30], outPV[30];

double BuffA[FAMAX],BuffB[FAMAX],BuffC[FAMAX],BuffD[FAMAX],BuffS[FAMAX];
double BuffX[FAMAX],BuffY[FAMAX];

int initialize_pvs()
{
    int status;
    char pvname[100];

    status = ca_context_create(ca_disable_preemptive_callback);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:A:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:B:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:C:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:D:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:S:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:X:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Y:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[6]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Cnt:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[7]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:WfmLen-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[8]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:WfmOff-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[9]);

    strcpy(pvname,PREFIX);
    strcat(pvname,"DMA:FALen-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[11]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Trig:TsSec-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[12]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"EVR:Trig:Cnt-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[14]);

    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:A-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:B-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:C-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:D-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Sum-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:X-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Y-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[6]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Time-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[7]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Cnt-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[8]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Aavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[12]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Bavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[13]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Cavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[14]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Davg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[15]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Savg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[16]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Xavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[17]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Yavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[18]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Asig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[19]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Bsig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[20]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Csig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[21]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Dsig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[22]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Ssig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[23]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Xsig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[24]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:Ysig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[25]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"EVR:TrigDate-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[26]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:LoopTime-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[27]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"FA:LoopCount-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[28]);

    ca_pend_io(5);
    return(status);
}

int main()
{
    int stat=0, wfmLen=200, wfmOff=0, oldwfmLen=-1, oldwfmOff=-1;
    int i, oldtrigCnt=0, process=0, buffLen, tsec;
    int loopCounter=0, etime, trigCnt;
    float tm;
    double Awfm[20000],Bwfm[20000],Cwfm[20000],Dwfm[20000];
    double Xwfm[20000],Ywfm[20000],Swfm[20000],Twfm[20000];
    double Asum,Bsum,Csum,Dsum,Aavg,Bavg,Cavg,Davg;
    double Xsum,Ysum,Ssum,Xavg,Yavg,Savg;
    double Asig,Bsig,Csig,Dsig,Ssig,Xsig,Ysig;

    time_t evrTime;
    struct tm ts;
    char tmstr[80];

    clock_t loopStart;
    clock_t loopEnd;

    while(1==1){
        loopStart = clock();
        if(stat!=1){
            stat = initialize_pvs();
            loopCounter=0;
            usleep(1000000);
        }
        process = 0;
        stat = stat*ca_get(DBR_LONG,inPV[14],(void *)&trigCnt);
        stat = stat*ca_get(DBR_LONG,inPV[11],(void *)&buffLen);
        stat = stat*ca_get(DBR_LONG,inPV[8],(void *)&wfmLen);
        stat = stat*ca_get(DBR_LONG,inPV[9],(void *)&wfmOff);
        ca_pend_io(5);

        if(trigCnt!=oldtrigCnt){
            usleep(1100000);
            oldtrigCnt = trigCnt;
            stat = stat*ca_array_get(DBR_DOUBLE,buffLen,inPV[0],(void *)&BuffA);
            stat = stat*ca_array_get(DBR_DOUBLE,buffLen,inPV[1],(void *)&BuffB);
            stat = stat*ca_array_get(DBR_DOUBLE,buffLen,inPV[2],(void *)&BuffC);
            stat = stat*ca_array_get(DBR_DOUBLE,buffLen,inPV[3],(void *)&BuffD);
            stat = stat*ca_array_get(DBR_DOUBLE,buffLen,inPV[4],(void *)&BuffS);
            stat = stat*ca_array_get(DBR_DOUBLE,buffLen,inPV[5],(void *)&BuffX);
            stat = stat*ca_array_get(DBR_DOUBLE,buffLen,inPV[6],(void *)&BuffY);
            stat = stat*ca_get(DBR_LONG,inPV[12],(void *)&tsec);
            ca_pend_io(5);
            ca_flush_io();
            process = 1;
        }

        if(wfmLen!=oldwfmLen){
            if(wfmLen>buffLen || wfmLen>20000 || wfmLen<100){
                if(wfmLen>buffLen) wfmLen = buffLen;
                if(wfmLen>20000) wfmLen = 20000;
                if(wfmLen<100) wfmLen=100;
                stat = stat*ca_put(DBR_LONG,inPV[8],(void *)&wfmLen);
                ca_pend_io(5);
            }
            oldwfmOff = oldwfmOff - 1;  // Force the next if block to execute
            oldwfmLen = wfmLen;
            process = 1;
        }
        if(wfmOff!=oldwfmOff){
            if((wfmLen+wfmOff)>buffLen || wfmOff<0){
                if((wfmLen+wfmOff)>buffLen) wfmOff = buffLen-wfmLen;
                if(wfmOff<0) wfmOff = 0;
                stat = stat*ca_put(DBR_LONG,inPV[9],(void *)&wfmOff);
                ca_pend_io(5);
            }
            oldwfmOff = wfmOff;
            process = 1;
        }
        if(process==1){
//            printf("Processing FA data\n");
            Asum = 0;
            Bsum = 0;
            Csum = 0;
            Dsum = 0;
            Ssum = 0;
            Xsum = 0;
            Ysum = 0;
            for(i=wfmOff;i<wfmOff+wfmLen;i++){
                Awfm[i-wfmOff] = BuffA[i]*FASCALE;
                Asum = Asum + BuffA[i]*FASCALE;
                Bwfm[i-wfmOff] = BuffB[i]*FASCALE;
                Bsum = Bsum + BuffB[i]*FASCALE;
                Cwfm[i-wfmOff] = BuffC[i]*FASCALE;
                Csum = Csum + BuffC[i]*FASCALE;
                Dwfm[i-wfmOff] = BuffD[i]*FASCALE;
                Dsum = Dsum + BuffD[i]*FASCALE;
                Swfm[i-wfmOff] = BuffS[i]*FASCALE;
                Ssum = Ssum + BuffS[i]*FASCALE;
                Xwfm[i-wfmOff] = BuffX[i]*0.001;
                Xsum = Xsum + BuffX[i]*0.001;
                Ywfm[i-wfmOff] = BuffY[i]*0.001;
                Ysum = Ysum + BuffY[i]*0.001;
                tm = (i-wfmOff)*0.100384246;   //Time in milliseconds.
                Twfm[i-wfmOff] = tm;
            }
            Aavg = Asum/wfmLen;
            Bavg = Bsum/wfmLen;
            Cavg = Csum/wfmLen;
            Davg = Dsum/wfmLen;
            Xavg = Xsum/wfmLen;
            Yavg = Ysum/wfmLen;

            Asum = 0;
            Bsum = 0;
            Csum = 0;
            Dsum = 0;
            Ssum = 0;
            Xsum = 0;
            Ysum = 0;
            for(i=0;i<wfmLen;i++){
                Asum = Asum + (Awfm[i]-Aavg)*(Awfm[i]-Aavg);
                Bsum = Bsum + (Bwfm[i]-Bavg)*(Bwfm[i]-Bavg);
                Csum = Csum + (Cwfm[i]-Cavg)*(Cwfm[i]-Cavg);
                Dsum = Dsum + (Dwfm[i]-Davg)*(Dwfm[i]-Davg);
                Ssum = Ssum + (Swfm[i]-Savg)*(Swfm[i]-Savg);
                Xsum = Xsum + (Xwfm[i]-Xavg)*(Xwfm[i]-Xavg);
                Ysum = Ysum + (Ywfm[i]-Yavg)*(Ywfm[i]-Yavg);
                Awfm[i] = Awfm[i] - Aavg;
                Bwfm[i] = Bwfm[i] - Bavg;
                Cwfm[i] = Cwfm[i] - Cavg;
                Dwfm[i] = Dwfm[i] - Davg;
                Swfm[i] = Swfm[i] - Savg;
            }
            Asig = sqrt(Asum/wfmLen);
            Bsig = sqrt(Bsum/wfmLen);
            Csig = sqrt(Csum/wfmLen);
            Dsig = sqrt(Dsum/wfmLen);
            Ssig = sqrt(Ssum/wfmLen);
            Xsig = sqrt(Xsum/wfmLen);
            Ysig = sqrt(Ysum/wfmLen);

            evrTime = (time_t)tsec;
            ts = *localtime(&evrTime);
            strftime(tmstr,sizeof(tmstr), "%b %d %Y %H:%M:%S %Z", &ts);
            stat = stat*ca_put(DBR_STRING,outPV[26],(void *)&tmstr);
            stat = stat*ca_array_put(DBR_DOUBLE,wfmLen,outPV[0],Awfm);
            stat = stat*ca_array_put(DBR_DOUBLE,wfmLen,outPV[1],Bwfm);
            stat = stat*ca_array_put(DBR_DOUBLE,wfmLen,outPV[2],Cwfm);
            stat = stat*ca_array_put(DBR_DOUBLE,wfmLen,outPV[3],Dwfm);
            stat = stat*ca_array_put(DBR_DOUBLE,wfmLen,outPV[4],Swfm);
            stat = stat*ca_array_put(DBR_DOUBLE,wfmLen,outPV[5],Xwfm);
            stat = stat*ca_array_put(DBR_DOUBLE,wfmLen,outPV[6],Ywfm);
            stat = stat*ca_array_put(DBR_DOUBLE,wfmLen,outPV[7],Twfm);
            stat = stat*ca_put(DBR_DOUBLE,outPV[12],(void *)&Aavg);
            stat = stat*ca_put(DBR_DOUBLE,outPV[13],(void *)&Bavg);
            stat = stat*ca_put(DBR_DOUBLE,outPV[14],(void *)&Cavg);
            stat = stat*ca_put(DBR_DOUBLE,outPV[15],(void *)&Davg);
            stat = stat*ca_put(DBR_DOUBLE,outPV[16],(void *)&Savg);
            stat = stat*ca_put(DBR_DOUBLE,outPV[17],(void *)&Xavg);
            stat = stat*ca_put(DBR_DOUBLE,outPV[18],(void *)&Yavg);
            stat = stat*ca_put(DBR_DOUBLE,outPV[19],(void *)&Asig);
            stat = stat*ca_put(DBR_DOUBLE,outPV[20],(void *)&Bsig);
            stat = stat*ca_put(DBR_DOUBLE,outPV[21],(void *)&Csig);
            stat = stat*ca_put(DBR_DOUBLE,outPV[22],(void *)&Dsig);
            stat = stat*ca_put(DBR_DOUBLE,outPV[23],(void *)&Ssig);
            stat = stat*ca_put(DBR_DOUBLE,outPV[24],(void *)&Xsig);
            stat = stat*ca_put(DBR_DOUBLE,outPV[25],(void *)&Ysig);
            ca_pend_io(5);

            oldwfmLen = wfmLen;
            oldwfmOff = wfmOff;
            process = 1;
        }
        loopEnd = clock();
        loopCounter = loopCounter + 1;
        etime = (int)(loopEnd-loopStart);  //microseconds
        stat = stat*ca_put(DBR_LONG,outPV[27],(void *)&etime);
        stat = stat*ca_put(DBR_LONG,outPV[28],(void *)&loopCounter);
        ca_pend_io(5);

        if(process==0) usleep(500000);
    }
    return(0);
}

