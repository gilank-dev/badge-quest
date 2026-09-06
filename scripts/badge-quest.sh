#!/usr/bin/env bash
# Galaxy Brain quest: bikin Q&A discussion + jawaban + tandai accepted.
# Usage: ./scripts/badge-quest.sh OWNER REPO "Judul" "Pertanyaan" "Jawaban"
set -euo pipefail
OWNER=${1:?owner}; REPO=${2:?repo}; TITLE=${3:?title}; BODY=${4:?body}; ANSWER=${5:?answer}

echo "==> resolving repo + Q&A category"
DATA=$(gh api graphql -f query="query{repository(owner:\"$OWNER\",name:\"$REPO\"){id discussionCategories(first:10){nodes{id name}}}}")
REPO_ID=$(jq -r '.data.repository.id' <<<"$DATA")
CAT_ID=$(jq -r '.data.repository.discussionCategories.nodes[] | select(.name=="Q&A") | .id' <<<"$DATA")
[ "$CAT_ID" != "null" ] || { echo "Q&A category not found"; exit 1; }

echo "==> creating discussion"
DISC=$(gh api graphql -f query="mutation{createDiscussion(input:{repositoryId:\"$REPO_ID\",categoryId:\"$CAT_ID\",title:\"$TITLE\",body:\"$BODY\"}){discussion{id}}}")
DISC_ID=$(jq -r '.data.createDiscussion.discussion.id' <<<"$DISC")

echo "==> posting answer"
COM=$(gh api graphql -f query="mutation{addDiscussionComment(input:{discussionId:\"$DISC_ID\",body:\"$ANSWER\"}){comment{id}}}")
COM_ID=$(jq -r '.data.addDiscussionComment.comment.id' <<<"$COM")

echo "==> marking as accepted"
gh api graphql -f query="mutation{markDiscussionCommentAsAnswer(input:{id:\"$COM_ID\"}){discussion{isAnswered}}}" | tee /dev/stderr | jq -e '.data.markDiscussionCommentAsAnswer.discussion.isAnswered' >/dev/null && echo "OK — answered"
