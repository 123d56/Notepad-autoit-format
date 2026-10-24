# Formateador AutoIt Tidy para Notepad++

[English](README.md) · [中文](README.zh-CN.md) · [हिन्दी](README.hi.md) · [Español](README.es.md) · [Français](README.fr.md) · [العربية](README.ar.md) · [বাংলা](README.bn.md) · [Português](README.pt.md) · [Русский](README.ru.md) · [اردو](README.ur.md)

Formateo de AutoIt con **un clic desde la barra de herramientas de Notepad++**, usando el **`Tidy.exe` oficial de AutoIt3** (SciTE4AutoIt3 v21.316.1639.1).
El resultado es idéntico a pulsar **Ctrl+T** en SciTE: el plugin **no contiene lógica de formateo propia**.

## Características

| Característica | Comportamiento |
| --- | --- |
| Motor | **Solo** el `Tidy.exe` oficial incluido en `plugins\AutoItBeautify\tidy\` |
| Alcance | Formatea **solo el búfer actual**; nunca lee ni guarda tu archivo |
| Un clic | Botón en la barra + comando de menú; sin diálogos para documentos `.au3` |
| Deshacer único | Todo el formateo es un solo paso → un **Ctrl+Z** lo revierte completo |
| Historial de cambios | La barra naranja aparece **solo en las líneas realmente modificadas** |
| Fin de línea | Se conserva el estilo EOL del documento (LF / CRLF / CR) |
| Codificación | Búferes en UTF-8; los comentarios no ASCII se conservan |
| Sin cambios | Si Tidy responde «no updates to make», el búfer no se toca |
| Cursor | Se conservan posición del cursor, selección y desplazamiento |

Tidy aplica sus reglas oficiales: indentación (tabulaciones por defecto), normalización de mayúsculas de palabras clave/funciones/variables,
espacios alrededor de delimitadores, eliminación de espacios finales, `EndFunc   ;==>NombreFuncion` automático,
sincronización de comentarios `#Region`/`#CE` y avisos como `;### Tidy Error`.

## Verificado contra el Tidy oficial

* **318 archivos `.au3` reales**: contenido **100 % idéntico** al ejecutar el `Tidy.exe` oficial.
* 317 son **idénticos byte a byte** (incluidos los fines de línea).
* 1 archivo difiere solo en el estilo de fin de línea (es LF y el plugin conserva LF; Tidy escribe siempre CRLF).

## Instalación

1. Descarga [Notepad-autoit-format (ZIP)](https://github.com/123d56/Notepad-autoit-format/archive/refs/heads/main.zip).
2. Descomprime y **haz clic derecho en `install.ps1` → Ejecutar con PowerShell**.
   El script detecta Notepad++ y pide elevación UAC cuando es necesario.
   Alternativa manual: copia la carpeta `AutoItBeautify` en `C:\Program Files\Notepad++\plugins\`.
3. **Cierra Notepad++ por completo y vuelve a abrirlo**: el botón azul aparece al final de la barra.

## Uso

* Botón azul de la barra, o menú **Plugins → AutoIt 美化 → 一键美化 AutoIt 代码（Tidy）** (los nombres están en chino; ID de comando 22000).
* La barra de estado informa el resultado; **Ctrl+Z** deshace todo en un paso.
* Opcional: asigna un atajo en **Settings → Shortcut Mapper → Plugin commands**.

## Opciones de Tidy

Edita `%APPDATA%\Notepad++\plugins\Config\AutoItBeautify\tidy\Tidy.ini` (se crea en el primer uso).

```ini
tabchar=0          ; 0 = tabulaciones, >0 = número de espacios
tabsize=4
proper=1           ; normaliza mayúsculas de palabras clave/funciones
vars=3             ; variables: 1 mayúsculas, 2 minúsculas, 3 primera aparición
delim=1            ; espacios alrededor de delimitadores
endfunc_comment=1  ; añade "EndFunc ;==>Nombre" (-1 = desactivar)
icl_pos=0          ; columna de comentarios en línea: 0 = mantener
```

También puedes usar directivas de Tidy dentro del script: `#Tidy_Off`, `#Tidy_On`, `#Tidy_ILC_Pos=nn`, `#Tidy_Parameters=...`.

## Desinstalar

Elimina `C:\Program Files\Notepad++\plugins\AutoItBeautify\` y reinicia Notepad++.

## Licencia

Código del plugin: **MIT** (ver `LICENSE`).
`Tidy.exe` y sus datos pertenecen a **SciTE4AutoIt3** (Jos van der Zande): ver `THIRD-PARTY-NOTICES.txt`.
