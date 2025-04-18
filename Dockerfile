
#Use Node.js LTS version
FROM node:18

#Set working directory
WORKDIR /app

#Copy package files and install dependencies
COPY package*.json ./
RUN npm install

#Copy source code
COPY . .

#Expose port
EXPOSE 3000

#Start the application
CMD ["node", "index.js"]