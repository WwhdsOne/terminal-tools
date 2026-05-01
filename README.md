# 一键安装 Zsh 和开发工具

这套工具是我在长期实践中选择的工具，它能极大提升命令行的使用体验和开发效率。以下是如何一键安装和配置 **Zsh**、**Oh My Zsh**、**Starship** 等工具，并配置插件和主题。

## 1. 本人配置一键安装

```bash
curl https://raw.githubusercontent.com/WwhdsOne/LearningNotes/master/tools/install_zsh.sh | bash
```

> **执行前请确保机器已安装 `curl`**，若未安装，请先安装 `curl`。

## 2. 安装 Zsh

### 功能：

`Zsh` 是一个强大的 shell，比 Bash 提供更多功能，如自动补全、插件支持、和高度自定义能力。它能够提升终端的交互体验，是很多开发者的首选终端 shell。

### 安装方式：

* **macOS**：

  ```bash
  brew install zsh
  ```

* **Ubuntu 或其他基于 Debian 的系统**：

  ```bash
  sudo apt install zsh -y
  ```

### 设置 Zsh 为默认 shell：

通过脚本中的 `chsh -s $(which zsh)`，将 `zsh` 设置为默认 shell。

## 3. 安装 Oh My Zsh

### 功能：

**Oh My Zsh** 是一个开源的 Zsh 配置管理工具，提供了丰富的插件和主题，能够极大简化 Zsh 配置管理。

### 安装方式：

使用官方提供的脚本，通过 `curl` 安装 **Oh My Zsh**：

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 4. 安装 Oh My Zsh 插件

### 功能：

以下插件能进一步增强 Zsh 的使用体验：

* **`zsh-autosuggestions`**：命令自动补全建议。
* **`zsh-syntax-highlighting`**：命令语法高亮显示。

### 安装方式：

通过 Git 克隆插件到 **Oh My Zsh** 的插件目录：

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## 5. 安装 Starship

### 功能：

**Starship** 是一个现代化的跨平台命令行提示符，它支持 Git 状态、当前目录信息、CPU/内存使用情况等，并且可以高度自定义。

### 安装方式：

* **macOS** 使用 Homebrew 安装：

  ```bash
  brew install starship
  ```

* **Ubuntu** 使用 `curl` 安装：

  ```bash
  curl -sS https://starship.rs/install.sh | sh
  ```

### 设置 Starship：

在 `~/.zshrc` 文件中添加以下内容，确保 Starship 在 Zsh 中初始化：

```bash
eval "$(starship init zsh)"
```

## 6. 安装 Nerd Font（Hack Nerd Font）

### 功能：

**Hack Nerd Font** 是一种专为开发者设计的字体，支持包括 Powerline 和 Unicode 字符在内的符号。非常适合用于命令行工具和代码编辑器。

### 安装方式：

* **macOS** 使用 Homebrew 安装：

  ```bash
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
  ```

* **Ubuntu** 需要手动安装字体（脚本中会提醒用户安装）。

## 7. 配置 Catppuccin Powerline 主题

### 功能：

**Catppuccin** 是一个高对比度的美观主题，适合用于终端和代码编辑器，配合 **Starship** 使用时能提供更为优雅的提示符。

### 安装方式：

使用 Starship 提供的预设命令来配置 **Catppuccin Powerline** 主题：

```bash
starship preset catppuccin-powerline -o ~/.config/starship.toml
```

## 8. 安装常用工具

这些工具能提升命令行操作效率，特别是在处理文件和多媒体数据时：

* **`bat`**：带语法高亮的 `cat` 替代命令，适合查看代码文件。
  * 注意`bat`指令是用的时候是`batcat`,直接使用`bat`会报`command not found`

* **`glow`**：命令行 Markdown 渲染器，渲染 Markdown 文件。
* **`poppler-utils`**：PDF 工具集，包含 `pdftotext` 等工具，用于处理 PDF 文件。
* **`eza`**：`ls` 的增强版本，提供更强的图形化支持。
* **`hexyl`**：十六进制文件查看器。
* **`mediainfo`**：查看多媒体文件的详细信息。
* **`exiftool`**：查看和修改图片或音频文件的 EXIF 信息。

### 安装方式：

```bash
brew install bat glow poppler-utils eza hexyl mediainfo exiftool
# 或者在 Ubuntu 上使用：
sudo apt install -y bat glow poppler-utils eza hexyl mediainfo exiftool
```

## 9. 创建 `yazi.toml` 配置文件

### 功能：

为 **yazi** 创建并配置 `yazi.toml` 文件，设定窗口布局、文件排序方式、隐藏文件显示、以及图像预览等功能。

### 配置内容：

```toml
[mgr]
ratio = [1, 2, 8]
sort_by = "alphabetical"
sort_dir_first = true
show_hidden = false

[preview]
image = true
max_width = 900
max_height = 1350
image_quality = 80
image_filter = "triangle"
```

## 10. 使配置生效

在终端中执行以下命令，使所有配置生效：

```bash
source ~/.zshrc
```
