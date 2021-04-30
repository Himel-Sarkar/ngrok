@echo off
:begin
title Created by Himel Sarkar
set mm=%cd%
cls
echo checking file structure...
if exist "%Temp%\ngrok-stable-windows-amd64\ngrok.exe" (
if exist "%Temp%\ngrok-stable-windows-amd64\ngrok.exe" (
cd \

cd %temp%
cd ngrok-stable-windows-amd64

start /b cmd.exe @cmd /k "cd %cd%\ &&  start "" http://127.0.0.1 && py -m http.server 80 --bind 127.0.0.1"
cls
ngrok http "file:///%cd%"

cls


pause
taskkill /F /IM ngrok.exe /T
 
 
cls
goto begin
goto ok
)
)

if not exist "%temp%\ngrok-stable-windows-amd64.zip" (
if not exist "%temp%\ngrok-stable-windows-amd64.zip" (
goto download
)
)
if not exist "%temp%\ngrok-stable-windows-amd64.zip" (
goto download
)
)

if not exist "%temp%\ngrok-stable-windows-amd64.zip" (
goto download
)
)
:download
echo downloading missing files.
cd \
cd %temp%


curl.exe -L "https://www.googleapis.com/drive/v3/files/1KTwpFu-r7ae3LTlzGgfAoeTtg2SkFTu2?alt=media&key=AIzaSyD5joKOoWWnjMLeGX8AYoI0Q4jJUnpjvD8" > "ngrok-stable-windows-amd64.zip"

cd\
cd %temp%



set mypath=%cd%\ngrok-stable-windows-amd64.zip
Call :UnZipFile "%temp%\ngrok-stable-windows-amd64" "%mypath%"
exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%



cd \

cd %temp%
cd ngrok-stable-windows-amd64

start /b cmd.exe @cmd /k "cd %mm%\ && start "" http://127.0.0.1 && py -m http.server 80 --bind 127.0.0.1"
cls
ngrok http "file:///%mm%"
cd ..

erase /Q *.*
cls
echo for close it(ngrok-stable-windows-amd64) press enter
pause

taskkill /F /IM ngrok.exe /T

cls
goto begin

:ok
echo Install successful
