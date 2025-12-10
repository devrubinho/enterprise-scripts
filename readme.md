# 🌐 Enterprise Scripts

> Complete development environment configurations for **Linux** and **macOS**

This repository contains **complete development environment configurations**, including:

- 📝 Configuration files (dotfiles)
- 🎨 Themes and fonts
- ⚙️ Automated installation scripts
- 🔧 Cursor/VS Code configurations
- 🛠️ Auxiliary tools
- 🔐 Environment variables for sensitive data

---

## 🚀 Quick Start

### 1. Clone the repository

```bash
git clone <repository-url>
cd enterprise-scripts
```

### 2. Configure Environment Variables (Optional)

```bash
cp .env.example .env  # Configure if needed
nano .env
```

Fill in your configuration values (Git credentials, API keys, etc.).

### 3. Platform-specific guides

- [🐧 Linux Installation](#-linux-installation)
- [🍎 macOS Installation](#-macos-installation)

---

## 🐧 Linux Installation

### Automatic Installation (Recommended)

```bash
cd linux/scripts/enviroment
bash 00-install-all.sh
```

**Note:** The script will automatically handle environment loading. After completion, simply close and reopen your terminal to ensure all configurations are applied.

### Manual Installation

```bash
cd linux/scripts/enviroment

# Run in order:
bash 01-configure-git.sh
bash 02-install-zsh.sh          # ⚠️ Close terminal after this
bash 03-install-zinit.sh
bash 04-install-starship.sh
bash 05-install-node-nvm.sh
bash 06-install-yarn.sh
bash 07-install-tools.sh
bash 08-install-font-jetbrains.sh
bash 09-install-cursor.sh
bash 10-install-claude.sh
bash 10-configure-terminal.sh
bash 11-configure-ssh.sh
bash 12-configure-inotify.sh
bash 13-install-task-master.sh
bash 13-install-cursor-extensions.sh
bash 14-configure-cursor.sh
bash 15-install-docker.sh       # ⚠️ Logout/login after this
bash 16-install-insomnia.sh
bash 17-install-heidisql.sh
```

---

## 🍎 macOS Installation

### Automatic Installation (Recommended)

```bash
cd macos/scripts/enviroment
bash 00-install-all.sh
```

**Note:** The script will automatically handle environment loading. After completion, simply close and reopen your terminal to ensure all configurations are applied.

### Manual Installation

```bash
cd macos/scripts/enviroment

# Run in order:
bash 01-configure-git.sh
bash 02-install-zsh.sh          # ⚠️ Close terminal after this
bash 03-install-zinit.sh
bash 04-install-starship.sh
bash 05-install-node-nvm.sh
bash 06-install-yarn.sh
bash 07-install-tools.sh
bash 08-install-font-jetbrains.sh
bash 09-install-cursor.sh
bash 10-install-claude.sh
bash 10-configure-terminal.sh
bash 11-configure-ssh.sh
bash 12-configure-inotify.sh
bash 12-install-task-master.sh
bash 13-install-cursor-extensions.sh
bash 14-configure-cursor.sh
bash 14-install-docker.sh
bash 15-configure-terminal.sh
bash 16-install-insomnia.sh
bash 17-install-tableplus.sh
```

---

## 🔐 Environment Variables

Optional `.env` for environment-specific configuration:

```bash
cp .env.example .env
nano .env  # Fill in your configuration details
```

**Environment variables:**
- `GITHUB_TOKEN` - For private repositories
- `AWS_SSO_START_URL` - AWS SSO configuration
- Multiple AWS accounts support
- Git user name and email

See `.env.example` for complete list.

**Benefits:**
✅ No hardcoded sensitive information
✅ Easy to share with team
✅ Secure (gitignored)
✅ Works for any organization

---

## 📋 Complete Script Listing

### **00-install-all.sh** (Master Script)
Runs all installation scripts in sequence automatically.
- Prompts for Git user name and email at the start
- Executes all scripts in the correct order (Linux and macOS have different script counts)
- Automatically loads NVM and environment configurations during installation
- Handles all setup phases: Initial Setup, Environment Configuration, Development Tools, and Application Setup
- **Note:** After completion, close and reopen your terminal to ensure all configurations are applied

---

## Individual Scripts

### **01-configure-git.sh**
Configures Git with identity and preferences.
- Prompts for Git user name and email (or uses values from environment variables)
- Configures name and email
- Sets default branch to `main`
- Enables colors in Git

**Note:** Git must already be installed (required to clone the repository). When running via `00-install-all.sh`, the name and email are collected at the start.

---

### **02-install-zsh.sh**
Installs and configures Zsh as the default shell.
- Installs Zsh, Curl and Git
- Sets Zsh as the default shell
- Creates minimal `.zshrc`
- Adds auxiliary configurations

**⚠️ After running:** Close and reopen the terminal.

---

### **03-install-zinit.sh**
Installs Zinit (fast Zsh plugin manager).
- Clones the Zinit repository
- Sets up plugin management system

---

### **04-install-starship.sh**
Installs and configures the Starship prompt.
- Installs Starship
- Copies and configures `starship.toml`
- Updates `.zshrc` with Zinit + Starship + tools

**Note:** The NVM configuration is automatically added to `.zshrc` and will be available after restart

---

### **05-install-node-nvm.sh**
Installs NVM (Node Version Manager) and Node.js.
- Installs NVM
- Installs Node.js version 22
- Sets Node 22 as default

---

### **06-install-yarn.sh**
Installs Yarn via Corepack.
- Enables Corepack
- Installs and activates Yarn 1

---

### **07-install-tools.sh**
Installs various development tools and utilities.

---

### **08-install-font-jetbrains.sh**
Installs JetBrains Mono Nerd Font.
- Downloads the font from the official repository
- Installs in user fonts directory
- Updates font cache

---

### **09-install-cursor.sh**
Installs Cursor Editor.
- **Linux**: Downloads Cursor .deb package and installs via dpkg
- **macOS**: Installs via Homebrew Cask
- Verifies installation

---

### **10-install-claude.sh**
Installs Claude Code CLI.
- Installs @anthropic-ai/claude-code via npm
- Requires Node.js/npm (script 05-install-node-nvm.sh)
- Verifies installation

---

### **10-configure-terminal.sh** (Linux only)
Configures GNOME Terminal with Dracula theme.
- Installs dconf-cli
- Creates custom profile in GNOME Terminal
- Applies Dracula theme
- Configures JetBrains Mono Nerd Font
- Removes old profiles

---

### **11-configure-ssh.sh** (Linux only)
Configures SSH for Git.
- Installs Git and OpenSSH
- Uses Git email from environment or prompts for it
- Generates ed25519 SSH key with the provided email
- Configures SSH agent
- Sets correct permissions
- Copies public key to clipboard

**👉 After running:** Add the SSH key to GitHub/GitLab.

**Note:** When running via `00-install-all.sh`, the email is collected at the start and used automatically.

---

### **10-configure-ssh.sh** (macOS only)
Configures SSH for Git.
- Uses Git email from environment or prompts for it
- Generates ed25519 SSH key with the provided email
- Configures SSH agent
- Sets correct permissions
- Copies public key to clipboard

**👉 After running:** Add the SSH key to GitHub/GitLab.

**Note:** When running via `00-install-all.sh`, the email is collected at the start and used automatically.

---

### **11-configure-file-watchers.sh** (macOS only)
Configures file watcher limits for macOS.
- Adjusts system limits for file watching
- Applies changes

### **12-configure-inotify.sh** (Linux only)
Configures inotify limits for file watching.
- Increases `max_user_watches` to 524288
- Makes the configuration persistent
- Applies changes

---

### **12-install-task-master.sh** (macOS only)
Installs Task Master MCP Server.
- Installs task-master-ai globally via npm
- Creates/updates MCP configuration in `~/.cursor/mcp.json`
- Requires Node.js/npm (script 05-install-node-nvm.sh)
- Provides instructions for enabling in Cursor

### **13-install-task-master.sh** (Linux only)
Installs Task Master MCP Server.
- Installs task-master-ai globally via npm
- Creates/updates MCP configuration in `~/.cursor/mcp.json`
- Requires Node.js/npm (script 05-install-node-nvm.sh)
- Provides instructions for enabling in Cursor

---

### **13-install-cursor-extensions.sh**
Installs essential Cursor extensions.
- Color Highlight
- DotENV
- ESLint
- GitLens
- Markdown Preview Enhanced
- Prisma
- px to rem
- Reload
- Tailwind CSS IntelliSense
- Indent Rainbow
- Symbols (icons)
- Catppuccin (theme)

---

### **14-configure-cursor.sh**
Applies Cursor configurations.
- Copies `settings.json` to Cursor
- Copies `keybindings.json` to Cursor
- Configures theme and preferences

**👉 After running:** Open Cursor again to apply everything.

---

### **15-install-docker.sh** (Linux only)
Installs Docker and Docker Compose.
- Removes old Docker installations
- Adds official Docker repository
- Installs Docker Engine, Docker Compose and plugins
- Adds user to docker group

**⚠️ After running:** Logout/login to use Docker without sudo.

---

### **14-install-docker.sh** (macOS only)
Installs Docker Desktop for macOS.
- Installs via Homebrew Cask
- Configures Docker Desktop

**⚠️ After running:** Make sure Docker Desktop is running.

---

### **16-install-insomnia.sh** (Linux only)
Installs Insomnia REST Client for Linux.
- Adds Insomnia repository
- Installs via apt
- Useful for API testing and development

**👉 After running:** Run `18-install-heidisql.sh` to install database tool.

---

### **17-install-heidisql.sh** (Linux only)
Installs HeidiSQL for Linux.
- Official HeidiSQL Linux version (64-bit .deb package)
- Supports MySQL, MariaDB, PostgreSQL, SQLite, and more
- Manual download required from https://www.heidisql.com/download.php
- Guides user through download and installation process

**📝 Note:** HeidiSQL has an official Linux version available as .deb package. The script will guide you to download and install it.

---

### **16-install-insomnia.sh** (macOS only)
Installs Insomnia REST Client for macOS.
- Installs via Homebrew Cask
- Useful for API testing and development

**👉 After running:** Run `17-install-tableplus.sh` to install database tool.

---

### **17-install-tableplus.sh** (macOS only)
Installs TablePlus for macOS (alternative to HeidiSQL).
- Modern, native macOS database client
- Supports MySQL, PostgreSQL, SQLite, Redis, and many more
- Installs via Homebrew Cask
- Beautiful interface with similar functionality to HeidiSQL

**📝 Note:** TablePlus is a native macOS app that provides excellent database management capabilities, similar to HeidiSQL.

---

## 📁 Repository Structure

```
enterprise-scripts/
├── .gitignore               # Protects sensitive files
├── LICENSE                  # MIT License
├── readme.md                # This file
│
├── .env                     # Your config (gitignored)
├── .env.example             # Environment config template
│
├── lib/                     # Shared library modules
│   ├── env_helper.sh
│   ├── logging.sh
│   ├── platform.sh
│   └── tool_detection.sh
│
├── linux/                   # 🐧 Linux setup
│   └── scripts/
│       ├── enviroment/      # Setup scripts (00-23)
│       │   ├── 00-install-all.sh
│       │   ├── 09-install-cursor.sh
│       │   ├── 10-install-claude.sh
│       │   ├── 13-install-task-master.sh
│       │   └── ...
│       └── utils/           # Utility scripts
│
└── macos/                   # 🍎 macOS setup
    └── scripts/
        ├── enviroment/      # Setup scripts (00-23)
        │   ├── 00-install-all.sh
        │   ├── 09-install-cursor.sh
        │   ├── 10-install-claude.sh
        │   ├── 12-install-task-master.sh
        │   └── ...
        └── utils/           # Disk space tools
```

---

## 🛠 Maintenance

To modify scripts, update tools or version environment adjustments, just edit the corresponding files and push the changes.

---

## 📝 Important Notes

### Prerequisites
- **Git** must be installed to clone the repository
- **macOS:** Homebrew will be installed automatically if it doesn't exist

### Required Restarts
1. **After script 02:** Close and reopen the terminal
2. **After script 16 (Linux):** Logout/login to use Docker without sudo
3. **After script 14 (macOS):** Make sure Docker Desktop is running

### Dependencies
- Scripts must be run in numerical order (01 → 02 → 03 → ...)
- Some scripts depend on others (e.g., Yarn needs Node installed)

### Configuration Files
- Configuration files (starship.toml, user-settings.json, cursor-keyboard.json, zsh-config) are automatically downloaded from the remote repository during installation
- The scripts fetch configurations from: `https://github.com/devrubinho/rubinho-scripts`
