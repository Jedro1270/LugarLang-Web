FROM node:18-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

# Use different commands based on NODE_ENV
CMD if [ "$NODE_ENV" = "development" ]; then \
        npm run dev -- --host 0.0.0.0 --port 3000; \
    else \
        npm run build && serve -s dist; \
    fi