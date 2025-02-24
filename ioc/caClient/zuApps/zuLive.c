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

#include "cadef.h"

#define TBTMAX  8000
#define ADCMAX  8000
#define PREFIX "lab-BI{BPM:1}"

chid inPV[30], outPV[30];

double BuffA[ADCMAX],BuffB[ADCMAX],BuffC[ADCMAX],BuffD[ADCMAX];
double BuffX[TBTMAX],BuffY[TBTMAX];

int initialize_pvs()
{
    int status;
    char pvname[100];

    status = ca_context_create(ca_disable_preemptive_callback);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:A:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:B:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:C:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:D:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:WfmLen-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:WfmOff-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:A:Buff-Wfm:T");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[6]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:A:Buff-Wfm.NORD");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[7]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:X:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[8]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:Y:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[9]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:WfmLen-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[10]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:WfmOff-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[11]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:X:Buff-Wfm.NORD");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[12]);

    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:A-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:B-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:C-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:D-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:ADC:Time-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:X-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:Y-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[6]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:Time-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[7]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:Xavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[8]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:Yavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[9]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:Xsig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[10]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:TBT:Ysig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[11]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:LoopTime-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[12]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Live:LoopCount-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[13]);

    ca_pend_io(5);
    return(status);
}

int main()
{
    int stat=0, ADClen=200, ADCoff=0, oldADClen=-1, oldADCoff=-1;
    int TBTlen=200, TBToff=0, oldTBTlen=-1, oldTBToff=-1;
    int j,i, TmStamp, oldTmStamp=0, process=0, ADCbuffLen, TBTbuffLen;
    int loopCounter=0, etime;
    float tm;
    double Awfm[ADCMAX],Bwfm[ADCMAX],Cwfm[ADCMAX],Dwfm[ADCMAX],Twfm[ADCMAX];
    double Xwfm[TBTMAX],Ywfm[TBTMAX];
    double Xsum, Ysum, Xavg, Yavg, Xsig, Ysig;
    char TmStr[12];

    time_t evrTime;
    struct tm ts;
    char tmstr[80];

    clock_t loopStart;
    clock_t loopEnd;

    j=0;
    while(1==1){
        loopStart = clock();
        if(stat!=1){
            stat = initialize_pvs();
            loopCounter = 0;
            usleep(1000000);
        }
        j=j+1;
        process = 0;
        stat = stat*ca_get(DBR_STRING,inPV[6],TmStr);
        stat = stat*ca_get(DBR_LONG,inPV[7],(void *)&ADCbuffLen);
        stat = stat*ca_get(DBR_LONG,inPV[4],(void *)&ADClen);
        stat = stat*ca_get(DBR_LONG,inPV[5],(void *)&ADCoff);
        stat = stat*ca_get(DBR_LONG,inPV[12],(void *)&TBTbuffLen);
        stat = stat*ca_get(DBR_LONG,inPV[10],(void *)&TBTlen);
        stat = stat*ca_get(DBR_LONG,inPV[11],(void *)&TBToff);
        ca_pend_io(5);
        TmStamp = (int) strtol(TmStr, (char **)NULL, 10);
//        printf("%d. TmStr = %s    TmStamp=%d   %d\n",j,TmStr,TmStamp,oldTmStamp);
        if(1==1){      //if(TmStamp>oldTmStamp){
            oldTmStamp = TmStamp;
            stat = stat*ca_array_get(DBR_DOUBLE,ADCMAX,inPV[0],(void *)&BuffA);
            stat = stat*ca_array_get(DBR_DOUBLE,ADCMAX,inPV[1],(void *)&BuffB);
            stat = stat*ca_array_get(DBR_DOUBLE,ADCMAX,inPV[2],(void *)&BuffC);
            stat = stat*ca_array_get(DBR_DOUBLE,ADCMAX,inPV[3],(void *)&BuffD);
            stat = stat*ca_array_get(DBR_DOUBLE,TBTMAX,inPV[8],(void *)&BuffX);
            stat = stat*ca_array_get(DBR_DOUBLE,TBTMAX,inPV[9],(void *)&BuffY);
            ca_pend_io(5);
            process = 1;
        }
        if(ADClen!=oldADClen){
            if(ADClen>ADCbuffLen || ADClen>ADCMAX || ADClen<100){
                if(ADClen>ADCbuffLen) ADClen = ADCbuffLen;
                if(ADClen>ADCMAX) ADClen = ADCMAX;
                if(ADClen<100) ADClen=100;
                stat = stat*ca_put(DBR_LONG,inPV[4],(void *)&ADClen);
                ca_pend_io(5);
            }
            oldADCoff = oldADCoff - 1;  // Force the next if block to execute
            oldADClen = ADClen;
            process = 1;
        }
        if(ADCoff!=oldADCoff){
            if((ADClen+ADCoff)>ADCbuffLen || ADCoff<0){
                if((ADClen+ADCoff)>ADCbuffLen) ADCoff = ADCbuffLen-ADClen;
                if(ADCoff<0) ADCoff = 0;
                stat = stat*ca_put(DBR_LONG,inPV[5],(void *)&ADCoff);
                ca_pend_io(5);
            }
            oldADCoff = ADCoff;
            process = 1;
        }
        if(TBTlen!=oldTBTlen){
            if(TBTlen>TBTbuffLen || TBTlen>TBTMAX || TBTlen<100){
                if(TBTlen>TBTbuffLen) TBTlen = TBTbuffLen;
                if(TBTlen>TBTMAX) TBTlen = TBTMAX;
                if(TBTlen<100) TBTlen=100;
                stat = stat*ca_put(DBR_LONG,inPV[10],(void *)&TBTlen);
                ca_pend_io(5);
            }
            oldTBToff = oldTBToff - 1;  // Force the next if block to execute
            oldTBTlen = TBTlen;
            process = 1;
        }
        if(TBToff!=oldTBToff){
            if((TBTlen+TBToff)>TBTbuffLen || TBToff<0){
                if((TBTlen+TBToff)>TBTbuffLen) TBToff = TBTbuffLen-TBTlen;
                if(TBToff<0) TBToff = 0;
                stat = stat*ca_put(DBR_LONG,inPV[11],(void *)&TBToff);
                ca_pend_io(5);
            }
            oldTBToff = TBToff;
            process = 1;
        }
        if(process==1){
//            printf("Processing ADC data\n");
            for(i=ADCoff;i<ADCoff+ADClen;i++){
                Awfm[i-ADCoff] = BuffA[i];
                Bwfm[i-ADCoff] = BuffB[i];
                Cwfm[i-ADCoff] = BuffC[i];
                Dwfm[i-ADCoff] = BuffD[i];
                tm = (i-ADCoff)*0.008521583;   //Time in microseconds.
                Twfm[i-ADCoff] = tm;
            }
            stat = stat*ca_array_put(DBR_DOUBLE,ADClen,outPV[0],Awfm);
            stat = stat*ca_array_put(DBR_DOUBLE,ADClen,outPV[1],Bwfm);
            stat = stat*ca_array_put(DBR_DOUBLE,ADClen,outPV[2],Cwfm);
            stat = stat*ca_array_put(DBR_DOUBLE,ADClen,outPV[3],Dwfm);
            stat = stat*ca_array_put(DBR_DOUBLE,ADClen,outPV[4],Twfm);
            ca_pend_io(5);
//            printf("Processing TBT data\n");
            Xsum=0;
            Ysum=0;
            for(i=TBToff;i<TBToff+TBTlen;i++){
                Xwfm[i-TBToff] = BuffX[i]*0.001;
                Ywfm[i-TBToff] = BuffY[i]*0.001;
                Xsum = Xsum + BuffX[i]*0.001;
                Ysum = Ysum + BuffY[i]*0.001;
                tm = (i-TBToff)*0.002641691;   //Time in milliseconds.
                Twfm[i-TBToff] = tm;
            }
            Xavg = Xsum/TBTlen;
            Yavg = Ysum/TBTlen;
            Xsum=0;
            Ysum=0;
            for(i=0;i<TBTlen;i++){
                Xsum = Xsum + (Xwfm[i]-Xavg)*(Xwfm[i]-Xavg);
                Ysum = Ysum + (Ywfm[i]-Yavg)*(Ywfm[i]-Yavg);
            }
            Xsig = sqrt(Xsum/TBTlen);
            Ysig = sqrt(Ysum/TBTlen);

            stat = stat*ca_array_put(DBR_DOUBLE,TBTlen,outPV[5],Xwfm);
            stat = stat*ca_array_put(DBR_DOUBLE,TBTlen,outPV[6],Ywfm);
            stat = stat*ca_array_put(DBR_DOUBLE,TBTlen,outPV[7],Twfm);
            stat = stat*ca_put(DBR_DOUBLE,outPV[8],(void *)&Xavg);
            stat = stat*ca_put(DBR_DOUBLE,outPV[9],(void *)&Yavg);
            stat = stat*ca_put(DBR_DOUBLE,outPV[10],(void *)&Xsig);
            stat = stat*ca_put(DBR_DOUBLE,outPV[11],(void *)&Ysig);
            ca_pend_io(5);
        }
        loopEnd = clock();
        loopCounter = loopCounter + 1;
        etime = (int)(loopEnd-loopStart);  //microseconds
        stat = stat*ca_put(DBR_LONG,outPV[12],(void *)&etime);
        stat = stat*ca_put(DBR_LONG,outPV[13],(void *)&loopCounter);
        ca_pend_io(5);

//        printf("process=%d  stat=%d\n",process,stat);
        usleep(997000);
    }
    return(0);
}

