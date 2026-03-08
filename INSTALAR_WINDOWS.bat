@echo off
title SUT Browser - Instalador
color 0A
echo.
echo  ############################################
echo  #        SUT Browser - Instalador          #
echo  ############################################
echo.

:: ── Verifica se Flutter esta instalado ──────────────────────────────────
flutter --version >nul 2>nul
if %errorlevel% neq 0 (
    echo  [!] Flutter nao encontrado. Instalando...
    echo.

    :: Baixa Flutter via PowerShell
    powershell -Command "& {
        Write-Host '  Baixando Flutter SDK...'
        $url = 'https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.19.0-stable.zip'
        $dest = '$env:USERPROFILE\flutter.zip'
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
        Write-Host '  Extraindo...'
        Expand-Archive -Path $dest -DestinationPath '$env:USERPROFILE' -Force
        Remove-Item $dest
        Write-Host '  Flutter extraido!'
    }"

    set "FLUTTER=%USERPROFILE%\flutter\bin"
    setx PATH "%PATH%;%FLUTTER%" >nul

    echo  Flutter instalado! Reinicie o terminal e rode este arquivo novamente.
    pause
    exit /b
)

echo  [OK] Flutter encontrado!
echo.

:: ── Instala dependencias ────────────────────────────────────────────────
echo  Instalando dependencias...
flutter pub get
echo.

:: ── Ativa suporte Windows ───────────────────────────────────────────────
flutter config --enable-windows-desktop >nul 2>nul

:: ── Compila para Windows ────────────────────────────────────────────────
echo  Compilando SUT Browser para Windows...
echo  (Pode demorar 2-3 minutos na primeira vez)
echo.

flutter build windows --release

if %errorlevel% neq 0 (
    echo.
    echo  [ERRO] Falha na compilacao. Tire um print e mande para suporte.
    pause
    exit /b
)

:: ── Abre a pasta com o EXE ─────────────────────────────────────────────
echo.
echo  ================================================
echo   PRONTO! SUT Browser compilado com sucesso!
echo   Abrindo pasta com o instalavel...
echo  ================================================
echo.

explorer build\windows\x64\runner\Release\
start "" "build\windows\x64\runner\Release\sut_browser.exe"
pause
