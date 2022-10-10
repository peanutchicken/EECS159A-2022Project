#include "main.h"

//fault is high output (non zero), low is no fault (0)

//Brake System plausability/APPS plausability fault handler
//The following conditions should be true before a fault
// -Braking hard without locking the wheels
// -Motor/Accumulator current is at a level where 5 kW of electrical power in the DC circuit
// is delivered to the Motors at the nominal battery voltage.
// The BSPD may delay opening the shutdown circuit up to 0.5 sec to avoid false trips
//
//High on fault
int bspFault(unsigned long b1, unsigned long a1, unsigned long a2){
    return 0;
}

//Insulation Monitoring Device fault handler
//Default low, high on fault
int IMDFault(unsigned long in){
    return 0;
}

//Inertia Switch Fault handler
//Default low, high on fault
int inertiaFault(unsigned long in){
    return 0;
}

//shutdown Button Handler
//Fault while all 3 are high
int shutdownButtons(unsigned long bLeft, unsigned long bCockpit, unsigned long bRight){
    return 0;
}

//Accumulator Management System Fault Handler
//Default low, high on fault
int AMSFault(unsigned long in){
    return 0;
}

//Brake Overtravel switch Fault Handler
//Default low, high on fault
int BOTSFault(unsigned long in){
    
    //if input voltage is >11.5 volts no fault
    if(in >= 11500)
        return 0;
    return 1;
}

//Master Switch Handler
//Default low, high on fault
int TractiveSystemMasterSwitch(unsigned long in){
    
    //if input voltage is >11.5 volts no fault
    if(in >= 11500)
        return 0;
    return 1;
}

//High Voltage Disconnect Interlock handler
//Default low, high on fault
int HVDInterlock(unsigned long in){
    
    //if input voltage is >11.5 volts no fault
    if(in >= 11500)
        return 0;
    return 1;
}

//additional interlock handler
int miscInterlock(unsigned long in){
    
    //if input voltage is >11.5 volts no fault
    if(in >= 11500)
        return 0;
    return 1;
}