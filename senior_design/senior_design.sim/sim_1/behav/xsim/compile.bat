@echo off
REM ****************************************************************************
REM Vivado (TM) v2022.1.2 (64-bit)
REM
REM Filename    : compile.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for compiling the simulation design source files
REM
REM Generated by Vivado on Thu Nov 03 16:24:28 -0700 2022
REM SW Build 3605665 on Fri Aug  5 22:53:37 MDT 2022
REM
REM IP Build 3603185 on Sat Aug  6 04:07:44 MDT 2022
REM
REM usage: compile.bat
REM
REM ****************************************************************************
REM compile Verilog/System Verilog design sources
echo "xvlog --incr --relax -prj safety_circuit_tb_vlog.prj"
call xvlog  --incr --relax -prj safety_circuit_tb_vlog.prj -log xvlog.log
call type xvlog.log > compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
