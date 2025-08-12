**Debian 13 (Trixie) - Qwerks & Install Notes**

**5.1.6. The temporary-files directory /tmp is now stored in a tmpfs**
From trixie, the default is for the /tmp/ directory to be stored in memory using a tmpfs(5) filesystem. This should make applications using temporary files faster, but if you put large files there, you may run out of memory.

For systems upgraded from bookworm, the new behavior only starts after a reboot. Files left in /tmp will be hidden after the new tmpfs is mounted which will lead to warnings in the system journal or syslog. Such files can be accessed using a bind-mount (see mount(1)): running mount --bind / /mnt will make the underlying directory accessible at /mnt/tmp (run umount /mnt once you have cleaned up the old files).

The default is to allocate up to 50% of memory to /tmp (this is a maximum: memory is only used when files are actually created in /tmp). You can change the size by running systemctl edit tmp.mount as root and setting, for example:

        [Mount]
        Options=mode=1777,nosuid,nodev,size=2G
        (see systemd.mount(5)).

You can return to /tmp being a regular directory by running systemctl mask tmp.mount as root and rebooting.

The new filesystem defaults can also be overridden in /etc/fstab, so systems that already define a separate /tmp partition will be unaffected.

**5.1.19. Samba: Active Directory Domain Controller packaging changes**
The Active Directory Domain Controller (AD-DC) functionality was split out of samba. If you are using this feature, you need to install the samba-ad-dc package

**5.2.1. The directories /tmp and /var/tmp are now regularly cleaned**
On new installations, systemd-tmpfiles will now regularly delete old files in /tmp and /var/tmp while the system is running. This change makes Debian consistent with other distributions. Because there is a small risk of data loss, it has been made “opt-in”: the upgrade to trixie will create a file /etc/tmpfiles.d/tmp.conf which reinstates the old behavior. This file can be deleted to adopt the new default, or edited to define custom rules. The rest of this section explains the new default and how to customize it.

The new default behavior is for files in /tmp to be automatically deleted after 10 days from the time they were last used (as well as after a reboot). Files in /var/tmp are deleted after 30 days (but not deleted after a reboot).

Before adopting the new default, you should either adapt any local programs that store data in /tmp or /var/tmp for long periods to use alternative locations, such as ~/tmp/, or tell systemd-tmpfiles to exempt the data file from deletion by creating a file local-tmp-files.conf in /etc/tmpfiles.d containing lines such as:

    x /var/tmp/my-precious-file.pdf
    x /tmp/foo 
    Please see systemd-tmpfiles(8) and tmpfiles.d(5) for more information.

**5.2.2. systemd message: System is tainted: unmerged-bin**
systemd upstream, since version 256, considers systems having separate /usr/bin and /usr/sbin directories noteworthy. At startup systemd emits a message to record this fact: System is tainted: unmerged-bin.

It is recommended to ignore this message. Merging these directories manually is unsupported and will break future upgrades. Further details can be found in bug #1085370.

