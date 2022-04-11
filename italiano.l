/*
 * Copyright (C) 2022 Kevin Matthes
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

/**
 * \author      Kevin Matthes
 * \brief       A very simple translator from Italian to some other languages.
 * \copyright   (C) 2022 Kevin Matthes.
 *              This file is licensed GPL 2 as of June 1991.
 * \date        2022
 * \file        italiano.l
 * \note        See `LICENSE' for full license.
 *              See `README.md' for project details.
 *
 * This lexer "translates" Italian to a given other language by replacing the
 * recognised vocabs by the predefined translation to the respective language.
 */

/******************************************************************************/

%{
    /*
     * Includes.
     */

    #include <sysexits.h>



    /*
     * Function declarations.
     */

    extern void echo (const char * const string);
    extern int  main (void);
%}

%% /***************************************************************************/

.   ECHO;

%% /***************************************************************************/

/**
 * \brief   Write a string to the configurated output stream.
 * \param   string  The string to write to the output stream.
 *
 * Write the given string to the configurated output stream.
 */

void echo (const char * const string)
{
    fprintf (yyout, "%s", string);
    return;
}



/**
 * \brief   The main function in order to control the behaviour of the lexer.
 * \return  0x0
 *
 * This is the main function which controls the behaviour and configuration of
 * resulting application.
 */

int main (void)
{
    yylex ();
    yylex_destroy ();
    return EX_OK;
}

/******************************************************************************/
