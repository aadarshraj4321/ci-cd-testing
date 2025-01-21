# Step 1: Set up the base image with Node.js for the build process
FROM node:20-alpine AS builder

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy package.json and package-lock.json for installing dependencies
COPY package.json package-lock.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application files (excluding those in .dockerignore)
COPY . .

# Step 6: Build the Next.js app
RUN npm run build

# Step 7: Create a production image
FROM node:20-alpine AS production

# Step 8: Set the working directory for production
WORKDIR /app

# Step 9: Copy files from builder stage - Fixed the copying of files
COPY --from=builder /app/package.json ./
COPY --from=builder /app/package-lock.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

# Step 10: Expose port 3000 (Next.js default)
EXPOSE 3000

# Step 11: Run the Next.js app in production mode
CMD ["npm", "start"]