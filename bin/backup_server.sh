#!/bin/bash

BASE_FOLDER_NAME='mineserver_data'
BACKUP_BASE_NAME='mineserver'
VOLUME_NAME='volume_runtime_mineserver'
SOURCE='/home/marden/'$BASE_FOLDER_NAME'/'$VOLUME_NAME
TARGET='/home/marden/'$BASE_FOLDER_NAME'/bkps'
CURRENT_DATE=$(date +%d%m%Y)
FINAL_FILE_NAME=$BACKUP_BASE_NAME'_bkp_'$CURRENT_DATE'.tar.gz'
TEMP_BACKUP_FOLDER_NAME='temp_bkp'

echo '##################################'
echo '#       Iniciando backup         #'
echo '# '$(date)' #'
echo '##################################'

echo '# Criando pasta temp'
mkdir $TEMP_BACKUP_FOLDER_NAME

echo '# Copiando arquivos para a pasta temp'
cp -r $SOURCE $TEMP_BACKUP_FOLDER_NAME

echo '# Compactando arquivos'
tar -c -z -f $FINAL_FILE_NAME $TEMP_BACKUP_FOLDER_NAME

echo '# Removendo pasta temporaria'
rm -r -f $TEMP_BACKUP_FOLDER_NAME

echo '# Movendo arquivo de backup para pasta alvo'
mv $FINAL_FILE_NAME $TARGET'/'$FINAL_FILE_NAME


echo '##################################'
echo '#       Backup finalizado        #'
echo '##################################'
