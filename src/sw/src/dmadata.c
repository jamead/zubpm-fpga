
// Trigger and Send DMA Data: ADC, TbT, FA

#include <stdio.h>

#include <xparameters.h>

#include <FreeRTOS.h>
#include <lwip/sys.h>
#include <lwip/stats.h>
#include "xil_cache.h"

#include "local.h"
#include "zubpm.h"
#include "control.h"

#include "xtime_l.h"





void dma_arm() {

	u32 i;
	u32 *adc_ptr, *tbt_ptr, *fa_ptr;
	u32 adclen, tbtlen, falen;

	xil_printf("Arming DMA...\r\n");

	//Read the DMA length registers
	adclen = Xil_In32(XPAR_M_AXI_BASEADDR + DMA_ADCBURSTLEN_REG);
	tbtlen = Xil_In32(XPAR_M_AXI_BASEADDR + DMA_TBTBURSTLEN_REG);
	falen = Xil_In32(XPAR_M_AXI_BASEADDR + DMA_FABURSTLEN_REG);
	if (adclen < 10000) {
		adclen = 10000;
		Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_ADCBURSTLEN_REG, adclen);
	}
	if (adclen > 1000000) {
		adclen = 1000000;
		Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_ADCBURSTLEN_REG, adclen);
	}
	if (tbtlen < 10000) {
		tbtlen = 10000;
		Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_TBTBURSTLEN_REG, tbtlen);
	}
	if (tbtlen > 1000000) {
		tbtlen = 1000000;
		Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_TBTBURSTLEN_REG, tbtlen);
	}
	if (falen < 1000) {
		falen = 1000;
		Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_FABURSTLEN_REG, falen);
	}
	if (falen > 20000) {
		falen = 20000;
		Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_FABURSTLEN_REG, falen);
	}



    //adclen = 1e5;
    //tbtlen = 80e3;
    //falen  = 20e3;  // 2 seconds

	xil_printf("DMA ADC Length = %d\r\n",adclen);
	xil_printf("DMA TbT Length = %d\r\n",tbtlen);
	xil_printf("DMA FA Length = %d\r\n",falen);

	//clear the DMA memory
	adc_ptr = (u32 *) ADC_DMA_DATA;
	tbt_ptr = (u32 *) TBT_DMA_DATA;
	fa_ptr  = (u32 *) FA_DMA_DATA;
	for (i=0;i<10000000;i++)  adc_ptr[i] = 0;
	for (i=0;i<10000000;i++)  tbt_ptr[i] = 0;
	for (i=0;i<10000000;i++)  fa_ptr[i]  = 0;


	//reset the PL DMA FIFO
	Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_FIFORST_REG, 1);
	Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_FIFORST_REG, 0);

	//reset the AXI DMA Core
	Xil_Out32(XPAR_AXI_DMA_ADC_BASEADDR + S2MM_DMACR, 4);
	Xil_Out32(XPAR_AXI_DMA_TBT_BASEADDR + S2MM_DMACR, 4);
	Xil_Out32(XPAR_AXI_DMA_FA_BASEADDR + S2MM_DMACR, 4);
	//dmaadcbase[S2MM_DMACR] = 4;
	//dmatbtbase[S2MM_DMACR] = 4;
	//dmafabase[S2MM_DMACR]  = 4;

	//write the number of ADC samples to DMA
	//Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_ADCBURSTLEN_REG, adclen+16);
	//Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_TBTBURSTLEN_REG, tbtlen);
	//Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_FABURSTLEN_REG, falen);

	//Start the S2MM channel with all interrupts masked
	Xil_Out32(XPAR_AXI_DMA_ADC_BASEADDR + S2MM_DMACR, 0xF001);
	Xil_Out32(XPAR_AXI_DMA_TBT_BASEADDR + S2MM_DMACR, 0xF001);
	Xil_Out32(XPAR_AXI_DMA_FA_BASEADDR + S2MM_DMACR, 0xF001);
	//dmaadcbase[S2MM_DMACR] = 0xF001;
	//dmatbtbase[S2MM_DMACR] = 0xF001;
	//dmafabase[S2MM_DMACR]  = 0xF001;

	//Write the Destination Address for the ADC data
	Xil_Out32(XPAR_AXI_DMA_ADC_BASEADDR + S2MM_DA, ADC_DMA_DATA);
	Xil_Out32(XPAR_AXI_DMA_TBT_BASEADDR + S2MM_DA, TBT_DMA_DATA);
	Xil_Out32(XPAR_AXI_DMA_FA_BASEADDR + S2MM_DA, FA_DMA_DATA);
	//dmaadcbase[S2MM_DA] = ADC_DMA_DATA;
    //dmatbtbase[S2MM_DA] = TBT_DMA_DATA;
    //dmafabase[S2MM_DA]  = FA_DMA_DATA;

	//Write the S2MM transfer length (must be written last (PG021 p72)
    //length is in bytes, for adc: 4 adc channels * 2bytes/sample
	Xil_Out32(XPAR_AXI_DMA_ADC_BASEADDR + S2MM_LEN, (adclen+16) * 4 * 2);
	//dmaadcbase[S2MM_LEN] = (dma_adclen+16) * 4 * 2;
	//length is in bytes, for TbT: 16 - 4 byte values
	Xil_Out32(XPAR_AXI_DMA_TBT_BASEADDR + S2MM_LEN, (tbtlen) * 16 * 4);
    //dmatbtbase[S2MM_LEN] = (dma_tbtlen) * 16 * 4;
	//length is in bytes, for FA: 10 - 4 byte values
	Xil_Out32(XPAR_AXI_DMA_FA_BASEADDR + S2MM_LEN, (falen) * 10 * 4);
    //dmafabase[S2MM_LEN] = (dma_tbtlen) * 10 * 4;

	//Enable the ADC and TbT DMA
	xil_printf("Enabling the DMA\r\n");
	Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_ADCENABLE_REG, 1);
	Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_TBTENABLE_REG, 1);
	Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_FAENABLE_REG, 1);

	//Allow Soft or EVR triggers
	//Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_PERMIT_REG, 1);

}





