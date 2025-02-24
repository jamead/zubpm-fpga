/*caExample.c*/
#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "cadef.h"

#include <fcntl.h>
#include <sys/mman.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <signal.h>
#include <fcntl.h>
#include <unistd.h>
#include "pl_lib.c"

#define PAGE_SIZE 4096
#define BURSTLEN 2048        // in lwords (every 512 generates a new burst)
#define DDRBUFLEN 4096       // in bytes buffer length 

#define CNT_REG 106
#define CHA_REG 110
#define CHB_REG 111
#define CHC_REG 112
#define CHD_REG 113
#define   X_REG 114
#define   Y_REG 115
#define SUM_REG 117
#define TM_NSEC 102
#define TM_SECS 103

#define TRGCNTR 107

#define PREFIX "SR:C28{ZBPM:2}"

int fd, i, stat;
chid mychid[70];
volatile unsigned int *fpgabase;  //mmap'd fpga registers

void mmap_fpga()
{
   int fd;


   fd = open("/dev/mem",O_RDWR|O_SYNC);
   if (fd < 0) {
      printf("Can't open /dev/mem\n");
      exit(1);
   }

   fpgabase = (unsigned int *) mmap(0,255,PROT_READ|PROT_WRITE,MAP_SHARED,fd,0x43C00000);

   if (fpgabase == NULL) {
      printf("Can't map FPGA space\n");
      exit(1);
   }

}

int initialize_pvs()
{
    int status;
    char pvname[100];

    status = ca_context_create(ca_disable_preemptive_callback);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Ampl:ASA-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[0]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Ampl:BSA-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[1]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Ampl:CSA-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[2]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Ampl:DSA-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[3]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Pos:X-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[4]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Pos:Y-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[5]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"TS-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[6]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"TS:NS-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[7]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Cnt:Trig-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[8]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"Ampl:SSA-Calc");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[9]);
// Waveform PVs for SA short histories:
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:A-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[25]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:B-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[26]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:C-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[27]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:D-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[28]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:X-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[29]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Y-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[30]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:S-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[31]);
// Waveform PVs for SA view histories:
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Hist:len-SP");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[47]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Hist:A-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[48]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Hist:B-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[49]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Hist:C-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[50]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Hist:D-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[51]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Hist:X-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[52]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Hist:Y-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[53]);
    strcpy(pvname,PREFIX);
    strcat(pvname,"SA:Hist:S-Wfm");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[54]);
//  Miscellaneous PVs:
    strcpy(pvname,PREFIX);
    strcat(pvname,"DMA:TrigCount-I");
    status = status*ca_create_channel(pvname,NULL,NULL,0,&mychid[55]);

    ca_pend_io(5);
    return(status);
}

