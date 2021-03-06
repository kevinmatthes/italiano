%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Copyright (C) 2022 Kevin Matthes
%%
%% This program is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 2 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License along
%% with this program; if not, write to the Free Software Foundation, Inc.,
%% 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
%%
%%%%
%%
%%  FILE
%%      flex-gcc.m
%%
%%  BRIEF
%%      Create a new lexer using Flex and GCC.
%%
%%  AUTHOR
%%      Kevin Matthes
%%
%%  COPYRIGHT
%%      (C) 2022 Kevin Matthes.
%%      This file is licensed GPL 2 as of June 1991.
%%
%%  DATE
%%      2022
%%
%%  NOTE
%%      See `LICENSE' for full license.
%%      See `README.md' for project details.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%
%%
%% Variables.
%%
%%%%

% Software.
compiler.flags  = [ ' -Wall -Werror -Wextra -Wpedantic '                     ...
                    ' -DYY_NO_INPUT '                                        ...
                    ' -DYY_NO_UNPUT '                                        ...
                  ];
compiler.in     = '*.c';
compiler.link   = [ ' -lfl '                                                 ...
                    ' -L./libgpl2/ -lgpl2 '                                  ...
                  ];
compiler.out    = ['./' 'italiano'];
compiler.self   = 'gcc';
compiler.call   = [ compiler.self ' ' compiler.flags ' ' compiler.in ' '     ...
                    compiler.link ' -o ' compiler.out                        ...
                  ];

octave.dir  = './libgpl2/';
octave.in   = 'gcc-ar.m';
octave.out  = 'libgpl2.a';
octave.self = 'octave';
octave.call = [octave.self ' ' octave.in];

scangen.in      = ['italiano' '.l'];
scangen.out     = 'lex.yy.c';
scangen.self    = 'flex';
scangen.call    = [scangen.self ' ' scangen.in];



% Miscellaneous.
misc.self   = 'flex-gcc.m';
misc.banner = ['[ ' misc.self ' ] '];



%%%%
%%
%% Build steps.
%%
%%%%

% Begin build instruction.
disp ([misc.banner 'Begin build instruction.']);



% Compile mandatory libraries.
disp ([misc.banner 'Compile mandatory libraries ...']);

directories.self = cd (octave.dir);
system (octave.call);
cd (directories.self);

disp ([misc.banner 'Done.']);



% Clean outdated compilation.
fprintf ([misc.banner 'Remove outdated compilation of ' compiler.out ' ... ']);

if length (glob (compiler.out));
    delete (compiler.out);
end;

disp ('Done.');



% Call Flex.
disp ([misc.banner 'Compile scanner definition with Flex ...']);

disp (scangen.call);
system (scangen.call);

disp ([misc.banner 'Done.']);



% Call GCC.
disp ([misc.banner 'Compile C source code with GCC ...']);

disp (compiler.call);
system (compiler.call);

disp ([misc.banner 'Done.']);



% Clean build artifacts.
fprintf ([misc.banner 'Remove build artifacts ... ']);

if length (glob (scangen.out));
    delete (scangen.out);
end;

disp ('Done.');



% End build instruction.
disp ([misc.banner 'End build instruction.']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
