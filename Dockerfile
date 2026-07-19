FROM node:20-alpine AS builder

WORKDIR /app

# 先装依赖（利用Docker缓存）
COPY package.json package-lock.json ./
COPY backend/package.json ./backend/
COPY frontend/package.json ./frontend/
RUN npm ci

# 复制源码
COPY . .

# 编译前后端
RUN npm run build --workspace backend && npm run build --workspace frontend

# ========== 运行镜像 ==========
FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache chromium

# 从builder复制
COPY --from=builder /app/backend/dist ./backend/dist
COPY --from=builder /app/backend/node_modules ./backend/node_modules
COPY --from=builder /app/backend/package.json ./backend/package.json
COPY --from=builder /app/frontend/dist ./frontend/dist
COPY --from=builder /app/frontend/package.json ./frontend/package.json
COPY --from=builder /app/frontend/node_modules ./frontend/node_modules
COPY --from=builder /app/frontend/src ./frontend/src
COPY --from=builder /app/frontend/public ./frontend/public
COPY --from=builder /app/package.json ./package.json

# 前端静态文件服务
RUN npm i -g serve

EXPOSE 4188

ENV NODE_ENV=production
ENV CRM_STORE=mysql
ENV PORT=4188

CMD ["node", "backend/dist/server.js"]
