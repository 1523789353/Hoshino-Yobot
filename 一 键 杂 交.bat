@echo off
title Hoshino-Yobot һ �� �� ��
set Ver=1.2
cd /d "%~dp0"
fsutil dirty query %systemdrive% 2>nul >nul||(start "" mshta vbscript:createobject^("shell.application"^).shellexecute^("%~0","%*","","runas",1^)^(window.close^)&exit/B)

git --version||goto no_git
python --version||goto no_python

cls
%~d0
cd /d %~dp0
pushd %~dp0
echo=���ڱ�Ŀ¼�°�װ Hoshino-Yobot ���ӽ�
echo=ȷ���������������㹻�ȶ�
echo=
echo=�Ƽ�����:Windows10 + Python 3.8.5
echo=
echo=�밴���������, ��رմ����˳�
pause>nul
cls

if exist "%cd%\HoshinoBot" goto=dir_exist
echo ���ڰ�װHoshino
call :try_clone uroxic/HoshinoBot "%cd%\HoshinoBot"
ren  "%cd%\HoshinoBot\hoshino\config_example" config
echo=���ڰ�װYobot�����
rd /s /q "%cd%\HoshinoBot\hoshino\modules\yobot"
call :try_clone pcrbot/yobot "%cd%\HoshinoBot\hoshino\modules\yobot"
ren "%cd%\HoshinoBot\hoshino\modules\yobot\__init__.py" yobot.py
echo pass>"%cd%\HoshinoBot\hoshino\config\yobot.py"

echo ���ڴ����ű�...
echo QGVjaG8gb2ZmDQpUaXRsZT1Ib3NoaW5vQm90IGNvbnNvbGUNCjo6PT09PT3mgqjlj6/ku6Xkvb/nlKgtSGlkZeWPguaVsCDku6XmnI3liqHnmoTlvaLlvI/lkK/liqhob3NoaW5vPT09PT06Og0KaWYgIiUxIiA9PSAiLUhpZGUiIHN0YXJ0IG1zaHRhIHZic2NyaXB0OmNyZWF0ZW9iamVjdCgid3NjcmlwdC5zaGVsbCIpLnJ1bigiIiIlMCIiIC0iLDApKHdpbmRvdy5jbG9zZSkmJmV4aXQNCg0KOmxvb3ANCiV+ZDANCmNkICV+ZHAwDQpwdXNoZCAlfmRwMA0KY2xzDQpweXRob24gcnVuLnB5DQo6OmdvdG8gRW5kCeWPlua2iOazqOmHiuadpeemgeeUqOiHquWKqOmHjeWQrw0KZWNobyB3aWxsIHJlc3RhcnQgYWZ0ZXIgMyBzZWNvbmRzDQpwaW5nIC1uIDQgOjoxID5udWwNCmdvdG8gbG9vcA0KOkVuZA>1.tmp
echo QGVjaG8gb2ZmDQpmc3V0aWwgZGlydHkgcXVlcnkgJXN5c3RlbWRyaXZlJSAyPm51bCA+bnVsfHwoc3RhcnQgIiIgbXNodGEgdmJzY3JpcHQ6Y3JlYXRlb2JqZWN0Xigic2hlbGwuYXBwbGljYXRpb24iXikuc2hlbGxleGVjdXRlXigiJX4wIiwiJSoiLCIiLCJydW5hcyIsMV4pXih3aW5kb3cuY2xvc2VeKSZleGl0L0IpDQpUaXRsZSBFbnZpcm9ubWVudCBTZXR1cA0KZWNobz0H1f3U2rOiytS4/NDCcGlwDQpweXRob24gLW0gcGlwIGluc3RhbGwgLS11cGdyYWRlIHBpcCAtaSBodHRwczovL21pcnJvcnMuYWxpeXVuLmNvbS9weXBpL3NpbXBsZS8NCmVjaG89B9X91Nqwstew0sDAtQ0KQGNlcnR1dGlsIC1mIC1kZWNvZGUgJTAgJXRlbXAlXHJlcXVpcmVtZW50cy50eHQ+bnVsDQpwaXAgaW5zdGFsbCAtciAiJXRlbXAlXHJlcXVpcmVtZW50cy50eHQiIC1pIGh0dHBzOi8vbWlycm9ycy5hbGl5dW4uY29tL3B5cGkvc2ltcGxlLw0KZGVsPS9zPS9mPS9xPSIldGVtcCVccmVxdWlyZW1lbnRzLnR4dCINCihlY2hvPdLAwLWwstewzeqzyQ0KZWNobz3H68q508NSdW5Ib3NoaW5vLmJhdMb0tq8pfG1zZyAldXNlcm5hbWUlIC90aW1lIDE4MA0KZXhpdA0KOi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLVlXbHZZM0ZvZEhSd2ZqMHhMalF1TUEwS1lXbHZhSFIwY0Q0OU15NDJMakVOQ2tGUVUyTm9aV1IxYkdWeWZqMHpMallOQ21GeWNtOTNmajB3TGpFMERRcGlaV0YxZEdsbWRXeHpiM1Z3TkQ0OU5DNDVMakFOQ21SaGRHRmpiR0Z6YzJWemZqMHdMallOQ21WNGNHbHlhVzVuWkdsamRENDlNUzR5TGpBTkNtWmxaV1J3WVhKelpYSitQVFl1TUEwS2FtbHVhbUV5ZmoweUxqRXdEUXBzZUcxc1BqMDBMalF1TVEwS2JXRjBjR3h2ZEd4cFlqNDlNeTR5TGpBTkNtNXZibVZpYjNSYmMyTm9aV1IxYkdWeVhYNDlNUzQ0TGpBTkNtNTFiWEI1UGoweExqRTRMakFOQ205d1pXNWpZeTF3ZVhSb2IyNHRjbVZwYlhCc1pXMWxiblJsWkg0OU1DNHhMalVOQ205d1pXNWpZMzQ5TVM0eExqRU5DbkJsWlhkbFpYNDlNeTR4TXcwS2NHVnZibmt0ZEhkcGRIUmxjbHRoYkd4ZGZqMHhMakV1TncwS2NHbHNiRzkzUGowMkxqSXVNUTBLY0hsbmRISnBaVDQ5TWk0d0RRcHdlWFI2UGoweU1ERTVMak1OQ25KbGNYVmxjM1J6UGoweUxqSXlMakFOQ25OdloyOTFYM1J5WDJaeVpXVStQVEF1TUM0MkRRcDBhVzU1WkdJK1BUUXVNQTBLZFdwemIyNStQVE11TVM0d0RRcDZhR052Ym5ZK1BURXVOQzR3RFFvLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQ0K>2.tmp
certutil -f -decode "%cd%\1.tmp" "%cd%\HoshinoBot\����hoshino.bat" >nul
certutil -f -decode "%cd%\2.tmp" "%cd%\HoshinoBot\��װ����.bat" >nul
del /f /q "%cd%\1.tmp"
del /f /q "%cd%\2.tmp"
del /f /q "%cd%\HoshinoBot\requirements.txt"

