#!/bin/bash

# 获取操作系统类型和架构
OS=$(uname -s)
ARCH=$(uname -m)
GETCONF=$(getconf LONG_BIT)
# 判断操作系统类型和架构
if [ "$OS" = "Linux" ]; then
    if [ "$ARCH" = "x86_64" ]; then
        echo "Linux 64位"
        # 在此处添加Linux 64位的下载和解压逻辑
        wget http://gitproxy.mrhjx.cn/https://github.com/StarzL1kerain/CloudflareST/releases/download/v1.0.1/CloudflareST_linux_amd64.tar
        tar -xf CloudflareST_linux_amd64.tar
        rm CloudflareST_linux_amd64.tar
    elif [ "$ARCH" = "aarch64" ] && [ "$GETCONF" = "64" ]; then
        echo "Linux ARMv8"
        # 在此处添加Linux ARMv8的下载和解压逻辑
        wget http://gitproxy.mrhjx.cn/https://github.com/StarzL1kerain/CloudflareST/releases/download/v1.0.1/CloudflareST_linux_arm64.tar
        tar -xf CloudflareST_linux_arm64.tar
        rm CloudflareST_linux_arm64.tar
    else
        echo "Unknown"
    fi
elif [ "$OSTYPE" = "msys" ] || [ "$OSTYPE" = "win32" ]; then
    if [ "$ARCH" = "x86_64" ]; then
        echo "Windows 64位"
        # 在此处添加Windows 64位的下载和解压逻辑
        powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://gitproxy.mrhjx.cn/https://github.com/StarzL1kerain/CloudflareST/releases/download/v1.0.1/CloudflareST_windows_amd64.zip', 'CloudflareST_windows_amd64.zip')"
        unzip CloudflareST_windows_amd64.zip
        rm CloudflareST_windows_amd64.zip
    else
        echo "Unknown"
    fi
else
    echo "Unknown"
fi
