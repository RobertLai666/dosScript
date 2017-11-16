@echo off

REM ********************
REM Func:netspeed.bat
REM 偵測網路速度
REM Create:2017/11/16 By Robert Lai
REM loopcount 執行多少次
REM pingcount Ping幾次
REM sleeptime 間隔多久
REM ********************

REM Initialization Parameter
set MyDate=%date:~0,4%%date:~5,2%%date:~8,2%
set jobtime=%time: =0%
set MyTime=%jobtime:~0,2%%jobtime:~3,2%%jobtime:~6,2%

set loopcount=120
set pingcount=10

set sleepTime=30

echo loopcount %loopcount%
echo pingcount %pingcount%
echo sleepTime %sleepTime%

echo "start time %MyDate%-%MyTime%"

:loop

set /a loopcount -= 1
ping 168.95.1.1 -n %pingcount%
timeout /t %sleepTime%
echo.
echo loopcount  %loopcount%

echo "now time is %MyDate%-%MyTime%"

if %loopcount% GTR 0 goto loop

echo "end time is %MyDate%-%MyTime%"

@echo on