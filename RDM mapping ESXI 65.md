# How to passthrough SATA drives directly on VMWare EXSI 6.5 as RDMs

To configure a local device as an RDM disk:

1. Open an SSH session to the ESXi/ESX host.
2. To configure the device as an RDM and output the RDM pointer file to your chosen destination, run this command:

`vmkfstools -z /vmfs/devices/disks/diskname /vmfs/volumes/datastorename/vmfolder/vmname.vmdk`

For example:

`vmkfstools -z /vmfs/devices/disks/t10.F405E46494C4540046F455B64787D285941707D203F45765 /vmfs/volumes/Datastore0/localrdm1.vmdk`

Note: The size of the newly created RDM pointer file appears to be the same size and the Raw Device it is mapped to, this is a dummy file and is not consuming any storage space.

When you have created the RDM pointer file, attach the RDM to a virtual machine using the vSphere Client:

1. Right click the virtual machine you want to add an RDM disk to.
2. Click Edit Settings.
3. Click Add.
4. Select Hard Disk.
5. Select Use an existing virtual disk.
6. Browse to the directory you saved the RDM pointer to in step 5 and select the RDM pointer file and click Next.
7. Select the virtual SCSI controller you want to attach the disk to and click Next.
8. Click Finish.

You should now see your new hard disk in the virtual machine inventory as Mapped Raw LUN.

Notes:
- As this virtual machine now has an attached local disk migration, using vMotion is not possible.
- If you need to remove the local RDM mapping from the virtual machine, just apply the same process you would with a shared storage RDM. In the vSphere Client: right-click the virtual machine, click Edit settings, select the RDM disk and then click delete from disk. This does not delete the data on the disk, it only deletes the RDM mapping file.