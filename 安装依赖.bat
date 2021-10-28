@echo off
fsutil dirty query %systemdrive% 2>nul >nul||(start "" mshta vbscript:createobject^("shell.application"^).shellexecute^("%~0","%*","","runas",1^)^(window.close^)&exit/B)
Title Environment Setup
echo=正在尝试更新pip
python -m pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple/
echo=正在安装依赖
@certutil -f -decode %0 %temp%\requirements.txt>nul
pip install -r "%temp%\requirements.txt" -i https://mirrors.aliyun.com/pypi/simple/
del=/s=/f=/q="%temp%\requirements.txt"
echo=依赖安装完成|msg %username% /time 180
exit
:-----BEGIN CERTIFICATE-----YWlvY3FodHRwfj0xLjQuMA0KYWlvaHR0cD49My42LjENCkFQU2NoZWR1bGVyfj0zLjYNCmFycm93fj0wLjE0DQpiZWF1dGlmdWxzb3VwND49NC45LjANCmRhdGFjbGFzc2Vzfj0wLjYNCmV4cGlyaW5nZGljdD49MS4yLjANCmZlZWRwYXJzZXJ+PTYuMA0KamluamEyfj0yLjEwDQpseG1sPj00LjQuMQ0KbWF0cGxvdGxpYj49My4yLjANCm5vbmVib3Rbc2NoZWR1bGVyXX49MS44LjANCm51bXB5Pj0xLjE4LjANCm9wZW5jYy1weXRob24tcmVpbXBsZW1lbnRlZH49MC4xLjUNCm9wZW5jY349MS4xLjENCnBlZXdlZX49My4xMw0KcGVvbnktdHdpdHRlclthbGxdfj0xLjEuNw0KcGlsbG93Pj02LjIuMQ0KcHlndHJpZT49Mi4wDQpweXR6Pj0yMDE5LjMNCnJlcXVlc3RzPj0yLjIyLjANCnNvZ291X3RyX2ZyZWU+PTAuMC42DQp0aW55ZGI+PTQuMA0KdWpzb25+PTMuMS4wDQp6aGNvbnY+PTEuNC4wDQo-----END CERTIFICATE-----
