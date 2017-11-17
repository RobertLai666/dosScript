@echo off

REM ********************
REM Func:netspeed.bat
REM 偵測網路速度
REM author：Robert Lai
REM update History
REM 2017/11/17 by Robert add timestemp function
REM ********************

REM Initialization Parameter
set MyDate=%date:~0,4%%date:~5,2%%date:~8,2%
set jobtime=%time: =0%
set MyTime=%jobtime:~0,2%%jobtime:~3,2%%jobtime:~6,2%
set AppName=netspeed
set StepName01=loop

set loopcount=60
set pingcount=10
set sleepTime=60

echo loopcount %loopcount%
echo pingcount %pingcount%
echo sleepTime %sleepTime%

call:timeStamp 1 %AppName%

:loop

set /a loopcount -= 1
ping 168.95.1.1 -n %pingcount%
timeout /t %sleepTime%
echo.
echo loopcount  %loopcount%

call:timeStamp 2 %StepName01%

if %loopcount% GTR 0 goto loop

call:timeStamp 2 %AppName%


:timeStamp %1 %2
rem parm1 為 1 代表start 為2代表stop
if %1 equ 1 set STR=Start
if %1 equ 2 set STR=End
echo %date:~0,10% %time% %2 %STR% *****
@echo:
goto:eof

@echo on