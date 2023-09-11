.PHONY: backup
.SILENT:

install:
	docker compose up

start:
	docker compose start

stop:
	docker compose stop

backup:
	if [ -z "$(label)" ]; then \
		echo 'Usage: make backup label=my_backup'; \
		exit 1; \
	fi
	mkdir -p backup
	make stop
	sudo tar -cvzf backup/backup_${label}.tar.gz system
	make start
	echo "backup complete."
	
restore:
	if [ -z "$(label)" ]; then \
		echo 'Usage: make restore label=my_back*'; \
		exit 1; \
	fi
	read -p "This will wipe the current system. Press Ctrl+C to abort or ENTER to continue..." input;
	make stop
	sudo rm -rf system
	sudo tar --same-owner -xvzf backup/backup_${label}
	make start
	echo "restore complete."
