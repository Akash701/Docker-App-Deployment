const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <title>Welcome Home</title>
      <style>
        body {
          background: linear-gradient(to right, #667eea, #764ba2);
          color: #fff;
          font-family: 'Segoe UI', sans-serif;
          text-align: center;
          margin-top: 100px;
        }
        h1 {
          font-size: 3rem;
          margin-bottom: 10px;
        }
        p {
          font-size: 1.2rem;
          opacity: 0.9;
        }
      </style>
    </head>
    <body>
      <h1>Welcome to my Dockerized App</h1>
      <p>You're running this on an EC2 instance using Docker + Terraform using SCP.</p>
    </body>
    </html>
  `);
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on port ${PORT}`);
});
