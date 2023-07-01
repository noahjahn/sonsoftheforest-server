# sonsoftheforest-server

## Setup

1. Clone the repo

```
git clone git@github.com:noahjahn/sonsoftheforest-server.git
```

2. Create the userdata directory (this is so it isn't created as the root user)

```
mkdir -p userdata
```

3. Start the container

```
docker compose up -d
```

View logs with `docker compose logs -f`

## Backups

- This assumes you're on linux, using crontab

There is a backup script located in the `bin` directory. It will backup the world and server information for restoring if necessary.

The script should be configured to run on a schedule, using something like `crontab`.

Here is an example of scheduling the backup script to run every hour:

```
0 * * * * cd ~/sonsoftheforest-server && ~/sonsoftheforest-server/bin/backup.sh ~/sonsoftheforest-server/backups >> ~/logs/cron.log
```

For this example, any output from the backup script is redirected to a log file in the users' home directory/log directory.

### Deleting old backups

There is a `cleanup-backups.sh` script in the same `bin` directory. It will remove any backup that is older than 3 days.

The script should be configured to also run on a schedule.

Here is an example of scheduling the cleanup-backups script to run every day:

```
0 0 * * * cd ~/sonsoftheforest-server && ~/sonsoftheforest-server/bin/cleanup-backups.sh ~/sonsoftheforest-server/backups >> ~/logs/cron.log
```
