#include "main.h"

//fault is high output (non zero), low is no fault (0)

//Brake System plausability device fault handler
//The following conditions should be true before a fault
// -Braking hard without locking the wheels
// -Motor/Accumulator current is at a level where 5 kW of electrical power in the DC circuit
// is delivered to the Motors at the nominal battery voltage.
// The BSPD may delay opening the shutdown circuit up to 0.5 sec to avoid false trips
//
//High on fault
int BSPDFault(unsigned long b1, unsigned long a1, unsigned long a2){
    return 0;
}

//Insulation Monitoring Device fault handler
//output Default low, high on fault
//High input is fault
int IMDFault(unsigned long in){
    return 0;
}

//Inertia Switch Fault handler
//refer to FSAE rulebook T.9.4.3
//output Default low, high on fault
//High input is fault
//for zyler
int inertiaFault(unsigned long in){
    //if impact load decelerates vehicle to 8-11g, open shutdown circuit
    if (in >= 8 && in <= 11)
        return 1;
    else
        return 0;
}

//shutdown Button Handler
//high Fault while all 3 are high
//fault on all 3 are high
//for zyler
int shutdownButtons(unsigned long bLeft, unsigned long bCockpit, unsigned long bRight){
    if (bLeft || bCockpit || bRight)
        return 1;
    else
        return 0;
}

//Accumulator Management System Fault Handler
//output Default low, high on fault
//Fault on high input
//for zyler
int AMSFault(unsigned long in){
     return 0;
}

//Brake Overtravel switch Fault Handler
//output Default low, high on fault
//fault on high input
int BOTSFault(unsigned long in){
    
    //if input voltage is >11.5 volts no fault
    if(in >= 11500)
        return 0;
    return 1;
}

//Master Switch Handler
//output Default low, high on fault
//fault on low
int TractiveSystemMasterSwitch(unsigned long in){
    
    //if input voltage is >11.5 volts no fault
    if(in >= 11500)
        return 0;
    return 1;
}

//High Voltage Disconnect Interlock handler
//output Default low, high on fault
//fault on low
int HVDInterlock(unsigned long in){
    
    //if input voltage is >11.5 volts no fault
    if(in >= 11500)
        return 0;
    return 1;
}

//additional interlock handler
//output Default low, high on fault
//fault on low
int miscInterlock(unsigned long in){
    
    //if input voltage is >11.5 volts no fault
    if(in >= 11500)
        return 0;
    return 1;
}