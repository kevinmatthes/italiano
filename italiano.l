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

    #include <ctype.h>
    #include <stdbool.h>
    #include <sysexits.h>

    #include "GPL_2.0.h"



    /*
     * Macros.
     */

    #define AUTHORS             "Kevin Matthes"
    #define LICENSE             GPL_2_0
    #define VERSION_FIX_LEVEL   0x5
    #define VERSION_MAJOR       0x0
    #define VERSION_MINOR       0x1
    #define VERSION_YEAR        0x7E6
    #define WARRANTY            GPL_2_0__WARRANTY



    /*
     * Function declarations.
     */

    extern void american                (const char * const translation);
    extern void british                 (const char * const translation);
    extern void echo                    (const char * const string);
    extern void english                 (const char * const translation);
    extern void eval                    ( const int             argc
                                        , char * const * const  args
                                        );
    extern void german                  (const char * const translation);
    extern void information             ( FILE * const          stream
                                        , const char * const    app_name
                                        , const int             major
                                        , const int             minor
                                        , const int             fix_level
                                        , const int             year
                                        , const int             year_this
                                        , const char * const    people
                                        );
    extern void license                 ( FILE * const          stream
                                        , const int             year
                                        , const int             year_this
                                        , const char * const    people
                                        , const char * const    license
                                        );
    extern void license_line            ( FILE * const          stream
                                        , const int             year
                                        , const int             year_this
                                        , const char * const    people
                                        );
    extern int  main                    ( const int             argc
                                        , char * const * const  args
                                        );
    extern void no_language_set         (void);
    extern void unresolvable_argument   (const char * const argument);
    extern void version                 ( FILE * const          stream
                                        , const char * const    app_name
                                        , const int             major
                                        , const int             minor
                                        , const int             fix_level
                                        );
    extern void warranty                ( FILE * const          stream
                                        , const char * const    warranty
                                        );



    /*
     * Global variables.
     */

    bool    chatty          = false;
    bool    language_unset  = true;
    bool    monosyllabic    = false;
    bool    to_american     = false;
    bool    to_british      = false;
    bool    to_german       = false;
%}

%% /***************************************************************************/

%[^ \t\n]+[ \t\n]   echo (& yytext[0x1]);



[Aa]l                       {
                                english ("in");
                                german  ("in");
                            };
[Aa]rrivederci              {
                                english ("good bye");
                                german  ("auf Wiedersehen");
                            };
[Aa]ustriac[ao]             {
                                english ("Austrian");
                                german  ("österreichisch");
                            };



[Bb]ello                    {
                                english ("nice");
                                german  ("schön");
                            };
[Bb]envenuti                {
                                english ("welcome");
                                german  ("willkommen");
                            };
[Bb]uona?                   {
                                english ("good");
                                german  ("gut");
                            };
[Bb]uona(\ )?sera           {
                                english ("good evening");
                                german  ("guten Abend");
                            };
[Bb]uon(\ )?giorno          {
                                english ("good morning");
                                german  ("guten Tag");
                            };



[Cc]hiami                   {
                                english ("call");
                                german  ("nennst");
                            };
[Cc]hiamo                   {
                                english ("call");
                                german  ("nenne");
                            };
[Cc]hiaro                   {
                                english ("clear");
                                german  ("klar");
                            };
[Cc]inese                   {
                                english ("Chinese");
                                german  ("chinesisch");
                            };
[Cc]inque                   {
                                english ("five");
                                german  ("fünf");
                            };
[Cc]ome                     {
                                english ("how");
                                german  ("wie");
                            };
[Cc]orso                    {
                                english ("course");
                                german  ("Kurs");
                            };
[Cc]osa                     {
                                english ("what");
                                german  ("was");
                            };



[Dd]'                       {
                                english ("of ");
                                german  ("für ");
                            };
[Dd]avvero                  {
                                english ("really");
                                german  ("wirklich");
                            };
[Dd]i                       {
                                english ("of");
                                german  ("von");
                            };
[Dd]i\ dov'è                {
                                english ("where are you from");
                                german  ("woher sind Sie");
                            };
[Dd]i\ dove\ sei            {
                                english ("where are you from");
                                german  ("woher bist Du");
                            };
[Dd]ieci                    {
                                english ("ten");
                                german  ("zehn");
                            };
[Dd]ove                     {
                                english ("where");
                                german  ("wo");
                            };
[Dd]omanda                  {
                                english ("question");
                                german  ("Frage");
                            };
[Dd]omande                  {
                                english ("questions");
                                german  ("Fragen");
                            };
