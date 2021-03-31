
1. When prompted, select "Try Ubuntu"
1. Open root terminal
1. `chroot` into new system
    1. Mount new system partitions

        ```
        # mount /dev/<new_system_partition> /mnt
        # mount --bind /dev /mnt/dev
        # mount --bind /proc /mnt/proc
        # mount --bind /sys /mnt/sys
        # mount --bind /bin /mnt/bin
        ```

    1. Change root into new system

        ```
        # chroot /mnt
        ```

1. Disable lightdm and get text login screen
    1. Make a backup of grub file

        ```sh
        # cp /etc/default/grub /etc/default/grub.gui
        ```

    1. Edit `/etc/default/grub`
        - Change `GRUB_CMDLINE_LINUX_DEFAULT` to `GRUB_CMDLINE_LINUX_DEFAULT="text"
        - Change `GRUB_CMDLINE_LINUX=""` to `GRUB_CMDLINE_LINUX="text"`

    1. Update grup

        ```
        # update-grub
        ```

    1. Change `systemd` default target

        ```
        # systemctl set-default multi-user.target
        ```

1. Disable unattended upgrades (FOR TEST SYSTEMS ONLY)
    1. Disable the service

        ```
        # systemctl disable unattended-upgrades.service
        ```

## After install is complete

1. Enable lightdm by changing `systemd` default target

    ```
    # systemctl set-default graphical.target
    ```



