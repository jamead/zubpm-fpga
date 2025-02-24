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

#define ADCMAX  1000000
#define PREFIX "lab-BI{BPM:1}"

chid inPV[30], outPV[30];

short BuffA[ADCMAX],BuffB[ADCMAX],BuffC[ADCMAX],BuffD[ADCMAX];

int initialize_pvs()
{
    int status;
    char pvname[100];

    status = ca_context_create(ca_disable_preemptive_callback);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:A:Buff-Wfm");
    printf("%s\n",pvname);
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:B:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:C:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:D:Buff-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:WfmLen-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:WfmOff-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:A:Buff-Wfm:T");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[6]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"DMA:ADCLen-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[7]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Trig:Strig-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[8]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Trig:TsSec-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[9]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Trig:TsNsec-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[10]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"EVR:Trig:Cnt-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[11]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:SpiData-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[12]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:SpiAddr-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[13]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:SpiLoad-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&inPV[14]);

    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:A-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:B-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:C-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:D-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:Time-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:UpdateFFT-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:LoopTime-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[6]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:LoopCount-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[7]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"ADC:SpiTransfer-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&outPV[8]);

    ca_pend_io(5);
    return(status);
}

int main()
{
    int stat=0, wfmLen=200, wfmOff=0, oldwfmLen=-1, oldwfmOff=-1;
    int i, TmStamp, oldTmStamp=0, process=0, buffLen, trigCnt;
    int loopCounter=0, looptimer, etime, tsec, tnsec, oldtrigCnt=0;
    int SpiTransfer, SpiData, SpiLoad, SpiAddr;
    float tm;
    short Awfm[20000],Bwfm[20000],Cwfm[20000],Dwfm[20000];
    float Twfm[20000];
    char TmStr[12];

    clock_t loopStart;
    clock_t loopEnd;

    while(1==1){
        loopStart = clock();
        if(stat!=1){
            stat = initialize_pvs();
            i=1;
            printf("Initializing System\n");
            while(buffLen==0){
//                printf("Waiting for Data...\n");
                stat*ca_put(DBR_LONG,inPV[8],(void *)&i); //Issue a SoftTrig.
                ca_pend_io(5);
                usleep(1000000);
                stat = stat*ca_get(DBR_LONG,inPV[7],(void *)&buffLen);
                ca_pend_io(5);
            }
            loopCounter = 0;
            usleep(1000000);
        }
        process = 0;
        stat = stat*ca_get(DBR_LONG,inPV[11],(void *)&trigCnt);
        stat = stat*ca_get(DBR_LONG,inPV[7],(void *)&buffLen);
        stat = stat*ca_get(DBR_LONG,inPV[4],(void *)&wfmLen);
        stat = stat*ca_get(DBR_LONG,inPV[5],(void *)&wfmOff);
        stat = stat*ca_get(DBR_LONG,inPV[14],(void *)&SpiLoad);
        ca_pend_io(5);

        if(SpiLoad==1){
            stat = stat*ca_get(DBR_LONG,inPV[12],(void *)&SpiData);
            stat = stat*ca_get(DBR_LONG,inPV[13],(void *)&SpiAddr);
            ca_pend_io(5);
            SpiLoad = 0;
            SpiTransfer = SpiAddr*256 + SpiData;
//            printf("SpiTransfer 0x%x  SpiData=0x%x   SpiAddr=0x%x\n",SpiTransfer,SpiData,SpiAddr);
            stat = stat*ca_put(DBR_LONG,outPV[8],(void *)&SpiTransfer);
            stat = stat*ca_put(DBR_LONG,inPV[14],(void *)&SpiLoad);
            ca_pend_io(5);
        }
//        printf("stat1=%d\n",stat);
        if(trigCnt!=oldtrigCnt){
            usleep(1100000);
            oldtrigCnt = trigCnt;
            stat = stat*ca_array_get(DBR_SHORT,buffLen,inPV[0],(void *)&BuffA);
            stat = stat*ca_array_get(DBR_SHORT,buffLen,inPV[1],(void *)&BuffB);
            stat = stat*ca_array_get(DBR_SHORT,buffLen,inPV[2],(void *)&BuffC);
            stat = stat*ca_array_get(DBR_SHORT,buffLen,inPV[3],(void *)&BuffD);
//            printf("stat1.5=%d\n",stat);
            ca_pend_io(5);
//            ca_flush_io();
            process = 1;
        }
//        printf("stat2=%d\n",stat);
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
//            printf("Processing ADC data\n");
            for(i=wfmOff;i<wfmOff+wfmLen;i++){
                Awfm[i-wfmOff] = BuffA[i];
                Bwfm[i-wfmOff] = BuffB[i];
                Cwfm[i-wfmOff] = BuffC[i];
                Dwfm[i-wfmOff] = BuffD[i];
                tm = (i-wfmOff)*0.008521583;   //Time in microseconds.
                Twfm[i-wfmOff] = tm;
            }
            i=1;
            stat = stat*ca_array_put(DBR_SHORT,wfmLen,outPV[0],Awfm);
            stat = stat*ca_array_put(DBR_SHORT,wfmLen,outPV[1],Bwfm);
            stat = stat*ca_array_put(DBR_SHORT,wfmLen,outPV[2],Cwfm);
            stat = stat*ca_array_put(DBR_SHORT,wfmLen,outPV[3],Dwfm);
            stat = stat*ca_array_put(DBR_FLOAT,wfmLen,outPV[4],Twfm);
            stat = stat*ca_put(DBR_LONG,outPV[5],(void *)&i);  //Set ADC:UpdateFFT to 1
            ca_pend_io(5);
        }
        loopEnd = clock();
        loopCounter = loopCounter + 1;
        etime = (int)(loopEnd-loopStart);  //microseconds
        stat = stat*ca_put(DBR_LONG,outPV[6],(void *)&etime);
        stat = stat*ca_put(DBR_LONG,outPV[7],(void *)&loopCounter);
        ca_pend_io(5);
        if(process==0) usleep(500000);
    }
    return(0);
}
