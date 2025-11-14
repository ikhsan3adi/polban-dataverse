FROM oven/bun:1.3 AS builder

ARG WORKDIR
ARG CONFDIR

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY ${WORKDIR}/package.json ${WORKDIR}/bun.lockb* ./

RUN bun install --frozen-lockfile

COPY ${WORKDIR} .

RUN bun run build

FROM oven/bun:1.3-slim

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json .

CMD ["bun", "run", "start:prod"]
