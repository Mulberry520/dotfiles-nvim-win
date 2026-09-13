# 我的个人 Neovim 配置 (基于 LazyVim) / My Personal Neovim Config (LazyVim)

## 说明

这是一份为 **Windows** 环境的 Neovim 配置的文件，基于 [LazyVim](https://www.lazyvim.org/) 构建。

本配置没有盲目堆砌插件，而是侧重于解决实际开发中的痛点，主要优化了特定语言的缩进体验、Markdown 的沉浸式编写与预览，以及 Java 开发环境的深度定制。

### 核心特性

- **基于 LazyVim**：继承了 LazyVim 现代化的 UI、极速的启动性能以及开箱即用的 LSP/Treesitter 体验。
- **精细化缩进控制**：
  - 通过 `after/indent/` 覆盖了 Go、JSON/JSONC 的默认缩进规则。
  - 在 `lua/custom/editor.lua` 中定义了全局的缩进与编辑器行为逻辑。
- **Markdown 沉浸式体验**：
  - 集成 `render-markdown.nvim`，在编辑器内提供优美的 Markdown 符号渲染与隐藏。
  - 配置 `markdown-preview.nvim`，支持一键在浏览器中进行实时同步预览。
- **Java 开发环境增强**：
  - 深度配置 `jdtls` (Java LSP)。
  - 编写了自定义模块 `lua/custom/java.lua`，支持读取项目根目录的 `.java-version` 文件，**动态探测
    并切换 JDK路径与运行时版本**，无需手动修改配置即可适配多版本 Java 项目。

### 核心目录结构

```text
lua/
├── config/         # LazyVim 核心配置 (options, keymaps, autocmds)
├── custom/         # 个人自定义逻辑模块
│   ├── editor.lua  # 全局编辑器行为与缩进设置
│   ├── java.lua    # JDK 版本探测与路径管理工具
│   └── utils.lua   # 通用辅助函数
└── plugins/        # 插件独立配置文件 (jdtls, markdown, vimtex 等)

after/
├── ftplugin/       # 特定文件类型的局部配置 (如 markdown)
└── indent/         # 覆盖特定语言的缩进规则 (go, json, jsonc)
```

---

## Description

This is a personal Neovim configuration tailored specifically for **Windows**,
built on top of [LazyVim](https://www.lazyvim.org/).

Instead of blindly adding plugins, this configuration focuses on solving
practical development pain points. It primarily optimizes indentation rules for
specific languages, provides an immersive Markdown writing/previewing experience,
and deeply customizes the Java development environment.

### Key Features

- **LazyVim Base**: Inherits LazyVim's modern UI, blazing-fast startup time,
  and out-of-the-box LSP/Treesitter experience.
- **Granular Indentation Control**:
  - Overrides default indentation rules for Go, JSON, and JSONC via `after/indent/`.
  - Defines global indentation and editor behavior logic in `lua/custom/editor.lua`.
- **Immersive Markdown Experience**:
  - Integrates `render-markdown.nvim` for beautiful in-editor rendering and
    concealing of Markdown syntax.
  - Configures `markdown-preview.nvim` for real-time synchronized previewing in
    the browser.
- **Enhanced Java Development**:
  - Deeply configured `jdtls` (Java LSP).
  - Includes a custom module `lua/custom/java.lua` that reads `.java-version`
    files to **dynamically detect and switch JDK paths and runtime versions**,
    adapting to multi-version Java projects without manual config tweaks.

### Core Directory Structure

```text
lua/
├── config/         # LazyVim core configs (options, keymaps, autocmds)
├── custom/         # Personal custom logic modules
│   ├── editor.lua  # Global editor behavior and indentation settings
│   ├── java.lua    # JDK version detection and path management
│   └── utils.lua   # General utility functions
└── plugins/        # Standalone plugin configurations (jdtls, markdown, etc.)

after/
├── ftplugin/       # Filetype-specific local configs (e.g., markdown)
└── indent/         # Overrides indentation rules for specific languages
```
