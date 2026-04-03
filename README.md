# Cockpit AI — Homebrew Tap

Personal agentic work orchestration system.

## Install

```bash
brew tap shreynshah/tap
brew install cockpit-ai
```

## First-Time Setup

```bash
# Initialize (creates config, state repo, registers auto-start)
cockpit init

# Or with an existing GitHub state repo:
cockpit init --state-repo shreynshah/cockpit-state

# Start the daemon
cockpitd

# Open the dashboard
open http://localhost:3200
```

## Desktop App

Download the latest `.dmg` from [Releases](https://github.com/shreynshah/releases/releases/latest).

Right-click → Open on first launch (unsigned app).

## Configure Connectors

Open `http://localhost:3200/settings` and enable connectors:

### GitHub
- **Auth Method:** `gh-cli` (corporate, uses `gh auth login`) or `pat` (personal, manual token)
- **State Repo:** `owner/cockpit-state` — where Cockpit stores state and work queue issues
- **Repos to Watch:** one per line — repos for PR reviews and code analysis

### Slack
- Create a Slack app at api.slack.com/apps → Bot Token Scopes: `channels:history`, `chat:write`
- Enter the Bot Token (`xoxb-...`) and channels to watch

### Gmail
- Enable 2FA on your Google account
- Generate an App Password at myaccount.google.com/apppasswords
- Enter your email address and the 16-character app password

### Outlook / Teams
- **Corporate:** Set auth method to `az-cli`, then run `az login` on your machine
- **Personal:** Register an Azure AD app at portal.azure.com, set auth method to `device-code`, enter the Client ID, click Authorize

### Calendar
- Requires Google OAuth (not yet available in dashboard — use `cockpit setup` CLI)

## Update

```bash
brew update && brew upgrade cockpit-ai
```

The dashboard shows an update banner when a new version is available.

## Requirements

- Node.js 22 (installed automatically by Homebrew)
- macOS (Apple Silicon or Intel)
