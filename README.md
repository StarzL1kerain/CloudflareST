# 优选IP脚本设置定时更新优选ip
## windows 直接解压执行bat
## 服务器
* 用ssh连接软件连接服务器
```Bash
不推荐root用户
pwd
控制台输出 /home/kerain

# 如果是第一次使用，则建议创建新文件夹（后续更新请跳过该步骤）
mkdir /home/kerain/CloudflareST
# 进入文件夹（后续更新，只需要从这里重复下面的下载、解压命令即可）
cd /home/kerain/CloudflareST

# 下载 CloudflareST 压缩包（自行根据需求替换 URL 中版本号和文件名）
wget -N http://gitproxy.mrhjx.cn/

# 解压（不需要删除旧文件，会直接覆盖，自行根据需求替换 文件名）
tar -xvf CloudflareST_linux_armv5.tar && rm CloudflareST_linux_armv5.tar


# 赋予执行权限
chmod +x CloudflareST && chmod +x CloudflareST.sh

# 首次建议手动执行命令 任意一个
./CloudflareST.sh
# 测速指令
# 日本ip
./CloudflareST -url https://jp.cloudflarest.link -sl 3 -tl 200 -dn 10
# 香港ip
./CloudflareST -url https://hkcs.cloudflarest.link -sl 3 -tl 200 -dn 10


```
### 添加定时

* 0 6 * * * 0代表分6代表小时，意思是6：00整开始运行脚本
```
crontab -e
0 0 * * * /home/kerain/CloudflareST/CloudflareST.sh
0 6 * * * /home/kerain/CloudflareST/CloudflareST.sh
0 12 * * * /home/kerain/CloudflareST/CloudflareST.sh
0 18 * * * /home/kerain/CloudflareST/CloudflareST.sh
当前的 crontab 配置
crontab -l
查看 crontab 日志
grep CRON /var/log/syslog

```


```
## 修改于CloudflareSpeedTest
* 请参考 [CloudflareSpeedTest](https://github.com/XIU2/CloudflareSpeedTest)
```