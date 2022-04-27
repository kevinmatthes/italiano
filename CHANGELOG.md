<!------------------------------------------------------------------------------
--
-- Copyright (C) 2022 Kevin Matthes
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--
----
--
--  FILE
--      CHANGELOG.md
--
--  BRIEF
--      The development history of this project.
--
--  AUTHOR
--      Kevin Matthes
--
--  COPYRIGHT
--      (C) 2022 Kevin Matthes.
--      This file is licensed GPL 2 as of June 1991.
--
--  DATE
--      2022
--
--  NOTE
--      See `LICENSE' for full license.
--      See `README.md' for project details.
--
------------------------------------------------------------------------------->

# Changelog

## [Unreleased]

### Added

* submodule `libgpl2`
* word:  ciao
* word:  scusi
* word:  si

### Changed

* link against `libgpl2.a` from corresponding submodule
* update `docs-snippets`
* update `routines`

### Removed

* `GPL_2.0.h`
* `gpl2_copyright_line.c`
* `gpl2_information.c`
* `gpl2_license.c`
* `gpl2_version.c`
* `gpl2_warranty.c`
* `pragma_once.dox`

## [0.1.9] -- 2022-04-26

### Fixed

* add missing semicolon
* incorrect release dates

## [0.1.8] -- 2022-04-26

### Added

* word:  diciannove
* word:  diciassette
* word:  diciotto
* word:  dodici
* word:  dov'
* word:  quattordici
* word:  quindici
* word:  sedici
* word:  settantotto
* word:  tredici
* word:  trentotto
* word:  undici
* word:  venti
* word:  zero

### Fixed

* sort vocabs

## [0.1.7] -- 2022-04-25

### Added

* option `-i`

### Changed

* adjust README description

## [0.1.6] -- 2022-04-23

### Added

* create `gpl2_copyright_line.c`
* create `gpl2_information.c`
* create `gpl2_license.c`
* create `gpl2_version.c`
* create `gpl2_warranty.c`
* create `pragma_once.dox`

### Changed

* move docstrings
* outsource copyright line function to `gpl2_copyright_line.c`
* outsource information function to `gpl2_information.c`
* outsource license function to `gpl2_license.c`
* outsource version function to `gpl2_version.c`
* outsource warranty function to `gpl2_warranty.c`

### Fixed

* missing line breaks
* shorten pattern of "buonasera" / "buona sera"
* shorten pattern of "buongiorno" / "buon giorno"
* sort changelog items

### Removed

* obsolete macros

## [0.1.5] -- 2022-04-23

### Added

* function `license_line`
* global variable `monosyllabic`
* option `-V`

### Changed

* outsource license headline to `license_line`
* set `chatty` to `false` by default

## [0.1.4] -- 2022-04-22

### Added

* function `information`
* function `warranty`
* global variable `chatty`
* macro `GPL_2_0__WARRANTY`
* macro `WARRANTY`
* option `-s`
* option `-w`

### Changed

* adjust README description

## [0.1.3] -- 2022-04-21

### Changed

* adjusted spacing in sections

### Fixed

* improved translation of "piacere"

## [0.1.2] -- 2022-04-21

### Added

* word:  austriaca, austriaco
* word:  buon, buona
* word:  francese
* word:  giorno
* word:  inglese
* word:  polacca, polacco
* word:  sera
* word:  studi
* word:  studia
* word:  studiamo
* word:  studiano
* word:  studiare
* word:  studiate
* word:  studio
* word:  svizzera, svizzero

### Fixed

* duplicate entries for "vola"
* enable alternative spelling for "buonasera"
* enable alternative spelling for "buongiorno"
* mismatching translation for "volano"

## [0.1.1] -- 2022-04-19

### Added

* word:  bello
* word:  chiaro
* word:  davvero
* word:  di
* word:  domanda
* word:  domande
* word:  dove
* word:  interessante
* word:  Londra
* word:  mi
* word:  mirtillo
* word:  no
* word:  non
* word:  perché
* word:  piacere
* word:  sì
* word:  tutto
* word:  vola
* word:  volano
* word:  volare
* word:  volate
* word:  voli
* word:  voliamo
* word:  volo

### Changed

* update `docs-snippets`
* update `routines`

### Fixed

* strings in regex for word "è"
* translation bugs in forms of "chiamarsi"

## [0.1.0] -- 2022-04-14

### Fixed

* missing changelog items
* typos in docstrings
* typos in README description
* typos in translations

## [0.0.3] -- 2022-04-14

### Added

* include `ctype.h`
* protector for unique words
* word:  al
* word:  arrivederci
* word:  benvenuti
* word:  buonasera
* word:  buongiorno
* word:  chiami
* word:  chiamo
* word:  cinese
* word:  cinque
* word:  come
* word:  corso
* word:  cosa
* word:  d'
* word:  dieci
* word:  due
* word:  e
* word:  è
* word:  essere
* word:  grazie
* word:  io
* word:  italiana, italiano
* word:  Lei
* word:  lei
* word:  loro
* word:  lui
* word:  noi
* word:  nove
* word:  otto
* word:  prego
* word:  quattro
* word:  sei
* word:  sette
* word:  siamo
* word:  siete
* word:  significa
* word:  sono
* word:  spagnola, spagnolo
* word:  tedesca, tedesco
* word:  ti
* word:  tre
* word:  tu
* word:  uno
* word:  voi

### Fixed

* case handling
* compact compilation routine

## [0.0.2] -- 2022-04-11

### Added

* basic option parsing
* create `define.dox`
* create `global_variables.dox`
* function `american`
* function `british`
* function `echo`
* function `english`
* function `eval`
* function `german`
* function `license`
* function `no_language_set`
* function `unresolvable_argument`
* function `version`
* header `GPL_2_0.h`
* include `stdbool.h`

### Changed

* accept command line arguments
* adjust README description

### Fixed

* typos in README

### Removed

* submodule `untab`

## [0.0.1] -- 2022-04-11

### Added

* add GPL 2.0 license
* build routine:  compilation
* build routine:  installation
* build routine:  repository manual
* create `.gitignore`
* create `italiano.l`
* create list of authors
* create project meta data for repository manual
* create repository README
* create this changelog
* create this repository
* submodule `docs-snippets`
* submodule `routines`
* submodule `untab`

### Deprecated

* submodule `untab`

<!----------------------------------------------------------------------------->
