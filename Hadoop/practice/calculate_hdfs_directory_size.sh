#!/bin/bash

HDFS_DIRECTORY="/test1"

# du - размер файла
# awk - форматирование данных
DIRECTORY_SIZE=$(hdfs dfs -du -s $HDFS_DIRECTORY | awk '{print $1}')

HUMAN_READABLE_SIZE=$(hdfs dfs -du -s -h $HDFS_DIRECTORY | awk '{print $1}')

# Вывод результата
echo "Размер директории $HDFS_DIRECTORY: $DIRECTORY_SIZE байт"
echo "Человекочитаемый размер директории $HDFS_DIRECTORY: $HUMAN_READABLE_SIZE"