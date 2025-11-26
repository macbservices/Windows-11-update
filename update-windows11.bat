@echo off
REM Detecta a versão do Windows 11
for /f "tokens=3 delims=." %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseId ^| findstr ReleaseId') do set version=%%a

echo Versão atual do Windows: %version%

REM Instala as atualizações offline que faltam
if "%version%"=="2302" (
    echo Instalando atualizações para 24H2 e 25H2...
    wusa.exe updates\update-24h2.msu /quiet /norestart
    wusa.exe updates\update-25h2.msu /quiet /norestart
) else if "%version%"=="2402" (
    echo Instalando atualização para 25H2...
    wusa.exe updates\update-25h2.msu /quiet /norestart
) else (
    echo Sistema atualizado ou versão desconhecida.
)

pause
