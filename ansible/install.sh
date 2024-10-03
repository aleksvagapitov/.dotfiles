#!/bin/bash

# Check if the script is running with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "You need to run this script as root"
    exit 1
fi

# Detect the operating system
OS=$(uname)

# For Linux (Debian/Ubuntu)
if [[ "$OS" == "Linux" ]]; then
    if ! command -v apt &> /dev/null; then
        echo "This script only supports Debian-based Linux distributions."
        exit 1
    fi

    apt update
    apt install -y software-properties-common
    apt-add-repository --yes --update ppa:ansible/ansible
    apt install -y ansible

    if (( "${?}" != 0 )); then
        echo "Installation failed on Linux."
        exit 1
    fi

# For macOS
elif [[ "$OS" == "Darwin" ]]; then
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        if (( "${?}" != 0 )); then
            echo "Homebrew installation failed."
            exit 1
        fi
    fi

    brew update
    brew install ansible

    if (( "${?}" != 0 )); then
        echo "Installation failed on macOS."
        exit 1
    fi

else
    echo "Unsupported operating system: $OS"
    exit 1
fi

echo "Ansible successfully installed."
exit 0
