# Call Quality Automation Template

This repository is a **click‑to‑deploy** template for hosting an n8n server on Heroku and automatically grading sales calls.

## What’s inside?

```
.
├── .github/workflows/        # CI/CD pipelines
│   └── deploy.yml            # builds Docker image and deploys to Heroku
├── docker/
│   ├── Dockerfile            # lightweight n8n image
│   └── entrypoint.sh         # respects Heroku’s dynamic $PORT
├── workflows/                # place your n8n exported JSON files here
│   └── README.txt            # instructions
├── .gitignore
└── README.md                 # (this file)
```

## Quick start

1. **Create a new GitHub repo** from this template (green **Use this template** button).
2. In your new repo, open **Settings → Secrets and variables → Actions** and add:

   | Name | Value |
   |------|-------|
   | `HEROKU_API_KEY` | *copy from https://dashboard.heroku.com/account* |
   | `HEROKU_EMAIL`   | *your‑email@example.com* |
   | `HEROKU_APP`     | *heroku‑app‑name* |

3. On the Heroku dashboard, create an app *(Container Stack)* with the same **app‑name**.
4. In **Heroku → Settings → Config Vars** add your runtime keys:

   - `OPENAI_API_KEY`
   - `TELEGRAM_BOT_TOKEN`
   - `N8N_ENCRYPTION_KEY` (any random 32‑char string, e.g. using [randomkeygen.com](https://randomkeygen.com/))

5. Commit / push to **main**.  
   The GitHub Action will build, push and release a Docker image.  
   Watch progress in the **Actions** tab.

6. Open `https://<heroku-app-name>.herokuapp.com` → sign up the first user → **Import** the workflow JSON.

That’s it — n8n will listen for webhooks and post call‑quality reports to Telegram.

## References

* GitHub Action: `gonuit/heroku-docker-deploy@v1.3.3` citeturn0search0
* Official n8n Docker image: `n8nio/n8n` citeturn0search1
