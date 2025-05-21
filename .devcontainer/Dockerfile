# 选择一个支持 ARM64 的基础镜像，例如 Ubuntu ARM64
# Docker Hub 上的官方 ubuntu 镜像通常会自动选择适合宿主机的架构
FROM ubuntu:22.04

# 设置非交互式安装
ENV DEBIAN_FRONTEND=noninteractive

# 安装 Godot 依赖 (这些通用依赖通常在 ARM64 上也适用)
# 确保你的基础镜像源支持 arm64 架构的这些包
RUN apt-get update && apt-get install -y --no-install-recommends \
    libx11-dev libxcursor-dev libxinerama-dev libxrandr-dev libxi-dev \
    libgl1-mesa-dev libglu1-mesa-dev libasound2-dev libpulse-dev libudev-dev \
    libssl-dev wget ca-certificates unzip git \
    # X11 Forwarding utilities
    xauth x11-apps \
    # 添加缺少的X11和OpenGL相关库
    libxkbcommon-x11-0 libxkbcommon0 libxkbcommon-dev \
    mesa-utils libgl1-mesa-dri libglvnd0 libglx0 libegl1 \
    # 其他你可能需要的工具
    && rm -rf /var/lib/apt/lists/*

# 下载并安装 Godot 编辑器 (ARM64 版本)
# 务必检查 Godot 官网获取最新的 ARM64 版本链接和文件名格式
ARG GODOT_VERSION="4.2.1" # 请替换为你需要的 Godot 版本
ARG GODOT_FILENAME_ARCH="linux.arm64" # Godot 4.x ARM64 编辑器通常的文件名部分
# 示例文件名: Godot_v4.2.1-stable_linux.arm64.zip
# 请到 Godot 官网的下载页面确认准确的文件名
RUN wget https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}-stable/Godot_v${GODOT_VERSION}-stable_${GODOT_FILENAME_ARCH}.zip -O /tmp/godot.zip && \
    unzip /tmp/godot.zip -d /opt/ && \
    # 解压后的文件是可执行文件本身，不是目录，所以需要创建目录
    mkdir -p /opt/godot && \
    mv /opt/Godot_v${GODOT_VERSION}-stable_${GODOT_FILENAME_ARCH} /opt/godot/godot && \
    ln -s /opt/godot/godot /usr/local/bin/godot && \
    chmod +x /opt/godot/godot && \
    rm /tmp/godot.zip

# 创建一个非 root 用户 (推荐)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME --shell /bin/bash && \
    apt-get update && apt-get install -y sudo && \
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

# 设置工作目录
WORKDIR /workspace

# 切换到非 root 用户
USER $USERNAME

# 恢复交互式安装
ENV DEBIAN_FRONTEND=dialog
