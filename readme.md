# 🌐 Enterprise Scripts 🇺🇸 | Scripts Empresariais 🇧🇷

> Complete development environment configurations for **Linux** and **macOS**
> Configurações completas de ambiente de desenvolvimento para **Linux** e **macOS**

This repository contains **complete development environment configurations**, including:
Este repositório contém **configurações completas de ambiente de desenvolvimento**, incluindo:

- 📝 Configuration files (dotfiles) | Arquivos de configuração (dotfiles)
- 🎨 Themes and fonts | Temas e fontes
- ⚙️ Automated installation scripts | Scripts automatizados de instalação
- 🔧 Cursor/VS Code configurations | Configurações do Cursor/VS Code
- 🛠️ Auxiliary tools | Ferramentas auxiliares
- 🔐 Environment variables for sensitive data | Variáveis de ambiente para dados sensíveis

---

## 🚀 Quick Start 🇺🇸 | Início Rápido 🇧🇷

### 1. Clone the repository 🇺🇸 | Clone o repositório 🇧🇷

```bash
git clone <repository-url>
cd enterprise-scripts
```

### 2. Run the installation script 🇺🇸 | Execute o script de instalação 🇧🇷

```bash
bash run.sh
```

The script will:
- Configure environment variables (`.env`)
- Ask you to select your platform (Linux or macOS)
- Run the complete installation automatically

O script irá:
- Configurar variáveis de ambiente (`.env`)
- Solicitar que você selecione sua plataforma (Linux ou macOS)
- Executar a instalação completa automaticamente

### 3. Alternative: Manual Installation 🇺🇸 | Alternativa: Instalação Manual 🇧🇷

#### 🐧 Linux

```bash
cd linux/scripts/enviroment
bash 00-install-all.sh
```

#### 🍎 macOS

```bash
cd macos/scripts/enviroment
bash 00-install-all.sh
```

**Note 🇺🇸 | Nota 🇧🇷:** After completion, close and reopen your terminal to ensure all configurations are applied.
Após a conclusão, feche e reabra o terminal para garantir que todas as configurações sejam aplicadas.

---

## 🔐 Environment Variables 🇺🇸 | Variáveis de Ambiente 🇧🇷

Optional `.env` for environment-specific configuration:
Arquivo `.env` opcional para configuração específica do ambiente:

```bash
cp .env.example .env
nano .env  # Fill in your configuration details | Preencha os detalhes da configuração
```

**Environment variables 🇺🇸 | Variáveis de ambiente 🇧🇷:**
- `GIT_USER_NAME` - Your Git user name | Seu nome de usuário do Git
- `GIT_USER_EMAIL` - Your Git user email | Seu email do Git
- `GITHUB_TOKEN` - For private repositories | Para repositórios privados
- `AWS_SSO_START_URL` - AWS SSO configuration | Configuração do AWS SSO
- Multiple AWS accounts support | Suporte a múltiplas contas AWS

See 🇺🇸 `.env.example` for complete list.
Veja 🇧🇷 `.env.example` para a lista completa.

**Benefits 🇺🇸 | Benefícios 🇧🇷:**
✅ No hardcoded sensitive information | Sem informações sensíveis no código
✅ Easy to share with team | Fácil de compartilhar com a equipe
✅ Secure (gitignored) | Seguro (ignorado pelo git)
✅ Works for any organization | Funciona para qualquer organização

---

## 📋 Scripts Overview 🇺🇸 | Visão Geral dos Scripts 🇧🇷

### **00-install-all.sh** (Master Script 🇺🇸 | Script Principal 🇧🇷)

Runs all installation scripts in sequence automatically. 🇺🇸
Executa todos os scripts de instalação em sequência automaticamente. 🇧🇷

- Prompts for Git user name and email at the start | Solicita nome e email do Git no início
- Executes all scripts in the correct order | Executa todos os scripts na ordem correta
- Automatically loads NVM and environment configurations | Carrega automaticamente NVM e configurações de ambiente
- Handles all setup phases | Gerencia todas as fases de configuração

