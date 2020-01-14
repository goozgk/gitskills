@echo off

echo ******MySQL backup start******

::删除一周前的备份数据
forfiles /P "D:\dbback\mail" /M backup_*.sql /D -7 /C "cmd /C del /F @path"

::设置时间变量
set Ymd=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%

::进入mysql安装目录的bin目录

::执行备份操作
::这里密码为dbPwd&% ，但是&前面需要加^，%%需要写2个，注意！参考https://jj-blues.com/cms/command-echo/
"C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump.exe" --opt --single-transaction=TRUE --user=root --password=dbPwd^&%% --host=127.0.0.1 --protocol=tcp --port=3306 --default-character-set=utf8 --routines --events --triggers --force --databases mail > D:\dbback\mail\backup_%Ymd%.sql

echo ******MySQL backup end******