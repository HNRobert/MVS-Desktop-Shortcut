# MVS-Desktop-Shortcut

A desktop shortcut solution for MVS on Ubuntu Linux systems. This package provides a desktop entry file and icon to create a menu shortcut for the MVS application.

## 文件说明 (File Description)

- `mvs.desktop` - 桌面快捷方式文件 (Desktop entry file)
- `MVS.png` - MVS应用程序图标 (MVS application icon)
- `install.sh` - 自动安装脚本 (Automatic installation script)

## 安装方法 (Installation)

### 方法1：使用自动安装脚本 (Method 1: Using automatic installation script)

1. 克隆或下载此仓库 (Clone or download this repository):
   ```bash
   git clone https://github.com/your-username/MVS-Desktop-Shortcut.git
   cd MVS-Desktop-Shortcut
   ```

2. 运行安装脚本 (Run the installation script):
   ```bash
   ./install.sh
   ```

   **注意 (Note)**: 脚本会自动检测权限，如果需要创建系统目录或复制文件到 `/opt/MVS/`，会提示输入sudo密码。

### 方法2：手动安装 (Method 2: Manual installation)

1. 复制图标文件 (Copy icon file):
   ```bash
   sudo mkdir -p /opt/MVS
   sudo cp MVS.png /opt/MVS/MVS.png
   sudo chmod 644 /opt/MVS/MVS.png
   ```

2. 复制桌面文件 (Copy desktop file):
   ```bash
   # 用户级安装 (User-level installation)
   mkdir -p ~/.local/share/applications
   cp mvs.desktop ~/.local/share/applications/
   chmod 644 ~/.local/share/applications/mvs.desktop
   
   # 或系统级安装 (Or system-wide installation)
   sudo cp mvs.desktop /usr/share/applications/
   sudo chmod 644 /usr/share/applications/mvs.desktop
   ```

3. 更新桌面数据库 (Update desktop database):
   ```bash
   # 用户级 (User-level)
   update-desktop-database ~/.local/share/applications
   
   # 或系统级 (Or system-wide)
   sudo update-desktop-database /usr/share/applications
   ```

## 使用说明 (Usage)

安装完成后，MVS应用程序将出现在您的应用程序菜单中。您可以：

After installation, the MVS application will appear in your applications menu. You can:

- 从应用程序菜单启动MVS (Launch MVS from the applications menu)
- 右键点击图标并添加到收藏夹或桌面 (Right-click the icon to add to favourites or desktop)

## 卸载 (Uninstallation)

要卸载桌面快捷方式 (To uninstall the desktop shortcut):

```bash
# 删除桌面文件 (Remove desktop file)
rm ~/.local/share/applications/mvs.desktop
# 或 (or)
sudo rm /usr/share/applications/mvs.desktop

# 删除图标文件 (Remove icon file)
sudo rm /opt/MVS/MVS.png

# 更新桌面数据库 (Update desktop database)
update-desktop-database ~/.local/share/applications
# 或 (or)
sudo update-desktop-database /usr/share/applications
```

## 系统要求 (System Requirements)

- Ubuntu Linux 或其他基于Debian的发行版 (Ubuntu Linux or other Debian-based distributions)
- MVS应用程序已安装在 `/opt/MVS/bin/MVS` (MVS application installed at `/opt/MVS/bin/MVS`)
- 桌面环境支持freedesktop.org标准 (Desktop environment supporting freedesktop.org standards)

## 故障排除 (Troubleshooting)

### 图标不显示 (Icon not showing)
- 确保 `/opt/MVS/MVS.png` 文件存在且有正确权限 (Ensure `/opt/MVS/MVS.png` exists with correct permissions)
- 尝试重新登录或重启桌面环境 (Try logging out/in or restarting desktop environment)

### 快捷方式不出现在菜单中 (Shortcut not appearing in menu)
- 运行 `update-desktop-database` 命令 (Run `update-desktop-database` command)
- 检查桌面文件权限 (Check desktop file permissions)
- 重新登录系统 (Log out and back in)

### 程序无法启动 (Program won't start)
- 确保MVS程序已正确安装在 `/opt/MVS/bin/MVS` (Ensure MVS is properly installed at `/opt/MVS/bin/MVS`)
- 检查程序文件的执行权限 (Check executable permissions on the program file)
