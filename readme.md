# `raspi-things`

This is a repo to hold the bits and bobs I find useful for Raspberry Pi projects.

## tl;dr

### Grab this repo and drop it on the Pi:

```sh
mkdir ~/git && cd git
https://github.com/milsyobtaf/raspi-things.git
```

### Make sure any of the necessary deps are installed

```sh
sudo apt install vim
```

## `scripts`

### `monitorpower-{gpio,command}.sh`

This is a small script to check the time of day and run a command depending on the defined schedule. You define the schedule and the desired commands as variables in the file, and then set the script to run on a `cron` schedule.

I am currently using this for two things:

- To run `GPIO` commands to trigger a power off / on function on the [USB Switch / Multiplexer](https://www.8086.net/products#80860042) from 8086 Consultancy. This is connected to the USB power line on the LCD screen connected to this Raspberry Pi.
- To enabled / disable `deeper`

### `kiosk.service`

This is a `systemd` service that starts `chromium` in kiosk mode. The URLs are hardcoded in the file. This file needs to be placed at:

```sh
-rw-r--r-- 1 root root 513 Jan 01 00:00 /etc/systemd/system/kiosk.service
```

Once it is in place, run:

```sh
sudo systemctl daemon-reload
sudo systemctl start kiosk.service
```

This will now run on boot, and the service will relaunch itself if `chromium` crashes.

## `shell`

These are things that make the shell a better place to be.

### `.bash_aliases`

Simple aliases to make things easier. The default `.bashrc` in Raspberry Pi OS looks for a `.bash_aliases` file, so this only needs to be symlinked into the correct place in the home directory to work.

### `.vimrc`

Some basic `vim` niceties. Make sure `vim` is installed, it isn't always by default.
