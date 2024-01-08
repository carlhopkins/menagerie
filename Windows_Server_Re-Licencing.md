# Re-Licence Windows Server Evaluation to Standard

1/ Apply the host machines 25 digit code to the VM.

<code>DISM /Online /Set-Edition:ServerStandard /ProductKey:INSERT_PRODUCT_KEY_HERE /AcceptEula</code>

<code>Deployment Image Servicing and Management tool
Version: 10.0.17763.1697

Image Version: 10.0.17763.2268

Starting to update components...
Starting to install product key...
Finished installing product key.

Removing package Microsoft-Windows-ServerStandardEvalEdition~31bf3856ad364e35~amd64~~10.0.17763.1
[==========================100.0%==========================]
Finished updating components.

Starting to apply edition-specific settings...
Finished applying edition-specific settings.

The operation completed successfully.
Restart Windows to complete this operation.
Do you want to restart the computer now? (Y/N)</code>

2/ Accept reboot prompt and then apply command to start activation
<code>SLUI 4</code>

3/ This launches the licensing for "telephone" activations, follow the steps and then should be good to go.

**Should** also work for Datacentre editions by exchanging the relevant edition and licence key inputs.