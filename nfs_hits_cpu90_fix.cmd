@echo off
title = Fix 90%% load for NFS Payback. by Octanium (edited by exyno5)
set "CPU_Cores=0"
set "CPU_Threads=0"
set "UserCFGFileCDDir=%USERPROFILE%\Documents\Need for Speed(TM) Payback\settings\"
set "UserCFGFileName=user.cfg"
set "UserCFGFile=%UserCFGFileCDDir%%UserCFGFileName%"
for /f "tokens=2 delims= " %%a in ('"wmic CPU Get DeviceID,NumberOfCores,NumberOfLogicalProcessors"') do set "CPU_Cores=%%a"
for /f "tokens=3 delims= " %%a in ('"wmic CPU Get DeviceID,NumberOfCores,NumberOfLogicalProcessors"') do set "CPU_Threads=%%a"
if %CPU_Cores% == 0 goto oops_a
echo.
echo    Fix 90%% CPU load!
echo    For NFS Payback
echo    by exyno5
echo.    
echo  ==== Your CPU ====
echo   CPU cores  : %CPU_Cores%
echo   CPU threads: %CPU_Threads%
echo  ==================
REM Create user.cfg
if exist "%UserCFGFile%" (
    if exist "%UserCFGFileCDDir%%UserCFGFileName%.bak" (
        del "%UserCFGFile%" /q /f
    ) else (
        rename "%UserCFGFileCDDir%%UserCFGFileName%" "%UserCFGFileName%.bak"
    )   
)
echo Thread.ProcessorCount %CPU_Cores% >> "%UserCFGFile%"
echo Thread.MaxProcessorCount %CPU_Cores% >> "%UserCFGFile%"
echo Thread.MinFreeProcessorCount 0 >> "%UserCFGFile%"
echo Thread.JobThreadPriority 0 >> "%UserCFGFile%"
echo GstRender.Thread.MaxProcessorCount %CPU_Threads% >> "%UserCFGFile%"
if exist "%UserCFGFile%" (
    echo.
    echo  ========================
    echo   File user.cfg created! 
    echo  ========================
    echo.
    echo.
    echo.
)
pause
exit

:oops_a
cls
echo.
echo  =============================================
echo    Oooops something went wrong :( (code: a)
echo  =============================================
echo.
echo.
pause
exit
