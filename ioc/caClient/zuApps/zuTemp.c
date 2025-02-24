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

#define TPMAX 57600 //16-hour Buffer for Thermistors A,B,C,D,AC,BD
#define PREFIX "lab-BI{BPM:1}"

chid inPV[30], outPV[30];

// Buffers are too large to be declared inside the "main" function.
// They must be declared as globals.
float BuffA[TPMAX],BuffB[TPMAX],BuffC[TPMAX],BuffD[TPMAX];
float BuffAC[TPMAX],BuffBD[TPMAX],BuffX[TPMAX],BuffY[TPMAX];

int initialize_pvs()
{
    int status;
    char pvname[100];

    status = ca_context_create(ca_disable_preemptive_callback);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Cnt:Trig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Thermistor:A-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Thermistor:B-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Thermistor:C-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Thermistor:D-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Thermistor:AC-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Thermistor:BD-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[6]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Length-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[8]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Decimate-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[9]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Reset-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[10]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"TS-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[11]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"TS:NS-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[12]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Pos:X-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[13]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Pos:Y-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[14]);


    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:A-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:B-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:C-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:D-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:AC-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:BD-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Time-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[7]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:X-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[8]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:Y-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[9]);

    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:TrigDate-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[26]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:LoopTime-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[27]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Temp:LoopCount-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[28]);

    ca_pend_io(5);
    return(status);
}

