# GitHub Personal Access Token (PAT) Guide

This guide will help you set up and use a GitHub Personal Access Token (PAT) to securely authenticate with GitHub for your text-to-audio conversion project.

## What is a Personal Access Token?

A Personal Access Token (PAT) is an alternative to using your GitHub password for authentication when using the GitHub API or command line. PATs are more secure than using your password because:

- They can have limited scopes/permissions
- They can be revoked at any time without changing your password
- They have expiration dates

## Creating a GitHub PAT

1. **Log in to your GitHub account**

2. **Access Token Settings**:
   - Click on your profile photo in the top-right corner
   - Select "Settings"
   - Scroll down to "Developer settings" in the left sidebar
   - Click on "Personal access tokens"
   - Select "Tokens (classic)" or "Fine-grained tokens" (newer option with more granular permissions)

3. **Generate New Token**:
   - Click "Generate new token"
   - For "Token (classic)", click "Generate new token (classic)"
   - For fine-grained token, click "Generate new token"

4. **Set Token Description**:
   - Enter a descriptive name like "TextToAudio Project"

5. **Set Expiration**:
   - Choose an expiration period (30 days, 60 days, 90 days, custom, or no expiration)
   - For security, it's recommended to use an expiration date

6. **Select Scopes/Permissions**:
   - For basic repository operations, select the "repo" scope (for classic tokens)
   - For fine-grained tokens, select the specific repositories and permissions you need

7. **Generate Token**:
   - Scroll down and click "Generate token"

8. **Copy Your Token**:
   - **IMPORTANT**: Copy your token immediately and store it securely. GitHub will only show it once!

## Using Your PAT with Git

### Method 1: Configure Git to Store Credentials

```powershell
# Store credentials in Git credential manager
git config --global credential.helper manager
```

Then, the next time you push to GitHub, enter your username and use the PAT as your password when prompted.

### Method 2: Include PAT in Remote URL

```powershell
# Set remote URL with embedded PAT
git remote set-url origin https://YOUR_USERNAME:YOUR_PAT@github.com/YOUR_USERNAME/textotoaudio.git
```

Replace:
- `YOUR_USERNAME` with your GitHub username
- `YOUR_PAT` with your personal access token

### Method 3: Set Environment Variable

```powershell
# Set environment variable for current session
$env:GH_TOKEN = "your_token_here"

# Or set permanently (requires restart)
[Environment]::SetEnvironmentVariable("GH_TOKEN", "your_token_here", "User")
```

## Setting Up Your Repository

If you haven't initialized a Git repository yet:

```powershell
# Navigate to your project directory
cd c:\dev\textotoaudio

# Initialize Git repository
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial commit of text-to-audio converter"

# Create repository on GitHub first, then add remote
git remote add origin https://github.com/YOUR_USERNAME/textotoaudio.git

# Push to GitHub (use PAT when prompted for password)
git push -u origin main
```

## Security Best Practices

1. **Never share your PAT** or commit it to your repository
2. **Set appropriate expiration dates** for your tokens
3. **Use the minimum required scopes/permissions**
4. **Revoke tokens** when they're no longer needed
5. **Rotate tokens periodically** for enhanced security

## Troubleshooting

If you encounter authentication issues:

1. Verify your token hasn't expired
2. Check that you're using the correct token
3. Ensure your token has the necessary permissions
4. Try clearing your cached credentials:

```powershell
git credential reject host=github.com
```

Then try pushing again with your PAT.