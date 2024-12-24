#!/bin/bash

# 设置显示环境变量
export DISPLAY=:0

# Chrome路径
CHROME_PATH="/usr/bin/google-chrome"

# 检查Chrome是否已安装
if ! command -v google-chrome &> /dev/null; then
    echo "错误: Google Chrome未安装"
    exit 1
fi

# 检查ChromeDriver是否已安装
if ! command -v chromedriver &> /dev/null; then
    echo "错误: ChromeDriver未安装"
    exit 1
fi

# 启动ChromeDriver
chromedriver --port=9515 &

# 创建Chrome调试目录
CHROME_DEBUG_DIR="$HOME/ChromeDebug"
mkdir -p "$CHROME_DEBUG_DIR"

# 启动Chrome
"$CHROME_PATH" \
    --remote-debugging-port=9222 \
    --user-data-dir="$HOME/ChromeDebug" \
    https://polymarket.com/markets/crypto

# 等待Chrome完全启动
sleep 3

echo "Chrome已启动，remote debugging端口: 9222"
echo "ChromeDriver已启动，端口: 9515"