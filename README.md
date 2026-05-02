# 一键安装 Zsh 和开发工具

这套工具能极大提升命令行的使用体验和开发效率，安装并配置 **Zsh**、**Oh My Zsh**、**Starship** 等工具。

## 快速开始

1. 执行以下一键安装脚本，自动安装和配置所有工具：

   ```bash
   curl https://raw.githubusercontent.com/WwhdsOne/terminal-tools/main/install_zsh.sh | bash && source ~/.zshrc && exec zsh
   ```

2. 配置 Zsh 为默认 shell 并安装 Oh My Zsh、插件、Starship 等工具。

3. 配置 **yazi.toml** 文件来优化文件管理。

4. 使配置生效，启动终端，享受定制化的命令行体验。

5. 目前仅支持`Macos/Ubuntu/Debian`

## 1. 安装 Zsh

**Zsh** 是一个强大的 shell，比 Bash 提供更多功能，如自动补全、插件支持、和高度自定义能力。

### 功能：
- 自动补全和语法高亮。
- 高度自定义，适合开发者使用。
- 增强命令行的交互体验。

## 2. 安装 Oh My Zsh

**Oh My Zsh** 是一个开源的 Zsh 配置管理工具，提供了丰富的插件和主题，简化配置管理。

### 功能：
- 提供了多种插件和主题，能大大提升 Zsh 使用体验。
- 自动化配置管理，易于扩展。

## 3. 安装 Oh My Zsh 插件

增强 Zsh 使用体验的插件：
- **`zsh-autosuggestions`**: 命令自动补全建议。
- **`zsh-syntax-highlighting`**: 命令语法高亮。

### 功能：
- 提供命令历史和自动补全建议。
- 命令语法高亮，减少错误。

## 4. 安装 Starship

**Starship** 是一个现代化、跨平台的命令行提示符，支持 Git 状态、当前目录信息、CPU/内存使用等，且高度可定制。

### 功能：
- 提供一个统一的命令行提示符，支持 Git 状态、文件信息等。
- 可高度定制，适应各种开发需求。

## 5. 安装 Nerd Font（Hack Nerd Font）

**Hack Nerd Font** 是专为开发者设计的字体，支持 Powerline 和 Unicode 字符。

### 功能：
- 为终端和编辑器提供支持特殊符号的字体。
- 提升终端美观度和可读性。

## 6. 配置 Catppuccin Powerline 主题

**Catppuccin** 是一个高对比度的美观主题，配合 **Starship** 使用能提供优雅的提示符。

### 功能：
- 提供高对比度的美观主题。
- 适合开发者的现代化 UI。

## 7. 安装常用工具

提升命令行效率的工具：
- **`bat`**: 带语法高亮的 `cat` 替代命令。
- **`glow`**: 命令行 Markdown 渲染器。
- **`poppler-utils`**: PDF 工具集。
- **`eza`**: `ls` 的增强版。
- **`hexyl`**: 十六进制文件查看器。
- **`mediainfo`**: 查看多媒体文件信息。
- **`exiftool`**: 查看和修改 EXIF 信息。

### 功能：
- 增强文件查看、PDF渲染、图片信息查看等能力。
- 提供更多命令行工具，提升开发效率。

## 8. 创建 `yazi.toml` 配置文件

为 **yazi** 创建并配置 `yazi.toml` 文件，设置窗口布局、文件排序方式、隐藏文件显示等功能。

### 功能：
- 配置文件管理，优化文件预览和排序。
- 提供更好的用户体验，特别是在处理文件时。

## 9. 使配置生效

在终端中执行以下命令，使所有配置生效：
```bash
source ~/.zshrc
````
