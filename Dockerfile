# Sử dụng Node.js 16
FROM node:16

# Thiết lập thư mục làm việc
WORKDIR /usr/src/app
RUN apt update && apt install git masscan libpcap-dev sudo -y
# Sao chép package.json và package-lock.json
COPY package*.json ./

# Cài đặt các phụ thuộc
RUN npm install --production

# Sao chép mã nguồn
COPY . .

# Lắng nghe trên cổng 3000
EXPOSE 8888


# Chạy ứng dụng
CMD ["npm", "start"]
