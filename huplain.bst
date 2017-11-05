%
% huplain.bst -- plain.bst in Hungarian
% by pts@fazekas.hu at Thu Oct 30 10:10:04 CET 2003
% tetex-url at Mon May  3 20:01:40 CEST 2004
% derived from BibTeX standard bibliography style `plain'
%   version 0.99a for BibTeX versions 0.99a or later, LaTeX version 2.09.
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of 
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% !! title={Az foo} -> key={foo}
% !! auto add space into URLs longer than 70 characters
% !! don't remove double-accent in T1 encoding: \'{\`a}}
% !! sort year
% !! make sure about Hungarian typography of {proceedings} and {inproceedings}
%    it is better now to have talked=1, (Elhangzott a ... címû konferencián)
% !! also remove space after \ae before calling purify$
% !! crossrefs
% !! ` type '
% !! hu ordering: author, year, title  if author is present
%                 title, year  if author is missing!
% !! use and document ``address''
% !! MSZ 3401--81. A bibliográfiai tételek betûrendbe sorolásának szabályai.
% !! MSZ 3402--80. Könyvek bibliográfiai adatközlése és belsõ elrendezése.
% !! MSZ 3424/*-*. Bibliográfiai leírás. *.
% !! MSZ 3432-85. Szavak és szókapcsolatok rövidítése a bibliográfiai leírásban.
% !! MSZ 3440/*-*. A bibiliográfiai leírás besorolási adatai. *.
% !! abbrv style for J.-P. Sartre
% !! test all entry types
% !! optional \uppercase or \textsc
% !! "5~ {\hbox{ja}}nu\'ar" #1 "({l,}{ff,})" format.name$ warning$
% !! format.name$ keeps the first char of the name only, so specify {Gy}ula
% !! don't use width$ ??, because it's the cmr10 font in 1987.
% !! getting the first chars of names
% !! \include...
% !! bibgerman.sty, gerplain.bst, language = "german" | "USenglish" | "english" etc.
%    \selectlanguage{...} \bibitem...
% !! doc: parametric volume: `kötet' (volumeisyearly={1}) instead of `évf.'
% OK: smaller space for \newblock
% OK: huname: name in hungarian order
% SUXX: cannot read current (overridden) MACRO values from .bst
% SUXX: #161 int.to.chr$ doesn't work (out of bounds), stupid BibTeX...
% Dat: @preamble { "..." # "..." }
% Dat: bibtex removes spaces from end of field contents
% Dat: `volume=' is `évfolyam' 
% Dat: Doc: key={{ }.}
% Dat: Doc: write non-decaptilized titles: title = {Fejtõ {Ferenc} és a szociáldemokrácia},
% Dat: print debug messages with "foo" warning$
%

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year

    street
    zip
    city
    phone
    mobile
    name

    numvolumes
    numpages
    tetex-url
    ctan-url
    url
    isbn
    issn
    nocheck % ****pts****
    huname  % ****pts****
    inputenc % ****pts****
    author2 % ****pts****
    talked % ****pts****
    volumeisyearly % ****pts****

    % vvv for fmts
    firstname.fmt % ****pts****
    lastname.fmt % ****pts****
  }
  {}
  { label adr.char } % !! what does this mean?


FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}



STRINGS { ss tt }

%STRINGS { acc.latin2.160 acc.latin1.160 acc.160 }
%FUNCTION {init.accs} {
%  " A L LS  SSTZ-ZZ a l ls  sstz zzRAAAALCCCEEEEIIDDNNOOOO*RUUUUYTsraaaalccceeeeiiddnnoooo/ruuuuytd" 'acc.latin2.160 :=
%  " !    |    <!- m +23 m   1 >    AAAAAAACEEEEIIIIDNOOOOO*OUUUUYTsaaaaaaaceeeeiiiidnooooo/ouuuuyty" 'acc.latin1.160 :=
%}
%%** @param #1 string
%%** @return string
%FUNCTION {rmacc.latinx} { % ****pts****
%  'tt :=
%  "" 'ss :=
%  { tt empty$ not } {
%    #1
%    { duplicate$ tt swap$ #1 substring$
%      duplicate$ "" = { pop$ #0 } { chr.to.int$ #160 < } if$
%    } { #1 + } while$
%    duplicate$ tt swap$ #1 swap$ #1 -  substring$
%    % duplicate$ ";" * warning$
%    ss swap$ * 'ss :=
%    duplicate$ tt swap$ #1 substring$
%    duplicate$ "" = { pop$ } {
%      chr.to.int$ #159 -  acc.160 swap$ #1 substring$
%      ss swap$ * 'ss :=
%      #1 +
%    } if$
%    tt swap$ global.max$ substring$ 'tt :=
%    % tt warning$
%  } while$
%  ss
%}
%
%%** @param #1 a string
%%** @return a string
%FUNCTION {rmacc} { % **** pts ****
%  inputenc empty$ 'skip$ {
%    inputenc "latin1" = { acc.latin1.160 'acc.160 :=  rmacc.latinx } 'skip$ if$
%    inputenc "latin2" = { acc.latin2.160 'acc.160 :=  rmacc.latinx } 'skip$ if$
%  } if$
%}

STRINGS { acc4.latin2.160 acc4.latin1.160 acc4.160 }
FUNCTION {init.accs4} {
  "%%%%%%%%%%%%%%%%%%%%%%%%%%%%\S %\" quote$ "{}%%%%%%%%%%%%%%%%%%%%%%%%\={}%%%%%%%%%%%%%%%%\'{}%%%%\P %%%%%\c\ %%%%%%%%%%%%%%%%%%%%%%%%%%%%\`A%\'A%\^A%\~A%\" quote$ "A%\r A\AE%\c C\`E%\'E%\^E%\" quote$ "E%\`I%\'I%\^I%\" quote$ "I%\DH%\~N%\`O%\'O%\^O%\~O%\" quote$ "O%%%%%\O %\`U%\'U%\^U%\" quote$ "U%\'Y%\TH%\ss%\`a%\'a%\^a%\~a%\" quote$ "a%\r a\ae%\c c\`e%\'e%\^e%\" quote$ "e%\`\i\'\i\^\i\" quote$ "\i\dh%\~n%\`o%\'o%\^o%\~o%\" quote$ "o%%%%%\o %\`u%\'u%\^u%\" quote$ "u%\'y%\th%\" quote$ "y%" * * * * * * * * * * * * * * * * * * * * * * * * 'acc4.latin1.160 :=
  "%%%%\k A\u{}\L %%%%%\v L\'S%\S %\" quote$ "{}\v S\c S\v T\'Z%%%%%\v Z\.Z%%%%%\k a\k\ \l %\'{}\v l\'s%\v{}\c\ \v s\c s\v t\'z%\H{}\v z\.z%\'R%\'A%\^A%\u A\" quote$ "A%\'L%\'C%\c C\v C\'E%\k E\" quote$ "E%\v E\'I%\^I%\v D\DJ%\'N%\v N\'O%\^O%\H O\" quote$ "O%%%%%\v R\r U\'U%\H U\" quote$ "U%\'Y%\c T\ss%\'r%\'a%\^a%\u a\" quote$ "a%\'l%\'c%\c c\v c\'e%\k e\" quote$ "e%\v e\'\i\^\i\v d\dj%\'n%\v n\'o%\^o%\H o\" quote$ "o%%%%%\v r\r u\'u%\H u\" quote$ "u%\'y%\c t\.{}" * * * * * * * * * * * * * * * * * * 'acc4.latin2.160 :=
}
%** @param #1 string
%** @return string
FUNCTION {rmacc4.latinx} { % ****pts****
  'tt :=
  "" 'ss :=
  { tt "" = not } { % Dat: empty$ is true for space
    #1
    { duplicate$ tt swap$ #1 substring$
      duplicate$ "" = { pop$ #0 } { chr.to.int$ #160 < } if$
    } { #1 + } while$
    duplicate$ tt swap$ #1 swap$ #1 -  substring$
    % duplicate$ ";" * warning$
    ss swap$ * 'ss :=
    duplicate$ tt swap$ #1 substring$
    duplicate$ "" = { pop$ } {
      % chr.to.int$ #159 -  acc.160 swap$ #1 substring$
      duplicate$ chr.to.int$
      acc4.160 swap$ duplicate$ + duplicate$ + #639 - #4 substring$
      duplicate$ "%%%%" = {
        pop$
      } {
        swap$ pop$
        duplicate$ #4 #1 substring$ "%" = { #1 #3 substring$ } 'skip$ if$
        "{" swap$ * "}" *
      } if$
      ss swap$ * 'ss :=
      #1 +
    } if$
    tt swap$ global.max$ substring$ 'tt :=
    % tt warning$
  } while$
  ss
}

%** Changes "á" to "{\'a}" etc.
%** @param #1 a string
%** @return a string
FUNCTION {rmacc4} { % **** pts ****
  inputenc empty$ 'skip$ {
    inputenc "latin1" = { acc4.latin1.160 'acc4.160 :=  rmacc4.latinx } 'skip$ if$
    inputenc "latin2" = { acc4.latin2.160 'acc4.160 :=  rmacc4.latinx } 'skip$ if$
  } if$
}

INTEGERS { acc.fwd }
%** Changes "fo{\'o}h{\H u}s" to "fo\'oh\H us". Helps keeping ligatures.
%** Changes `{\ae}' to `\ae ' and `{\\XY}' to `\XY '
%** Changes only known accents inside braces, followed by 1 or 2 accented
%** letters.
%** Dat: previous \oe must be inserted as {\\oe}, the same for {\DH} etc.
%** @param #1 string
%** @return string
FUNCTION {rmbrace.accs} { % ****pts****
  % Dat: LaTeX non-alphanumeric accents \`\'\^\~\"\=\.
  % Dat: LaTeX accents for purify$: \c\u\v\H\d\b\t\r
  % Dat: specially removed: {\?...} -> ...
  'tt :=
  "" 'ss :=
  { tt "" = not } {
    #1
    { duplicate$ tt swap$ #2 substring$
      duplicate$ "" = { pop$ #0 } { "{\" = not } if$
    } { #1 + } while$
    duplicate$ tt swap$ #1 swap$ #1 -  substring$
    % duplicate$ ";" * warning$
    ss swap$ * 'ss :=

    duplicate$ tt swap$ #2 + #1 substring$
    "}" = { #3 } {
      duplicate$ tt swap$ #3 + #1 substring$
      "}" = { % `{\i}' etc.
        duplicate$ tt swap$ #2 + #1 substring$
	duplicate$ "o" = {#4} {
	duplicate$ "O" = {#4} {
	duplicate$ "l" = {#4} {
	duplicate$ "L" = {#4} {
	duplicate$ "i" = {#4} {
	duplicate$ "j" = {#4} {
	#3} % Dat: disallow other {\X}
	if$} if$} if$} if$} if$} if$
	swap$ pop$
      } {
        duplicate$ tt swap$ #4 + #1 substring$
         "}" = { #5 } {
          duplicate$ tt swap$ #5 + #1 substring$
          "}" = { #6 } { #3 } if$
        } if$
      } if$
    } if$
    'acc.fwd :=
    % Status: offset-of-"\{"
    %%acc.fwd int.to.str$ warning$
    acc.fwd #3 = {
      duplicate$ tt swap$ acc.fwd substring$ % copy 3 bytes
    } {
      duplicate$ #1 + tt swap$ acc.fwd #2 - substring$ % keep "\'o" or "\H u" only
      %%duplicate$ warning$
      duplicate$ "\oe" = {#5} {
      duplicate$ "\OE" = {#5} {
      duplicate$ "\ae" = {#5} {
      duplicate$ "\AE" = {#5} {
      duplicate$ "\aa" = {#5} {
      duplicate$ "\AA" = {#5} {
      duplicate$ "\th" = {#5} {
      duplicate$ "\TH" = {#5} {
      duplicate$ "\dh" = {#5} {
      duplicate$ "\DH" = {#5} {
      duplicate$ "\dj" = {#5} {
      duplicate$ "\DJ" = {#5} {
      duplicate$ "\ng" = {#5} {
      duplicate$ "\NG" = {#5} {
      duplicate$ "\ss" = {#5} {
      duplicate$ "\SS" = {#5} {
      duplicate$ "\o"  = {#5} {
      duplicate$ "\O"  = {#5} {
      duplicate$ "\l"  = {#5} {
      duplicate$ "\L"  = {#5} {
      duplicate$ "\i"  = {#5} {
      duplicate$ "\j"  = {#5} {
        duplicate$ #2 #1 substring$
	duplicate$ "`" = {#1} {
	duplicate$ "'" = {#1} {
	duplicate$ "^" = {#1} {
	duplicate$ "~" = {#1} {
	duplicate$ quote$ = {#1} {
	duplicate$ "=" = {#1} {
	duplicate$ "." = {#1} {
	duplicate$ "c" = {#2} {
	duplicate$ "u" = {#2} {
	duplicate$ "v" = {#2} {
	duplicate$ "H" = {#2} {
	duplicate$ "d" = {#2} {
	duplicate$ "b" = {#2} {
	duplicate$ "t" = {#2} {
	duplicate$ "r" = {#2} {
	duplicate$ "?" = {#3} {
	duplicate$ "\" = {#4} { % added at Mon May 17 15:39:30 CEST 2004
	#0} if$} if$} if$} if$} if$} if$} if$} if$} if$}
	    if$} if$} if$} if$} if$} if$} if$} if$
	% Stack: "\'o" "'" 0|1|2
	swap$ pop$
      } if$} if$} if$} if$} if$} if$} if$} if$} if$} if$} if$} if$} if$} if$}
        if$} if$} if$} if$} if$} if$} if$} if$

      % Stack: "\'o" 0|1|2|3
      duplicate$ #5 = {
        pop$ " " * % `{\oe}' becomes `\oe '
      } { duplicate$ #4 = {
        pop$  #2 global.max$ substring$ % include single  backlsash
        " " * % add space so `{\\th}' becomes `\th '
      } { duplicate$ #3 = {
	pop$  #3 global.max$ substring$
      } { duplicate$ #2 = {
	  pop$
	  duplicate$ #3 #1 substring$
	  " " =
	} 'skip$ if$
	% Stack: "\'o" 0|1
	'skip$  { "{" swap$ * "}" * } if$
      } if$ } if$ } if$
    } if$
    ss swap$ * 'ss :=
    acc.fwd + tt swap$ global.max$ substring$ 'tt :=
  } while$
  ss
}

% ---

INTEGERS { output.state before.all mid.sentence after.sentence after.block
  cur.adr.char after.authors }
STRINGS { s t ls rs }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'after.authors :=
}


FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
	{ add.period$ write$
	  newline$
	  "\bibNewBlock " write$
	}
	{ output.state before.all =
	    'write$
            { output.state after.authors =
                { write$  newline$  "\bibNewBlock " write$ }
	        { add.period$ " " * write$ }
              if$
            }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$
      nocheck empty$ { "empty " t * " in " * cite$ * warning$ } {} if$
    }
    'output.nonnull
  if$
}

% @return a string
FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  inputenc empty$ {} { " \bibInputEncoding{" inputenc "}" * * write$ } if$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
  inputenc empty$ 'skip$ { "\bibResetInputEncoding" write$ newline$ } if$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

% ****pts****
FUNCTION {new.block.authors} {
  duplicate$ empty$ 'skip$ { ":" * } if$
  output.state before.all =
    'skip$
    { after.authors 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.isbn}
{ isbn empty$
    { "" }
    { new.block "ISBN " isbn * }
  if$
}

FUNCTION {format.issn}
{ issn empty$
    { "" }
    { new.block "ISSN " issn * }
  if$
}

%** <string-of-length-1> is.url.split.char <0-or-1>
%** Is the spefified char candidate to split the URL at?
FUNCTION {is.url.split.char} {
  duplicate$ "/" = { pop$ #1 } {
  duplicate$ "." = { pop$ #1 } {
  duplicate$ "?" = { pop$ #1 } {
  duplicate$ "&" = { pop$ #1 } {
  duplicate$ "-" = { pop$ #1 } {
  pop$ #0 } if$ } if$ } if$ } if$ } if$
}

%** <string> string.length <length>
%** Imp: a faster implementation
%** Dat: destroys 'ls
FUNCTION {string.length} {
  'ls :=
  #1
  { duplicate$ ls swap$ #1 substring$  "" =  #1 swap$ - }
  { #1 + } while$
  #1 -
  "" 'ls :=
}


INTEGERS { last.split.ofs }

%** <url> split.url <url-with-spaces>
%** We have to add spaces (works with \usepackage{url}), because otherwise
%** bibtex adds a % at column 79.
%** After a maxinmum of 71 chars, a space gets inserted.
%** Clobbers 'ss, 'ls and 'rs.
FUNCTION {split.url} {
  % We add spaces after the last is.url.split.char
  'ss := % save original string
  #0 'last.split.ofs := % Dat: last offset to split _after_
  "" 'rs :=
  #1 % loop variable
  { duplicate$ ss swap$ #1 substring$  "" =  #1 swap$ - } % more chars in ss
  { duplicate$ ss swap$ #1 substring$ is.url.split.char {
      duplicate$ 'last.split.ofs :=
    } 'skip$ if$
    duplicate$ #70 > {
      last.split.ofs #0 = {
        duplicate$ 'last.split.ofs := % Dat: split at any char if cannot split at good position
      } 'skip$ if$
      rs  ss #1 last.split.ofs substring$ " " * * 'rs :=
      ss last.split.ofs #1 + ss string.length substring$ 'ss :=
      %% ss warning$
      last.split.ofs - #1 + % decrement loop variable
      %% duplicate$ warning$
      #0 'last.split.ofs :=
    } { #1 + } if$
  } while$
  pop$ % Dat: pop loop variable
  rs ss *
  "" 'ss :=
  "" 'rs :=
}

FUNCTION {output.url} {
  url empty$
    { "" }
    { new.block "" output.nonnull
      before.all 'output.state :=
      newline$ % Dat: bibtex breaks lines -- let it be longer
      "\bibUrll{URL} >" url split.url * ">" * }
  if$ output
  ctan-url empty$
    { "" }
    { new.block "" output.nonnull
      before.all 'output.state :=
      newline$ % Dat: bibtex breaks lines -- let it be longer
      "\bibUrll{CTAN} >" ctan-url split.url * ">" * }
  if$ output
  tetex-url empty$
    { "" }
    { new.block "" output.nonnull
      before.all 'output.state :=
      newline$ % Dat: bibtex breaks lines -- let it be longer
      "\bibUrll{te\TeX} >" tetex-url * split.url ">" * }
  if$ output
}

% ****pts****
STRINGS { nfmt0 nfmt1 nfmt2 nfmt3 }
STRINGS {firstname.fmt0 lastname.fmt0}
FUNCTION {init.nfmt0} {
  "ff" 'firstname.fmt0 :=
  "ll" 'lastname.fmt0 :=
  % "f." 'firstname.fmt0 := % similar to abbrev.bst
}
FUNCTION {init.nfmts} {
  "{" firstname.fmt0 "~}{vv~}{" lastname.fmt0 "}{, jj}" * * * * 'nfmt0 :=% 0: English order
  "{jj~}{vv~}{" lastname.fmt0 "}{~" firstname.fmt0 "}" * * * * 'nfmt1 := % 1: Hungarian name in Hungarian bib
  "{vv~}{" lastname.fmt0 "}{, " firstname.fmt0 "}{, jj}" * * * * 'nfmt2 := % 2: English name in Hungarian bib
  "{jj~}{vv~}{ll}{~f.}" 'nfmt3 := % 3: Hungarian name in Hungarian bib, abbreviated name
}

FUNCTION {format.names}
{ rmacc4 's := % ****pts****
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  { namesleft #0 > } {
    % ****pts****
    huname empty$ { s nameptr nfmt0 format.name$ 't := }{ % empty: English order
    huname "0" =  { s nameptr nfmt0 format.name$ 't := }{ % 0: English order
    huname "1" =  { s nameptr nfmt1 format.name$ 't := }{ % 1: Hungarian name in Hungarian bib
    huname "2" =  { s nameptr nfmt2 format.name$ 't := }  % 2: English name in Hungarian bib
                  { s nameptr nfmt3 format.name$ 't := }  % 3: Hungarian name in Hungarian bib, abbreviated name
    if$ }if$ }if$ }if$
    % ^^^ Dat: important to have no space in {ll} for "others"
    t rmbrace.accs 't := % ****pts****
    nameptr #1 >
      { namesleft #1 >
	  { "\bibAnd 0" * t * }
	  { % numnames #2 > { "," * } 'skip$ if$ % ****pts****
	    %% t ";;" * warning$
	    t "others" =
	      { "\bibEtAl ." * }
	      { numnames #2 > { "\bibAnd 2" } { "\bibAnd 1"} if$ * t * }
	    if$
	  }
	if$
      }
      't
    if$
    %% t warning$
    nameptr #1 + 'nameptr :=
    namesleft #1 - 'namesleft :=
  } while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 > { "\bibEd 1" } { "\bibEd 0" } if$ * %****pts****
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title rmacc4 "t" change.case$ rmbrace.accs } % Dat: ****pts**** get used to it in English...
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
	{ t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    {   { t #1 #1 substring$ "-" = }
		{ "-" *
		  t #2 global.max$ substring$ 't :=
		}
	      while$
	    }
	  if$
	}
	{ t #1 #1 substring$ *
	  t #2 global.max$ substring$ 't :=
	}
      if$
    }
  while$
}

% Dat: possible months formats in .bib:
%   month = jun # "-" # aug,   --> "j\'unius--\allowbreak augusztus" !!
%   month = jun,               --> "j\'unius"
%   month = "8~" # feb,        --> "február 8."
%   month = nov # ", " # dec,  --> "november\nobreak\hskip--\allowbreak december"

FUNCTION {format.date}
{ year empty$
    { month empty$
	{ "" }
	{ "there's a month but no year in " cite$ * warning$
	  month
	}
      if$
    }
    { month empty$
	'year
	{ year ".\ " *
          month #1 "{ll}{~ff.}" format.name$ % convert "december" -> "december"; "5~december" -> "december~5."
          % ^^^ !! convert "janu\'ar--febru\'ar" and "janu\'ar, febru\'ar" to "j--f"...
          % ^^^ !! convert . to \hbox{.} at end, to have frenchspacing...
          * } % !! date
      if$
    }
  if$
}

FUNCTION {format.btitle}
{ title rmbrace.accs emphasize
}

%** <a> <b> tie.or.space.connect "<b><conc><a>"
%** <conc> is ~ if <b> is long (>=3 normal letters)
FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {numpages.output} { % ****pts****
  numpages empty$ 'skip$ {
    numpages "p." tie.or.space.connect output
  } if$
}

FUNCTION {note.output} { % ****pts****
  note empty$ 'skip$ { note rmbrace.accs output.nonnull } if$
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.series} { % ****pts****
  series empty$ { "" } {
    series
    type$ "inproceedings" = type$ "proceedings" = or
    { " kon\-fe\-ren\-cia\-so\-ro\-zat" } { " sorozat" } if$
    *
  } if$
}

% Dat: INCOLLECTION: number = 23, series = "Fast Computers",
FUNCTION {format.bvolume} { % ****pts****
  volume empty$  number empty$ and {
    series empty$ 'skip$ { format.series output new.block } if$
    % ^^^ Dat: don't emphasize {Osiris kézikönyvek sorozat}, because it's after the book title.
    numvolumes empty$ { "" }
    { "\bibNumVolumes {" numvolumes "}." * * } if$ % ****pts****
  } {
    "numvolumes and volume/number" numvolumes either.or.check
    series empty$ 'skip$ { format.series output } if$ % Dat: no new.block
    number empty$
    { volume }
    { "volume and number" volume either.or.check  number } if$
    n.dashify
    duplicate$ #-1 #1 substring$ "-" =  'skip$  'add.period$  if$
    "\bibVolume {" swap$ * "}." *
  } if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
	{ edition rmacc4 "l" change.case$ }
	{ edition rmacc4 "t" change.case$ }
      if$
      add.period$
      " kiad." * % Dat: " kiad.": Gyurgyák János: Szerkesztõk és szerzõk kézikönyve, 533. oldal, 2. sor.
    }
  if$
}

% Dat: `FUNCTION {multi.page.check}' not needed

%** Used by type$ {inbook} and {incollection}
%** English typography has:
%**   pages 23--45 (pages={23--45})
%**   pp. 23--45. (pages={23--45})
%**   p. 23. (pages=={23}: on page 23)
%**   p. 234 (numpages=234: the book has 234 pages)
%** Hungarian typography has:
%**   234 p. (numpages=234)
%**   23--45. p (pages={23--45})
%**   23. p. (pages=23)
FUNCTION {format.pages} { % ****pts****
  pages empty$
    { "" }
    { pages add.period$ n.dashify "p." tie.or.space.connect }
  if$
}

FUNCTION {volume.caption} { % ****pts****
  volumeisyearly empty$ { "1" } { volumeisyearly } if$  % default is "1"
  "0" = { "k\" quote$ "otet" * * } { "\'evf." } if$
}

FUNCTION {format.vol.num.pages} { % ****pts****
  volume duplicate$ empty$ { pop$ "" } {
    add.period$
    volume.caption % "\'evf."
    tie.or.space.connect } if$
  year empty$ {
    nocheck empty$ { "empty year in " cite$ * warning$ } 'skip$ if$
  } {
    duplicate$ empty$
    { pop$ format.date add.period$ }
    { " (" * format.date * ")" * } if$
  } if$
  number empty$ 'skip$ {
    duplicate$ empty$ 'skip$ { " " * } if$
    volume empty$ nocheck empty$ and { "there's a number but no volume in " cite$ * warning$ } 'skip$ if$
    number add.period$ "sz." tie.or.space.connect  *
  } if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    { "" } % 'format.pages
    { chapter
      type empty$ { "fejezet" } {
      type "subsection" = { "alszakasz" } {
      type "subsubsection" = { "alalszakasz" } {
      type "chapter" = { "fejezet" } {
      type "section" = { "szakasz" } {
      type "part" = { "r{\'e}sz" } {
      type "appendix" = { "f{\" quote$ "u}ggel{\'e}k" * * } {
      type rmacc4 "l" change.case$ } if$ } if$ } if$ } if$ } if$ } if$ } if$
      tie.or.space.connect
      % Dat: no format.pages here % ****pts****
    }
  if$
}

FUNCTION {format.in.edited} { % ****pts****
  editor "self" = % ****pts****
  { "\bibInSelf0" }
  { "In " format.editors * ": " * } if$
  booktitle rmbrace.accs emphasize *
}

FUNCTION {format.in.ed.booktitle} {
  booktitle empty$
  { "" }
  { editor empty$
    % vvv "In ": Gyurgyák János: Szerkesztõk és szerzõk kézikönyve, 130. oldal, 12. sor.
    { "In " booktitle rmbrace.accs emphasize * }
    'format.in.edited if$
  } if$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}


%* @param #1 a string beginning with a possibly accented letter
%* @return "" or "z", corresponding to the Hungarian definite article "a" and "az"
FUNCTION {article.az} {
  rmacc4 % remove accents smartly
  purify$
  "l" change.case$
  #1 #1 substring$
  duplicate$ " " = {"z"} { % hack
  duplicate$ "a" = {"z"} {
  duplicate$ "e" = {"z"} {
  duplicate$ "i" = {"z"} {
  duplicate$ "o" = {"z"} {
  duplicate$ "u" = {"z"} {
  ""} if$ }if$ }if$ }if$ }if$ }if$
  swap$ pop$
}

%** by pts@fazekas.hu at Thu Nov  9 17:03:00 CET 2006
%** @example "foo}" split.last.brace "foo" "}"
%** @example "food" split.last.brace "food" ""
FUNCTION {split.last.brace} {
  duplicate$ #-1 #1 substring$ "}" =
    { duplicate$ string.length #1 - #1 swap$ substring$ "}" }
    { "" } if$
}

%** by pts@fazekas.hu at Thu Nov  9 17:03:00 CET 2006
%** Clobbers 'rs and 'ls
%** @example "foobar"  "bar" replace.at.end "foo" 1
%** @example "foobar!" "bar" replace.at.end "foobar!" 0
FUNCTION {remove.at.end} {
  'rs := % save pattern string % Dat: string.length destroys 'ls
  duplicate$  rs string.length #-1 swap$
   substring$ rs =
    { duplicate$ string.length rs string.length - #1 swap$  substring$ #1 }
    { #0 } if$
}

FUNCTION {format.in.talked.booktitle} {
  booktitle empty$
  { "" }
  { editor empty$
    { 
      booktitle duplicate$ 's :=
      "A "  swap$ #2 swap$ chop.word
      "Az " swap$ #3 swap$ chop.word
      %% duplicate$ warning$
      s = {
        "a" booktitle article.az *
        booktitle rmbrace.accs emphasize
        tie.or.space.connect
      } { booktitle rmbrace.accs emphasize } if$
      % Dat: now: "a~{\em Foo Konferencia}"
      split.last.brace
      swap$
      % Dat: now "}" "a~{\em Foo Konferencia"
      % vvv Imp: maybe we don't need \- here, because it
      %     prevents hyphenation in earlier parts of the word
      "Conference" remove.at.end { "Con\-fe\-ren\-ce-en" * swap$ * } {
      "conference" remove.at.end { "con\-fe\-ren\-ce-en" * swap$ * } {
      "Konferencia" remove.at.end { "Kon\-fe\-ren\-ci\'an" * swap$ * } {
      "konferencia" remove.at.end { "kon\-fe\-ren\-ci\'an" * swap$ * } {
      swap$ * " c{\'i}m{\H u} konferenci{\'a}n" *
      } if$ } if$ } if$ } if$
      %% duplicate$ warning$
      % Dat: now "a~{\em Foo Konferencián}"
      %       or "a~{\em Foo} címû konferencián"
      %% "alma" string.length warning$
      "Elhangzott " swap$ *
   } 'format.in.edited if$
  } if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

%** @param #1 default value for `type'
FUNCTION {format.thesis.type} { % ****pts****
  type empty$ 'skip$ { pop$ type } if$
  rmacc4  "t" change.case$  rmbrace.accs
}

FUNCTION {format.tr.number} % ****pts****
{ type empty$
    { "{\bibTechRep 0}" } % Dat: `{'..`}' to avoid "t" change.case$
    'type
  if$
  number empty$
    { rmacc4 "t" change.case$ }
    { number add.period$ swap$ tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
	{ "need key or journal for " cite$ * " to crossref " * crossref *
	  warning$
	  ""
	}
	{ "In {\em " journal * "\/}" * }
      if$
    }
    { "In " key * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " \bibEtAl ." * }
    { #2 <
	'skip$
	{ editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
	    { " \bibEtAl ." * }
	    { " \'es " * editor #2 "{vv~}{ll}" format.name$ * } % !!
	  if$
	}
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ series empty$
	    { "need editor, key, or series for " cite$ * " to crossref " *
	      crossref * warning$
	      "" *
	    }
	    { "{\em " * series * "\/}" * }
	  if$
	}
	{ key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ booktitle empty$
	    { "need editor, key, or booktitle for " cite$ * " to crossref " *
	      crossref * warning$
	      ""
	    }
	    { "In {\em " booktitle * "\/}" * }
	  if$
	}
	{ "In " key * }
      if$
    }
    { "In " format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {article} %*type* ****pts****
{ output.bibitem
  format.authors "author" output.check
  new.block.authors
  format.title "title" output.check
  new.block
  crossref missing$
  { journal emphasize "journal" output.check
    format.vol.num.pages output % format.date is inside this
  }
  { format.article.crossref output.nonnull
  } if$
  format.pages output
  format.issn output
  output.url
  new.block numpages.output note.output
  fin.entry
}

% copied from KOMA-Script
% by pts at Thu Oct 30 09:56:33 CET 2003

% !! how does it work and why?
FUNCTION {print.adrchr}
{ adr.char empty$ 'skip$ { % ****pts**** Dat: default
  adr.char chr.to.int$ cur.adr.char >
  { newline$ "\adrchar{" adr.char "}" * * write$ newline$
    adr.char chr.to.int$ 'cur.adr.char :=
  }
  'skip$
  if$
  } if$ % !!
}

FUNCTION {get.names}
{ name empty$
  { organization empty$
    { "{}{}" }
    { organization "{}" * }
    if$
  }
  { "{" name #1 "{ll}" format.name$ "}" * *
    "{" name #1 "{ff}{ vv}" format.name$ "}" * * *
  }
  if$
}

%** Dat: deliberately with `sss', to avoid conflict
FUNCTION {addresss} { %*type*
  % !! many improvements
  output.bibitem pop$
  print.adrchr % !!
  "\adrentry" write$
  get.names write$ newline$
  "{"
  street empty$
    { "" }
    { street " \\ " *}
    if$
  *
  zip empty$
    { "" }
    { zip }
    if$
  " " * *
  city empty$
    { "" }
    { city }
    if$
  "}{" * *
  phone empty$
    {
      mobile empty$
        { "" }
        { mobile }
      if$
    }{
      mobile empty$
        { phone }
        { phone "\\" mobile * * }
      if$
    }
    if$
  "}{}{}{}{" * *
  key empty$
    { "" }
    { key }
    if$
  "}" * * write$ newline$
}


% ---

%** Used by type$ {book}, {inbook} and {incollection}
FUNCTION {books.tail} { % ****pts****
  crossref missing$ {
    format.bvolume output % includes functionality of format.number.series
    new.block % no comma in `1--4. köt., 7. kiad.'
  } 'skip$ if$
  type$ "book" = {
    chapter empty$  'skip$
    { "can't use chapter for @book; try @inbook or @incollection" warning$ } if$
  } {
    format.chapter.pages
    pages empty$ { "chapter and pages" output.check } {output} if$
    new.block % new.sentence? -- for incollection
  } if$
  author2 empty$ 'skip$ { author2 output.nonnull new.block } if$
  format.edition output new.block
  crossref missing$ {
    % format.bvolume output
    % new.block
    % format.number.series output % ****pts****
    % new.sentence
    address output
    format.date "year" output.check
    publisher "publisher" output.check
  } {
    format.date "year" output.check
    new.block
    format.book.crossref output.nonnull
  } if$
  format.pages output
  format.isbn output
  format.issn output % Dat: most books don't have this
  output.url
  new.block numpages.output note.output fin.entry
}

FUNCTION {book} { %*type*
  output.bibitem
  author empty$
    { editor empty$ key missing$ { "" } { key } if$ "." = and
      'skip$
      { format.editors "author and editor" output.check } if$
    }
    { format.authors output.nonnull
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  new.block.authors
  format.btitle "title" output.check
  new.block
  books.tail
}

FUNCTION {booklet} { %*type* ****pts****
  output.bibitem
  format.authors output
  new.block.authors
  format.title "title" output.check
  new.block
  format.bvolume output new.block
  author2 output.nonnull new.block
  format.edition output new.block
  % howpublished address new.block.checkb
  howpublished output
  address output
  % Dat: no publisher=
  format.date output
  format.isbn output
  format.issn output % Dat: most books don't have this
  output.url
  new.block numpages.output note.output fin.entry
}

FUNCTION {inbook} %*type*
{ book % ****pts****
}

FUNCTION {incollection} %*type*
{ output.bibitem
  format.authors "author" output.check
  new.block.authors
  format.title "title" output.check
  new.block
  crossref missing$
  { format.in.ed.booktitle "booktitle" output.check  new.block }
  { format.incoll.inproc.crossref output.nonnull } if$
  books.tail
}

%** @param #1 thesis type
FUNCTION {thesises.tail} { % ****pts****
  format.thesis.type output.nonnull
  school empty$ { nocheck empty$ { "empty school in " * cite$ * warning$ } 'skip$ if$ } 'skip$ if$
  school empty$ address empty$ and  'skip$ {
    write$  before.all 'output.state := " ("
    % school output address ")" * output
    school ")" * output
    new.block
  } if$
  author2 empty$ 'skip$ { author2 output new.block } if$
  new.block
  address output
  format.date "year" output.check
  output.url
  new.block numpages.output note.output fin.entry
}

%** Emits a decapitalized title.
FUNCTION {mastersthesis} { %*type*
  output.bibitem
  format.authors "author" output.check
  new.block.authors
  format.title "title" output.check
  new.block
  "{Diplomaterv}" % "{Doktori} {{\'e}rtekez{\'e}s} " % "Master's thesis" 
  thesises.tail
}

%** Emits an \emph-asized title.
FUNCTION {phdthesis} { %*type*
  output.bibitem
  format.authors "author" output.check
  new.block.authors
  format.btitle "title" output.check
  new.block
  "{PhD} {\'e}rtekez{\'e}s " % "PhD thesis" 
  thesises.tail
}

FUNCTION {misc} %*type* % ****pts****
{ output.bibitem
  format.authors output
  title empty$  howpublished empty$ and 'skip$ {
    new.block.authors % Dat: emits ":"
    % title howpublished new.block.checkb % Dat: emits "."
    format.title output
    howpublished new.block.checka
    howpublished output
  } if$
  format.date output
  format.isbn output
  format.issn output % Dat: most books don't have this
  output.url
  new.block numpages.output note.output fin.entry
  empty.misc.check
}

FUNCTION {manual} %*type* ****pts****
{ output.bibitem
  author empty$
  { organization empty$
    'skip$
    { organization output.nonnull } if$
    new.block
  }
  { format.authors output.nonnull new.block.authors }
  if$
  format.btitle "title" output.check
  author2 empty$ 'skip$ { author2 output new.block } if$
  format.edition output new.block

  publisher empty$ 'skip$ { "can't use publisher for @manual; try @book" warning$ } if$
  author empty$
  { address output }
  { % organization address new.block.checkb
    organization output
    address output
  } if$
  format.edition output
  format.date output
  publisher output
  output.url
  new.block numpages.output note.output fin.entry
}


FUNCTION {techreport} %*type*
{ output.bibitem
  format.authors "author" output.check
  new.block.authors
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  author2 empty$ 'skip$ { author2 output new.block } if$
  address output
  format.date "year" output.check
  institution "institution" output.check
  output.url
  new.block numpages.output note.output fin.entry
}

FUNCTION {unpublished} %*type* % ****pts****
{ output.bibitem
  format.authors "author" output.check
  new.block.authors
  format.title "title" output.check new.block
  format.date output
  output.url
  new.block
  note "note" output.check
  fin.entry
}

FUNCTION {inproceedings} %*type*
{ output.bibitem
  format.authors "author" output.check
  new.block.authors
  format.title
    talked empty$ 'skip$ 'emphasize if$ % at Thu Nov  9 16:19:53 CET 2006
    "title" output.check
  new.block
  crossref missing$
  { talked empty$ 'format.in.ed.booktitle 'format.in.talked.booktitle if$
    duplicate$ #1 #1 substring$ "I" =  { % Dat: don't append to `Elhangzott' or empty booktitle
      series empty$ { duplicate$ empty$ 'skip$ { " (kon\-fe\-ren\-cia\-anyag)" * } if$ } 'skip$ if$
    } 'skip$ if$
    "booktitle" output.check
    format.bvolume output % includes functionality of format.number.series
    author2 empty$ 'skip$ { author2 output.nonnull new.block } if$
    new.block
    address output % ****pts****
    format.date "year" output.check
    % new.sentence
    organization output
    publisher output
  }
  { format.incoll.inproc.crossref output.nonnull }
  if$
  format.pages output
  format.isbn output
  format.issn output % Dat: most books don't have this
  output.url
  new.block numpages.output note.output fin.entry
}

FUNCTION {proceedings} %*type*
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  series empty$ { " (konferenciaanyag)" * } 'skip$ if$
  format.bvolume output % includes functionality of format.number.series
  author2 empty$ 'skip$ { author2 output.nonnull new.block } if$
  address empty$
    { editor empty$
	{ publisher new.sentence.checka }
	{ organization publisher new.sentence.checkb
	  organization output
	}
      if$
      publisher output
      format.date "year" output.check
    }
    { address output.nonnull
      format.date "year" output.check
      % new.sentence % ****pts****
      editor empty$
	'skip$
	{ organization output }
      if$
      publisher output
    }
  if$
  format.isbn output
  format.issn output % Dat: most books don't have this
  output.url
  new.block numpages.output note.output fin.entry
}

FUNCTION {conference} %*type* % ****pts****
{ inproceedings }

FUNCTION {default.type} { misc }

FUNCTION {fmts} { %*type* % ****pts****
  % Emulation of \bibtem without typesetting anything.
  newline$
  "\immediate\write\@auxout{\string\bibcite{" write$
  cite$ write$
  "}{0}}" write$ newline$
}
FUNCTION {fmts2} {
  firstname.fmt empty$ 'skip$ { firstname.fmt 'firstname.fmt0 := } if$
  lastname.fmt empty$ 'skip$ { lastname.fmt 'lastname.fmt0 := } if$
  init.nfmts
}

%****pts****
% Dat: {\-} is needed for format.name$
MACRO {jan} {"ja{\-}nu{\-}\'ar"}
MACRO {feb} {"feb{\-}ru\'ar"}
MACRO {mar} {"m\'ar{\-}cius"}
MACRO {apr} {"\'ap{\-}ri{\-}lis"}
MACRO {may} {"m\'a{\-}jus"}
MACRO {jun} {"j\'u{\-}ni{\-}us"}
MACRO {jul} {"j\'u{\-}li{\-}us"}
MACRO {aug} {"au{\-}gusz{\-}tus"}
MACRO {sep} {"szep{\-}tem{\-}ber"}
MACRO {oct} {"ok{\-}t\'o{\-}ber"}
MACRO {nov} {"no{\-}vem{\-}ber"}
MACRO {dec} {"de{\-}cem{\-}ber"}

% Dat: see also in mrabbrev.bib
MACRO {acmcs} {"ACM Computing Surveys"}
MACRO {acta} {"Acta Informatica"}
MACRO {cacm} {"Communications of the ACM"}
MACRO {ibmjrd} {"IBM Journal of Research and Development"}
MACRO {ibmsj} {"IBM Systems Journal"}
MACRO {ieeese} {"IEEE Transactions on Software Engineering"}
MACRO {ieeetc} {"IEEE Transactions on Computers"}
MACRO {ieeetcad} {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}
MACRO {ipl} {"Information Processing Letters"}
MACRO {jacm} {"Journal of the ACM"}
MACRO {jcss} {"Journal of Computer and System Sciences"}
MACRO {scp} {"Science of Computer Programming"}
MACRO {sicomp} {"SIAM Journal on Computing"}
MACRO {tocs} {"ACM Transactions on Computer Systems"}
MACRO {tods} {"ACM Transactions on Database Systems"}
MACRO {tog} {"ACM Transactions on Graphics"}
MACRO {toms} {"ACM Transactions on Mathematical Software"}
MACRO {toois} {"ACM Transactions on Office Information Systems"}
MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}
MACRO {tcs} {"Theoretical Computer Science"}

READ

%** @param #1 string
%FUNCTION {reverse} { %
%  't :=   "" 's :=
%  #1
%  { duplicate$ t swap$ #1 substring$ "" = not } {
%    duplicate$ t swap$ #1 substring$
%    s * 's :=
%    #1 +
%  } while$
%  pop$  s
%}

%** by pts@fazekas.hu at Mon May 17 16:50:26 CEST 2004
%** @param 1: TeX string
%** @return {\th}, {\TH} {\dh} {\DH} {\dj} {\DJ} {\ng} {\NG} {\SS} changed to
%**           th     TH    dh    DH    dj    DJ    ng    NG    SS
FUNCTION {rmbrace.extrat1} {
  % Dat: #4 #1 substring$ is substr($_,3,1)
  'ss :=
  "" 'tt :=
  #1 'len :=
  #5
  { duplicate$ ss swap$ #1 substring$ "" = not } {
    % Stack: index-value (#5, #6 ...)
    duplicate$ ss swap$ #1 substring$ "}" = {
      duplicate$ ss swap$	#4 - #5 substring$
      %% duplicate$ warning$
      duplicate$ "{\th}" = {#1} {
      duplicate$ "{\TH}" = {#1} {
      duplicate$ "{\dh}" = {#1} {
      duplicate$ "{\DH}" = {#1} {
      duplicate$ "{\dj}" = {#1} {
      duplicate$ "{\DJ}" = {#1} {
      duplicate$ "{\ng}" = {#1} {
      duplicate$ "{\NG}" = {#1} {
      duplicate$ "{\SS}" = {#1} {
      #0 }if$ }if$ }if$ }if$ }if$ }if$ }if$ }if$ }if$
    } {#42 #0} if$
    #1 = {
      swap$
      % Stack: 5-char-substring index-value
      duplicate$ tt swap$ ss swap$ len swap$  len - #4 - substring$ * 'tt :=
      swap$ tt swap$ #3 #2 substring$ * 'tt :=
      #1 +
      duplicate$ 'len :=
    } { pop$ #1 + } if$
  } while$
  pop$ % index value
  tt ss len global.max$ substring$ *
}


FUNCTION {sortify}
{ rmacc4 % remove accents smartly, so purify$ will remove the accent
  % rmbrace.accs
  duplicate$ % ****pts****
  rmbrace.extrat1 % ****pts****
  purify$
  % Dat: purify$ removes á from "várom", keeps `varom' in "v\'arom","v{\'a}rom"
  % Dat: purify$ changes {\ss} to ss, but {\dj} to empty
  "l" change.case$
  "  " *
  swap$ *
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
	{ "   " * }
	'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
	{ "et al" * }
	{ t sortify % Dat: calls rmacc4 and purify$
          %% duplicate$ warning$
          * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ rmacc4 't :=
  "A " #2
    "An " #3
      "The " #4
        "Egy " #4
        "Der " #4
        "Die " #4
        "Das " #4
        "Un " #3
        "Une " #4
          "Az " #3 t chop.word
  chop.word chop.word chop.word chop.word chop.word % ***pts****
        chop.word
      chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ name empty$
  { author empty$
    { key empty$
      { "to sort, need author/key/name in " cite$ * warning$
        title empty$ { "" } { title sort.format.title } if$ % ****pts****
      }{ key sortify }
      if$
    }{ author sort.format.names }
    if$
  }{ name sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
	{ key missing$
	    { title empty$ nocheck empty$ or
              { "to sort, need author, editor, or key in " cite$ * warning$ } 'skip$ if$
              title empty$ { "" } { title sort.format.title } if$ % ****pts****
	    }
	    { key "." = % ****pts****
              { " " title sort.format.title * } % duplicate$ warning$
              % ^^^ Dat: " " is here to put them in front of other books
              { key sortify } if$
            }
	  if$
	}
	{ editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
	{ key empty$
	    { "to sort, need author, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
	{ key empty$
	    { "to sort, need editor, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ type$ "book" =  type$ "inbook" =  or
    'author.editor.sort
    { type$ "proceedings" =
	'editor.organization.sort
	{ type$ "manual" =
	    'author.organization.sort
	    { type$ "fmts" =
	      { fmts2 "" } % ****pts****
	      'author.sort
	      if$
	    }
	  if$
	}
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

EXECUTE {init.accs4}
EXECUTE {init.nfmt0}
EXECUTE {init.nfmts}

ITERATE {presort}

SORT

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {bibIE.a} {
  "\makeatletter" write$ newline$
  "\global\def\bibIE@lowc{%" write$ newline$
  "  \expandafter\ifx\csname inputencoding\endcsname\relax" write$ newline$
  "    \def\NeedsTeXFormat##1]{}%" write$ newline$
  "    \def\ProvidesPackage##1]{}%" write$ newline$
  "    \def\DeclareOption##1##2{}%" write$ newline$
  "    \def\ProcessOptions{\@ifstar\@gobble\@empty}%" write$ newline$
  "    \input inputenc.sty" write$ newline$
  "    \let\NeedsTeXFormat \@notprerr" write$ newline$
  "    \let\ProvidesPackage\@notprerr" write$ newline$
  "    \let\DeclareOption  \@notprerr" write$ newline$
  "    \let\ProcessOptions \@notprerr" write$ newline$
  "  \fi" write$ newline$
  "  \global\let\bibIE@lowc\relax}" write$ newline$
  "\def\bibIE@lowa#1#2{%" write$ newline$
  "  \global\def\bibResetInputEncoding{\bibIE@lowb{ascii}}% anti-warning" write$ newline$
  "  \ifx#1\relax\else" write$ newline$
  "  \ifx#1\@inpenc@undefined@\@empty" write$ newline$
  "    \global\def\bibResetInputEncoding{\bibIE@lowb{#2}}%" write$ newline$
  "    \ifx\bibResetInputEncoding\reserved@a% keep old encoding" write$ newline$
  "      \global\let\bibResetInputEncoding\@empty \let\reserved@a\@empty \fi" write$ newline$
  "  \fi\fi}" write$ newline$
}
FUNCTION {bibIE.b} {
  "\let\bibIE@input\input" write$ newline$
  "\def\bibIE@ascii{ascii}" write$ newline$
  "\def\bibIE@lowb#1{%" write$ newline$
  "  \def\reserved@a{#1}\ifx\reserved@a\bibIE@ascii" write$ newline$
  "    \gdef\@inpenc@test{\global\let\@inpenc@test\relax}%" write$ newline$
  "    \edef\@inpenc@undefined{\noexpand\@inpenc@undefined@{ascii}}%" write$ newline$
  "    \@inpenc@loop\^^A\^^H\@inpenc@loop\^^K\^^K%" write$ newline$
  "    \@inpenc@loop\^^N\^^_\@inpenc@loop\^^?\^^ff%" write$ newline$
  "\else\def\input{\global\let\@inpenc@test\relax \bibIE@input}% no {ascii} warn" write$ newline$
  "  \inputencoding{#1}\fi}%" write$ newline$
  "\def\bibInputEncoding#1{%" write$ newline$
  "  \bibIE@lowc" write$ newline$
  "  \def\reserved@a{\bibIE@lowb{#1}}%" write$ newline$
  "  % vvv \@inpenc@undefined -> `\@inpenc@undefined@{latin2}' or undefined" write$ newline$
  "  \expandafter\expandafter\expandafter\bibIE@lowa\csname" write$ newline$
  "    @inpenc@undefined\endcsname\relax" write$ newline$
  "  \reserved@a}" write$ newline$ newline$
}

%** Usage: insert `\let\bibEarlyBegin\hfuzz \InputIfFileExists{\jobname.bbl}{}{}'
%** into the LaTeX document preamble to avoid running latex(1) twice after
%** bibtex(1) has been run.
FUNCTION {bibIE.c} {
  "\makeatletter \ifx\bibEarlyBegin\hfuzz" write$ newline$
  "  \def\bibEarlyBegin{\begingroup\everypar{}\sloppy\hbadness10000 " write$ newline$
  "    \def\Hy@colorlink##1{\begingroup}" write$ newline$  % for hyperref.sty
  "    \def\Hy@endcolorlink{\endgroup}" write$ newline$    % for hyperref.sty
  "    \def\@inpenc@loop##1##2{}" write$ newline$
  "    \def\thebibliography##1{}" write$ newline$
  "    \def\endthebibliography{\skip@egroup\aftergroup\bibEarlyEnd}%" write$ newline$
  "    \def\inputencoding##1{}\c@enumi\z@" write$ newline$
  "    \def\bibitem{\skip@egroup \let\skip@egroup\egroup" write$ newline$
  "      \advance\c@enumi\@ne\@ifnextchar[\@lbibitem\@bibitem}%" write$ newline$
  "    \def\@lbibitem[##1]##2{\bibcite{##2}{##1}%" write$ newline$
  "      \setbox0\vbox\bgroup}% avoid emitting boxes" write$ newline$
  "    \def\@bibitem##1{\expandafter\skip@bibcite\expandafter" write$ newline$
  "      {\the\c@enumi}{##1}\setbox0\vbox\bgroup}% avoid emitting boxes" write$ newline$
  "    \def\skip@bibcite##1##2{\bibcite{##2}{##1}}%" write$ newline$
  "    \catcode11=9 % ignored" write$ newline$
  "    \@tempcnta  1 \loop\catcode\@tempcnta=9" write$ newline$
  "      \ifnum\@tempcnta<  8 \advance\@tempcnta\@ne\repeat" write$ newline$
  "    \@tempcnta 14 \loop\catcode\@tempcnta=9" write$ newline$
  "      \ifnum\@tempcnta< 31 \advance\@tempcnta\@ne\repeat" write$ newline$
  "    \@tempcnta127 \loop\catcode\@tempcnta=9" write$ newline$
  "      \ifnum\@tempcnta<255 \advance\@tempcnta\@ne\repeat" write$ newline$
  "    \let\skip@egroup\relax}" write$ newline$
  "  \def\bibEarlyEnd{\endgroup \let\bibcite\@gobbletwo" write$ newline$
  "    \global\let\bibEarlyRead\relax}" write$ newline$
  "  \bibEarlyBegin" write$ newline$
  "\else \let\bibEarlyEnd\relax \fi" write$ newline$
  newline$
}

FUNCTION {begin.bib}
{ bibIE.c
  % Dat: bibTeX breaks long lines (>78 chars), so we wouldn't emit such lines
  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
  preamble$ empty$  'skip$  { preamble$ write$ newline$ } if$
  % ****pts**** Dat: put preamble$ after \begin{thebibliography}
  "\frenchspacing" write$ newline$ % !! optional
  bibIE.a
  bibIE.b
  "\def\leftflushbreak{\ifx\\\@centercr\penalty100 \else" write$ newline$ % Dat: \\ is \@centercr for \raggedright
  "  \unpenalty\unpenalty{\@tempdima\lastskip\unskip\nobreak" write$ newline$
  "  \hskip\@tempdima plus1fil}\null\penalty100 \hskip0pt plus-1fil\relax\fi}" write$ newline$
  % "\def\leftflushbreak{\nobreak\hskip0pt plus1fil\null\penalty100 \hskip0pt plus-1fil\relax}" write$ newline$

  % Ignoring newline + spaces in a \verb (usually called in \bibUrll).
  % This doesn't apply for \usepackage{url} -- please use that to have
  % line breaks in the URLs.
  % Example .bbl excerpt (to be converted to \bibUrll{URL} >http://foobarbaz>.)
  %   \bibUrll{URL} >http://
  %     foobar
  %     baz<,
  "\begingroup\lccode\string`~=\string`\^^M" write$ newline$
  "  \lowercase{\endgroup\def\verb@eol@error{\obeylines\def~{\bibVerbNoSp}}}" write$ newline$
  "\begingroup\lccode\string`~=\string`\ \relax" write$ newline$
  "  \lowercase{\endgroup\def\bibVerbNoSp#1{\ifx#1~\expandafter\bibVerbNoSp" write$ newline$
  "  \else\expandafter#1\fi}}" write$ newline$

  "\expandafter\ifx\csname bibUrll\endcsname\relax" write$ newline$
  "\expandafter\ifx\csname url\endcsname\relax" write$ newline$
  "     \def\bibUrll#1>{\leavevmode\leftflushbreak #1~\verb>}" write$ newline$ % Imp: line breaks etc., \PVerb
  "\else\def\bibUrll#1>{\leavevmode\leftflushbreak#1~\begingroup" write$ newline$
  "       \catcode\string`\%=12 \catcode\string`\#=12 \bibUrlll}" write$ newline$
  "     \def\bibUrlll#1>{\url{#1}\endgroup}\fi" write$ newline$
  % ^^^ "\else\def\bibUrll#1>#2>{\leftflushbreak #1~\url{#2}}\fi" write$ newline$
  % ^^^ Imp: do these parens work? Includes field URL for Internet addresses (best used with with the url.sty package of Donald Arseneau)
  "\fi" write$ newline$
  % vvv Dat: so user can specify `{\empty Maf}fia' and still have the `ffi' ligature -- undocumented.
  % vvv Dat: doesn't work with hyperref.sty, and has marginal benefits -- commented out
  % "\def\empty{\egroup\expandafter\@firstofone\expandafter{\iffalse}\fi}" write$ newline$
  "\def\bibHU@mix#1{\egroup#1}" write$ newline$
  %"\def\empty{\expandafter\bibHU@mix\expandafter{\iffalse}\fi}" write$ newline$
  %"\def\bibHU@mix#1{\egroup#1}" write$ newline$
  % vvv Dat: Hungarian typgrphy dictates 1/3 non-stretchable space, which
  %     might look ugly, because the space between f+l names stretches more.
  "\def\bibAnd#1{\nobreak\,\nobreak\hbox{--}\,}" write$ newline$
  % "\def\bibAnd#1{\ifcase#1 , \or\space and \or, and \fi}" write$ newline$
  % "\def\bibAnd#1{\ifcase#1 , \else\space\'es \fi}" write$ newline$
  % "\def\bibEtAl#1{ et~al.}" write$ newline$ % Dat: or `et al.' (meaning: et alii)
  "\def\bibEtAl#1{ \'es m\'asok}" write$ newline$
  % ^^^ Dat: botht \bibEtAl confirmed by Gyurgyák (p. 137)
  "\def\bibEd#1{ (szerk.)}" write$ newline$
  % "\def\bibEd#1{ (szerk\ifcase#1 .\else eszt\H{o}k\fi)}" write$ newline$ % (szerk.) or (szerkesztõk)
  % "\let\bibNewBlock\newblock" write$ newline$
  "\def\bibNewBlock{\unskip\space}" write$ newline$
  % "\def\bibVolume#1{k\" quote$ "otet}" * * write$ newline$
  "\def\bibVolume#1#2{#1 k\" quote$ "ot.} \let\bibNumVolumes\bibVolume" * * write$ newline$
  % "\def\bibTechRep#1{Technical Report}" write$ newline$
  "\def\bibTechRep#1{Jelent\'{e}s}" write$ newline$ % Dat: `.' után van => nagybetû
  "\def\bibInSelf#1{In u\H{o}: }" write$ newline$
  "\csname bibOverride\endcsname" write$ newline$
}


EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}

% #****pts**** !!
FUNCTION {what} {
  % "dr. Köpeczi, Béla and Jules Verne and Kossuth, Lajos and gróf Széchenyi, István and John von Neumann and Donald E. Knuth and Strunk, Jr., William and Knézy, ifj., Jenõ and L. R. McColvin and Tinódi Lantos, Sebestyén and Molnár-Sáska, Balázs and Claude Lévi-Strauss and Kis, Péter Pál and Mary-Claire van Leunen and Paul Gerhard Hoel and G. Bernard Godfrey and II., János-Pál and {Szerencsejáték Rt.} and {\empty Earl of} Traquair and Horace [pseud.] Hunt and Verne, {\empty Gy}ula" 's :=
  % init.nfmts  s #1 nfmt0 format.name$ warning$
  % ss #385 #1 substring$ warning$
  % "fo{\'o}\oe{\H u}s{\HON}{\HANT}" rmbrace.accs warning$ % to "fo\'o\oe\H us{\HON}{\HANT}"
  % "fr\'e ncia" purify$ warning$
  % "bar" #-1 #1 substring$ warning$
  % "5~janu\'ar" #1 "{ll~~}{ff{}}" format.name$ warning$
  % "janu\'ar" #1 "{ll}{~ff.}" format.name$ warning$
  % "{\null Gy}urgyák" #1 "{l}/" format.name$ warning$
  % "AzBÁrvíztûrõ~tükörfúrógép" rmacc.latin2 warning$
  % "fogbar" #3 #1 substring$ warning$
  % "Az Árvíztûrõõ tükörfúrógépí" sortify warning$
  % "Marjai, Imre and Pataky, Dénes" rmacc.latin2 warning$
  % "{\empty\'\i}purify" purify$ warning$
  % "grof Szechenyi, Istvan" #1 "{ll}/{ff}/{jj}/{vv}" format.name$ warning$
  % "John von Neumann" #1 "{ll}/{ff}/{jj}/{vv}" format.name$ warning$
  % "Tinódi Lantos, Sebestyén" #1 "{ll}/{ff}/{jj}/{vv}" format.name$ warning$
  % "II., Janos., Pal" #1 "{ll}/{ff}/{jj}/{vv}" format.name$ warning$
  % "álom" "u" change.case$ warning$ % "áLOM"
  % "{\'a}lom" "u" change.case$ warning$ % "{\'A}LOM"
  %"alma{\ss}t" purify$ warning$ % alma{\ss}t
  %"alma{\dj}t" purify$ warning$ % almat (!)
  % "egykor{\th}Alma korte" rmbrace.extrat1 warning$
}
EXECUTE {what}
