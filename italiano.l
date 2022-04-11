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

    #include <stdbool.h>
    #include <sysexits.h>

    #include "GPL_2_0.h"



    /*
     * Macros.
     */

    #define AUTHORS             "Kevin Matthes"
    #define LICENSE             GPL_2_0
    #define VERSION_FIX_LEVEL   0x2
    #define VERSION_MAJOR       0x0
    #define VERSION_MINOR       0x0
    #define VERSION_YEAR        0x7E6



    /*
     * Function declarations.
     */

    extern void echo                    (const char * const string);
    extern void eval                    ( const int             argc
                                        , char * const * const  args
                                        );
    extern void license                 ( const int             year
                                        , const int             year_this
                                        , const char * const    people
                                        , const char * const    license
                                        );
    extern int  main                    ( const int             argc
                                        , char * const * const  args
                                        );
    extern void no_language_set         (void);
    extern void unresolvable_argument   (const char * const argument);
    extern void version                 ( const char * const    app_name
                                        , const int             major
                                        , const int             minor
                                        , const int             fix_level
                                        );



    /*
     * Global variables.
     */

    bool    language_unset  = true;
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

inline void echo (const char * const string)
{
    fprintf (yyout, "%s", string);
    return;
}



/**
 * \brief   Evaluate the command line arguments and set the environment.
 * \param   argc    The count of passed command line arguments.
 * \param   args    The passed command line arguments.
 *
 * This function will evaluate the passed command line arguments and set the
 * environment of this lexer accordingly.
 */

void eval (const int argc, char * const * const args)
{
    for (int i = 0x1; i < argc; i++)
    {
        char * const current = args[i];

        if (current[0x0] == '-')
        {
            switch (strlen (current))
            {
                default:
                    unresolvable_argument (current);
                    break;

                case 0x2:
                    switch (current[0x1])
                    {
                        default:
                            unresolvable_argument (current);
                            break;

                        case 'l':
                            license (0x7E6, VERSION_YEAR, AUTHORS, LICENSE);
                            exit (EX_OK);
                            break;

                        case 'v':
                            version ( args[0x0]
                                    , VERSION_MAJOR
                                    , VERSION_MINOR
                                    , VERSION_FIX_LEVEL
                                    );
                            exit (EX_OK);
                            break;
                    };
                    break;
            };
        }
        else
            unresolvable_argument (current);
    };

    if (language_unset)
        no_language_set ();

    return;
}



/**
 * \brief   The license information.
 * \param   year        The year of the first commit.
 * \param   year_this   The year of the latest commit.
 * \param   people      The people who contributed to this project.
 * \param   license     The license text.
 *
 * This function will write a brief license information to `stdout`.
 */

inline void license ( const int             year
                    , const int             year_this
                    , const char * const    people
                    , const char * const    license
                    )
{
    if (year >= year_this)
        fprintf ( stdout
                , "Copyright (C) %d %s\n\n%s\n"
                , year
                , people
                , license
                );
    else
        fprintf ( stdout
                , "Copyright (C) %d─%d %s\n\n%s\n"
                , year
                , year_this
                , people
                , license
                );

    return;
}



/**
 * \brief   The main function in order to control the behaviour of the lexer.
 * \param   argc    The count of passed command line arguments.
 * \param   args    The passed command line arguments.
 * \return  The application status.
 *
 * This is the main function which controls the behaviour and configuration of
 * resulting application.
 *
 * The meaning of the return values are as follows:
 *
 * | Code   | Meaning                           |
 * |:------:|:----------------------------------|
 * | 0      | no problem occured                |
 * | 64     | unknown / too many argument(s)    |
 */

int main (const int argc, char * const * const args)
{
    eval (argc, args);
    yylex ();
    yylex_destroy ();
    return EX_OK;
}



/**
 * \brief   Quit the application because of an unresolvable argument.
 * \param   argument    The argument which cannot be resolved.
 *
 * In case some extra arguments are passed to the lexer, it cannot deduce what
 * it should do with them.  Hence, it will consider them unresolvable and quit.
 *
 * This function will write a brief error message to `stderr` and quit the
 * application with code 64.
 */

inline void unresolvable_argument (const char * const argument)
{
    fprintf (stderr, "Unresolvable argument:  '%s'.\n", argument);
    exit (EX_USAGE);
    return;
}



/**
 * \brief   The version information.
 * \param   app_name    This lexer's name.
 * \param   major       This lexer's major version.
 * \param   minor       This lexer's minor version.
 * \param   fix_level   This lexer's fix level.
 *
 * This function will write a brief version information to `stdout`.
 */

inline void version ( const char * const    app_name
                    , const int             major
                    , const int             minor
                    , const int             fix_level
                    )
{
    if (fix_level >= 0x0)
        fprintf ( stdout
                , "%s, version %x.%x.%x.\n"
                , app_name
                , major
                , minor
                , fix_level
                );
    else
        fprintf ( stdout
                , "%s, version %x.%x.\n"
                , app_name
                , major
                , minor
                );

    return;
}

/******************************************************************************/
