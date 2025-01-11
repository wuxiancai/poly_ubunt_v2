#!/bin/bash
# check_environment.sh

echo "检查系统环境..."

# 检查 Python 版本
python3 --version

# 检查 Chrome 和 ChromeDriver
echo "Chrome 版本:"
chromium-browser --version
echo "ChromeDriver 版本:"
chromedriver --version

# 检查显示服务器
echo "显示服务器:"
echo $XDG_SESSION_TYPE

# 检查必要的系统库
echo "检查系统库..."
for lib in libatk-1.0.so.0 libatk-bridge-2.0.so.0 libcups.so.2 libxkbcommon.so.0 libgbm.so.1; do
    if ldconfig -p | grep -q $lib; then
        echo "$lib: 已安装"
    else
        echo "$lib: 未找到"
    fi
done

# 检查 Python 包
echo "检查 Python 包..."
source venv/bin/activate
pip list | grep -E "selenium|pyautogui|pillow|python3-xlib"

# 检查目录权限
echo "检查目录权限..."
ls -l "$HOME/ChromeDebug"