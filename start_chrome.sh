#!/bin/bash

# 设置Chrome用户数据目录
CHROME_USER_DIR="$HOME/ChromeDebug"

# 确保目录存在
mkdir -p "$CHROME_USER_DIR"

# 定义Chrome启动参数
CHROME_ARGS=(
    --remote-debugging-port=9222
    --user-data-dir="$CHROME_USER_DIR"
    --disable-gpu
    --disable-features=IsolateOrigins,site-per-process
)

# 检查Chrome进程
if pgrep -x "chromium" > /dev/null || pgrep -x "chromium-browser" > /dev/null; then
    echo "检测到Chrome正在运行，正在关闭..."
    pkill -x chromium
    pkill -x chromium-browser
    sleep 2
fi

# 启动Chrome
echo "正在启动Chrome浏览器..."
chromium-browser "${CHROME_ARGS[@]}" &

# 等待Chrome启动
sleep 2

# 检查是否成功启动
if ! pgrep -x "chromium" > /dev/null && ! pgrep -x "chromium-browser" > /dev/null; then
    echo "Chrome启动失败！"
    exit 1
fi

echo "Chrome已成功启动！"
echo "远程调试端口: 9222"
echo "用户数据目录: $CHROME_USER_DIR" 