**Note 🇺🇸 | Nota 🇧🇷:** After completion, close and reopen your terminal.
Após a conclusão, feche e reabra o terminal.

---

## 📁 Repository Structure 🇺🇸 | Estrutura do Repositório 🇧🇷

```
enterprise-scripts/
├── .gitignore               # Protects sensitive files | Protege arquivos sensíveis
├── LICENSE                  # MIT License
├── readme.md                # This file | Este arquivo
│
├── .env                     # Your config (gitignored) | Sua configuração (ignorado pelo git)
├── .env.example             # Environment config template | Modelo de configuração
│
├── lib/                     # Shared library modules | Módulos de biblioteca compartilhados
│   ├── env_helper.sh
│   ├── logging.sh
│   ├── platform.sh
│   └── tool_detection.sh
│
├── linux/                   # 🐧 Linux setup
│   └── scripts/
│       └── enviroment/      # Setup scripts (00-23)
│           ├── 00-install-all.sh
│           ├── 01-configure-git.sh
│           ├── 02-install-zsh.sh
│           ├── 09-install-cursor.sh
│           ├── 10-install-claude.sh
│           ├── 13-install-task-master.sh
│           ├── 15-install-docker.sh
│           ├── 16-install-aws-vpn-client.sh
│           ├── 17-install-aws-cli.sh
│           ├── 18-configure-aws-sso.sh
│           ├── 19-install-dotnet.sh
│           ├── 20-install-java.sh
│           ├── 21-configure-github-token.sh
│           └── ...
│
└── macos/                   # 🍎 macOS setup
    └── scripts/
        └── enviroment/      # Setup scripts (00-23)
            ├── 00-install-all.sh
            ├── 01-configure-git.sh
            ├── 02-install-zsh.sh
            ├── 09-install-cursor.sh
            ├── 10-install-claude.sh
            ├── 12-install-task-master.sh
            ├── 15-install-docker.sh
            ├── 16-install-aws-vpn-client.sh
            ├── 17-install-aws-cli.sh
            ├── 18-configure-aws-sso.sh
            ├── 19-install-dotnet.sh
            ├── 20-install-java.sh
            ├── 21-configure-github-token.sh
            └── ...
```

---

## 📝 Individual Scripts 🇺🇸 | Scripts Individuais 🇧🇷

### **01-configure-git.sh**
Configures Git with identity and preferences. 🇺🇸
Configura o Git com identidade e preferências. 🇧🇷

- Prompts for Git user name and email | Solicita nome e email do Git
- Sets default branch to `main` | Define branch padrão como `main`
- Enables colors in Git | Habilita cores no Git

---

### **02-install-zsh.sh**
Installs and configures Zsh as the default shell. 🇺🇸
Instala e configura o Zsh como shell padrão. 🇧🇷

**⚠️ After running | Após executar:** Close and reopen the terminal.
Feche e reabra o terminal.

---

### **03-install-zinit.sh**
Installs Zinit (fast Zsh plugin manager). 🇺🇸
Instala o Zinit (gerenciador rápido de plugins Zsh). 🇧🇷

---

### **04-install-starship.sh**
Installs and configures the Starship prompt. 🇺🇸
Instala e configura o prompt Starship. 🇧🇷

- Downloads configuration from remote repository | Baixa configuração do repositório remoto
- Updates `.zshrc` with Zinit + Starship | Atualiza `.zshrc` com Zinit + Starship

---

### **05-install-node-nvm.sh**
Installs NVM (Node Version Manager) and Node.js. 🇺🇸
Instala NVM (Node Version Manager) e Node.js. 🇧🇷

- Installs Node.js version 22 | Instala Node.js versão 22

---

### **06-install-yarn.sh**
Installs Yarn via Corepack. 🇺🇸
Instala Yarn via Corepack. 🇧🇷

