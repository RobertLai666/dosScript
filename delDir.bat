:: Function Name : delDir.bat
:: Update author : Robert Lai
:: Update Datet : 2017/02/02
:: Desc : �R�����|�M�ѼơA�i�վ���|�M�R���Ѽ�

echo off

REM "�w���R���ؿ�

echo "---�w���R���L���ؿ�---"
echo "---����}�l�ɶ�  %date% %time% ---"
echo:

:: �R�����|
SET DELPATH=D:\CCC
:: �R���Ѽ�
SET DAYS=365

echo "--- �R�����| %DELPATH% �R���ѼơG %DAYS% ---"

attrib -S -H %DELPATH%\* /D /S

echo "--- �R���e�ɮײM�� ---"
forfiles /p "%DELPATH%" /s -c  "cmd /c echo @path"

::��ڧR�����O
forfiles /p "%DELPATH%" /s /d %DAYS% -c  "cmd /c rd /q @path"

echo "--- �R�����ɮײM�� ---"
forfiles /p "%DELPATH%" /s -c  "cmd /c echo @path"

echo:
echo "---���浲���ɶ�  %date% %time% ---"

echo on