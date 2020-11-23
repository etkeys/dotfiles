
- The "kiosk" user should be created.
- Group "kiosk" must be the assigned group for target directory. Recursive.
- Group must have rwx on target directory.
- Path leading to target directory must have other x. Maybe r too.
- Root can make symlink to target directory but mush have permissions 777.
- The following permissions should be set.
    - rwxr-xr-x autostart
    - rw-r--r-- autostart/\*
    - rwxr-xr-x openbox
    - rwxr-xr-x openbox/autostart
    - rwxr-xr-x openbox/environment
    - rw-r--r-- openbox/menu.xml
    - rw-r--r-- openbox/rc.xml
    - rw-rw-r-- QtProject.conf
    - rw-r--r-- redshift.conf
    - rw-rw-r-- user-dirs.dirs
    - rw-rw-r-- user-dirs.local
- Set erik:erik as owner for .gitignore



