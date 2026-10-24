# Formatador AutoIt Tidy para Notepad++

[English](README.md) · [中文](README.zh-CN.md) · [हिन्दी](README.hi.md) · [Español](README.es.md) · [Français](README.fr.md) · [العربية](README.ar.md) · [বাংলা](README.bn.md) · [Português](README.pt.md) · [Русский](README.ru.md) · [اردو](README.ur.md)

Formatação de AutoIt com **um clique na barra de ferramentas do Notepad++**, usando o **`Tidy.exe` oficial do AutoIt3** (SciTE4AutoIt3 v21.316.1639.1).
O resultado é idêntico a pressionar **Ctrl+T** no SciTE — o plugin **não tem lógica de formatação própria**.

## Recursos

| Recurso | Comportamento |
| --- | --- |
| Motor | **Somente** o `Tidy.exe` oficial incluído em `plugins\AutoItBeautify\tidy\` |
| Escopo | Formata **apenas o buffer atual**; nunca lê nem salva seu arquivo |
| Um clique | Botão na barra + comando de menu; sem diálogos para documentos `.au3` |
| Desfazer único | Toda a formatação é uma etapa → um **Ctrl+Z** restaura tudo |
| Histórico | A barra laranja aparece **só nas linhas realmente alteradas** |
| Fins de linha | O estilo EOL do documento (LF / CRLF / CR) é preservado |
| Codificação | Buffers em UTF-8; comentários não ASCII são preservados |
| Sem alterações | Se o Tidy responder «no updates to make», o buffer não é tocado |
| Cursor | Posição do cursor, seleção e rolagem são preservadas |

O Tidy aplica suas regras oficiais: indentação (tabs por padrão), normalização de maiúsculas em palavras-chave/funções/variáveis,
espaços ao redor de delimitadores, remoção de espaços finais, `EndFunc   ;==>NomeFuncao` automático,
sincronização de comentários `#Region`/`#CE` e avisos `;### Tidy Error`.

## Verificado contra o Tidy oficial

* **318 arquivos `.au3` reais**: conteúdo **100 % idêntico** ao executar o `Tidy.exe` oficial.
* 317 são **idênticos byte a byte** (incluindo fins de linha).
* 1 arquivo difere apenas no estilo de fim de linha (é LF; o plugin mantém LF, o Tidy sempre grava CRLF).

## Instalação

1. Baixe [Notepad-autoit-format (ZIP)](https://github.com/123d56/Notepad-autoit-format/archive/refs/heads/main.zip).
2. Descompacte e **clique com o botão direito em `install.ps1` → Executar com PowerShell**.
   O script localiza o Notepad++ e solicita elevação UAC quando necessário.
   Alternativa manual: copie a pasta `AutoItBeautify` para `C:\Program Files\Notepad++\plugins\`.
3. **Feche o Notepad++ completamente e abra novamente** — o botão azul aparece no fim da barra.

## Uso

* Botão azul da barra, ou menu **Plugins → AutoIt 美化 → 一键美化 AutoIt 代码（Tidy）** (nomes em chinês; ID do comando 22000).
* A barra de status informa o resultado; **Ctrl+Z** desfaz tudo em uma etapa.
* Opcional: defina um atalho em **Settings → Shortcut Mapper → Plugin commands**.

## Opções do Tidy

Edite `%APPDATA%\Notepad++\plugins\Config\AutoItBeautify\tidy\Tidy.ini` (criado no primeiro uso).

```ini
tabchar=0          ; 0 = tabs, >0 = número de espaços
tabsize=4
proper=1           ; normaliza maiúsculas de palavras-chave/funções
vars=3             ; variáveis: 1 maiúsculas, 2 minúsculas, 3 primeira ocorrência
delim=1            ; espaços ao redor de delimitadores
endfunc_comment=1  ; adiciona "EndFunc ;==>Nome" (-1 = desativar)
icl_pos=0          ; coluna de comentário em linha: 0 = manter
```

Diretivas do Tidy no script: `#Tidy_Off`, `#Tidy_On`, `#Tidy_ILC_Pos=nn`, `#Tidy_Parameters=...`.

## Desinstalar

Exclua `C:\Program Files\Notepad++\plugins\AutoItBeautify\` e reinicie o Notepad++.

## Licença

Código do plugin: **MIT** (veja `LICENSE`).
`Tidy.exe` e seus dados pertencem ao **SciTE4AutoIt3** (Jos van der Zande) — veja `THIRD-PARTY-NOTICES.txt`.
