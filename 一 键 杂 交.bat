@echo off
title Hoshino-Yobot 一 键 杂 交
set Ver=1.2
cd /d "%~dp0"
fsutil dirty query %systemdrive% 2>nul >nul||(start "" mshta vbscript:createobject^("shell.application"^).shellexecute^("%~0","%*","","runas",1^)^(window.close^)&exit/B)

git --version||goto no_git
python --version||goto no_python

cls
%~d0
cd /d %~dp0
pushd %~dp0
echo=将在本目录下安装 Hoshino-Yobot 的杂交
echo=确保您的网络连接足够稳定
echo=
echo=推荐环境:Windows10 + Python 3.8.5
echo=
echo=请按任意键继续, 或关闭窗口退出
pause>nul
cls

if exist "%cd%\HoshinoBot" goto=dir_exist
echo 正在安装Hoshino
call :try_clone uroxic/HoshinoBot "%cd%\HoshinoBot"
ren  "%cd%\HoshinoBot\hoshino\config_example" config
echo=正在安装Yobot插件版
rd /s /q "%cd%\HoshinoBot\hoshino\modules\yobot"
call :try_clone pcrbot/yobot "%cd%\HoshinoBot\hoshino\modules\yobot"
ren "%cd%\HoshinoBot\hoshino\modules\yobot\__init__.py" yobot.py
echo pass>"%cd%\HoshinoBot\hoshino\config\yobot.py"

echo 正在创建脚本...
echo QGVjaG8gb2ZmDQpUaXRsZT1Ib3NoaW5vQm90IGNvbnNvbGUNCjo6PT09PT3mgqjlj6/ku6Xkvb/nlKgtSGlkZeWPguaVsCDku6XmnI3liqHnmoTlvaLlvI/lkK/liqhob3NoaW5vPT09PT06Og0KaWYgIiUxIiA9PSAiLUhpZGUiIHN0YXJ0IG1zaHRhIHZic2NyaXB0OmNyZWF0ZW9iamVjdCgid3NjcmlwdC5zaGVsbCIpLnJ1bigiIiIlMCIiIC0iLDApKHdpbmRvdy5jbG9zZSkmJmV4aXQNCg0KOmxvb3ANCiV+ZDANCmNkICV+ZHAwDQpwdXNoZCAlfmRwMA0KY2xzDQpweXRob24gcnVuLnB5DQo6OmdvdG8gRW5kCeWPlua2iOazqOmHiuadpeemgeeUqOiHquWKqOmHjeWQrw0KZWNobyB3aWxsIHJlc3RhcnQgYWZ0ZXIgMyBzZWNvbmRzDQpwaW5nIC1uIDQgOjoxID5udWwNCmdvdG8gbG9vcA0KOkVuZA>1.tmp
echo QGVjaG8gb2ZmDQpmc3V0aWwgZGlydHkgcXVlcnkgJXN5c3RlbWRyaXZlJSAyPm51bCA+bnVsfHwoc3RhcnQgIiIgbXNodGEgdmJzY3JpcHQ6Y3JlYXRlb2JqZWN0Xigic2hlbGwuYXBwbGljYXRpb24iXikuc2hlbGxleGVjdXRlXigiJX4wIiwiJSoiLCIiLCJydW5hcyIsMV4pXih3aW5kb3cuY2xvc2VeKSZleGl0L0IpDQpUaXRsZSBFbnZpcm9ubWVudCBTZXR1cA0KZWNobz0H1f3U2rOiytS4/NDCcGlwDQpweXRob24gLW0gcGlwIGluc3RhbGwgLS11cGdyYWRlIHBpcCAtaSBodHRwczovL21pcnJvcnMuYWxpeXVuLmNvbS9weXBpL3NpbXBsZS8NCmVjaG89B9X91Nqwstew0sDAtQ0KQGNlcnR1dGlsIC1mIC1kZWNvZGUgJTAgJXRlbXAlXHJlcXVpcmVtZW50cy50eHQ+bnVsDQpwaXAgaW5zdGFsbCAtciAiJXRlbXAlXHJlcXVpcmVtZW50cy50eHQiIC1pIGh0dHBzOi8vbWlycm9ycy5hbGl5dW4uY29tL3B5cGkvc2ltcGxlLw0KZGVsPS9zPS9mPS9xPSIldGVtcCVccmVxdWlyZW1lbnRzLnR4dCINCihlY2hvPdLAwLWwstewzeqzyQ0KZWNobz3H68q508NSdW5Ib3NoaW5vLmJhdMb0tq8pfG1zZyAldXNlcm5hbWUlIC90aW1lIDE4MA0KZXhpdA0KOi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLVlXbHZZM0ZvZEhSd2ZqMHhMalF1TUEwS1lXbHZhSFIwY0Q0OU15NDJMakVOQ2tGUVUyTm9aV1IxYkdWeWZqMHpMallOQ21GeWNtOTNmajB3TGpFMERRcGlaV0YxZEdsbWRXeHpiM1Z3TkQ0OU5DNDVMakFOQ21SaGRHRmpiR0Z6YzJWemZqMHdMallOQ21WNGNHbHlhVzVuWkdsamRENDlNUzR5TGpBTkNtWmxaV1J3WVhKelpYSitQVFl1TUEwS2FtbHVhbUV5ZmoweUxqRXdEUXBzZUcxc1BqMDBMalF1TVEwS2JXRjBjR3h2ZEd4cFlqNDlNeTR5TGpBTkNtNXZibVZpYjNSYmMyTm9aV1IxYkdWeVhYNDlNUzQ0TGpBTkNtNTFiWEI1UGoweExqRTRMakFOQ205d1pXNWpZeTF3ZVhSb2IyNHRjbVZwYlhCc1pXMWxiblJsWkg0OU1DNHhMalVOQ205d1pXNWpZMzQ5TVM0eExqRU5DbkJsWlhkbFpYNDlNeTR4TXcwS2NHVnZibmt0ZEhkcGRIUmxjbHRoYkd4ZGZqMHhMakV1TncwS2NHbHNiRzkzUGowMkxqSXVNUTBLY0hsbmRISnBaVDQ5TWk0d0RRcHdlWFI2UGoweU1ERTVMak1OQ25KbGNYVmxjM1J6UGoweUxqSXlMakFOQ25OdloyOTFYM1J5WDJaeVpXVStQVEF1TUM0MkRRcDBhVzU1WkdJK1BUUXVNQTBLZFdwemIyNStQVE11TVM0d0RRcDZhR052Ym5ZK1BURXVOQzR3RFFvLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQ0K>2.tmp
certutil -f -decode "%cd%\1.tmp" "%cd%\HoshinoBot\启动hoshino.bat" >nul
certutil -f -decode "%cd%\2.tmp" "%cd%\HoshinoBot\安装依赖.bat" >nul
del /f /q "%cd%\1.tmp"
del /f /q "%cd%\2.tmp"
del /f /q "%cd%\HoshinoBot\requirements.txt"

