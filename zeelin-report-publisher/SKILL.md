---
name: zeelin-report-publisher
description: Publish reports to the ZeeLin reports website ("智灵报告网站") by copying report assets, inserting a new top entry into public/reports_config.json for any category, running build checks, and preparing PR-ready branches.
metadata:
  {
    "openclaw":
      {
        "emoji": "🗂️",
        "requires": { "bins": ["python3", "git", "npm"], "anyBins": ["gh"] },
      },
  }
---

# ZeeLin Report Publisher

## When To Use

Use this skill when the user asks to publish, upload, or add a report to the **智灵报告网站**.

Trigger intent should include both:

- the site phrase: `智灵报告网站`
- an action phrase: `发布` / `上架` / `新增报告`

This skill supports multiple categories (not only OpenClaw).

## Inputs

Collect these fields before running:

- `report_file` (required)
- `title` (required)
- `category` (required)
- `date` (optional, auto-infer if omitted)
- `abstract` (optional, auto-generate if omitted)
- `version` (optional, default `1.0`)
- `id` (optional)
- `cover_url` (optional)
- `category_dir` (optional)

Field details: see [report-metadata.md](references/report-metadata.md).

## Workflow

1. Confirm target repo path and that it contains `public/reports_config.json`.
2. Run the publisher script (below).
3. Verify build result.
4. Confirm branch push and PR URL.

## Script

Primary command:

```bash
python3 {baseDir}/scripts/publish_report.py \
  --repo "/absolute/path/to/repo" \
  --report-file "/absolute/path/to/report.pptx" \
  --title "Report Title" \
  --category "OpenClaw" \
  --date "2026" \
  --version "1.0" \
  --abstract "Short summary text."
```

If your runner does not resolve `{baseDir}`, replace it with the absolute path of this skill folder.

Default behavior:

- Copies file into `public/<category_dir>/`.
- Inserts new entry at index `0` in `public/reports_config.json`.
- Auto-detects `date` from file name/title (`YYYY-MM`/`YYYY`) and falls back to current year.
- Auto-generates `abstract` when omitted.
- Runs `npm run build`.
- Creates feature branch `codex/report-<id>`.
- Commits and pushes to `origin`.
- Creates PR with `gh` if available; otherwise prints manual compare URL.

## Abstract Generation Standard

When `abstract` is omitted, generate a concise, neutral summary by these rules:

- Use one sentence in Chinese, around 40-90 characters.
- Mention scope + value (for example: "核心进展、关键问题、落地路径").
- Avoid unverifiable claims and marketing tone.
- If content context is limited, use title/category-based generic summary.

## Guardrails

- Do not push directly to `main` as final delivery; use PR workflow.
- If working tree is dirty, stop unless user explicitly allows mixed changes.
- Keep existing entry format compatible with site fields: `id/title/version/date/category/abstract/coverUrl/pdfUrl`.
