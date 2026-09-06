# 🏆 Badge Quest — Panduan Lengkap GitHub Achievements (Bahasa Indonesia)

Repo ini awalnya dibuat sebagai *badge quest playground*, sekarang jadi **panduan lengkap mendapatkan GitHub Achievements** — lengkap dengan quest log nyata dan playbook otomasi via `gh` CLI + GraphQL.

> Dikerjakan bersama [Hermes Agent](https://github.com/nousresearch) — AI-augmented engineering, bukan manual clicking 😎

## Daftar Badge & Syaratnya

| Badge | Syarat | Tier |
|---|---|---|
| 🦈 **Pull Shark** | PR dibuka & di-merge | 2 · 🥉16 · 🥈128 · 🥇1024 |
| 🧠 **Galaxy Brain** | Jawaban di Discussions ditandai accepted | 2 · 🥉8 · 🥈16 · 🥇32 |
| ⚡ **Quickdraw** | Close issue/PR < 5 menit setelah dibuka | single |
| 😎 **YOLO** | Merge PR tanpa review | single |
| 🤝 **Pair Extraordinaire** | Co-authored commit di PR yang di-merge | 1 · 🥉10 · 🥈24 · 🥇48 |
| ⭐ **Starstruck** | Repo publik dapat stars | 16 · 🥉12 8 · 🥈512 · 🥇4096 |
| 💛 **Public Sponsor** | Sponsor dev open source via GitHub Sponsors | single |

⚠️ Sejak Feb 2024, jawaban di **GitHub Community Discussions** (forum utama) tidak dihitung untuk Galaxy Brain — harus di Discussions repo publik lain.

## Playbook Otomasi

Semua langkah teknis (perintah `gh` + mutation GraphQL lengkap) ada di **[docs/badge-automation.md](docs/badge-automation.md)**.

Script siap pakai: `scripts/badge-quest.sh` (Galaxy Brain quest otomatis).

## Quest Log — 2026-09-06

| Waktu (WIB) | Aksi | Hasil |
|---|---|---|
| 23:26 | PR #1 (.gitignore) di-merge | Pull Shark #1 ✅ |
| 23:32 | Issue #2 dibuka & ditutup dalam 2 detik | Quickdraw ✅ |
| 23:48 | PR #5 (CONTRIBUTING) di-merge | Pull Shark #2 ✅ |
| ~23:50 | 2 Q&A Discussions dijawab & accepted | Galaxy Brain ✅ |
| (semua merge tanpa review) | — | YOLO ✅ |

Badge muncul di profile dalam **≤ 24 jam** (sync GitHub, bukan instan).

## Development

Repo ini juga jadi template playground:

- `.gitignore` — keep junk out of commits
- `.github/` — templates, CI, policy files standar repo open source

## License

MIT — lihat [LICENSE](LICENSE).