void data_ready()
{
    float sa_x, sa_y, sa_cha, sa_chb, sa_chc, sa_chd, sa_sum;
    long sa_N, sa_sec, sa_nsec;
    float ha[2000],hb[2000],hc[2000],hd[2000],hx[2000],hy[2000],hs[2000];
    int L,dma_trig_count;

    const float scale = 2147483648.0;  //13500000.0;

    sa_N = fpgabase[CNT_REG];
    sa_cha = (float) fpgabase[CHA_REG]/scale;
    sa_chb = (float) fpgabase[CHB_REG]/scale;
    sa_chc = (float) fpgabase[CHC_REG]/scale;
    sa_chd = (float) fpgabase[CHD_REG]/scale;
    sa_sum = sa_cha + sa_chb + sa_chc + sa_chd;
//    sa_x = (int) fpgabase[X_REG]/1000.0;
//    sa_y = (int) fpgabase[Y_REG]/1000.0;
    sa_x = 10000.0*(sa_cha+sa_chd-sa_chb-sa_chc)/(sa_cha+sa_chd+sa_chb+sa_chc);
    sa_y = 10000.0*(sa_cha+sa_chb-sa_chc-sa_chd)/(sa_cha+sa_chd+sa_chb+sa_chc);
    sa_sec = fpgabase[TM_SECS];
    sa_nsec = fpgabase[TM_NSEC];

    if(stat!=1){
        stat = initialize_pvs();
        sleep(2);
        printf("Initializing all PVs. Status = %d\n",stat);
    }

//    printf("%8.6f %8.6f %8.6f %8.6f\n",sa_cha,sa_chb,sa_chc,sa_chd);

    stat = stat*ca_put(DBR_FLOAT,mychid[0],(void *)&sa_cha);
    stat = stat*ca_put(DBR_FLOAT,mychid[1],(void *)&sa_chb);
    stat = stat*ca_put(DBR_FLOAT,mychid[2],(void *)&sa_chc);
    stat = stat*ca_put(DBR_FLOAT,mychid[3],(void *)&sa_chd);
    stat = stat*ca_put(DBR_FLOAT,mychid[4],(void *)&sa_x);
    stat = stat*ca_put(DBR_FLOAT,mychid[5],(void *)&sa_y);
    stat = stat*ca_put(DBR_LONG,mychid[6],(void *)&sa_sec);
    stat = stat*ca_put(DBR_LONG,mychid[7],(void *)&sa_nsec);
    stat = stat*ca_put(DBR_LONG,mychid[8],(void *)&sa_N);
    stat = stat*ca_put(DBR_FLOAT,mychid[9],(void *)&sa_sum);
    ca_pend_io(5);

    stat = stat*ca_array_get(DBR_FLOAT,2000,mychid[25],ha);
    stat = stat*ca_array_get(DBR_FLOAT,2000,mychid[26],hb);
    stat = stat*ca_array_get(DBR_FLOAT,2000,mychid[27],hc);
    stat = stat*ca_array_get(DBR_FLOAT,2000,mychid[28],hd);
    stat = stat*ca_array_get(DBR_FLOAT,2000,mychid[29],hx);
    stat = stat*ca_array_get(DBR_FLOAT,2000,mychid[30],hy);
    stat = stat*ca_array_get(DBR_FLOAT,2000,mychid[31],hs);

    stat = stat*ca_get(DBR_LONG,mychid[47],&L);

    ca_pend_io(5);
    for(i=0;i<1999;i=i+1){
        ha[i] = ha[i+1];
        hb[i] = hb[i+1];
        hc[i] = hc[i+1];
        hd[i] = hd[i+1];
        hx[i] = hx[i+1];
        hy[i] = hy[i+1];
        hs[i] = hs[i+1];
    }

    ha[1999]=sa_cha;
    hb[1999]=sa_chb;
    hc[1999]=sa_chc;
    hd[1999]=sa_chd;
    hx[1999]=sa_x;
    hy[1999]=sa_y;
    hs[1999]=sa_sum;

    stat = stat*ca_array_put(DBR_FLOAT,2000,mychid[25],ha);
    stat = stat*ca_array_put(DBR_FLOAT,2000,mychid[26],hb);
    stat = stat*ca_array_put(DBR_FLOAT,2000,mychid[27],hc);
    stat = stat*ca_array_put(DBR_FLOAT,2000,mychid[28],hd);
    stat = stat*ca_array_put(DBR_FLOAT,2000,mychid[29],hx);
    stat = stat*ca_array_put(DBR_FLOAT,2000,mychid[30],hy);
    stat = stat*ca_array_put(DBR_FLOAT,2000,mychid[31],hs);

    dma_trig_count = fpgabase[TRGCNTR];
    stat = stat*ca_put(DBR_LONG,mychid[55],(void *)&dma_trig_count);
    stat = stat*ca_flush_io();

    ca_pend_io(5);
}

int main(int argc,char **argv)
{
    int sacnt,prev_sacnt;

    mmap_fpga();
    stat = initialize_pvs();
//    printf("stat = %d\n",stat);
    prev_sacnt = 0;
    while(1==1){
        sacnt = fpgabase[CNT_REG];
        if(sacnt==prev_sacnt){
            usleep(2500);
//            printf(".");
        }else{
            prev_sacnt = sacnt;
            data_ready();
        }
    }

    return(0);
}
