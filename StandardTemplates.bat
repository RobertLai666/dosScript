@echo off

REM ********************
REM Func:StandardTemplates.bat
REM 定義標準批次樣板
REM Create:2017/08/29 By Robert Lai
REM ********************

REM Initialization Parameter
set MyDate=%date:~0,4%%date:~5,2%%date:~8,2%
set jobtime=%time: =0%
set MyTime=%jobtime:~0,2%%jobtime:~3,2%%jobtime:~6,2%

set Location=CIGNA
set HOSTNAME=%COMPUTERNAME%
set AppName=StandardTemplates
set StepName01=KillTask
set StepName02=StartTask
set LogPath=D:\bat\log\
rem set ErrorPath=\\tpiums-profs\CitasPlus\BatchLog\Error\
set ErrorPath=D:\bat\log\
set LogFileName=%Location%_%HOSTNAME%_%AppName%_%MyDate%%MyTime%.log
set ErrorFileName=%Location%_%HOSTNAME%_%AppName%_%MyDate%.ERROR

REM Progrm Start
call:fun01  >> %LogPath%%LogFileName% 2>&1

:fun01
@echo off

call:timeStamp 1 %AppName%

call:timeStamp 1 %StepName01%

rem ex.stop tiff generation
taskkill /F /im notepad.exe
if %errorlevel% gtr 0 call:ErrorProcess %StepName01%

call:timeStamp 2 %StepName01%

rem sleep 5 sec and not log
timeout /t 1

call:timeStamp 1 %StepName02%

rem ex.Start tiff generation
start notepad.exe
if %errorlevel% gtr 0 call:ErrorProcess %StepName02%
call:timeStamp 2 %StepName02%

call:timeStamp 2 %AppName%

goto:eof

:timeStamp %1 %2
rem parm1 為 1 代表start 為2代表stop
if %1 equ 1 set STR=Start
if %1 equ 2 set STR=End
echo %date%%time% %2 %STR% *****
@echo:
goto:eof

:ErrorProcess %1
echo %1 process error
rem write error file to fs assigent path
echo Write error file %ErrorFileName% to %ErrorPath% *****
echo %1 >> %ErrorPath%%ErrorFileName%
rem 每次人工處理就先將檔案搬到bkup目錄，避免hostmonitor重複警告
goto:eof

@echo on

