#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║         🚀 Enterprise Scripts - Interactive Launcher 🚀         ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# ────────────────────────────────
# Environment Variables Setup
# ────────────────────────────────

setup_environment_variables() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "⚙️  Environment Configuration"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "Checking required environment variables..."
    echo ""

    # Check if .env exists, if not create from .env.example
    local env_file="$SCRIPT_DIR/.env"
    local env_example="$SCRIPT_DIR/.env.example"

    if [ ! -f "$env_file" ]; then
        if [ -f "$env_example" ]; then
            echo "📝 Creating .env file from .env.example..."
            cp "$env_example" "$env_file"
            echo "✓ Created .env file"
            echo ""
        else
            echo "📝 Creating new .env file..."
            touch "$env_file"
            echo "✓ Created empty .env file"
            echo ""
        fi
    fi

    # Variables that might be needed for installation
    local required_vars=(
        "GIT_USER_NAME:Your Git user name (for Git commits):true"
        "GIT_USER_EMAIL:Your Git user email (for Git commits):true"
    )

    local optional_vars=(
        "GITHUB_TOKEN:GitHub token (for private repositories):false"
        "AWS_SSO_START_URL:AWS SSO start URL (for AWS SSO configuration):false"
    )

    # Check required variables
    for var_info in "${required_vars[@]}"; do
        IFS=':' read -r var_name prompt_text is_required <<< "$var_info"

        # Check if variable exists in .env
        local value
        if [ -f "$env_file" ]; then
            # Try to read from .env
            while IFS= read -r line || [ -n "$line" ]; do
                # Skip comments and empty lines
                [[ "$line" =~ ^[[:space:]]*# ]] && continue
                [[ -z "${line// }" ]] && continue

                # Check if this line matches our variable
                if [[ "$line" =~ ^[[:space:]]*${var_name}[[:space:]]*=[[:space:]]*(.+)$ ]]; then
                    value="${BASH_REMATCH[1]}"
                    # Remove quotes if present
                    value="${value#\"}"
                    value="${value%\"}"
                    value="${value#\'}"
                    value="${value%\'}"
                    # Remove leading/trailing whitespace
                    value="${value#"${value%%[![:space:]]*}"}"
                    value="${value%"${value##*[![:space:]]}"}"
                    break
                fi
            done < "$env_file"
        fi

        # If not found or empty (after removing quotes and spaces), prompt user
        if [ -z "${value// }" ] || [ -z "$value" ]; then
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo "📝 Missing Required Variable: $var_name"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
            echo "$prompt_text"
            echo ""

            while true; do
                read -p "Enter value for $var_name: " user_input

                if [ -z "$user_input" ]; then
                    if [ "$is_required" = "true" ]; then
                        echo "❌ Error: $var_name is required and cannot be empty."
                        echo "   Please enter a value."
                        echo ""
                        continue
                    else
                        echo "⚠️  No value provided. Skipping..."
                        echo ""
                        break
                    fi
                else
                    # Save to .env
                    if grep -q "^[[:space:]]*${var_name}[[:space:]]*=" "$env_file" 2>/dev/null; then
                        # Update existing line
                        if [[ "$OSTYPE" == "darwin"* ]]; then
                            sed -i '' "s|^[[:space:]]*${var_name}[[:space:]]*=.*|${var_name}=\"${user_input}\"|" "$env_file"
                        else
                            sed -i "s|^[[:space:]]*${var_name}[[:space:]]*=.*|${var_name}=\"${user_input}\"|" "$env_file"
                        fi
                    else
                        # Append new line
                        echo "${var_name}=\"${user_input}\"" >> "$env_file"
                    fi

                    echo "✓ Saved $var_name to .env file"
                    echo ""
                    break
                fi
            done
        else
            echo "✓ Found $var_name in .env file (using existing value)"
        fi
    done

    # Check optional variables (only prompt if user wants to configure them)
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📋 Optional Configuration"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "You can configure optional variables now, or skip and configure later."
    echo ""

    read -p "Configure optional variables now? [y/N]: " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        for var_info in "${optional_vars[@]}"; do
            IFS=':' read -r var_name prompt_text is_required <<< "$var_info"

            # Check if variable exists in .env
            local value=""
            if [ -f "$env_file" ]; then
                # Try to read from .env
                while IFS= read -r line || [ -n "$line" ]; do
                    # Skip comments and empty lines
                    [[ "$line" =~ ^[[:space:]]*# ]] && continue
                    [[ -z "${line// }" ]] && continue

                    # Check if this line matches our variable
                    if [[ "$line" =~ ^[[:space:]]*${var_name}[[:space:]]*=[[:space:]]*(.+)$ ]]; then
                        value="${BASH_REMATCH[1]}"
                        # Remove quotes if present
                        value="${value#\"}"
                        value="${value%\"}"
                        value="${value#\'}"
                        value="${value%\'}"
                        # Remove leading/trailing whitespace
                        value="${value#"${value%%[![:space:]]*}"}"
                        value="${value%"${value##*[![:space:]]}"}"
                        break
                    fi
                done < "$env_file"
            fi

            # If not found or empty, prompt user
            if [ -z "${value// }" ] || [ -z "$value" ]; then
                echo ""
                echo "$prompt_text"
                read -p "Enter value for $var_name (or press Enter to skip): " user_input

                if [ -n "$user_input" ]; then
                    # Remove empty value if exists
                    if grep -q "^[[:space:]]*${var_name}[[:space:]]*=" "$env_file" 2>/dev/null; then
                        if [[ "$OSTYPE" == "darwin"* ]]; then
                            sed -i '' "/^[[:space:]]*${var_name}[[:space:]]*=/d" "$env_file"
                        else
                            sed -i "/^[[:space:]]*${var_name}[[:space:]]*=/d" "$env_file"
                        fi
                    fi
                    echo "${var_name}=\"${user_input}\"" >> "$env_file"
                    echo "✓ Saved $var_name to .env file"
                else
                    echo "⏭️  Skipped $var_name"
                fi
            else
                echo "✓ Found $var_name in .env file (using existing value)"
            fi
        done
    else
        echo "⏭️  Skipping optional variables configuration"
    fi

    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "✅ Environment configuration complete"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

# Setup environment variables before installation
setup_environment_variables

# ────────────────────────────────
# Choose Platform
# ────────────────────────────────

echo "Select platform:"
echo "  1) 🐧 Linux"
echo "  2) 🍎 macOS"
echo ""
read -p "Choice [1-2]: " PLATFORM_CHOICE

case $PLATFORM_CHOICE in
    1)
        PLATFORM="linux"
        PLATFORM_NAME="Linux"
        ;;
    2)
        PLATFORM="macos"
        PLATFORM_NAME="macOS"
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "Platform: $PLATFORM_NAME"
echo ""

# ────────────────────────────────
# Run Installation Script
# ────────────────────────────────

INSTALL_SCRIPT="$SCRIPT_DIR/$PLATFORM/scripts/enviroment/00-install-all.sh"

if [ ! -f "$INSTALL_SCRIPT" ]; then
    echo "❌ Error: Installation script not found at $INSTALL_SCRIPT"
    exit 1
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🚀 Starting Installation for $PLATFORM_NAME"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Run the installation script
cd "$(dirname "$INSTALL_SCRIPT")"
bash "$INSTALL_SCRIPT"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Installation completed!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