---

### **07-install-tools.sh**
Installs various development tools and utilities. 🇺🇸
Instala várias ferramentas e utilitários de desenvolvimento. 🇧🇷

---

### **08-install-font-jetbrains.sh**
Installs JetBrains Mono Nerd Font. 🇺🇸
Instala a fonte JetBrains Mono Nerd Font. 🇧🇷

---

### **09-install-cursor.sh**
Installs Cursor Editor. 🇺🇸
Instala o Cursor Editor. 🇧🇷

- **Linux**: Downloads .deb package and installs via dpkg
- **macOS**: Installs via Homebrew Cask

---

### **10-install-claude.sh**
Installs Claude Code CLI. 🇺🇸
Instala o Claude Code CLI. 🇧🇷

- Installs @anthropic-ai/claude-code via npm
- Requires Node.js/npm | Requer Node.js/npm

---

### **10-configure-terminal.sh** (Linux only 🇺🇸 | Apenas Linux 🇧🇷)
Configures GNOME Terminal with Dracula theme. 🇺🇸
Configura o GNOME Terminal com tema Dracula. 🇧🇷

---

### **10-configure-terminal.sh** (macOS only 🇺🇸 | Apenas macOS 🇧🇷)
Configures iTerm2 with Dracula theme. 🇺🇸
Configura o iTerm2 com tema Dracula. 🇧🇷

---

### **11-configure-ssh.sh**
Configures SSH for Git. 🇺🇸
Configura SSH para Git. 🇧🇷

- Generates ed25519 SSH key | Gera chave SSH ed25519
- Copies public key to clipboard | Copia chave pública para área de transferência

**👉 After running | Após executar:** Add the SSH key to GitHub/GitLab.
Adicione a chave SSH ao GitHub/GitLab.

---

### **12-configure-inotify.sh** (Linux only 🇺🇸 | Apenas Linux 🇧🇷)
Configures inotify limits for file watching. 🇺🇸
Configura limites do inotify para monitoramento de arquivos. 🇧🇷

---

### **12-install-task-master.sh** (macOS only 🇺🇸 | Apenas macOS 🇧🇷)
Installs Task Master MCP Server. 🇺🇸
Instala o servidor MCP Task Master. 🇧🇷

- Creates/updates MCP configuration | Cria/atualiza configuração MCP
- Requires Node.js/npm | Requer Node.js/npm

---

### **13-install-task-master.sh** (Linux only 🇺🇸 | Apenas Linux 🇧🇷)
Installs Task Master MCP Server. 🇺🇸
Instala o servidor MCP Task Master. 🇧🇷

---

### **13-install-cursor-extensions.sh**
Installs essential Cursor extensions. 🇺🇸
Instala extensões essenciais do Cursor. 🇧🇷

- GitLens, ESLint, Tailwind CSS IntelliSense, Catppuccin, and more | E mais

---

### **14-configure-cursor.sh**
Applies Cursor configurations. 🇺🇸
Aplica configurações do Cursor. 🇧🇷

- Downloads settings from remote repository | Baixa configurações do repositório remoto
- Configures theme and preferences | Configura tema e preferências

---

### **15-install-docker.sh** (Linux only 🇺🇸 | Apenas Linux 🇧🇷)
Installs Docker and Docker Compose. 🇺🇸
Instala Docker e Docker Compose. 🇧🇷

**⚠️ After running | Após executar:** Logout/login to use Docker without sudo.
Faça logout/login para usar Docker sem sudo.

---

### **15-install-docker.sh** (macOS only 🇺🇸 | Apenas macOS 🇧🇷)
Installs Docker Desktop for macOS. 🇺🇸
Instala Docker Desktop para macOS. 🇧🇷

**⚠️ After running | Após executar:** Make sure Docker Desktop is running.
Certifique-se de que o Docker Desktop está em execução.

---

