# Workspace

Written by `/jobsearch:setup`. Paths are relative to `root` unless absolute.

```yaml
root: ~/JobSearch
master_resume:                # path to your current master resume (md, docx or pdf)
companies_dir: companies
pipeline: pipeline.md
drive_folder: null            # Google Drive folder name to mirror into, or null
gmail: false                  # true if Gmail tools may be used to read and draft
```

Local files are the source of truth. When `drive_folder` is set and Drive tools are present, each file written locally is also written there. When `gmail` is true and Gmail tools are present, the correspondence skill may read a thread you point it to and place a draft in your drafts folder. It never sends.
