@echo off 
REM # Universal Powershell Loader - v0.25 - Copyright (c) 2025 Carl Hopkins
REM # To download and launch powershell scripts, direct from repo

ECHO +====================================================+
ECHO +       Universal Powershell Loader - v0.25          +
ECHO +====================================================+

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command ""iwr -useb https://raw.githubusercontent.com/#### REPO LINK GOES HERE #### | iex""' -Verb RunAs}"
TIMEOUT /T 2