int main()
{
    int stat=0, oldtsec=-1, topIndx, buffmax, reset,loopTimer,etime,TPcnt=0;
    int TPlen,TPdec,count,start,i,tsec,tnsec,loopstart,loopCounter=0;
    float TPa,TPb,TPc,TPd,TPac,TPbd,tm,TPx,TPy;
    float Awfm[15000],Bwfm[15000],Cwfm[15000],Dwfm[15000];
    float ACwfm[15000],BDwfm[15000],Twfm[15000],Xwfm[15000],Ywfm[15000];

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
        stat = stat*ca_get(DBR_LONG,inPV[11],(void *)&tsec);
        ca_pend_io(5);
        if(tsec>oldtsec){
            oldtsec = tsec;
            stat = stat*ca_get(DBR_FLOAT,inPV[1],(void *)&TPa);
            stat = stat*ca_get(DBR_FLOAT,inPV[2],(void *)&TPb);
            stat = stat*ca_get(DBR_FLOAT,inPV[3],(void *)&TPc);
            stat = stat*ca_get(DBR_FLOAT,inPV[4],(void *)&TPd);
            stat = stat*ca_get(DBR_FLOAT,inPV[5],(void *)&TPac);
            stat = stat*ca_get(DBR_FLOAT,inPV[6],(void *)&TPbd);
            stat = stat*ca_get(DBR_LONG,inPV[8],(void *)&TPlen);
            stat = stat*ca_get(DBR_LONG,inPV[9],(void *)&TPdec);
            stat = stat*ca_get(DBR_LONG,inPV[10],(void *)&reset);
            stat = stat*ca_get(DBR_LONG,inPV[12],(void *)&tnsec);
            stat = stat*ca_get(DBR_FLOAT,inPV[13],(void *)&TPx);
            stat = stat*ca_get(DBR_FLOAT,inPV[14],(void *)&TPy);

            ca_pend_io(5);

            evrTime = (time_t)tsec;
            ts = *localtime(&evrTime);
            strftime(tmstr,sizeof(tmstr), "%b %d %Y %H:%M:%S %Z", &ts);
            stat = stat*ca_put(DBR_STRING,outPV[26],(void *)&tmstr);
            ca_pend_io(5);
//            printf("%s  s=%d  %5.2f %5.2f %5.2f %5.2f %5.2f %5.2f %6.3f %6.3f\n",tmstr,stat,TPa,TPb,TPc,TPd,TPac,TPbd,TPx,TPy);
            if(reset==1){
                topIndx = 0;
                buffmax = 0;
                reset = 0;
                stat = stat*ca_put(DBR_LONG,inPV[10],(void *)&reset);
                ca_pend_io(5);
            }
            BuffA[topIndx] = TPa;
            BuffB[topIndx] = TPb;
            BuffC[topIndx] = TPc;
            BuffD[topIndx] = TPd;
            BuffAC[topIndx] = TPac;
            BuffBD[topIndx] = TPbd;
            BuffX[topIndx] = TPx;
            BuffY[topIndx] = TPy;

            topIndx = (topIndx+1)%TPMAX;
            if(buffmax<TPMAX) buffmax++;
//            oldSAcnt = SAcnt;
            if(buffmax<TPMAX){
                //Circular Buffers are not yet full.
                start = topIndx - TPlen;
                if(start<0) start=0;
//                printf("start=%d topIndx=%d buffmax=%d\n",start,topIndx,buffmax);
                count = 0;
                for(i=start;i<topIndx;i=i+TPdec){
                    Awfm[count] = BuffA[i];
                    Bwfm[count] = BuffB[i];
                    Cwfm[count] = BuffC[i];
                    Dwfm[count] = BuffD[i];
                    ACwfm[count] = BuffAC[i];
                    BDwfm[count] = BuffBD[i];
                    tm = (count*TPdec)*0.01673071;  // Time in minutes.
                    Twfm[count] = tm;
                    Xwfm[count] = BuffX[i];
                    Ywfm[count] = BuffY[i];
                    count++;
                }
            }else{
                //Circular Buffers are full.
                count = 0;
                start = topIndx -TPlen;
                if(start<0){
                    start = TPMAX + start;
                    for(i=start;i<TPMAX;i=i+TPdec){
                        Awfm[count] = BuffA[i];
                        Bwfm[count] = BuffB[i];
                        Cwfm[count] = BuffC[i];
                        Dwfm[count] = BuffD[i];
                        ACwfm[count] = BuffAC[i];
                        BDwfm[count] = BuffBD[i];
                        tm = (count*TPdec)*0.01673071;  // Time in minutes.
                        Twfm[count] = tm;
                        Xwfm[count] = BuffX[i];
                        Ywfm[count] = BuffY[i];
                        count++;
                    }
                    start = 0;  //Start position for the next loop below.
                }
                for(i=start;i<topIndx;i=i+TPdec){
                    Awfm[count] = BuffA[i];
                    Bwfm[count] = BuffB[i];
                    Cwfm[count] = BuffC[i];
                    Dwfm[count] = BuffD[i];
                    ACwfm[count] = BuffAC[i];
                    BDwfm[count] = BuffBD[i];
                    tm = (count*TPdec)*0.01673071;  // Time in minutes.
                    Twfm[count] = tm;
                    Xwfm[count] = BuffX[i];
                    Ywfm[count] = BuffY[i];
                    count++;
                }
            }
            stat = stat*ca_array_put(DBR_FLOAT,count,outPV[0],Awfm);
            stat = stat*ca_array_put(DBR_FLOAT,count,outPV[1],Bwfm);
            stat = stat*ca_array_put(DBR_FLOAT,count,outPV[2],Cwfm);
            stat = stat*ca_array_put(DBR_FLOAT,count,outPV[3],Dwfm);
            stat = stat*ca_array_put(DBR_FLOAT,count,outPV[4],ACwfm);
            stat = stat*ca_array_put(DBR_FLOAT,count,outPV[5],BDwfm);
            stat = stat*ca_array_put(DBR_FLOAT,count,outPV[7],Twfm);
            stat = stat*ca_array_put(DBR_FLOAT,count,outPV[8],Xwfm);
            stat = stat*ca_array_put(DBR_FLOAT,count,outPV[9],Ywfm);
            ca_pend_io(5);
        }else{
            usleep(90000);
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
