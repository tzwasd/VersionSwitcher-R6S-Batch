@echo off
title R6˫�汾�����ű�

:launcher
if not exist current.mark goto :init
cls
set /p currentVersion=<current.mark
echo R6˫�汾�����ű�
echo.
echo ��ǰdefaultargs.dll�汾Ϊ%currentVersion%��
echo.
echo 1.����%currentVersion%��RainbowSix.exe
echo 2.����%currentVersion%��RainbowSix_Vulkan.exe
echo 3.�л�defaultargs.dll�汾
echo 4.����ϷĿ¼����%currentVersion%DA.dll
echo.
set /p option=���������ִ��:
if "%option%"=="1" goto :startgame
if "%option%"=="2" goto :startgame_Vulkan
if "%option%"=="3" goto :switch
if "%option%"=="4" goto :update
exit

:init
cls
echo δ�ҵ�current.mark�����ֶ�ȷ�ϵ�ǰdefaultargs.dll�汾
echo 1.Steam
echo 2.Uplay
set /p option_1=���������ѡ��:
if "%option_1%"=="1" echo steam>current.mark
if "%option_1%"=="2" echo uplay>current.mark
goto :launcher

:startgame
if "%currentVersion%"=="steam" start steam://rungameid/359550
if "%currentVersion%"=="uplay" start uplay://launch/635/0
exit

:startgame_Vulkan
if "%currentVersion%"=="steam" start ..\RainbowSix_Vulkan.exe
if "%currentVersion%"=="uplay" start uplay://launch/635/1
exit

:switch
cls
echo �л�defaultargs.dll�汾
echo 1.Steam
echo 2.Uplay
set /p option_2=���������ѡ��:
if "%option_2%"=="1" (
    copy steamDA.dll ..\defaultargs.dll
    echo steam>current.mark
)
if "%option_2%"=="2" (
    copy uplayDA.dll ..\defaultargs.dll
    echo uplay>current.mark
)
goto :launcher

:update
cls
xcopy /y /f ..\defaultargs.dll %currentVersion%DA.dll
pause
goto :launcher
