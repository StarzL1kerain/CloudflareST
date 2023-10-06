// npm install express
// npm install dotenv

const express = require('express');
const dotenv = require('dotenv');

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;
const node_base64 = process.env.node_base64||0;

console.log(node_base64.length);

app.get(['/', '/v2ray'], (req, res) => {
  res.send(node_base64);
});

app.listen(port, () => {
  console.log("服务器已启动，监听端口:", port);
  console.log(`localhost:${port}`);
});
