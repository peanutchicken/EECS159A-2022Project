#include <stdio.h>
#include <stdlib.h>

//fault is high output, low is no fault
int main(){

    return 0;
}

//Brake System plausability fault handler
//Default low, high on fault
int bspFault(unsigned long b1, unsigned long b2){
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
    return 0;
}

//Master Switch Handler
//Default low, high on fault
int TractiveSystemMasterSwitch(unsigned long in){
    return 0;
}

//High Voltage Disconnect Interlock handler
//Default low, high on fault
int HVDInterlock(unsigned long in){
    return 0;
}

//additional interlock handler
int miscInterlock(unsigned long in){
    return 0;
}