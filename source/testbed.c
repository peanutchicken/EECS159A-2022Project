#include "main.h"

int poll(unsigned long bsp1, unsigned long aBsp1, unsigned long aBsp2, unsigned long imd1, unsigned long inertia1, unsigned long shutdownL,
		unsigned long shutdownR, unsigned long shutdownC, unsigned long ams1, unsigned long bots1,
		unsigned long master1, unsigned long hvd1, unsigned long misc1){
	
	//print the values recieved
	printf("\n\n--Values--\n\n");
	printf("bsp1: %lu\n",bsp1);
	printf("imd1: %lu\n",imd1);
	printf("inertia1: %lu\n",inertia1);
	printf("shutdownL: %lu\n",shutdownL);
	printf("shutdownR: %lu\n",shutdownR);
	printf("shutdownC: %lu\n",shutdownC);
	printf("ams1: %lu\n",ams1);
	printf("bots1: %lu\n",bots1);
	printf("master1: %lu\n",master1);
	printf("hvd1: %lu\n",hvd1);
	printf("misc1: %lu\n",misc1);

	//polls each individual device
	int ret = bspFault(bsp1,aBsp1,aBsp2)&&IMDFault(imd1)&&shutdownButtons(shutdownL,shutdownR,shutdownC)&&
			AMSFault(ams1)&&BOTSFault(bots1)&&TractiveSystemMasterSwitch(master1)&&
			HVDInterlock(hvd1)&&miscInterlock(misc1);
	printf("\nFault Value is: %d\n\n", ret);
	return ret;
}

int main(){

	//BSP values
	unsigned long bsp1=0, aBsp1=0, aBsp2=0;

	//IMD values
	unsigned long imd1=0;

	//Inertia Switch values
	unsigned long inertia1=0;

	//shutdown button values: left, right and cockpit
	unsigned long shutdownL=0, shutdownR=0, shutdownC=0;

	//AMS Fault values
	unsigned long ams1=0;

	//BOTS Fault values
	unsigned long bots1=0;

	//master switch values
	unsigned long master1=0;

	//HVD values
	unsigned long hvd1=0;

	//misc values
	unsigned long misc1=0;


	poll(bsp1,aBsp1,aBsp2,imd1,inertia1,
		shutdownL,shutdownR,shutdownC,ams1,
		bots1,master1,hvd1,misc1);

	return 0;
}	