[Dd]ue                      {
                                english ("two");
                                german  ("zwei");
                            };



[Ee]                        {
                                english ("and");
                                german  ("und");
                            };
È|è                         {
                                english ("is");
                                german  ("ist");
                            };
[Ee]ssere                   {
                                english ("to be");
                                german  ("sein");
                            };



[Ff]rancese                 {
                                english ("French");
                                german  ("französisch");
                            };



[Gg]iorno                   {
                                english ("day");
                                german  ("Tag");
                            };
[Gg]razie                   {
                                english ("thanks");
                                german  ("danke");
                            };



[Ii]nglese                  {
                                english ("English");
                                german  ("englisch");
                            };
[Ii]nteressante             {
                                english ("interesting");
                                german  ("interessant");
                            };
[Ii]o                       {
                                english ("I");
                                german  ("ich");
                            };
[Ii]o\ sono                 {
                                english ("I am");
                                german  ("ich bin");
                            };
[Ii]o\ studio               {
                                english ("I study");
                                german  ("ich studiere");
                            };
[Ii]talian[ao]              {
                                english ("Italian");
                                german  ("italienisch");
                            };



Lei                         {
                                english ("you");
                                german  ("Sie");
                            };
lei                         {
                                english ("she");
                                german  ("sie");
                            };
Lei\ è                      {
                                english ("you are");
                                german  ("Sie sind");
                            };
Lei\ studia                 {
                                english ("you study");
                                german  ("Sie studieren");
                            };
Lei\ vola                   {
                                english ("you fly");
                                german  ("Sie fliegen");
                            };
Londra                      {
                                english ("London");
                                german  ("London");
                            };
[Ll]oro                     {
                                english ("they");
                                german  ("sie");
                            };
[Ll]oro\ sono               {
                                english ("they are");
                                german  ("sie sind");
                            };
[Ll]oro\ volano             {
                                english ("they fly");
                                german  ("sie fliegen");
                            };
[Ll]ui                      {
                                english ("he");
                                german  ("er");
                            };



[Mm]i                       {
                                english ("me");
                                german  ("mich");
                            };
[Mm]i\ chiamo               {
                                english ("am called");
                                german  ("mich nenne");
                            };
[Mm]irtillo                 {
                                english ("blueberry");
                                german  ("Heidelbeere");
                            };



[Nn]o                       {
                                english ("no");
                                german  ("nein");
                            };
[Nn]on                      {
                                english ("not");
                                german  ("nicht");
                            };
[Nn]oi                      {
                                english ("we");
                                german  ("wir");
                            };
[Nn]ove                     {
                                english ("nine");
                                german  ("neun");
                            };



[Oo]tto                     {
                                english ("eight");
                                german  ("acht");
                            };



[Pp]erché                   {
                                english ("why");
                                german  ("warum");
                            };
[Pp]iacere                  {
                                english ("pleased to meet you");
                                german  ("sehr erfreut");
                            };
[Pp]olacc[ao]               {
                                english ("Polish");
                                german  ("polnisch");
                            };
[Pp]rego                    {
                                english ("please");
                                german  ("bitte");
                            };



[Qq]uattro                  {
                                english ("four");
                                german  ("vier");
                            };



[Ss]ei                      {
                                english ("six");
                                german  ("sechs");
                            };
[Ss]era                     {
                                english ("evening");
                                german  ("Abend");
                            };
[Ss]ette                    {
                                english ("seven");
                                german  ("sieben");
                            };
[Ss]ì                       {
                                english ("yes");
                                german  ("ja");
                            };
[Ss]iamo                    {
                                english ("are");
                                german  ("sind");
                            };
[Ss]iete                    {
                                english ("are");
                                german  ("seid");
                            };
[Ss]ignifica                {
                                english ("means");
                                german  ("bedeutet");
                            };
[Ss]ono                     {
                                english ("I am");
                                german  ("ich bin");
                            };
[Ss]pagnol[ao]              {
                                english ("Spanish");
                                german  ("spanisch");
                            };
[Ss]tudi                    {
                                english ("study");
                                german  ("studierst");
                            };
[Ss]tudia                   {
                                english ("studies");
                                german  ("studiert");
                            };
[Ss]tudia((m|n)o|re)        {
                                english ("study");
                                german  ("studieren");
                            };
[Ss]tudiate                 {
                                english ("study");
                                german  ("studiert");
                            };
[Ss]vizzer[ao]              {
                                english ("Swiss");
                                german  ("schweizerisch");
                            };



[Tt]edesc[ao]               {
                                english ("German");
                                german  ("deutsch");
                            };
