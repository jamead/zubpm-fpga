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

#define SAMAX 576000 //16-hour SA Buffers for ABCDXY and Sum
#define PREFIX "lab-BI{BPM:1}"

chid inPV[30], outPV[30];

// Buffers are too large to be declared inside the "main" function.
// They must be declared as globals.
float BuffA[SAMAX],BuffB[SAMAX],BuffC[SAMAX],BuffD[SAMAX];
float BuffS[SAMAX],BuffX[SAMAX],BuffY[SAMAX];

int initialize_pvs()
{
    int status;
    char pvname[100];

    status = ca_context_create(ca_disable_preemptive_callback);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Cnt:Trig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Ampl:ASA-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Ampl:BSA-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Ampl:CSA-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Ampl:DSA-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Ampl:Sum-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Pos:X-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[6]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Pos:Y-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[7]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Length-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[8]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Decimate-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[9]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Reset-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[10]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"TS-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[11]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"TS:NS-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[12]);

    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:A-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:B-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:C-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:D-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Sum-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:X-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Y-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[6]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Time-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[7]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:XS-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[8]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:YS-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[9]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:XM-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[10]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:YM-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[11]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Aavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[12]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Bavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[13]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Cavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[14]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Davg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[15]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Savg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[16]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Xavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[17]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Yavg-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[18]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Asig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[19]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Bsig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[20]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Csig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[21]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Dsig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[22]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Ssig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[23]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Xsig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[24]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Ysig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[25]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:TrigDate-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[26]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:LoopTime-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[27]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:LoopCount-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[28]);

    ca_pend_io(5);
    return(status);
}

