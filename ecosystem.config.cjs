module.exports = {
  apps: [{
    name: 'goodjob-backend',
    script: 'backend/src/server.ts',
    interpreter: 'tsx',
    env: {
      NODE_ENV: 'development',
      CRM_STORE: 'mysql',
      DATABASE_URL: 'mysql://root@127.0.0.1:3306/goodjob_crm',
      PORT: '4188',
      JWT_SECRET: 'goodjob_dev_jwt_secret_2024',
      CORS_ORIGINS: 'http://127.0.0.1:5188,http://localhost:5188,http://192.168.1.6:5188,http://192.168.1.6:3000,http://www.zsfer.cn:5188',
      SESSION_COOKIE_SECURE: 'false'
    }
  }]
};
