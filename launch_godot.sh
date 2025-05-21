#!/bin/bash

# 配置GPU和渲染设置
export LIBGL_ALWAYS_SOFTWARE=1
export MESA_GL_VERSION_OVERRIDE=3.3
export MESA_GLSL_VERSION_OVERRIDE=330

# 启动Godot（带GUI界面）
godot --rendering-driver opengl3 --verbose "$@"

# 如果需要可视化界面时，去掉--headless参数
# godot --rendering-driver opengl3 --verbose "$@" 