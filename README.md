# WEB GURU AI V3

Aplikasi administrasi guru berbasis HTML, CSS, JavaScript dan siap dipublikasikan dengan GitHub Pages.

## Fitur
- Login/Logout mode demo
- Dashboard statistik
- Data siswa: tambah, cari, hapus
- Absensi berdasarkan tanggal
- Penilaian dan rata-rata
- Export CSV
- Laporan dan cetak
- AI Guru lokal: soal, rangkuman, TP, aktivitas
- Profil guru/sekolah/mapel
- Backup/Restore JSON
- Dark mode
- Responsive HP/laptop
- `supabase-schema.sql` sebagai fondasi database online

## Upload
Upload `index.html`, `style.css`, `script.js`, `README.md`, dan `supabase-schema.sql` ke repository GitHub. Aktifkan **Settings > Pages > Deploy from a branch > main > /root**.

## Arsitektur V3
Versi yang langsung dijalankan memakai `localStorage`, sehingga tidak memerlukan server. Untuk database terpusat, gunakan Supabase/Firebase/backend.

```text
Browser
  ↓
GitHub Pages
  ↓
Frontend
  ↓
Backend/API
  ├── Database
  └── AI API
```

Jangan pernah menaruh API key rahasia atau service-role key di `script.js` pada repository publik.

## Database
`supabase-schema.sql` berisi tabel awal:
- teacher_profiles
- students
- attendance
- scores

## Roadmap
V3.1: Supabase Auth + database online + multi-user.
V3.2: Import Excel + rekap semester + cetak administrasi.
V4: Backend/serverless + AI API nyata + analisis nilai + generator perangkat pembelajaran.
