
#!/bin/bash
# 检查是否已经运行
if pgrep -f "chromium-browser.*remote-debugging-port=9222" > /dev/null; then
    echo "Chrome 调试实例已经在运行"
    exit 1
fi

# 启动 Chrome
chromium-browser \
    --remote-debugging-port=9222 \
    --user-data-dir="$HOME/ChromeDebug" \
    --disable-dev-shm-usage \
    --disable-gpu \
    --disable-software-rasterizer \
    --enable-logging \
    --v=1 \
    https://polymarket.com/markets/crypto