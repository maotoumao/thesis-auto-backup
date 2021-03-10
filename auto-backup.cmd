@echo off
chcp 65001

for /f "tokens=1,2 delims==" %%i in (%~dp0/config.ini) do (
    set %%i=%%j
)

echo %REMOTE_PATH%
cd /d %LOCAL_PATH%

if exist ./.git (
    git add .
    git commit -m "备份: %date%"
    git push origin master
) else (
    git init
    git add .
    git commit -m "初始化"
    git remote add origin %REMOTE_PATH%
    git push -u origin master
)

echo done