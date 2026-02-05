# E-Gereja Management System

Aplikasi Sistem Informasi Management (non keuangan) opensource untuk Gereja. Menggunakan Laravel 12, Filament 5, MySql. Silahkan gunakan untuk Kemulyaan Tuhan Yesus. Masih banyak Bug. Silahkan anda sempurnakan sendiri, kalau membutuhkan jasa custom bukan opensource lagi hehehe...

## Panduan Instalasi dan Penggunaan

Berikut adalah langkah-langkah lengkap dan mendetail untuk menjalankan aplikasi ini di komputer lokal Anda:

### 1. Prasyarat Sistem
Pastikan komputer Anda sudah terinstall:
- [PHP](https://www.php.net/) (versi 8.2 atau lebih baru - disarankan sesuai requirements Laravel 12)
- [Composer](https://getcomposer.org/) (Dependency Manager untuk PHP)
- [Node.js & NPM](https://nodejs.org/) (Untuk mengelola aset frontend)
- [MySQL Database](https://www.mysql.com/) (Atau database lain yang didukung Laravel)
- [Git](https://git-scm.com/)

### 2. Download Source Code
Langkah pertama adalah mengambil source code aplikasi dari GitHub. Buka terminal atau command prompt dan jalankan perintah:

```bash
git clone https://github.com/wiratmoko1708/e-Gereja.git
```

Masuk ke direktori project:
```bash
cd e-gereja
```

### 3. Install Dependensi PHP (Composer)
Aplikasi ini membutuhkan berbagai library PHP yang dikelola oleh Composer. Install dependensi dengan perintah:

```bash
composer install
```

Jika Anda perlu memperbarui library ke versi yang lebih baru (hati-hati, ini bisa mengubah versi lock file):
```bash
composer update
```

### 4. Konfigurasi Environment (.env)
Laravel menyimpan konfigurasi lingkungan dalam file `.env`. Anda perlu membuat file ini dari contoh yang disediakan:

**Untuk Pengguna Mac/Linux:**
```bash
cp .env.example .env
```

**Untuk Pengguna Windows:**
```bash
copy .env.example .env
```

Selanjutnya, buka file `.env` dengan text editor favorit Anda (VS Code, Notepad, dll) dan sesuaikan konfigurasi database. Cari bagian berikut dan ubah sesuai setting database komputer Anda:

```ini
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=e_gereja       # Ganti dengan nama database yang Anda buat
DB_USERNAME=root           # Ganti dengan username database Anda
DB_PASSWORD=               # Ganti dengan password database Anda
```

*Pastikan Anda sudah membuat database kosong bernama `e_gereja` (atau nama yang Anda pilih) di MySQL sebelum melanjutkan.*

### 5. Generate Application Key
Laravel membutuhkan key enkripsi yang unik untuk keamanan. Generate key tersebut dengan perintah:

```bash
php artisan key:generate
```

### 6. Setup Database (Migrate & Seed)
Sekarang kita perlu membuat tabel-tabel di database dan mengisi data awal (seeding). Jalankan perintah:

```bash
php artisan migrate --seed
```
Perintah ini akan menjalankan migrasi database dan mengisi data awal pengguna.

### 7. Link Storage
Agar file gambar dan dokumen yang diupload bisa diakses oleh publik (browser), kita perlu membuat symbolic link:

```bash
php artisan storage:link
```

### 8. Install & Build Aset Frontend
Aplikasi ini menggunakan Vite untuk build asset. Anda perlu menginstall dependensi JavaScript dan membuild-nya:

```bash
npm install
npm run build
```

### 9. Jalankan Server Lokal
Langkah terakhir, jalankan server pengembangan lokal Laravel:

```bash
php artisan serve
```

Biasanya aplikasi akan berjalan di alamat: `http://127.0.0.1:8000`.

### 10. Login ke Aplikasi
Buka browser dan akses alamat di atas (misal: `http://127.0.0.1:8000/faith/login`).

Gunakan kredensial berikut (jika menggunakan seeder default):
- **Email**: `test@example.com`
- **Password**: `password`

---
Jika anda import dari database contoh (dbcontoh.sql ):
ada 2 level user:
1. Admin => akses semua menu
- **Email**: `gembala@gmail.com`
- **Password**: `password`

2. Operator => akses menu tertentu
- **Email**: `operator@gmail.com`
- **Password**: `password`

Web Demo : https://e-gereja.my.id/

---
*Dibuat dengan ❤️ untuk kemuliaan nama Tuhan.*