### **16-install-aws-vpn-client.sh**
Installs AWS VPN Client. 🇺🇸
Instala o cliente AWS VPN. 🇧🇷

---

### **17-install-aws-cli.sh**
Installs AWS CLI. 🇺🇸
Instala o AWS CLI. 🇧🇷

---

### **18-configure-aws-sso.sh**
Configures AWS SSO. 🇺🇸
Configura AWS SSO. 🇧🇷

- Uses `AWS_SSO_START_URL` from `.env` | Usa `AWS_SSO_START_URL` do `.env`

---

### **19-install-dotnet.sh**
Installs .NET SDK. 🇺🇸
Instala o SDK .NET. 🇧🇷

---

### **20-install-java.sh**
Installs Java Development Kit. 🇺🇸
Instala o Java Development Kit. 🇧🇷

---

### **21-configure-github-token.sh**
Configures GitHub token for private repositories. 🇺🇸
Configura token do GitHub para repositórios privados. 🇧🇷

- Uses `GITHUB_TOKEN` from `.env` | Usa `GITHUB_TOKEN` do `.env`

---

### **22-install-insomnia.sh**
Installs Insomnia REST Client. 🇺🇸
Instala o cliente REST Insomnia. 🇧🇷

---

### **23-install-heidisql.sh** (Linux only 🇺🇸 | Apenas Linux 🇧🇷)
Installs HeidiSQL for Linux. 🇺🇸
Instala HeidiSQL para Linux. 🇧🇷

---

### **23-install-heidisql.sh** (macOS only 🇺🇸 | Apenas macOS 🇧🇷)
Installs HeidiSQL for macOS. 🇺🇸
Instala HeidiSQL para macOS. 🇧🇷

---

## 🛠 Maintenance 🇺🇸 | Manutenção 🇧🇷

To modify scripts, update tools or version environment adjustments, just edit the corresponding files and push the changes. 🇺🇸
Para modificar scripts, atualizar ferramentas ou ajustes de versão do ambiente, basta editar os arquivos correspondentes e enviar as alterações. 🇧🇷

---

## 📝 Important Notes 🇺🇸 | Notas Importantes 🇧🇷

### Prerequisites 🇺🇸 | Pré-requisitos 🇧🇷
- **Git** must be installed to clone the repository | **Git** deve estar instalado para clonar o repositório
- **macOS:** Homebrew will be installed automatically if it doesn't exist | **macOS:** Homebrew será instalado automaticamente se não existir

### Required Restarts 🇺🇸 | Reinicializações Necessárias 🇧🇷
1. **After script 02:** Close and reopen the terminal | **Após script 02:** Feche e reabra o terminal
2. **After script 15 (Linux):** Logout/login to use Docker without sudo | **Após script 15 (Linux):** Faça logout/login para usar Docker sem sudo
3. **After script 15 (macOS):** Make sure Docker Desktop is running | **Após script 15 (macOS):** Certifique-se de que o Docker Desktop está em execução

### Dependencies 🇺🇸 | Dependências 🇧🇷
- Scripts must be run in numerical order (01 → 02 → 03 → ...) | Scripts devem ser executados em ordem numérica
- Some scripts depend on others (e.g., Yarn needs Node installed) | Alguns scripts dependem de outros (ex: Yarn precisa do Node instalado)

### Configuration Files 🇺🇸 | Arquivos de Configuração 🇧🇷
- Configuration files (starship.toml, user-settings.json, cursor-keyboard.json, zsh-config) are automatically downloaded from the remote repository during installation | Arquivos de configuração são baixados automaticamente do repositório remoto durante a instalação
- The scripts fetch configurations from: `https://github.com/devrubinho/rubinho-scripts` | Os scripts buscam configurações de: `https://github.com/devrubinho/rubinho-scripts`

---

## 📄 License 🇺🇸 | Licença 🇧🇷

This project is licensed under the MIT License - see the LICENSE file for details. 🇺🇸
Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para detalhes. 🇧🇷
