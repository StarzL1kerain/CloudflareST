#!/bin/bash
cd ~/CloudflareST/
# 生成一个0到2之间的随机数
random_number=$((RANDOM % 4))

# 根据随机数执行相应的命令
case $random_number in
  0)
    ./CloudflareST -sl 1 -tl 300 -dn 10
    ;;
  1)
    ./CloudflareST -url https://jp.cloudflarest.link -sl 1 -tl 300 -dn 10
    ;;
  2)
    ./CloudflareST -url https://hkcs.cloudflarest.link -sl 1 -tl 300 -dn 10
    ;;
  3)
    ./CloudflareST -sl 1 -dn 10
    ;;
esac
