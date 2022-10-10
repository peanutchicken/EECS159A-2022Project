#ifndef MAIN
#define MAIN

#include <stdio.h>
#include <stdlib.h>

//fault is high output (non zero), low is no fault (0)

//Brake System plausability fault handler
//On greater than 10% difference, should trigger fault
//Default low, high on fault
int bspFault(unsigned long b1, unsigned long b2);

//Insulation Monitoring Device fault handler
//Default low, high on fault
int IMDFault(unsigned long in);


//Inertia Switch Fault handler
//Default low, high on fault
int inertiaFault(unsigned long in);


//shutdown Button Handler
//Fault while all 3 are high
int shutdownButtons(unsigned long bLeft, unsigned long bCockpit, unsigned long bRight);


//Accumulator Management System Fault Handler
//Default low, high on fault
int AMSFault(unsigned long in);


//Brake Overtravel switch Fault Handler
//Default low, high on fault
int BOTSFault(unsigned long in);


//Master Switch Handler
//Default low, high on fault
int TractiveSystemMasterSwitch(unsigned long in);


//High Voltage Disconnect Interlock handler
//Default low, high on fault
int HVDInterlock(unsigned long in);


//additional interlock handler
int miscInterlock(unsigned long in);


#endif /* MAIN */