int main()
{
    int stat=0, oldSAcnt=-1, SAcnt, topIndx, buffmax, reset,loopTimer,etime;
    int SAlen,SAdec,count,start,i,tsec,tnsec,loopstart,loopCounter=0;
    float SAa,SAb,SAc,SAd,SAs,SAx,SAy,tm;
    float Awfm[9000],Bwfm[9000],Cwfm[9000],Dwfm[9000];
    float Xwfm[9000],Ywfm[9000],Swfm[9000],Twfm[9000];
    float XSwfm[10],YSwfm[10],XMwfm[100],YMwfm[100];
    float Asum,Bsum,Csum,Dsum,Aavg,Bavg,Cavg,Davg;
    float Xsum,Ysum,Ssum,Xavg,Yavg,Savg;
    float Asig,Bsig,Csig,Dsig,Ssig,Xsig,Ysig;

    time_t evrTime;
    struct tm ts;
    char tmstr[80];

    clock_t loopStart;
    clock_t loopEnd;

    while(1==1){
        loopStart = clock();
        if(stat!=1){
            stat = initialize_pvs();
            topIndx=0;
            buffmax=0;
            loopCounter=0;
            usleep(1000000);
        }
        stat = stat*ca_get(DBR_LONG,inPV[0],(void *)&SAcnt);
        ca_pend_io(5);
        if(SAcnt>oldSAcnt){
            stat = stat*ca_get(DBR_FLOAT,inPV[1],(void *)&SAa);
            stat = stat*ca_get(DBR_FLOAT,inPV[2],(void *)&SAb);
            stat = stat*ca_get(DBR_FLOAT,inPV[3],(void *)&SAc);
            stat = stat*ca_get(DBR_FLOAT,inPV[4],(void *)&SAd);
            stat = stat*ca_get(DBR_FLOAT,inPV[5],(void *)&SAs);
            stat = stat*ca_get(DBR_FLOAT,inPV[6],(void *)&SAx);
            stat = stat*ca_get(DBR_FLOAT,inPV[7],(void *)&SAy);
            stat = stat*ca_get(DBR_LONG,inPV[8],(void *)&SAlen);
            stat = stat*ca_get(DBR_LONG,inPV[9],(void *)&SAdec);
            stat = stat*ca_get(DBR_LONG,inPV[10],(void *)&reset);
            stat = stat*ca_get(DBR_LONG,inPV[11],(void *)&tsec);
            stat = stat*ca_get(DBR_LONG,inPV[12],(void *)&tnsec);
            ca_pend_io(5);

            evrTime = (time_t)tsec;
            ts = *localtime(&evrTime);
            strftime(tmstr,sizeof(tmstr), "%b %d %Y %H:%M:%S %Z", &ts);
            stat = stat*ca_put(DBR_STRING,outPV[26],(void *)&tmstr);
            ca_pend_io(5);
//            printf("tmstr=%s  stat=%d\n",tmstr,stat);
            if(reset==1){
                topIndx = 0;
                buffmax = 0;
                reset = 0;
                stat = stat*ca_put(DBR_LONG,inPV[10],(void *)&reset);
                ca_pend_io(5);
            }
            BuffA[topIndx] = SAa;
            BuffB[topIndx] = SAb;
            BuffC[topIndx] = SAc;
            BuffD[topIndx] = SAd;
            BuffS[topIndx] = SAs;
            BuffX[topIndx] = SAx;
            BuffY[topIndx] = SAy;

            topIndx = (topIndx+1)%SAMAX;
            if(buffmax<SAMAX) buffmax++;
//            printf("%d %d %d %d %d %8.0f %8.0f\n",SAlen,SAdec,SAcnt,topIndx,buffmax,SAc,SAd);
            oldSAcnt = SAcnt;
            if(SAcnt%5==0){
//                printf("Update Plots\n");
                if(buffmax<SAMAX){
                    //Circular Buffers are not yet full.
                    start = topIndx - SAlen;
                    if(start<0) start=0;
//                    printf("start=%d topIndx=%d buffmax=%d\n",start,topIndx,buffmax);
                    count = 0;
                    Asum = 0;
                    Bsum = 0;
                    Csum = 0;
                    Dsum = 0;
                    Ssum = 0;
                    Xsum = 0;
                    Ysum = 0;
                    for(i=start;i<topIndx;i=i+SAdec){
                        Awfm[count] = BuffA[i];
                        Asum = Asum + BuffA[i];
                        Bwfm[count] = BuffB[i];
                        Bsum = Bsum + BuffB[i];
                        Cwfm[count] = BuffC[i];
                        Csum = Csum + BuffC[i];
                        Dwfm[count] = BuffD[i];
                        Dsum = Dsum + BuffD[i];
                        Swfm[count] = BuffS[i];
                        Ssum = Ssum + BuffS[i];
                        Xwfm[count] = BuffX[i];
                        Xsum = Xsum + BuffX[i];
                        Ywfm[count] = BuffY[i];
                        Ysum = Ysum + BuffY[i];
                        tm = (count*SAdec)*0.001673071;  // Time in minutes.
                        Twfm[count] = tm;
                        count++;
                    }
                }else{
                    //Circular Buffers are full.
                    count = 0;
                    Asum = 0;
                    Bsum = 0;
                    Csum = 0;
                    Dsum = 0;
                    Ssum = 0;
                    Xsum = 0;
                    Ysum = 0;
                    start = topIndx -SAlen;
                    if(start<0){
                        start = SAMAX + start;
                        for(i=start;i<SAMAX;i=i+SAdec){
                            Awfm[count] = BuffA[i];
                            Asum = Asum + BuffA[i];
                            Bwfm[count] = BuffB[i];
                            Bsum = Bsum + BuffB[i];
                            Cwfm[count] = BuffC[i];
                            Csum = Csum + BuffC[i];
                            Dwfm[count] = BuffD[i];
                            Dsum = Dsum + BuffD[i];
                            Swfm[count] = BuffS[i];
                            Ssum = Ssum + BuffS[i];
                            Xwfm[count] = BuffX[i];
                            Xsum = Xsum + BuffX[i];
                            Ywfm[count] = BuffY[i];
                            Ysum = Csum + BuffY[i];
                            tm = (count*SAdec)*0.001673071;  // Time in minutes.
                            Twfm[count] = tm;
                            count++;
                        }
                        start = 0;  //Start position for the next loop below.
                    }
                    for(i=start;i<topIndx;i=i+SAdec){
                        Awfm[count] = BuffA[i];
                        Asum = Asum + BuffA[i];
                        Bwfm[count] = BuffB[i];
                        Bsum = Bsum + BuffB[i];
                        Cwfm[count] = BuffC[i];
                        Csum = Csum + BuffC[i];
                        Dwfm[count] = BuffD[i];
                        Dsum = Dsum + BuffD[i];
                        Swfm[count] = BuffS[i];
                        Ssum = Ssum + BuffS[i];
                        Xwfm[count] = BuffX[i];
                        Xsum = Xsum + BuffX[i];
                        Ywfm[count] = BuffY[i];
                        Ysum = Ysum + BuffY[i];
                        tm = (count*SAdec)*0.001673071;  // Time in minutes.
                        Twfm[count] = tm;
                        count++;
                    }
                }
                Aavg = Asum/count;
                Bavg = Bsum/count;
                Cavg = Csum/count;
                Davg = Dsum/count;
                Savg = Ssum/count;
                Xavg = Xsum/count;
                Yavg = Ysum/count;
                Asum = 0;
                Bsum = 0;
                Csum = 0;
                Dsum = 0;
                Ssum = 0;
                Xsum = 0;
                Ysum = 0;
                for(i=0;i<count;i++){
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
                Asig = sqrt(Asum/count);
                Bsig = sqrt(Bsum/count);
                Csig = sqrt(Csum/count);
                Dsig = sqrt(Dsum/count);
                Ssig = sqrt(Ssum/count);
                Xsig = sqrt(Xsum/count);
                Ysig = sqrt(Ysum/count);
                if(count>10){
                    memcpy(XSwfm,&Xwfm[count-10], 10*sizeof(float));
                    memcpy(YSwfm,&Ywfm[count-10], 10*sizeof(float));
                    stat = stat*ca_array_put(DBR_FLOAT,10,outPV[8],XSwfm);
                    stat = stat*ca_array_put(DBR_FLOAT,10,outPV[9],YSwfm);
                }else{
                    stat = stat*ca_array_put(DBR_FLOAT,0,outPV[8],XSwfm);
                    stat = stat*ca_array_put(DBR_FLOAT,0,outPV[9],YSwfm);
                }
                if(count>100){
                    memcpy(XMwfm,&Xwfm[count-100], 100*sizeof(float));
                    memcpy(YMwfm,&Ywfm[count-100], 100*sizeof(float));
                    stat = stat*ca_array_put(DBR_FLOAT,100,outPV[10],XMwfm);
                    stat = stat*ca_array_put(DBR_FLOAT,100,outPV[11],YMwfm);
                }else{
                    stat = stat*ca_array_put(DBR_FLOAT,0,outPV[10],XMwfm);
                    stat = stat*ca_array_put(DBR_FLOAT,0,outPV[11],YMwfm);
                }
                stat = stat*ca_array_put(DBR_FLOAT,count,outPV[0],Awfm);
                stat = stat*ca_array_put(DBR_FLOAT,count,outPV[1],Bwfm);
                stat = stat*ca_array_put(DBR_FLOAT,count,outPV[2],Cwfm);
                stat = stat*ca_array_put(DBR_FLOAT,count,outPV[3],Dwfm);
                stat = stat*ca_array_put(DBR_FLOAT,count,outPV[4],Swfm);
                stat = stat*ca_array_put(DBR_FLOAT,count,outPV[5],Xwfm);
                stat = stat*ca_array_put(DBR_FLOAT,count,outPV[6],Ywfm);
                stat = stat*ca_array_put(DBR_FLOAT,count,outPV[7],Twfm);
                stat = stat*ca_put(DBR_FLOAT,outPV[12],(void *)&Aavg);
                stat = stat*ca_put(DBR_FLOAT,outPV[13],(void *)&Bavg);
                stat = stat*ca_put(DBR_FLOAT,outPV[14],(void *)&Cavg);
                stat = stat*ca_put(DBR_FLOAT,outPV[15],(void *)&Davg);
                stat = stat*ca_put(DBR_FLOAT,outPV[16],(void *)&Savg);
                stat = stat*ca_put(DBR_FLOAT,outPV[17],(void *)&Xavg);
                stat = stat*ca_put(DBR_FLOAT,outPV[18],(void *)&Yavg);
                stat = stat*ca_put(DBR_FLOAT,outPV[19],(void *)&Asig);
                stat = stat*ca_put(DBR_FLOAT,outPV[20],(void *)&Bsig);
                stat = stat*ca_put(DBR_FLOAT,outPV[21],(void *)&Csig);
                stat = stat*ca_put(DBR_FLOAT,outPV[22],(void *)&Dsig);
                stat = stat*ca_put(DBR_FLOAT,outPV[23],(void *)&Ssig);
                stat = stat*ca_put(DBR_FLOAT,outPV[24],(void *)&Xsig);
                stat = stat*ca_put(DBR_FLOAT,outPV[25],(void *)&Ysig);
                ca_pend_io(5);
            }
        }else{
            usleep(50000);
        }
        loopEnd = clock();
        loopCounter = loopCounter + 1;
        etime = (int)(loopEnd-loopStart);  //microseconds
        stat = stat*ca_put(DBR_LONG,outPV[27],(void *)&etime);
        stat = stat*ca_put(DBR_LONG,outPV[28],(void *)&loopCounter);
        ca_pend_io(5);
    }

    return(0);
}

