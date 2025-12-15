FROM oven/bun:1.3 AS builder

ARG WORKDIR
ARG CONFDIR

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY ${WORKDIR}/package.json ${WORKDIR}/bun.lock ${WORKDIR}/bun.lockb* ./

RUN bun install --frozen-lockfile

COPY ${WORKDIR} .

RUN bun run build

FROM oven/bun:1.3-slim

WORKDIR /app

COPY --from=builder /app .

CMD ["sh", "-c", "bun run db:migrate && bun run start:prod"]
