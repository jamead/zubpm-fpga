/********************************************************************
*  LTC2986 Temperature Readout Chip 
*  8-3-2020
*  
*  This program reads the thermistor temperatures from the LTC2986
********************************************************************/
#include "xil_printf.h"
#include "sleep.h"
#include "../inc/pl_regs.h"


void setup_thermistors(u8 chipnum)
{
    //Setup which of the 3 chips to setup
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SEL_REG, chipnum);
	usleep(1000);

	// Set up the 10KOhm sense resistor on Channel 2....
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x020204e8);
	usleep(1000);
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x0202059c);
	usleep(1000);
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x02020640);
	usleep(1000);
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x02020700);
	usleep(1000);

	// Set up the first thermistor on channel 4...
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x02020cb0);
	usleep(1000);
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x02020d8c);
	usleep(1000);
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x02020e00);
	usleep(1000);
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x02020f00);
	usleep(1000);

	// Set up the second thermistor on channel 6...
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x020214b0);
	usleep(1000);
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x0202158c);
	usleep(1000);
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x02021600);
	usleep(1000);
	Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x02021700);
	usleep(1000);

}


void read_thermistors(u8 chipnum, float *temp1, float *temp2)
{

  int dat1, dat2, dat3;

  //Setup which of the 3 chips to setup
  Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SEL_REG, chipnum);
  usleep(1000);


  // Read the first thermistor on CH4:
   Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x02000084);
   usleep(170000);

   Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x03001f00);
   usleep(1000);
   dat1 = Xil_In32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG);

   Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x03001e00);
   usleep(1000);
   dat2 = Xil_In32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG);

   Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x03001d00);
   usleep(1000);
   dat3 = Xil_In32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG);

   *temp1 = (float)(dat1 + dat2*256 + dat3*65536)/1024.0;



   // Read the second thermistor on CH6:
   Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x02000086);
   usleep(170000);
      
   Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x03002700);
   usleep(1000);
   dat1 = Xil_In32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG);
      
   Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x03002600);
   usleep(1000);
   dat2 = Xil_In32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG);

   Xil_Out32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG, 0x03002500);
   usleep(1000);
   dat3 = Xil_In32(XPAR_M_AXI_BASEADDR + THERM_SPI_REG);
      
   *temp2 = (float)(dat1 + dat2*256 + dat3*65536)/1024.0;



}


