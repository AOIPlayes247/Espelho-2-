[Setup]
AppName=StarControl PC
AppVersion=1.0
AppPublisher=AOIofc1
AppPublisherURL=https://www.youtube.com/@AOIofc1
DefaultDirName={autopf}\StarControl
DefaultGroupName=StarControl
PrivilegesRequired=lowest
OutputDir=Output
OutputBaseFilename=StarControl-Setup
SetupIconFile=icon.ico
UninstallDisplayIcon={app}\StarControl-PC.exe
Compression=lzma2
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "Criar atalho na área de trabalho"; Flags: unchecked
Name: "autostart"; Description: "Iniciar com o Windows (em segundo plano, sem abrir o navegador)"; Flags: unchecked

[Files]
Source: "dist\StarControl-PC.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\StarControl PC"; Filename: "{app}\StarControl-PC.exe"
Name: "{autodesktop}\StarControl PC"; Filename: "{app}\StarControl-PC.exe"; Tasks: desktopicon
Name: "{userstartup}\StarControl PC"; Filename: "{app}\StarControl-PC.exe"; Parameters: "--silent"; Tasks: autostart

[Run]
Filename: "{app}\StarControl-PC.exe"; Description: "Abrir o StarControl agora"; Flags: nowait postinstall skipifsilent
