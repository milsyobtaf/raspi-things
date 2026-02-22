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
sudo apt install wtype unclutter vim
```

## `scripts`

### `monitorpower.sh`

This is a small script to check the time of day and run a command depending on the defined schedule. You define the schedule and the desired commands as variables in the file, and then set the script to run on a `cron` schedule.

I am currently using this for two things:

- To run `GPIO` commands to trigger a power off / on function on the [USB Switch / Multiplexer](https://www.8086.net/products#80860042) from 8086 Consultancy. This is connected to the USB power line on the LCD screen connected to this Raspberry Pi.
- To enabled / disable `deeper`

### `switchtabs.sh`

This is a small script that uses `wtype` to cycle `chromium` browser tabs on a cycled defined in a constant in the script. This script originally came from [raspberrypi.com](https://www.raspberrypi.com/tutorials/how-to-use-a-raspberry-pi-in-kiosk-mode/).

`wtype` needs to be installed separately, and requires a `wayland` environment, so make sure you have that setup on the Raspberry Pi.

#### `autostart`

`switchtabs.sh` is being called from an `autostart` file, currently located at `.config/labwc/autostart` on my Raspberry Pi. This runs when the desktop environment loads, launches `chromium` in `kiosk` mode with two (or more) tabs, and then cycles those tabs.

The `sleep 10` at the top is to ensure the internet connection is active before launching the browser. Not necessary, but avoids error screens.

The `unclutter -idle 0` command is there to hide the cursor when in kiosk mode. You need to make sure `unclutter` is installed.

## `shell`

These are things that make the shell a better place to be.

### `.bash_aliases`

Simple aliases to make things easier. The default `.bashrc` in Raspberry Pi OS looks for a `.bash_aliases` file, so this only needs to be symlinked into the correct place in the home directory to work.

### `.vimrc`

Some basic `vim` niceties. Make sure `vim` is installed, it isn't always by default.
