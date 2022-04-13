# build phase
From node:alpine as builder 
WORKDIR '/app'
COPY package.json .
Run npm install
# copy all source code over 
COPY . . 
# output a build folder to WORKING DIR /app/build 
RUN npm run build 

# run phase 
FROM nginx 
Expose 80
# copy over the builder folder to nginx container 
COPY --from=builder /app/build /usr/share/nginx/html



