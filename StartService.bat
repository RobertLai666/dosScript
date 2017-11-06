:: Function Name : StartOracleXE
:: Update author : Robert Lai
:: Update Datet : 2015/11/12
:: Desc : Start Oracle
@echo off

net start OracleServiceXE
:: d:\server\oraclexe\app\oracle\product\11.2.0\server\bin\ORACLE.EXE XE

::Sleep 6 seconds
ping 127.0.0.1 -n 6 >nul

net start OracleXETNSListener
:: D:\Server\oraclexe\app\oracle\product\11.2.0\server\BIN\tnslsnr.exe

@echo on