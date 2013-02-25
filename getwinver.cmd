@echo off
:: Get-Win-Ver
:: Just a simple script to determine the windows version. You can call this from your own scripts. It sets two variables, win_v and win_v_name. win-v is the version number #.#, the rest is removed for simplicity and it's not needed anyway. win_v_name is the name of the operating system in a string. Feel free to modify this any way you like or just copy/paste it to your own script. Your welcome. :)
:: If you need a more specific answer, you might decide to modify this to not remove the build number. I guess it's possible it could help determine exact version.

:: Information below from: http://msdn.microsoft.com/en-us/library/windows/desktop/ms724832%28v=vs.85%29.aspx
:: Windows 8					6.2
:: Windows Server 2012			6.2
:: Windows 7					6.1
:: Windows Server 2008 R2		6.1
:: Windows Server 2008			6.0
:: Windows Vista				6.0
:: Windows Server 2003 R2		5.2
:: Windows Server 2003			5.2
:: Windows XP 64-Bit Edition	5.2
:: Windows XP					5.1
:: Windows 2000					5.0

SETLOCAL ENABLEDELAYEDEXPANSION

for /f "tokens=2 delims=[]" %%x in ('ver') do set win_v=%%x
for /f "tokens=1,2 delims=." %%x in ("%win_v%") do set win_v=%%x.%%y
set win_v=%win_v:Version =%

if %win_v% EQU 5.0 set win_v_name=Windows 2000
if %win_v% EQU 5.1 set win_v_name=Windows XP
if %win_v% EQU 5.2 set win_v_name=Windows Server 2003 / Server 2003 R2 / XP 64-Bit Edition
if %win_v% EQU 6.0 set win_v_name=Windows Vista / Server 2008
if %win_v% EQU 6.1 set win_v_name=Windows 7 / Server 2008 R2
if %win_v% EQU 6.2 set win_v_name=Windows 8 / Server 2012

:: Uncomment the below two lines for a test.
REM echo Version: %win_v% ^(%win_v_name%^)
REM pause