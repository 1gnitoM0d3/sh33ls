@echo off
for /l %%x in (1, 1, 3) do (
    start notepad
    timeout /t 1 /nobreak >nul
    echo Hacked By MrBrew1337 | SECURITY RESEARCH PDF EXPLOIT > hacked.txt
    start notepad hacked.txt
)
exit
