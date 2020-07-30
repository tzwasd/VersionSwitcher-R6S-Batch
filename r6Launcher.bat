@echo off
title R6双版本启动脚本

:launcher
if not exist current.mark goto :init
cls
set /p currentVersion=<current.mark
echo R6双版本启动脚本
echo.
echo 当前defaultargs.dll版本为%currentVersion%版
echo.
echo 1.启动%currentVersion%版RainbowSix.exe
echo 2.启动%currentVersion%版RainbowSix_Vulkan.exe
echo 3.切换defaultargs.dll版本
echo 4.从游戏目录更新%currentVersion%DA.dll
echo.
set /p option=请输入序号执行:
if "%option%"=="1" goto :startgame
if "%option%"=="2" goto :startgame_Vulkan
if "%option%"=="3" goto :switch
if "%option%"=="4" goto :update
exit

:init
cls
echo 未找到current.mark，请手动确认当前defaultargs.dll版本
echo 1.Steam
echo 2.Uplay
set /p option_1=请输入序号选择:
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
echo 切换defaultargs.dll版本
echo 1.Steam
echo 2.Uplay
set /p option_2=请输入序号选择:
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
