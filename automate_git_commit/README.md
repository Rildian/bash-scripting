# Automating git push 

Work in progress 




# 🔐 Setting up SSH for Automated Backups

Since this script runs via **Cron** (background process), it cannot interactively ask for your GitHub username or password. You must configure an **SSH Key** to allow the script to push changes automatically.

## 1. Generate a Dedicated "Bot" Key

Open your terminal and run the following command to generate a new SSH key specifically for this script.

**Important:** When asked for a passphrase, press `Enter` twice to leave it **empty**. Cron cannot type passwords!

```bash
ssh-keygen -t ed25519 -C "cron-bot" -f ~/.ssh/id_github_bot
```

## 2. Configure SSH to Use the Key

You need to tell your system to use this specific key when connecting to GitHub.

1. Open (or create) your SSH config file:

```bash
nano ~/.ssh/config
```

2. Paste the following configuration at the bottom of the file:

```
Host github.com
    User git
    Hostname github.com
    IdentityFile ~/.ssh/id_github_bot
    IdentitiesOnly yes
```

3. Save and exit (`Ctrl+O`, `Enter`, `Ctrl+X`), then secure the file permissions:

```bash
chmod 600 ~/.ssh/config
```

## 3. Add the Key to GitHub

1. Copy the public key to your clipboard:

```bash
cat ~/.ssh/id_github_bot.pub
```

2. Go to GitHub.com → Settings → SSH and GPG keys.
3. Click **[New SSH key]**.
4. Give it a title (e.g., "Cron Bot") and paste the key.
5. Click **Add SSH key**.

## 4. Test the Connection

Run this command in your terminal to verify everything is working. You should see a success message welcoming you by name.

```bash
ssh -T git@github.com
# Expected Output: "Hi username! You've successfully authenticated..."
```

## 5. Switch Your Repository to SSH

For the backup to work, your local repository MUST use the SSH URL, not HTTPS.

1. Navigate to your repository:

```bash
cd /path/to/your/repo
```

2. Check your current remote URL:

```bash
git remote -v
```

3. If the URL starts with `https://`, you must switch it to SSH:

```bash
# Replace 'user' and 'repo' with your actual details
git remote set-url origin git@github.com:user/repo.git
```

