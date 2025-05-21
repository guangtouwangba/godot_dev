# Godot 开发容器

本仓库包含为 Godot 游戏开发优化的开发容器配置，专为搭载 Apple Silicon (ARM64) 架构的 macOS 系统设计。

## 前提条件

- Docker Desktop for Mac
- 安装了"Remote - Containers"扩展的 Visual Studio Code 或 Cursor
- macOS 的 X11 服务器（如 XQuartz）用于 GUI 应用程序

## 设置步骤

1. 安装 Docker Desktop for Mac
2. 安装 Visual Studio Code 或 Cursor
3. 安装"Remote - Containers"扩展
4. 安装 XQuartz：`brew install --cask xquartz`
5. 配置 XQuartz 允许来自网络客户端的连接：
   - 打开 XQuartz
   - 前往 XQuartz > 偏好设置 > 安全
   - 勾选"允许来自网络客户端的连接"
   - 重启 XQuartz
6. 使用 `ifconfig` 或在系统偏好设置 > 网络中找到您的本地 IP 地址
7. 在 `.devcontainer/devcontainer.json` 中用您的 IP 地址更新 DISPLAY 变量：
   ```
   "-e", "DISPLAY=您的IP地址:0"
   ```

## 使用方法

1. 克隆此仓库
2. 在 VS Code 或 Cursor 中打开仓库文件夹
3. 点击编辑器左下角的绿色按钮，选择"在容器中重新打开"
4. 首次执行此操作时，Docker 将构建容器，这可能需要几分钟时间
5. 容器构建并运行后，您可以在容器内使用 Godot 编辑器
6. 在终端中运行 Godot 的命令：`godot`

## 容器特性

- 基于 Ubuntu 22.04 的 ARM64 支持的基础镜像
- 预安装的 Godot 4.2.1 引擎，兼容 ARM64
- 配置 X11 转发以支持 GUI 应用程序
- 用于 3D 渲染的 OpenGL 库和 Mesa 工具
- 具有 sudo 权限的非 root 用户设置 (vscode)
- 用于 Godot 开发的 VS Code/Cursor 扩展

## 技术细节

该开发容器包括：
- 核心 X11 开发库
- 用于 3D 渲染的 OpenGL/Mesa 库
- 音频库 (ALSA, PulseAudio)
- 用于版本控制的 Git
- 具有 sudo 权限的非 root 用户

## 故障排除

### X11 显示问题

如果您在使用 X11 显示时遇到问题：

1. 检查 XQuartz 是否正在运行
2. 验证 `.devcontainer/devcontainer.json` 中 `DISPLAY` 环境变量的 IP 地址是否正确
3. 使用简单应用程序如 `xeyes`（容器中已包含）测试 X11 转发
4. 尝试重启 XQuartz 和 Docker

### 容器构建失败

如果容器构建失败：

1. 检查 Docker 日志以获取具体错误
2. 确保 Docker 分配了足够的资源
3. 对于 ARM64 特定问题，验证 Dockerfile 中的所有包是否可用于 ARM64 架构

### GPU 加速

此容器配置不使用 GPU 加速，因为 Docker 在 macOS 上（尤其是 Apple Silicon）的 GPU 直通能力有限。容器使用软件渲染进行 OpenGL 应用程序的显示。

## 许可证

[您的许可证信息]

## 贡献

[贡献指南] 