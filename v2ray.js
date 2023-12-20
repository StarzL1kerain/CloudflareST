const express = require('express');
const dotenv = require('dotenv');
const fs = require('fs');

dotenv.config();
const app = express();
const port = process.env.PORT || 2016;

const os = require('os');

function getLocalIP() {
  const interfaces = os.networkInterfaces();
  for (const interfaceName in interfaces) {
    const interface = interfaces[interfaceName];
    for (const info of interface) {
      if (info.family === 'IPv4' && !info.internal) {
        return info.address;
      }
    }
  }
  return null;
}

app.get(['/','/v2ray1'], (req, res) => {
  let uuid = process.env.uuid1
  let domain = process.env.domain1
  localIP = getLocalIP();
  // 读取 result.csv 文件内容
  let csvData = fs.readFileSync('result.csv', 'utf8');
  // console.log(csvData)
  // 解析 IP 列数据
  let lines = csvData.split('\n').slice(1);
  let ips = lines.map(line => line.split(',')[0]);
  // 构建 vless_links 字符串
  vlessLinks=''
  ips.forEach(ip => {
    vlessLinks += `vless://${uuid}@${ip}:80?encryption=none&security=none&sni=${domain}&fp=randomized&type=ws&host=${domain}&path=%2F%3Fed%3D2048#${domain}\n`;
  });
  // 将字符串进行 Base64 编码
  let nodeBase64 = Buffer.from(vlessLinks).toString('base64');
  // console.log(nodeBase64);
  console.log(nodeBase64.length);
  res.send(nodeBase64);
});

// app.get(['/v2ray2'], (req, res) => {
//   let uuid = process.env.uuid2
//   let domain = process.env.domain2
//   localIP = getLocalIP();
//   // 读取 result.csv 文件内容
//   let csvData = fs.readFileSync('result.csv', 'utf8');
//   // console.log(csvData)
//   // 解析 IP 列数据
//   let lines = csvData.split('\n').slice(1);
//   let ips = lines.map(line => line.split(',')[0]);
//   // 构建 vless_links 字符串
//   vlessLinks=''
//   ips.forEach(ip => {
//     vlessLinks += `vless://${uuid}@${ip}:80?encryption=none&security=none&sni=${domain}&fp=randomized&type=ws&host=${domain}&path=%2F%3Fed%3D2048#${domain}\n`;
//   });
//   // 将字符串进行 Base64 编码
//   let nodeBase64 = Buffer.from(vlessLinks).toString('base64');
//   // console.log(nodeBase64);
//   console.log(nodeBase64.length);
//   res.send(nodeBase64);
// });

app.listen(port, () => {
  console.log("服务器已启动，监听端口:", port);
  localIP = getLocalIP();
  console.log(`${localIP}:${port}`);
});
