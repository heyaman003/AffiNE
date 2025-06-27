FROM node:20-alpine

ENV NODE_OPTIONS=--max_old_space_size=8192

WORKDIR /app

# Enable corepack and install git
RUN corepack enable && apk update && apk add --no-cache git

# Show git version immediately after installing to verify
RUN git --version

COPY . .

RUN ls -al /app/.git

RUN yarn install --frozen-lockfile

EXPOSE 8080

CMD ["yarn", "affine", "dev", "-p", "web"]