[Tt]i                       {
                                english ("you");
                                german  ("Dich");
                            };
[Tt]i\ chiami               {
                                english ("are called");
                                german  ("Dich nennst");
                            };
[Tt]re                      {
                                english ("three");
                                german  ("drei");
                            };
[Tt]u                       {
                                english ("you");
                                german  ("Du");
                            };
[Tt]u\ sei                  {
                                english ("you are");
                                german  ("Du bist");
                            };
[Tt]utto                    {
                                english ("anything");
                                german  ("alles");
                            };



[Uu]no                      {
                                english ("one");
                                german  ("eins");
                            };



[Vv]oi                      {
                                english ("you");
                                german  ("ihr");
                            };
[Vv]ola                     {
                                english ("flies");
                                german  ("fliegt");
                            };
[Vv]ol(are|iamo)            {
                                english ("fly");
                                german  ("fliegen");
                            };
[Vv]olate                   {
                                english ("fly");
                                german  ("fliegt");
                            };
[Vv]oli                     {
                                english ("fly");
                                german  ("fliegst");
                            };
[Vv]olo                     {
                                english ("fly");
                                german  ("fliege");
                            };



.   ECHO;

%% /***************************************************************************/

/**
 * \brief   The translation into US American English.
 * \param   translation The meaning in the output language.
 *
 * If configurated, this lexer will write the given meaning in US American
 * English to `yyout`.
 */

void american (const char * const translation)
{
    if (to_american && isupper (yytext[0x0]))
    {
        fprintf (yyout, "%c", toupper (translation[0x0]));
        echo (& translation[0x1]);
    }
    else if (to_american)
        echo (translation);

    return;
}



/**
 * \brief   The translation into British English.
 * \param   translation The meaning in the output language.
 *
 * If configurated, this lexer will write the given meaning in British English
 * to `yyout`.
 */

void british (const char * const translation)
{
    if (to_british && isupper (yytext[0x0]))
    {
        fprintf (yyout, "%c", toupper (translation[0x0]));
        echo (& translation[0x1]);
    }
    else if (to_british)
        echo (translation);

    return;
}



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
 * \brief   The translation into English.
 * \param   translation The meaning in the output language.
 *
 * If configurated, this lexer will write the given meaning in both US American
 * and British English to `yyout`.
 */

inline void english (const char * const translation)
{
    american (translation);
    british (translation);
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

                        case 'V':
                            if (! monosyllabic)
                                chatty = true;
                            else
                                unresolvable_argument (current);
                            break;

                        case 'l':
                            license ( stdout
                                    , 0x7E6
                                    , VERSION_YEAR
                                    , AUTHORS
                                    , LICENSE
                                    );
                            exit (EX_OK);
                            break;

                        case 's':
                            if (! chatty)
                                monosyllabic = true;
                            else
                                unresolvable_argument (current);
                            break;

                        case 'v':
                            version ( stdout
                                    , args[0x0]
                                    , VERSION_MAJOR
                                    , VERSION_MINOR
                                    , VERSION_FIX_LEVEL
                                    );
                            exit (EX_OK);
                            break;

                        case 'w':
                            warranty (stdout, WARRANTY);
                            exit (EX_OK);
                            break;
                    };
                    break;

                case 0x8:
                    if (  language_unset
                       && memcmp (current, "--german", 0x8) == 0x0
                       )
                    {
                        language_unset  = false;
                        to_german       = true;
                    }
                    else
                        unresolvable_argument (current);
                    break;

                case 0x9:
                    if (  language_unset
                       && memcmp (current, "--british", 0x9) == 0x0
                       )
                    {
                        language_unset  = false;
                        to_british      = true;
                    }
                    else
                        unresolvable_argument (current);
                    break;

                case 0xA:
                    if (  language_unset
                       && memcmp (current, "--american", 0xA) == 0x0
                       )
                    {
                        language_unset  = false;
                        to_american     = true;
                    }
                    else
                        unresolvable_argument (current);
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
 * \brief   The translation into German.
 * \param   translation The meaning in the output language.
 *
 * If configurated, this lexer will write the given meaning in German to
 * `yyout`.
 */

void german (const char * const translation)
{
    if (to_german && isupper (yytext[0x0]))
    {
        fprintf (yyout, "%c", toupper (translation[0x0]));
        echo (& translation[0x1]);
    }
    else if (to_german)
        echo (translation);

    return;
}



