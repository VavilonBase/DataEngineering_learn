Задание 1. Простая загрузка в HDFS.
Создайте директорию в HDFS.
hdfs dfs -mkdir /test2

Добавьте 5 файлов в HDFS. 
docker cp file_1.docx c0e34bce62ff:/tmp/file_1.docx
docker cp file_2.xlsx c0e34bce62ff:/tmp/file_2.xlsx
docker cp file_3.xlsx c0e34bce62ff:/tmp/file_3.xlsx
docker cp file_4.pptx c0e34bce62ff:/tmp/file_4.pptx
docker cp file_5.png c0e34bce62ff:/tmp/file_5.png

hdfs dfs -put /tmp/file_1.docx /test2/file_1.docx
hdfs dfs -put /tmp/file_2.xlsx /test2/file_2.xlsx
hdfs dfs -put /tmp/file_3.xlsx /test2/file_3.xlsx
hdfs dfs -put /tmp/file_4.pptx /test2/file_4.pptx
hdfs dfs -put /tmp/file_5.png /test2/file_5.png

Подсчитайте количество файлов и занимаемое пространство.
echo "Files count: $(hdfs dfs -find /test2 | wc -l)" && hdfs dfs -du -s -h /test2

Поставьте квоту на 5 файлов для этой директории (гуглим)
hdfs dfsadmin -setQuota 6 /test2

6, так как сама директория тоже считается за файл и занимает слот