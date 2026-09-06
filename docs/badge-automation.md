# Badge Automation Playbook

Perintah lengkap untuk mengejar GitHub Achievements via `gh` CLI + GraphQL. Akun harus sudah `gh auth login`.

## Pull Shark / YOLO

```bash
git checkout -b feat/branch-name
# edit file...
git add -A && git commit -m "feat: something"
git push -u origin feat/branch-name
gh pr create --title "feat: something" --body "description"
gh pr merge --merge            # tanpa review = YOLO
```

## Quickdraw (issue < 5 menit)

```bash
URL=$(gh issue create --title "judul" --body "isi")
NUM=$(basename "$URL")
gh issue close "$NUM" --comment "closing note"
```

## Galaxy Brain (2 accepted answers)

Butuh repo dengan Discussions aktif + kategori Q&A. Semua via GraphQL:

```bash
# 1. id repo & kategori
gh api graphql -f query='query{repository(owner:"OWNER",name:"REPO"){id discussionCategories(first:10){nodes{id name}}}}'

# 2. bikin discussion
gh api graphql -f query='mutation{createDiscussion(input:{repositoryId:"R_...",categoryId:"DIC_...",title:"...",body:"..."}){discussion{id}}}'

# 3. jawab (comment)
gh api graphql -f query='mutation{addDiscussionComment(input:{discussionId:"D_...",body:"jawaban..."}){comment{id}}}'

# 4. tandai accepted — perhatikan: field-nya `id`, BUKAN `commentId`
gh api graphql -f query='mutation{markDiscussionCommentAsAnswer(input:{id:"DC_..."}){discussion{isAnswered}}}'
```

Catatan: penanya sendiri harus yang menandai accepted (di repo sendiri = aman).

## Pair Extraordinaire

```bash
git commit -m "feat: something" --trailer "Co-authored-by: USERNAME <ID+USERNAME@users.noreply.github.com>"
```
Lalu PR → merge. Co-author harus akun GitHub asli.

## Cheat sheet tier

| Badge | Default | Bronze | Silver | Gold |
|---|---|---|---|---|
| Pull Shark | 2 | 16 | 128 | 1024 |
| Galaxy Brain | 2 | 8 | 16 | 32 |
| Pair Extraordinaire | 1 | 10 | 24 | 48 |
| Starstruck | 16 | 128 | 512 | 4096 |
