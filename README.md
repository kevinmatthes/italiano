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
--      README.md
--
--  BRIEF
--      Important information regarding this project.
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
--
------------------------------------------------------------------------------->

# italiano

## Summary

A very simple translator from Italian to some other languages.

## License

This project's license is **GPL 2** (as of June 1991).  The whole license text
can be found in `LICENSE` in the main directory of this repository.  The brief
version is as follows:

> Copyright (C) 2022 Kevin Matthes
>
> This program is free software; you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation; either version 2 of the License, or
> (at your option) any later version.
>
> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> GNU General Public License for more details.
>
> You should have received a copy of the GNU General Public License along
> with this program; if not, write to the Free Software Foundation, Inc.,
> 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

When compiling a printable version of this documentation using Pandoc, the full
license will be attached automatically to the resulting document.  This can be
invoked by calling `repository-manual.m`.

## Software Requirements

| Requirement       | Type          | Role                                  |
|:------------------|:-------------:|:--------------------------------------|
| `docs-snippets`   | repository    | documentation constants               |
| Flex              | application   | Lex compiler                          |
| GCC               | application   | C compiler                            |
| GNU Octave        | application   | execution of the provided scripts     |
| Pandoc            | application   | compilation of repository manual      |
| `texlive-full`    | package       | compilation of repository manual      |

The compilation of such an **optional** repository manual can be invoked by just
calling one of the following lines in a terminal.

```
octave repository-manual.m
octave-cli repository-manual.m
```

Both will redirect to the same application, GNU Octave, which will then create
the manual for this repository and attach the entire license to it.  The
resulting file, `repository.pdf`, will be saved in the main directory of this
repository.

## Description

This repository provides a simple lexer in order to translate Italian to a
selected language.  It can be compiled by invoking the GNU Octave script
`flex-gcc.m` in a terminal:

```
octave flex-gcc.m
octave-cli flex-gcc.m
```

The script `install-app.m` will install the application in `~/.local/bin/`, at
option.

```
octave install-app.m
octave-cli install-app.m
```

## Options

### `--american`

```
italiano --american
```

Set the output language to US American English.  Only one target language is
allowed.

### `--british`

```
italiano --british
```

Set the output language to British English.  Only one target language is
allowed.

### `--german`

```
italiano --german
```

Set the output language to German.  Only one target language is allowed.

### `-V`

```
italiano -V
```

Show verbose information.  Can be combined with any option.

### `-i`

```
italiano -i
```

Show a brief information block and quit.  All further options will be ignored.

### `-l`

```
italiano -l
```

Show the license text and quit.  All further options will be ignored.

### `-s`

```
italiano -s
```

Suppress verbose information.  Can be combined with any option.

### `-v`, `--version`

```
italiano -v
italiano --version
```

Show the version and quit.  All further options will be ignored.

### `-w`

```
italiano -w
```

Show the warranty information and quit.  All further options will be ignored.

## Hints

### Unique Word Protection

In order to protect a unique word from being replaced, `%` needs to be given as
a prefix to the respective word.

Due to the defined replacement rules, unknown words might be misunderstood and,
thus, translated incorrectly.  This affects words such as names which contain
a configurated vocab.

```
$ echo %Io | italiano --british
Io
$ echo Io | italiano --british
I
```

<!----------------------------------------------------------------------------->
