Зайти в NameNode
docker exec -it docker-hive-master-namenode-1 /bin/bash

Создание папок
hdfs dfs -mkdir /test1

Просмотр содержимого
hdfs dfs -ls /

Команд cd и touch нет

Создание файла:
1) Создаем файл локально
2) Переносем в docker (c0e34bce62ff - NameNode container id)
docker cp localfile.txt c0e34bce62ff:/tmp/localfile.txt
3) Переносим из docker в HDFS
hdfs dfs -put /tmp/localfile.txt /test1/localfile.txt

Просмотр содержимого файла
hdfs dfs -cat /test1/localfile.txt

Копирование файлов внутри HDFS
hdfs dfs -cp /test1/localfile.txt /test1/localfile_copy.txt

Перемещение или переименовывание в HDFS
hdfs dfs -mv /test1/localfile.txt /test1/localfile_renamed.txt

Удаление в HDFS
hdfs dfs -rm /test1/localfile_copy.txt

Информация о файле в HDFS
hdfs dfs -stat [формат] [путь_к_файлу]
Формат может принимать следующие значения:
%b — размер файла в байтах.
%y — время последней модификации файла (формат даты).
%n — имя файла.
%o — права доступа к файлу (в формате rwx).
%r — количество реплик файла.
%u — владелец файла.
%g — группа файла.

Пример: 
hdfs dfs -stat "%r %u" /test1/localfile_renamed.txt

Изменить кол-во реплик
hdfs dfs -setrep 1 /test1/localfile_renamed.txt

Отчет о состоянии файловой системы:
hdfs dfsadmin -report
Описание:
Configured Capacity — общая ёмкость всех DataNode, доступная в HDFS (сумма всех дисковых пространств).
Present Capacity — доступная ёмкость HDFS с учетом зарезервированного пространства.
DFS Remaining — оставшееся свободное пространство на всех DataNode.
DFS Used — пространство, которое используется для хранения данных в HDFS.
DFS Used% — процент использования пространства в HDFS.
Under replicated blocks — количество блоков, у которых недостаточно реплик.
Blocks with corrupt replicas — количество блоков с повреждёнными репликами.
Missing blocks — количество блоков, которые отсутствуют в кластере (потерянные данные).
Live datanodes — количество активных (доступных) DataNode.
Dead datanodes — количество DataNode, которые не в сети или не отвечают.
Name и Hostname — IP-адрес и имя хоста DataNode.
Decommission Status — статус DataNode (например, Normal или Decommissioned, если DataNode выведен из эксплуатации).
Configured Capacity, DFS Used, DFS Remaining — ёмкость, используемое и оставшееся пространство на DataNode.
DFS Used%, DFS Remaining% — процентное использование и оставшееся пространство.
Last contact — время последнего контакта с DataNode.

Местоположение блоков данных:
hdfs fsck /test1/localfile_renamed.txt -files -blocks -locations