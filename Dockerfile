FROM node:18
WORKDIR /app
COPY backend/package*.json ./backend/
RUN cd backend && npm install
COPY . .
RUN cd backend && npx prisma generate && npm run build
EXPOSE 7860
ENV PORT=7860
CMD ["node", "backend/dist/main"]
