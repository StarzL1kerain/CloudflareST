#!/bin/bash

# ip格式化
column_data=$(tail -n +2 result.csv | awk -F, '{print $1}')

vless_links=""
uuid=''
domain=""
for ip in $column_data; do
    vless_links+="vless://$uuid@${ip}:80?encryption=none&security=none&sni=$domain&fp=randomized&type=ws&host=$domain&path=%2F%3Fed%3D2048#$domain\n"
done

# 将字符串进行Base64编码
node_base64=$(echo -en "$vless_links" | base64)

# 获取当前工作目录
current_directory=$(dirname "$(readlink -f "$0")")
# 构建.env文件的路径
env_file_path="$current_directory/.env"
# 将node_base64的值写入.env文件（一行）
echo -n "node_base64=" > "$env_file_path"
echo -n "$node_base64" >> "$env_file_path"
echo "成功将node_base64的值存储到.env文件中"

# 将.env文件中的内容合并成一行
tr -d '\n' < "$env_file_path" > "$env_file_path.temp"
mv "$env_file_path.temp" "$env_file_path"