static void dmadata_push(void *unused)
{
    (void)unused;


    static struct {
        s16 cha; // 0
        s16 chb; // 2
        s16 chc; // 4
        s16 chd; // 6
    } adcmsg[100000];

    s16 cha, chb, chc, chd;
    u32 i,regval;
    u32 *adc_data;
    u32 trignum=0, prevtrignum=0;

    dma_arm();

    while(1) {


		vTaskDelay(pdMS_TO_TICKS(1000));

		trignum = Xil_In32(XPAR_M_AXI_BASEADDR + DMA_TRIGCNT_REG);
        xil_printf("\nTrig Num: %d  \r\n",trignum);
		if (trignum != prevtrignum)  {
			//received a DMA trigger
			xil_printf("Received DMA Trigger... Disabling DMA\r\n");
			Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_ADCENABLE_REG, 0);
			Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_TBTENABLE_REG, 0);
			Xil_Out32(XPAR_M_AXI_BASEADDR + DMA_FAENABLE_REG, 0);
   			xil_printf("\nTrig Num: %d  \r\n",trignum);
            prevtrignum = trignum;
 	        Xil_DCacheInvalidateRange(ADC_DMA_DATA,1e6);
 	        Xil_DCacheInvalidateRange(TBT_DMA_DATA,1e6);
 	        Xil_DCacheInvalidateRange(FA_DMA_DATA,1e6);



            // read out live adc data buffer from FIFO
 	        adc_data = (u32 *) ADC_DMA_DATA;
 	        // read out live adc data buffer from FIFO
 	        for (i=0;i<100000;i++) {
 	             //chA and chB are in a single 32 bit word
 	         	regval = *adc_data++;
 	         	cha = (s16) ((regval & 0xFFFF0000) >> 16);
 	         	chb = (s16) (regval & 0xFFFF);
 	            regval = *adc_data++;
 	         	chc = (s16) ((regval & 0xFFFF0000) >> 16);
 	         	chd = (s16) (regval & 0xFFFF);

 	            //chC and chD are in a single 32 bit word
 	            adcmsg[i].cha = htons(chc);
 	            adcmsg[i].chb = htons(chd);
 	            adcmsg[i].chc = htons(cha);
 	            adcmsg[i].chd = htons(chb);

 	         }


 	        for (i = 0; i < 10; i++) {
 	            xil_printf("Sample %lu: A=%d  B=%d  C=%d  D=%d\r\n",
 	                       (unsigned long)i,
 	                       ntohs(adcmsg[i].cha),
 	                       ntohs(adcmsg[i].chb),
 	                       ntohs(adcmsg[i].chc),
 	                       ntohs(adcmsg[i].chd));
 	        }





        psc_send(the_server, 53, sizeof(adcmsg), adcmsg);

        //re-arm AXI DMA for next trigger
        dma_arm();

    }




    }
}

void dmadata_setup(void)
{
    printf("INFO: Starting DMA Data daemon\n");
    sys_thread_new("dmadata", dmadata_push, NULL, THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);
}

