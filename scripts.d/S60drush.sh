
case "$COMMAND" in
  backup)
    #Backup site using archive
    #Method to list all files: ls -1 -d /var/www/projects/*
    #Method to show last git update : git log -1 --format=%cd --date=iso
    mkdir -p $BACKUP_DIR
    drush archive-backup -r $WWW_DIR/$PROJECT --generator "Creo Project Manager"  --destination=$BACKUP_DIR/$PROJECT-$DATESTAMP.tar.gz  --overwrite
    filesize=$(stat --format="%s" $BACKUP_DIR/$PROJECT-$DATESTAMP.tar.gz)
    # If file size greater than 4GB, split and delete original
    if [ $filesize -gt 4294967296 ]; then
      split -b 4G -d $BACKUP_DIR/$PROJECT-$DATESTAMP.tar.gz $BACKUP_DIR/$PROJECT-$DATESTAMP.tar.gz.split_
      rm $BACKUP_DIR/$PROJECT-$DATESTAMP.tar.gz
    fi
  ;;

  create | import)
    #Add project to global drush aliases
  ;;

  restore)
    #Add project to global drush aliases
  ;;

  delete)
    #Remove project from global drush aliases
  ;;

  sandbox)
    #Add sandbox to user's drush aliases
  ;;

esac
