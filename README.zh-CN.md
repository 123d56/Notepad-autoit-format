# AutoIt 一键美化（Notepad++ 插件 · 官方 Tidy 引擎）

[English](README.md) · [中文](README.zh-CN.md) · [हिन्दी](README.hi.md) · [Español](README.es.md) · [Français](README.fr.md) · [العربية](README.ar.md) · [বাংলা](README.bn.md) · [Português](README.pt.md) · [Русский](README.ru.md) · [اردو](README.ur.md)

在 **Notepad++ 工具栏**上一键美化 AutoIt 代码，引擎是 **官方 AutoIt3 `Tidy.exe`**（SciTE4AutoIt3 v21.316.1639.1）。
效果与 SciTE 里按 **Ctrl+T** 一致——插件里**没有任何自研排版逻辑**，只是把当前缓冲区交给官方 Tidy，再把结果写回。

## 功能

| 项目 | 行为 |
| --- | --- |
| 引擎 | **只用**插件自带的官方 `Tidy.exe`（`AutoItBeautify\tidy\`） |
| 范围 | 只美化**当前编辑页缓冲区**；不读取、不保存你的文件 |
| 一键 | 工具栏按钮 + 菜单命令；`.au3` 文档不弹任何对话框 |
| 单步撤销 | 整次美化算一步 → 一次 **Ctrl+Z** 全部还原 |
| 改动历史 | 左侧橙色条**只出现在真正被改动的行** |
| 换行风格 | 保留文档原有 EOL（LF / CRLF / CR） |
| 编码 | 按 UTF-8 处理缓冲区；中文等非 ASCII 注释原样保留 |
| 无需修改 | Tidy 报 “no updates to make” 时，缓冲区完全不动 |
| 光标 | 尽量保持光标、选区与滚动位置 |

Tidy 的官方规则全部生效：缩进（默认 Tab）、关键字/函数/变量大小写规范化、分隔符空格、清理行尾空白、
自动补 `EndFunc   ;==>函数名`、`#Region`/`#CE` 注释同步，以及 `;### Tidy Error` 等结构检查提示。

## 与官方 Tidy 一致性验证

| 校验项 | 结果 |
| --- | --- |
| 318 个真实 `.au3` 文件 | 内容与官方 `Tidy.exe` 输出 **100% 一致** |
| 其中逐字节一致（含换行） | **317 / 318** |
| 仅换行风格不同 | 1（该文件是 LF，插件保留 LF；官方固定 CRLF） |
| 内容不同 | **0** |
| 编辑器内“格式化→保存”后与官方比对 | 逐字节一致（抽样 3/3） |

## 安装

1. 下载本仓库 ZIP（绿色 **Code → Download ZIP**）或 clone；
2. 解压后**右键 `install.ps1` → 使用 PowerShell 运行**：
   脚本自动定位 Notepad++，需要写入 `Program Files` 时会自动请求 UAC 提权；
   也可手动把 `AutoItBeautify` 文件夹复制到 `C:\Program Files\Notepad++\plugins\`；
3. **完全退出并重启 Notepad++** → 工具栏最右出现蓝色按钮。

> 原生插件只在启动时加载，安装/更新后**必须重启 Notepad++**。

## 使用

- 点击工具栏蓝色按钮，或菜单 **插件(P) → AutoIt 美化 → 一键美化 AutoIt 代码（Tidy）**（命令 ID 22000）；
- 状态栏会提示结果，例如 `Tidy 美化完成：调整 N 行（Ctrl+Z 可撤销）`；
- 一次 **Ctrl+Z** 整体撤销；
- 可选：在 **设置 → 管理快捷键 → 插件命令** 里绑定快捷键。

## Tidy 选项

编辑 `%APPDATA%\Notepad++\plugins\Config\AutoItBeautify\tidy\Tidy.ini`
（首次点击按钮时由自带默认值自动生成）。常用项：

```ini
tabchar=0          ; 0=Tab，>0=空格数
tabsize=4
proper=1           ; 关键字/函数名大小写规范化
vars=3             ; 变量大小写：1 大写 2 小写 3 首次出现写法
delim=1            ; 运算符/分隔符两侧空格
endfunc_comment=1  ; 自动补 "EndFunc ;==>函数名"（-1 关闭）
icl_pos=0          ; 行尾注释列：0=保持原列
KeepNVersions=0    ; 不保留备份（临时文件场景）
```

脚本内还可用 Tidy 指令：`#Tidy_Off`、`#Tidy_On`、`#Tidy_ILC_Pos=nn`、`#Tidy_Parameters=...`。

## 卸载

删除 `C:\Program Files\Notepad++\plugins\AutoItBeautify\` 并重启 Notepad++；
可选删除 `%APPDATA%\Notepad++\plugins\Config\AutoItBeautify*`。

## 本仓库内容

```
AutoItBeautify\          即插即用的插件文件夹（DLL + 图标 + tidy 组件）
install.ps1              安装脚本（自动定位 Notepad++，需要时提权）
README*.md               全球前 10 语言说明
LICENSE                  插件代码 MIT 许可
THIRD-PARTY-NOTICES.txt  Tidy.exe 与 Notepad++ SDK 归属声明
```

本仓库**只发布插件本体**，不含源码、构建脚本或开发日志。

## 许可证

插件代码：**MIT**（见 `LICENSE`）。
`Tidy.exe` 及其数据文件属于 **SciTE4AutoIt3**（Jos van der Zande）——见 `THIRD-PARTY-NOTICES.txt`。