/**
 * \brief   Write a minimal information to the given stream.
 * \param   stream      The stream to write the information to.
 * \param   app_name    This lexer's name.
 * \param   major       This lexer's major version.
 * \param   minor       This lexer's minor version.
 * \param   fix_level   This lexer's fix level.
 * \param   year        The year of the first commit.
 * \param   year_this   The year of the latest commit.
 * \param   people      The people who contributed to this project.
 *
 * This function writes a minimal information to the given stream.
 */

inline void information ( FILE * const          stream
                        , const char * const    app_name
                        , const int             major
                        , const int             minor
                        , const int             fix_level
                        , const int             year
                        , const int             year_this
                        , const char * const    people
                        )
{
    version (stream, app_name, major, minor, fix_level);
    license_line (stream, year, year_this, people);

    fprintf ( stream
            , "This is free software, see the GPL 2.0 license for copying condi"
              "tions.\n"
              "This application comes with ABSOLUTELY NO WARRANTY, not even for"
              "MERCHANTABILITY\nor FITNESS FOR A PARTICULAR PURPOSE; run `%s -w"
              "' for more details.\n\n"
            , app_name
            );

    return;
}



/**
 * \brief   The license information.
 * \param   stream      The stream to write the information to.
 * \param   year        The year of the first commit.
 * \param   year_this   The year of the latest commit.
 * \param   people      The people who contributed to this project.
 * \param   license     The license text.
 *
 * This function will write a brief license information to the given stream.
 */

inline void license ( FILE * const          stream
                    , const int             year
                    , const int             year_this
                    , const char * const    people
                    , const char * const    license
                    )
{
    license_line (stream, year, year_this, people);
    fprintf (stream, "%s\n", license);
    return;
}



/**
 * \brief   The copyright information line.
 * \param   stream      The stream to write the information to.
 * \param   year        The year of the first commit.
 * \param   year_this   The year of the latest commit.
 * \param   people      The people who contributed to this project.
 *
 * This function will write a brief license information to the given stream.
 */

inline void license_line ( FILE * const          stream
                         , const int             year
                         , const int             year_this
                         , const char * const    people
                         )
{
    if (year >= year_this)
        fprintf ( stream
                , "Copyright (C) %d %s\n\n"
                , year
                , people
                );
    else
        fprintf ( stream
                , "Copyright (C) %d─%d %s\n\n"
                , year
                , year_this
                , people
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
 * The meanings of the return values are as follows:
 *
 * | Code   | Meaning                           |
 * |:------:|:----------------------------------|
 * | 0      | no problem occured                |
 * | 64     | unknown / too many argument(s)    |
 */

int main (const int argc, char * const * const args)
{
    eval (argc, args);
    information ( stderr
                , args[0x0]
                , VERSION_MAJOR
                , VERSION_MINOR
                , VERSION_FIX_LEVEL
                , 0x7E6
                , VERSION_YEAR
                , AUTHORS
                );
    yylex ();
    yylex_destroy ();
    return EX_OK;
}



/**
 * \brief   Quit the application because of unset target languages.
 *
 * This lexer needs exactly one language it can translate to.  If no one is
 * configurated, there is no need to keep this translator running.
 *
 * This function will write a brief error message to `stderr` and quit the
 * application with code 64.
 */

inline void no_language_set (void)
{
    fprintf (stderr, "The target language needs to be specified!\n");
    exit (EX_USAGE);
    return;
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
 * \param   stream      The stream to write the information to.
 * \param   app_name    This lexer's name.
 * \param   major       This lexer's major version.
 * \param   minor       This lexer's minor version.
 * \param   fix_level   This lexer's fix level.
 *
 * This function will write a brief version information to the given stream.
 */

inline void version ( FILE * const          stream
                    , const char * const    app_name
                    , const int             major
                    , const int             minor
                    , const int             fix_level
                    )
{
    if (fix_level >= 0x0)
        fprintf ( stream
                , "%s, version %x.%x.%x.\n"
                , app_name
                , major
                , minor
                , fix_level
                );
    else
        fprintf ( stream
                , "%s, version %x.%x.\n"
                , app_name
                , major
                , minor
                );

    return;
}



/**
 * \brief   The warranty information.
 * \param   stream      The stream to write the information to.
 * \param   warranty    The warranty information to display.
 *
 * This function will write a brief warranty information to the given stream.
 */

inline void warranty (FILE * const stream, const char * const warranty)
{
    fprintf ( stream
            , "This application comes with ABSOLUTELY NO WARRANTY, not even for"
              " MERCHANTABILITY\nor FITNESS FOR A PARTICULAR PURPOSE.\n\n"
              "The GPL 2.0 license specifies the following:\n\n"
              "%s\n"
            , warranty
            );
    return;
}

/******************************************************************************/
