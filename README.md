# AutoIt Tidy Formatter for Notepad++

[English](README.md) · [中文](README.zh-CN.md) · [हिन्दी](README.hi.md) · [Español](README.es.md) · [Français](README.fr.md) · [العربية](README.ar.md) · [বাংলা](README.bn.md) · [Português](README.pt.md) · [Русский](README.ru.md) · [اردو](README.ur.md)

One-click AutoIt formatting from the **Notepad++ toolbar**, powered by the **official AutoIt3 `Tidy.exe`** (SciTE4AutoIt3 v21.316.1639.1).
The result is identical to pressing **Ctrl+T** in SciTE — the plugin contains **no formatter logic of its own**: it runs the official Tidy on the current buffer and writes the result back.

## Features

| Feature | Behavior |
| --- | --- |
| Engine | **Only** the official `Tidy.exe` shipped inside `AutoItBeautify\tidy\` |
| Scope | Formats the **current editor buffer only**; never reads or saves your file |
| One-click | Toolbar button + menu command; no dialogs for `.au3` documents |
| Single undo | The whole formatting is one undo step → one **Ctrl+Z** restores everything |
| Change history | The orange margin bar appears **only on lines that were actually changed** |
| Line endings | The document's own EOL style (LF / CRLF / CR) is preserved |
| Encoding | Buffers are handled as UTF-8; non-ASCII comments are preserved |
| No-change case | If Tidy reports “no updates to make”, the buffer is left untouched |
| Cursor | Caret / selection / scroll position are preserved as far as possible |

Tidy applies its official rules: indentation (tabs by default), keyword/function/variable casing, delimiter spacing, trailing-space removal, automatic `EndFunc   ;==>FunctionName` comments, `#Region`/`#CE` comment synchronisation, and structural checks such as `;### Tidy Error` notes.

## Verified against the official Tidy

* **318 real `.au3` files**: content **100 % identical** to running the official `Tidy.exe` directly.
* 317 of them are **byte-for-byte identical** (including line endings).
* 1 file differs only in line-ending style: the document is LF and the plugin preserves LF, while Tidy always writes CRLF.
* End-to-end in Notepad++ (format → save): saved bytes match the official Tidy output exactly.

## Install

1. Download this repository as ZIP (green **Code → Download ZIP**) or clone it.
2. Unzip, then **right-click `install.ps1` → Run with PowerShell**.
   The script auto-detects Notepad++ and requests UAC elevation when it has to write into `Program Files`.
   Manual alternative: copy the `AutoItBeautify` folder into `C:\Program Files\Notepad++\plugins\`.
3. **Exit Notepad++ completely and start it again** — the blue button appears at the right end of the toolbar.

> A native plugin is only loaded at startup, so **restarting Notepad++ is required** after installing or updating.

## Usage

* Click the blue toolbar button, or use
  **Plugins → AutoIt 美化 → 一键美化 AutoIt 代码（Tidy）**
  (the plugin and command names are in Chinese; the command ID is 22000).
* The status bar reports the result, e.g. `Tidy 美化完成：调整 N 行（Ctrl+Z 可撤销）`.
* Press **Ctrl+Z** to undo the whole formatting in one step.
* Optional: assign a shortcut in **Settings → Shortcut Mapper → Plugin commands**.

## Tidy options

Edit `%APPDATA%\Notepad++\plugins\Config\AutoItBeautify\tidy\Tidy.ini`
(created automatically on first use from the bundled defaults). Common keys:

```ini
tabchar=0          ; 0 = tabs, >0 = number of spaces
tabsize=4
proper=1           ; normalise keyword/function casing
vars=3             ; variable casing: 1 upper, 2 lower, 3 first-seen
delim=1            ; spaces around delimiters/operators
endfunc_comment=1  ; add "EndFunc ;==>Name" (-1 = disable)
icl_pos=0          ; inline-comment column: 0 = keep current
KeepNVersions=0    ; no backup copies (temporary-file scenario)
```

Inside a script you can also use Tidy directives: `#Tidy_Off`, `#Tidy_On`, `#Tidy_ILC_Pos=nn`, `#Tidy_Parameters=...`.

## Uninstall

Delete `C:\Program Files\Notepad++\plugins\AutoItBeautify\` and restart Notepad++.
Optionally delete `%APPDATA%\Notepad++\plugins\Config\AutoItBeautify*`.

## What is in this repository

```
AutoItBeautify\        ready-to-use plugin folder (DLL + icons + tidy components)
install.ps1            installer (auto-detects Notepad++, UAC when needed)
README*.md             documentation in the 10 most-spoken languages
LICENSE                MIT license for the plugin code
THIRD-PARTY-NOTICES.txt  Tidy.exe / Notepad++ SDK attribution
```

Source code is intentionally not shipped here; this repository is the distribution of the plugin.

## License

Plugin code: **MIT** (see `LICENSE`).
`Tidy.exe` and its data files belong to **SciTE4AutoIt3** (Jos van der Zande) — see `THIRD-PARTY-NOTICES.txt`.