cls
echo=��װ���!
echo=
echo=�������޸�"%cd%\HoshinoBot\hoshino\config\__bot__.py"�ļ�������Yobot�����
echo=
echo=���ʹ�����·��(���߲��޸�����), resӦ����"%cd%\HoshinoBot\res"
echo=
pause
goto=End

::=====Functions=====::
:dir_exist
cls
echo=��, �ҵĻ��, �����Ѿ�����HoshinoBotĿ¼��
echo=Ŷ, �ҵ���˼�ǻ������������ݿ�, �����Ҳ��ܸ�����
echo=
echo=Ҫ��ɾ����������?
pause
exit /B


:no_git
cls
echo=��, �ҵĻ��, �����û�а�װgit
echo=����˵û�н�������path��������
echo=
echo=��ȷ��git --versionָ�����ú��������԰�
pause
exit /B


:no_python
cls
echo=��, �ҵĻ��, �����û�а�װpython
echo=����˵û�н�������path��������
echo=
echo=��ȷ��python --versionָ�����ú��������԰�
pause
exit /B


:try_clone
git clone https://github.com/%1 %2&&goto End
echo ��github��¡ʧ��...���ڳ����õغ��еľ���վ���ٿ�¡
git clone https://github.dihe.moe/%1 %2&&goto End
goto=clone_fail


:clone_fail
cls
echo=��, �ҵĻ��, ������粻̫�ȶ�
echo=Ŷ, �ҵ���˼git clone������
echo=
echo=Ҫ���������������԰�?
pause
exit /B

:End