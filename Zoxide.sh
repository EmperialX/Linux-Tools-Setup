#!/bin/bash

# Download and install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
# Move zoxide to /usr/local/bin
sudo mv /root/.local/bin/zoxide /usr/local/bin/
# Make zoxide executable
sudo chmod +x /usr/local/bin/zoxide
# Create profile script for zoxide
echo 'export PATH="/usr/local/bin:$PATH"' | sudo tee /etc/profile.d/zoxide.sh > /dev/null
# Update bash configuration to include zoxide alias and initialization
{
    echo 'alias cd=z'
    echo 'eval "$(zoxide init --cmd cd bash)"'
} | sudo tee -a /etc/bash.bashrc > /dev/null
# Source the updated bash configuration
source /etc/bash.bashrc
echo "zoxide installation and setup complete."
