# Formateur AutoIt Tidy pour Notepad++

[English](README.md) · [中文](README.zh-CN.md) · [हिन्दी](README.hi.md) · [Español](README.es.md) · [Français](README.fr.md) · [العربية](README.ar.md) · [বাংলা](README.bn.md) · [Português](README.pt.md) · [Русский](README.ru.md) · [اردو](README.ur.md)

Mise en forme AutoIt en **un clic depuis la barre d'outils de Notepad++**, via le **`Tidy.exe` officiel d'AutoIt3** (SciTE4AutoIt3 v21.316.1639.1).
Le résultat est identique à **Ctrl+T** dans SciTE : le plugin **ne contient aucune logique de formatage**.

## Fonctionnalités

| Fonction | Comportement |
| --- | --- |
| Moteur | **Uniquement** le `Tidy.exe` officiel inclus dans `plugins\AutoItBeautify\tidy\` |
| Portée | Formate **seulement le tampon courant** ; ne lit ni n'enregistre votre fichier |
| Un clic | Bouton de barre + commande de menu ; aucune boîte de dialogue pour les `.au3` |
| Annulation unique | Tout le formatage est une seule étape → **Ctrl+Z** restaure tout |
| Historique | La barre orange n'apparaît **que sur les lignes réellement modifiées** |
| Fins de ligne | Le style EOL du document (LF / CRLF / CR) est conservé |
| Encodage | Tampons en UTF-8 ; les commentaires non ASCII sont préservés |
| Aucun changement | Si Tidy répond « no updates to make », le tampon reste intact |
| Curseur | Position du curseur, sélection et défilement sont préservés |

Tidy applique ses règles officielles : indentation (tabulations par défaut), normalisation de la casse des mots-clés/fonctions/variables,
espaces autour des délimiteurs, suppression des espaces de fin, ajout automatique de `EndFunc   ;==>NomFonction`,
synchronisation des commentaires `#Region`/`#CE`, et avertissements `;### Tidy Error`.

## Vérifié par rapport au Tidy officiel

* **318 fichiers `.au3` réels** : contenu **100 % identique** à l'exécution du `Tidy.exe` officiel.
* 317 sont **identiques octet pour octet** (fins de ligne comprises).
* 1 fichier ne diffère que par le style de fin de ligne (il est en LF ; le plugin conserve LF, Tidy écrit toujours CRLF).

## Installation

1. Téléchargez [Notepad-autoit-format (ZIP)](https://github.com/123d56/Notepad-autoit-format/archive/refs/heads/main.zip).
2. Décompressez, puis **clic droit sur `install.ps1` → Exécuter avec PowerShell**.
   Le script localise Notepad++ et demande une élévation UAC si nécessaire.
   Alternative manuelle : copiez le dossier `AutoItBeautify` dans `C:\Program Files\Notepad++\plugins\`.
3. **Quittez complètement Notepad++ puis relancez-le** : le bouton bleu apparaît à droite de la barre d'outils.

## Utilisation

* Bouton bleu de la barre, ou menu **Plugins → AutoIt 美化 → 一键美化 AutoIt 代码（Tidy）** (noms en chinois ; ID de commande 22000).
* La barre d'état indique le résultat ; **Ctrl+Z** annule tout en une étape.
* Optionnel : définissez un raccourci dans **Settings → Shortcut Mapper → Plugin commands**.

## Options de Tidy

Modifiez `%APPDATA%\Notepad++\plugins\Config\AutoItBeautify\tidy\Tidy.ini` (créé au premier usage).

```ini
tabchar=0          ; 0 = tabulations, >0 = nombre d'espaces
tabsize=4
proper=1           ; normalise la casse des mots-clés/fonctions
vars=3             ; variables : 1 majuscules, 2 minuscules, 3 première occurrence
delim=1            ; espaces autour des délimiteurs
endfunc_comment=1  ; ajoute "EndFunc ;==>Nom" (-1 = désactiver)
icl_pos=0          ; colonne des commentaires en ligne : 0 = conserver
```

Directives Tidy utilisables dans un script : `#Tidy_Off`, `#Tidy_On`, `#Tidy_ILC_Pos=nn`, `#Tidy_Parameters=...`.

## Désinstallation

Supprimez `C:\Program Files\Notepad++\plugins\AutoItBeautify\` puis redémarrez Notepad++.

## Licence

Code du plugin : **MIT** (voir `LICENSE`).
`Tidy.exe` et ses données appartiennent à **SciTE4AutoIt3** (Jos van der Zande) : voir `THIRD-PARTY-NOTICES.txt`.