cls
echo=安装完成!
echo=
echo=请自行修改"%cd%\HoshinoBot\hoshino\config\__bot__.py"文件以启用Yobot插件版
echo=
echo=如果使用相对路径(或者不修改配置), res应放在"%cd%\HoshinoBot\res"
echo=
pause
goto=End

::=====Functions=====::
:dir_exist
cls
echo=噢, 我的伙计, 好像已经存在HoshinoBot目录了
echo=哦, 我的意思是或许里面有数据库, 所以我不能覆盖它
echo=
echo=要不删除它再试试?
pause
exit /B


:no_git
cls
echo=噢, 我的伙计, 你好像没有安装git
echo=或者说没有将它加入path环境变量
echo=
echo=请确认git --version指令能用后再来试试吧
pause
exit /B


:no_python
cls
echo=噢, 我的伙计, 你好像没有安装python
echo=或者说没有将它加入path环境变量
echo=
echo=请确认python --version指令能用后再来试试吧
pause
exit /B


:try_clone
git clone https://github.com/%1 %2&&goto End
echo 从github克隆失败...正在尝试用地河佬的镜像站加速克隆
git clone https://github.dihe.moe/%1 %2&&goto End
goto=clone_fail


:clone_fail
cls
echo=噢, 我的伙计, 你的网络不太稳定
echo=哦, 我的意思git clone出错了
echo=
echo=要不我们重新再试试吧?
pause
exit /B

:End