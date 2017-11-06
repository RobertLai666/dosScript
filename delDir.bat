:: Function Name : delDir.bat
:: Update author : Robert Lai
:: Update Datet : 2017/02/02
:: Desc : 刪除路徑和天數，可調整路徑和刪除天數

echo off

REM "定期刪除目錄

echo "---定期刪除過期目錄---"
echo "---執行開始時間  %date% %time% ---"
echo:

:: 刪除路徑
SET DELPATH=D:\CCC
:: 刪除天數
SET DAYS=365

echo "--- 刪除路徑 %DELPATH% 刪除天數： %DAYS% ---"

attrib -S -H %DELPATH%\* /D /S

echo "--- 刪除前檔案清單 ---"
forfiles /p "%DELPATH%" /s -c  "cmd /c echo @path"

::實際刪除指令
forfiles /p "%DELPATH%" /s /d %DAYS% -c  "cmd /c rd /q @path"

echo "--- 刪除後檔案清單 ---"
forfiles /p "%DELPATH%" /s -c  "cmd /c echo @path"

echo:
echo "---執行結束時間  %date% %time% ---"

echo on