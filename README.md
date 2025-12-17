<div align="center">

![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Montserrat&weight=600&size=32&duration=3000&pause=2000&color=FFFFFF&center=true&vCenter=true&width=435&lines=Polban+DataVerse)

<img src="https://github.com/ihsan-ramadhan/polban-dataview/raw/main/laravel-vue/public/images/polban-logo.png" alt="Polban Logo" width="120" />

**Polban DataVerse Project**

Polban Dataverse is a collaborative initiative to consolidate data from various sources within the Bandung State Polytechnic into a single interactive visual portal.

[![Polban DataHub](https://img.shields.io/badge/Polban-DataHub-fff?style=for-the-badge&labelColor=FFBBAE&color=FF2D20)](https://github.com/ErsyaHasby/polban-datahub)
[![Polban DataCore](https://img.shields.io/badge/Polban-DataCore-fff?style=for-the-badge&labelColor=C5F74F&color=111)](https://github.com/muhamadSyahid/polban-datacore)
[![Polban DataView](https://img.shields.io/badge/Polban-DataView-fff?style=for-the-badge&labelColor=41B883&color=35495E)](https://github.com/ihsan-ramadhan/polban-dataview)

</div>

<div align="center">

---

### 📈 Project Stats

![GitHub repo size](https://img.shields.io/github/repo-size/ikhsan3adi/polban-dataverse?style=flat-square&color=FF6384)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/ikhsan3adi/polban-dataverse?style=flat-square&color=2196F3)
![GitHub last commit](https://img.shields.io/github/last-commit/ikhsan3adi/polban-dataverse?style=flat-square&color=646CFF)

</div>

---

## Overview

Repository superproject ini berisi:

- Semua DataVerse services sebagai git submodules:
  - [**Polban DataCore**](https://github.com/muhamadSyahid/polban-datacore)
  - [**Polban DataHub**](https://github.com/ErsyaHasby/polban-datahub)
  - [**Polban DataView**](https://github.com/ihsan-ramadhan/polban-dataview)
- Dockerfile untuk mem-build semua layanan
- Konfigurasi Docker Compose untuk penggunaan mudah

## Prerequisites

- Docker
- Git (for cloning + submodules)
- Bash/sh shell

## Quick Start

1. Clone repo beserta submodule:

```bash
git clone https://github.com/ikhsan3adi/polban-dataverse.git
cd polban-dataverse
git submodule update --init --recursive
```

2. Salin env contoh dan sesuaikan:

```bash
cp .env.example .env
# lalu edit nilai kredensial DB, KONG, app keys, dsb.
```

3. Jalankan semua layanan (build + up):

```bash
./run.sh
# atau: docker compose up -d --build --remove-orphans
```

4. Jalankan migrasi (otomatis untuk DataHub via `run.sh`):

- DataHub: sudah dijalankan di `run.sh` (`php artisan migrate --force`)
- DataCore (opsional, jika belum dimigrasi):
  ```bash
  docker compose exec dataverse-datacore bun run db:migrate
  ```

5. Akses layanan:

- DataCore API: `dataverse-datacore:3000` (internal) / via Kong proxy jika diekspos
- DataCore Web (admin): `dataverse-datacore_web`
- DataHub: `dataverse-datahub`
- DataView: `dataverse-dataview`
- Kong Proxy/Admin/GUI: sesuai port env (`KONG_PROXY_PORT_PUBLIC`, `KONG_API_PORT_PUBLIC`, `KONG_GUI_PORT_PUBLIC`)

## Docker Compose Lifecycle

- Start + build:

  ```bash
  ./run.sh
  ```

  atau

  ```bash
  docker compose up -d --build --remove-orphans
  ```

- Stop:

  ```bash
  docker compose down
  ```

- Rebuild tertentu (misal hanya datacore):

  ```bash
  docker compose up -d --build dataverse-datacore
  ```

- Logs (contoh DataCore):
  ```bash
  docker compose logs -f dataverse-datacore
  ```

## Kong Gateway (deck) Export/Import

- Export konfigurasi dari Kong DB → file deklaratif (`configs/kong.yml`):

  ```bash
  ./export-kong.sh
  ```

- Import/sync konfigurasi ke Kong DB dari file deklaratif:
  ```bash
  ./import-kong.sh
  ```

Gunakan setelah mengubah service/route/consumer agar konsisten antara file dan database Kong.

## Update Submodules

Untuk menarik perubahan terbaru dari semua layanan:

```bash
git submodule update --remote --merge services
```

Jika hanya ingin fetch tanpa merge otomatis, hilangkan `--merge`.

## Troubleshooting

- **Database belum siap**: Pastikan kontainer `dataverse-main_db` dan `dataverse-datacore_db` healthy sebelum menjalankan migrasi.
- **Port bentrok**: Sesuaikan `*_PORT_PUBLIC` di `.env` dengan port kosong di host.
- **Kong tidak bisa diakses**: Cek `docker compose logs -f dataverse_gateway`; pastikan migrasi `dataverse_gateway_bootstrap` selesai sukses.
- **Env tidak terbaca**: Pastikan `.env` ada di root repo dan tidak ada spasi berlebih.

## Authors

### DataCore

- Ikhsan Satriadi - [@ikhsan3adi](https://github.com/ikhsan3adi)
- Muhamad Syahid - [@muhamadSyahid](https://github.com/muhamadSyahid)
- Rizky Satria Gunawan - [@RizkySatria123](https://github.com/RizkySatria123)
- Yazid Alrasyid - [@yajidms](https://github.com/yajidms)

### DataHub

- Alda Pujama - [@Arud4Alda](https://github.com/Arud4Alda)
- Alexandrio Vega Bonito - [@AlexandrioVega](https://github.com/AlexandrioVega)
- Ersya Hasby Satria - [@ErsyaHasby](https://github.com/ErsyaHasby)
- Gema Adzan Firdaus - [@Gema1407](https://github.com/Gema1407)
- Muhammad Raihan Abubakar - [@hanzz78](https://github.com/hanzz78)

### DataView

- Fatimah Hawwa Alkhansa - [@ftmhhwwa](https://github.com/ftmhhwwa)
- Hanifidin Ibrahim - [@Hanif13579](https://github.com/Hanif13579)
- Muhammad Brata Hadinata - [@MuhammadBrataH](https://github.com/MuhammadBrataH)
- Muhammad Ihsan Ramadhan - [@ihsan-ramadhan](https://github.com/ihsan-ramadhan)
- Varian Abidarma Syuhada - [@v4rshaaa](https://github.com/v4rshaaa)
