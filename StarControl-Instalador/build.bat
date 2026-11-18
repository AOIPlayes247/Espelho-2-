@echo off
chcp 65001 >nul
title Criar instalador do StarControl
cd /d "%~dp0"
if exist agent.py goto temagente
echo Coloque aqui o agent.py baixado do site ^(botao Baixar Launcher para PC^) e rode de novo.
pause
exit /b 1
:temagente
set PY=python
where py >nul 2>nul && set PY=py
%PY% --version >nul 2>nul && goto temPython
echo Python nao encontrado. Instale em python.org marcando Add Python to PATH.
pause
exit /b 1
:temPython
if not exist .venv %PY% -m venv .venv
call .venv\Scripts\activate
python -m pip install --quiet "websockets>=12,<16" "pydirectinput>=1.0.4" "pynput>=1.7" "pystray>=0.19" pillow pyinstaller
if not errorlevel 1 goto compilar
echo Falha ao instalar as dependencias.
pause
exit /b 1
:compilar
pyinstaller --noconfirm --clean --onefile --noconsole --name StarControl-PC --icon icon.ico --hidden-import pynput.keyboard._win32 --hidden-import pynput.mouse._win32 --hidden-import pystray._win32 agent.py
if not errorlevel 1 goto instalador
echo Falha ao compilar.
pause
exit /b 1
:instalador
echo.
echo Pronto: dist\StarControl-PC.exe
set "ISCC="
if exist "%ProgramFiles(x86)%\Inno Setup 6\ISCC.exe" set "ISCC=%ProgramFiles(x86)%\Inno Setup 6\ISCC.exe"
if exist "%ProgramFiles%\Inno Setup 6\ISCC.exe" set "ISCC=%ProgramFiles%\Inno Setup 6\ISCC.exe"
if exist "%LocalAppData%\Programs\Inno Setup 6\ISCC.exe" set "ISCC=%LocalAppData%\Programs\Inno Setup 6\ISCC.exe"
if not defined ISCC goto semiscc
"%ISCC%" installer.iss
echo Instalador criado: Output\StarControl-Setup.exe
goto fim
:semiscc
echo Inno Setup nao encontrado. Instale em jrsoftware.org/isinfo.php e rode de novo para gerar o instalador.
echo Ou use direto o dist\StarControl-PC.exe.
:fim
pause
