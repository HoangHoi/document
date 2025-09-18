#!/bin/bash

set -e

echo "🔹 Cập nhật hệ thống..."
sudo apt update -y
sudo apt install -y zsh git curl tmux

echo "🔹 Đặt Zsh làm shell mặc định..."
chsh -s $(which zsh)

echo "🔹 Cài Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "🔹 Cài plugin zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || true

echo "🔹 Cấu hình ~/.zshrc..."
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting)/' ~/.zshrc

# Thêm auto tmux nếu chưa có
if ! grep -q "Auto start tmux" ~/.zshrc; then
cat << 'EOF' >> ~/.zshrc

# Auto start tmux
if command -v tmux &>/dev/null; then
  if [ -z "$TMUX" ] && [ -t 1 ]; then
    unattached=$(tmux ls 2>/dev/null | grep -v '(attached)' | head -n1 | cut -d: -f1)

    if [ -n "$unattached" ]; then
      tmux attach -t "$unattached"
    else
      tmux
    fi
  fi
fi
EOF
fi

echo "✅ Hoàn tất! Hãy logout/login hoặc mở terminal mới để trải nghiệm."
