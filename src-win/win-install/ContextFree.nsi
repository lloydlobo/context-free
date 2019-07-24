; Context Free
; ---------------------
; Copyright (C) 2005 John Horigan
;
; This program is free software; you can redistribute it and/or
; modify it under the terms of the GNU General Public License
; as published by the Free Software Foundation; either version 2
; of the License, or (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
; 
; John Horigan can be contacted at john@glyphic.com or at
; John Horigan, 1209 Villa St., Mountain View, CA 94041-1123, USA
;

!define VER_MAJOR 3
!define VER_MINOR 2

SetCompressor bzip2
RequestExecutionLevel user

!define PRODUCT "ContextFree"
!define VERSION "${VER_MAJOR}.${VER_MINOR}"

!include "MUI.nsh"
!include WordFunc.nsh
!include "x64.nsh"
!include WinVer.nsh

;--------------------------------
;Variables

  Var MUI_TEMP
  Var STARTMENU_FOLDER
  
;--------------------------------
;Configuration

  !define MUI_ICON "ContextFree.ico"
  !define MUI_UNICON "ContextFree.ico"
  
  !define MUI_WELCOMEFINISHPAGE_BITMAP "sidebar.bmp"
  !define MUI_UNWELCOMEFINISHPAGE_BITMAP "sidebar.bmp"


  !define MUI_WELCOMEPAGE_TITLE "Context Free"
    
  
  !define MUI_FINISHPAGE_NOAUTOCLOSE
  !define MUI_UNFINISHPAGE_NOAUTOCLOSE

ShowInstDetails show
ShowUninstDetails show

  
;General
  OutFile "ContextFreeInstall.exe"
  
  ;License page
  LicenseData "license.txt"

  Name "${PRODUCT}"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_DIRECTORY

  ;Start Menu Folder Page Configuration
  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\OzoneSoft\ContextFree" 
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"
  
  !insertmacro MUI_PAGE_STARTMENU Application $STARTMENU_FOLDER

!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

  ;Language
  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "Context Free (required)" 
SectionIn RO
  SetOutPath "$INSTDIR"
  ClearErrors
  
  File 'license.txt'

  ${If} ${RunningX64}
    File "..\\..\\src-net\\Release64\\ContextFree.exe" 
    File "..\\..\\Release64\\ContextFreeCLI.exe" 
    File "..\\..\\src-net\\Release64\\CFControls.dll" 
    File "..\\..\\src-net\\Release64\\FileDlgExtenders.dll" 
    File "..\\..\\src-net\\Release64\\WeifenLuo.WinFormsUI.Docking.dll" 
    File "..\\..\\src-net\\Release64\\WeifenLuo.WinFormsUI.Docking.ThemeVS2015.dll" 
    File "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Redist\\MSVC\\14.21.27702\\x64\\Microsoft.VC142.CRT\\vcruntime140.dll"
    File "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Redist\\MSVC\\14.21.27702\\x64\\Microsoft.VC142.CRT\\concrt140.dll"
    File "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Redist\\MSVC\\14.21.27702\\x64\\Microsoft.VC142.CRT\\msvcp140.dll"
    File "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Redist\\MSVC\\14.21.27702\\x64\\Microsoft.VC142.CRT\\msvcp140_1.dll"
    File "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Redist\\MSVC\\14.21.27702\\x64\\Microsoft.VC142.CRT\\msvcp140_2.dll"
    File "C:\\Program Files (x86)\\Windows Kits\\10\\Redist\\ucrt\\DLLs\\x64\\*.dll"
  ${Else}
    File "..\\..\\src-net\\release\\ContextFree.exe" 
    File "..\\..\\Release\\ContextFreeCLI.exe" 
    File "..\\..\\src-net\\Release\\CFControls.dll" 
    File "..\\..\\src-net\\Release\\FileDlgExtenders.dll" 
    File "..\\..\\src-net\\Release\\WeifenLuo.WinFormsUI.Docking.dll" 
    File "..\\..\\src-net\\Release\\WeifenLuo.WinFormsUI.Docking.ThemeVS2015.dll" 
    File "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Redist\\MSVC\\14.21.27702\\x86\\Microsoft.VC142.CRT\\vcruntime140.dll"
    File "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Redist\\MSVC\\14.21.27702\\x86\\Microsoft.VC142.CRT\\concrt140.dll"
    File "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Redist\\MSVC\\14.21.27702\\x86\\Microsoft.VC142.CRT\\msvcp140.dll"
    File "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Redist\\MSVC\\14.21.27702\\x86\\Microsoft.VC142.CRT\\msvcp140_1.dll"
    File "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Redist\\MSVC\\14.21.27702\\x86\\Microsoft.VC142.CRT\\msvcp140_2.dll"
    File "C:\\Program Files (x86)\\Windows Kits\\10\\Redist\\ucrt\\DLLs\\x86\\*.dll"
  ${EndIf}
  File "..\\..\\src-net\\packages\\jacobslusser.ScintillaNET.3.6.3\\lib\\net40\\ScintillaNET.dll"
SectionEnd


Section -post

  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\{DD0B06AD-5E55-41be-88E5-E9D13BAF06F4}" \
                   "DisplayName" "Context Free"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\{DD0B06AD-5E55-41be-88E5-E9D13BAF06F4}" \
                   "UninstallString" '"$INSTDIR\uninst-contextfree.exe"'
  WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\{DD0B06AD-5E55-41be-88E5-E9D13BAF06F4}" \
                   "NoModify" 1
  WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\{DD0B06AD-5E55-41be-88E5-E9D13BAF06F4}" \
                   "NoRepair" 1
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\{DD0B06AD-5E55-41be-88E5-E9D13BAF06F4}" \
                   "InstallDir" '$INSTDIR'

  SetOutPath $INSTDIR



  ; since the installer is now created last (in 1.2+), this makes sure 
  ; that any old installer that is readonly is overwritten.
  Delete $INSTDIR\uninst-contextfree.exe 
  WriteUninstaller $INSTDIR\uninst-contextfree.exe

  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$STARTMENU_FOLDER"
    CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Context Free.lnk" "$INSTDIR\ContextFree.exe"
  
  !insertmacro MUI_STARTMENU_WRITE_END

SectionEnd

Function .onInstSuccess
  Exec '"$INSTDIR\ContextFree.exe"'
FunctionEnd

Function .onInit
  ;Folder-selection page
  ${If} ${AtLeastWin2000}
    StrCpy $INSTDIR "$LOCALAPPDATA\OzoneSoft\${PRODUCT}"
  ${Else}
    StrCpy $INSTDIR "$PROGRAMFILES\OzoneSoft\${PRODUCT}"
  ${EndIf}
  
  ReadRegDWORD $0 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" "Release"
  ${If} $0 < 378389
    MessageBox \
      MB_OK|MB_USERICON \
      ".NET Framework v4.5 or later is required. Please make sure that your system has all the latest updates."
  ${EndIf}

  SetOutPath $TEMP
  File /oname=spltmp.bmp "splash.bmp"

  splash::show 4000 $TEMP\spltmp
  
  Pop $0 ; $0 has '1' if the user closed the splash screen early,
         ; '0' if everything closed normal, and '-1' if some error occured.

  Delete $TEMP\spltmp.bmp
FunctionEnd

;--------------------------------
;Uninstaller Section

Section "Uninstall"
  Delete '$INSTDIR\ContextFree.exe'
  Delete '$INSTDIR\ContextFreeCLI.exe'
  Delete '$INSTDIR\*.dll'
  Delete '$INSTDIR\license.txt'
  Delete '$INSTDIR\COPYING.GPLv2.txt'
  Delete '$INSTDIR\uninst-contextfree.exe' 
  RMDir  '$INSTDIR'

  !insertmacro MUI_STARTMENU_GETFOLDER Application $MUI_TEMP

  RMDir /r "$SMPROGRAMS\$MUI_TEMP"
  SetShellVarContext all
  RMDir /r "$SMPROGRAMS\$MUI_TEMP"
  

  SetRegView 32
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\{DD0B06AD-5E55-41be-88E5-E9D13BAF06F4}"
  DeleteRegKey HKCU "Software\OzoneSoft\ContextFree" 
  DeleteRegKey HKCU "Software\Classes\.cfdg"
  DeleteRegKey HKCU "Software\Classes\ContextFree.Document"
  SetRegView 64
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\{DD0B06AD-5E55-41be-88E5-E9D13BAF06F4}"
  DeleteRegKey HKCU "Software\OzoneSoft\ContextFree" 
  DeleteRegKey HKCU "Software\Classes\.cfdg"
  DeleteRegKey HKCU "Software\Classes\ContextFree.Document"


SectionEnd

;eof
