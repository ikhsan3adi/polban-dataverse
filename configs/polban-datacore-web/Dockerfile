FROM oven/bun:1.3 AS builder

ARG WORKDIR

WORKDIR /app

COPY ${WORKDIR}/package.json ${WORKDIR}/bun.lockb* ./

RUN bun install --frozen-lockfile

COPY ${WORKDIR} .

RUN bun run build

FROM nginx:1.29.3-alpine

ARG CONFDIR

COPY --from=builder /app/dist /usr/share/nginx/html

COPY ${CONFDIR}/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
