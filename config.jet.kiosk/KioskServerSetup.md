# Kiosk Sever Setup

## Setup vim.basic as default editor

Skip this section if __any__ of the follow do not apply to you:

- You use `vim`
- You prefer to use `vim` as a text editor

Otherwise, run command `update-alternatives --config editor` and select option
for `vim.basic`

## Apt Install

```sh
# as root
apt install alsa-utils curl feh openbox openssh-server redshift-gtk snapd tree \
vim xorg
```

Install `pulseaudio` seperately, after everything else, because we want to make
sure `pulseaudio` knows about alsa and performs most of the reconfiguring.

```sh
# as root
apt install pulseaudio pavucontrol
```

## Snap Install

```sh
# as root
snap install firefox vlc
```

## Create _kiosk_ user

### Create the user

```sh
# as root
adduser kiosk
```

You'll need to provide something for a password.

### Setup _kiosk_ dirs

**dotbot should do this**

```sh
# as root
cd /home/kiosk
rm -rf Downloads
ln -s /tmp Downloads
mkdir .config
chown kiosk:kiosk .config
```

### Modify system cifugriations

1. Edit `/etc/pulse/daemon.conf`

    ```sh
    # as root

    # change (near the end)
    ; default-sample-channels = 2

    # to (note missing ";")
    default-sample-channels = 2 # for 2 speakers
    default-sample-channels = 6 # for 5.1
    default-sample-channels = 8 # for 7.1
    ```

### Copy/modify configrations

dotbot should link to the config.jet.kiosk folder

## Create firefox start-up scripts

1. As **root**, create `/usr/local/bin/start-firefox.sh`

    ```sh
    #!/bin/sh
    firefox &
    ```

1. Change permissions
  
    ```sh
    sudo chmod +x /usr/local/bin/start-firefox.sh
    ```

## Setup autologin for user, _kiosk_

1. Enter root

    ```sh
    sudo su
    ```

1. Edit tty1 systemd configuration

    ```sh
    systemctl edit getty@tty1
    ```

    _in editor_

    ```txt
    [Service]
    ExecStart=
    ExecStart=-/sbin/agetty --autologin kiosk --noclear %I $TERM
    ```

1. Edit the autologin user, _kiosk_, `.profile` file and append the following

    ```sh
    [ "$(tty)" = "/dev/tty1" ] && exec startx
    ```

## Configure Firefox

1. Reboot the machine
1. When Firefox opens, configure the following sections

### about:preferences#general

1. Check "Tabs > When you open a link in new tab, switch to it immediately"
1. Check "Digital Rights Management ... > Play DRM-controlled content"
1. Uncheck "Browsing > Enable picture-in-picture video controls"
1. Uncheck "Browsing > Recommend extensions as you browse"
1. Uncheck "Browsing > Recommend features as you browse"

### about:preferences#home

1. Uncheck "Recommended by Pocket"
1. Uncheck "Highlights > Visited Pages"
1. Uncheck "Highlights > Most Recent Download"
1. Uncheck "Highlights > Pages Saved to Pocket"
1. Uncheck "Snippets"

### about:preferneces#search

1. Select Add search bar in toolbar
1. Set Default Search Engine to "DuckDuckGo"
1. Set One-Click Search Engines as follows
    - Google
    - Amazon.com
    - DuckDuckGo
    - Wikipedia (en)

### about:preferences#privacy

1. Uncheck "Login and Passwords > Ask to save logins and passwords for websites"
1. Uncheck "Login and Passwords > Ask to save logins and passwords for websites
    \> Show alerts about passwords for breached websites"

### about:config

1. browser.tabs.closeWindowsWithLastTab to `false`
1. browser.sessionstore.resume_from_crash to `false`

### Addons

- Facebook Container
- Lastpass
- Public Fox (should be done last, need to configure password)
- Text Contrast for Dark Themes
- ublock origin
- vim-vixen
