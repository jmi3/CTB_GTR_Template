\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CBTGTR}[2025/03/14 v3.2 CBT book class]
%%%%%%%
% v2.0 added:
%   english translation
%   namedbox environment
%   better colors
% v3.0 added:
%   bigname environment
%   inverted option that changes colors to white on black
% v3.1 added:
%   better colors
% v3.2 added:
%   repaired the problem with paging in the online option
%%%%%%%

% Define variables for envs
\def\NoSol{}
\def\Nameless{}
\def\BackgroundColor{white}
\def\TextColor{black}
\def\LemmishColor{lime}
\def\LemmaColor{green}
\def\TheoremColor{red}
\def\ClaimColor{cyan}
\def\DefinitionColor{teal}
\def\ProblemColor{purple}
\def\LawColor{pink}
\def\CorollaryColor{yellow}
\def\NamedboxColor{magenta}


% Define variables for envs
\def\LemmishText{Lemmátko }
\def\LemmaText{Lemma }
\def\TheoremText{Věta }
\def\CorollaryText{Důsledek }
\def\ClaimText{Tvrzení }
\def\DefinitionText{Definice }
\def\ProblemText{Problém }
\def\ProblemSolLinkText{Řešení }
\def\ProblemSolText{Řešení problému }
\def\LawText{Zákon }
\def\ProofText{Důkaz} %  ONLY ONE THAT MUST BE WITHOUT SPACE AFTER



\DeclareOption{czech}{
  % Define variables for envs
  \def\LemmishText{Lemmátko }
  \def\LemmaText{Lemma }
  \def\TheoremText{Věta }
  \def\CorollaryText{Důsledek }
  \def\ClaimText{Tvrzení }
  \def\DefinitionText{Definice }
  \def\ProblemText{Problém }
  \def\ProblemSolLinkText{Řešení }
  \def\ProblemSolText{Řešení problému }
  \def\LawText{Zákon }
  \def\ProofText{Důkaz} %  ONLY ONE THAT MUST BE WITHOUT SPACE AFTER  
  \PassOptionsToPackage{
    czech
  }{babel}
}

\DeclareOption{english}{
  % Define variables for envs
  \def\LemmishText{Lemmish }
  \def\LemmaText{Lemma }
  \def\TheoremText{Theorem }
  \def\CorollaryText{Corollary }
  \def\ClaimText{Claim }
  \def\DefinitionText{Definition }
  \def\ProblemText{Problem }
  \def\ProblemSolLinkText{Solution }
  \def\ProblemSolText{Solution of problem }
  \def\LawText{Law }
  \def\ProofText{Proof} %  ONLY ONE THAT MUST BE WITHOUT SPACE AFTER  
  \PassOptionsToPackage{
    english
  }{babel}
}


\DeclareOption{colored}{
  \def\LemmishColor{lime}
  \def\LemmaColor{green}
  \def\TheoremColor{red}
  \def\ClaimColor{cyan}
  \def\DefinitionColor{teal}
  \def\ProblemColor{purple}
  \def\LawColor{pink}
  \def\CorollaryColor{yellow}
  \def\NamedboxColor{magenta}
  \PassOptionsToPackage{
    colorlinks=true,   % Enable colored links
    linkcolor=blue,    % Color of internal links (e.g., to sections, lemmas)
    citecolor=green,   % Color of citation links
    urlcolor=cyan      % Color of external links (e.g., URLs)
    }{hyperref}  
}

% Define parameters
\DeclareOption{blackwhite}{
  \PassOptionsToPackage{
    colorlinks=false   % Disable colored links
  }{hyperref}
  \def\LemmishColor{gray}
  \def\LemmaColor{gray}
  \def\TheoremColor{gray}
  \def\ClaimColor{gray}
  \def\DefinitionColor{gray}
  \def\ProblemColor{gray}
  \def\LawColor{gray}
  \def\CorollaryColor{gray}
  \def\NamedboxColor{gray}
}


\DeclareOption{inverted}{
    \AtBeginDocument{
        \pagecolor{black!80!white}
        \color{black!5!white}
    }
    \def\TextColor{black!5!white}
    \def\BackgroundColor{black!80!white}
    \PassOptionsToPackage{
      colorlinks=true,   % Enable colored links
      linkcolor=violet!50!white,    % Color of internal links (e.g., to sections, lemmas)
      citecolor=green!80!white,   % Color of citation links
      urlcolor=cyan!80!white      % Color of external links (e.g., URLs)
      }{hyperref}  
}



\DeclareOption{online}{
  \PassOptionsToPackage{
    a4paper,            % Choose paper size
    twoside,            % Enable two-sided layout
    inner=22mm,         % Margin on the inside (binding side)
    outer=22mm,         % Margin on the outer side
    top=20mm,           % Top margin
    bottom=30mm,        % Bottom margin
    headsep=10mm,       % Space between header and text
    marginparwidth=20mm % Space for margin notes
  }{geometry}
  \AtBeginDocument{
    \let\cleardoublepage\clearpage % Disable starting chapters on the right page
  }
}
\DeclareOption{twosided}{
  \PassOptionsToPackage{
    a4paper,            % Choose paper size
    twoside,            % Enable two-sided layout
    inner=27mm,         % Margin on the inside (binding side)
    outer=17mm,         % Margin on the outer side
    top=20mm,           % Top margin
    bottom=30mm,        % Bottom margin
    headsep=10mm,       % Space between header and text
    marginparwidth=20mm % Space for margin notes
  }{geometry}  
}
\DeclareOption{onesided}{
  \PassOptionsToPackage{
    a4paper,            % Choose paper size
    left=27mm,          % Left margin for one-sided layout
    right=17mm,         % Right margin
    top=30mm,           % Top margin
    bottom=30mm,        % Bottom margin
    headsep=10mm,       % Space between header and text
    marginparwidth=20mm % Space for margin notes
  }{geometry}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

% Load the base class (book)
\LoadClass{book}

% Load the language
\RequirePackage{babel}

% Load fontspec for handling system fonts
\RequirePackage{fontspec}
\RequirePackage{lettrine}

% Load graphical packages
\RequirePackage[most]{tcolorbox}
\RequirePackage{graphicx}
\RequirePackage{framed}
\RequirePackage{xcolor}  
\RequirePackage{hyperref}
\RequirePackage{geometry}
\RequirePackage{enumitem}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{longtable}


% Load math packages
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{tensor}



\makeatletter
% Altered definition for numbered chapter headings
\renewcommand{\@makechapterhead}[1]{%
  \cleardoublepage
  \vspace*{0pt} % Space before the heading
  {\bfseries\Huge\hspace{-17pt}\thechapter. #1\par\nobreak\vspace{6pt}} % Formatting for numbered chapter headings
  \thispagestyle{plain} % Page style for numbered chapters
}

% Altered definition for unnumbered chapter headings (used by \chapter*)
\renewcommand{\@makeschapterhead}[1]{%
  \cleardoublepage
  \vspace*{0pt} % Space before the heading
  {\bfseries\Huge\hspace{-17pt}#1\par\nobreak\vspace{6pt}} % Formatting for unnumbered chapter headings
  \thispagestyle{plain} % Page style for unnumbered chapters
}
\makeatother




% Define counters for envs
\newcounter{lemmish}[section]
\renewcommand{\thelemmish}{\thesection.\arabic{lemmish}}
\newcounter{lemma}[section]
\renewcommand{\thelemma}{\thesection.\arabic{lemma}}
\newcounter{theorem}[section]
\renewcommand{\thetheorem}{\thesection.\arabic{theorem}}
\newcounter{claim}[section]
\renewcommand{\theclaim}{\thesection.\arabic{claim}}
\newcounter{definition}[section]
\renewcommand{\thedefinition}{\thesection.\arabic{definition}}
\newcounter{problem}[section]
\renewcommand{\theproblem}{\thesection.\arabic{problem}}
\newcounter{law}[section]
\renewcommand{\thelaw}{\thesection.\arabic{law}}
\newcounter{problemsol}[section]
\renewcommand{\theproblemsol}{\thesection.\arabic{problemsol}}
\newcounter{corollary}[section]
\renewcommand{\thecorollary}{\thesection.\arabic{corollary}}
\newcounter{namedbox}[section]
\renewcommand{\thenamedbox}{\thesection.\arabic{namedbox}}


% Define envs
\newenvironment{lemmish}[1][\Nameless]
{
  \refstepcounter{lemmish}\begin{tcolorbox}[
    arc=0mm,
    colback=\LemmishColor!5!\BackgroundColor, 
    boxrule=0mm, 
    colframe=\BackgroundColor,
    colbacktitle=\LemmishColor!50!\BackgroundColor, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    coltext=\TextColor,
    title=\textcolor{\TextColor}{\LemmishText \thesection.\arabic{lemmish}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{lemma}[1][\Nameless]
{
  \refstepcounter{lemma}\begin{tcolorbox}[
    arc=0mm,
    colback=\LemmaColor!5!\BackgroundColor, 
    boxrule=0mm, 
    colframe=\BackgroundColor,
    colbacktitle=\LemmaColor!50!\BackgroundColor, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    coltext=\TextColor,
    title=\textcolor{\TextColor}{\LemmaText \thesection.\arabic{lemma}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{theorem}[1][\Nameless]
{
  \refstepcounter{theorem}\begin{tcolorbox}[
    arc=0mm,
    colback=\TheoremColor!5!\BackgroundColor, 
    boxrule=0mm, 
    colframe=\BackgroundColor,
    colbacktitle=\TheoremColor!50!\BackgroundColor, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    coltext=\TextColor,
    title=\textcolor{\TextColor}{\TheoremText \thesection.\arabic{theorem}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{claim}[1][\Nameless]
{
  \refstepcounter{claim}\begin{tcolorbox}[
    arc=0mm,
    colback=\ClaimColor!5!\BackgroundColor, 
    boxrule=0mm, 
    colframe=\BackgroundColor,
    colbacktitle=\ClaimColor!50!\BackgroundColor, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    coltext=\TextColor,
    title=\textcolor{\TextColor}{\ClaimText \thesection.\arabic{claim}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{definition}[1][\Nameless]
{
  \refstepcounter{definition}\begin{tcolorbox}[
    arc=0mm,
    colback=\DefinitionColor!5!\BackgroundColor, 
    boxrule=0mm, 
    colframe=\BackgroundColor,
    colbacktitle=\DefinitionColor!50!\BackgroundColor, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    coltext=\TextColor,
    title=\textcolor{\TextColor}{\DefinitionText \thesection.\arabic{definition}\ifx#1\Nameless\else{: \!\textit{#1}}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{law}[1][\Nameless]
{
  \refstepcounter{law}\begin{tcolorbox}[
    arc=0mm,
    colback=\LawColor!5!\BackgroundColor, 
    boxrule=0mm, 
    colframe=\BackgroundColor,
    colbacktitle=\LawColor!50!\BackgroundColor, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    coltext=\TextColor,
    title=\textcolor{\TextColor}{\LawText \thesection.\arabic{law}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{corollary}[1][\Nameless]
{
  \refstepcounter{corollary}\begin{tcolorbox}[
    arc=0mm,
    colback=\CorollaryColor!5!\BackgroundColor, 
    boxrule=0mm, 
    colframe=\BackgroundColor,
    colbacktitle=\CorollaryColor!50!\BackgroundColor, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    coltext=\TextColor,
    title=\textcolor{\TextColor}{\CorollaryText \thesection.\arabic{corollary}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}

% Problems envs
\newenvironment{problem*}[1][\Nameless]
{
  \refstepcounter{problem}\begin{tcolorbox}[
    arc=0mm,
    colback=\ProblemColor!5!\BackgroundColor, 
    boxrule=0mm, 
    colframe=\BackgroundColor,
    colbacktitle=\ProblemColor!50!\BackgroundColor, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    coltext=\TextColor,
    title=\textcolor{\TextColor}{\ProblemText \thesection.\arabic{problem}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{problem}[2][\Nameless]
{
  \def\PasteEnd{\hfill \ProblemSolLinkText #2}\refstepcounter{problem}\begin{tcolorbox}[
    arc=0mm,
    colback=\ProblemColor!5!\BackgroundColor, 
    boxrule=0mm, 
    colframe=\BackgroundColor,
    colbacktitle=\ProblemColor!50!\BackgroundColor, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    coltext=\TextColor,
    title=\textcolor{\TextColor}{\ProblemText \thesection.\arabic{problem}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \begin{flushright}
    \PasteEnd
  \end{flushright}
  \end{tcolorbox}
  \noindent
}
\newenvironment{problemsol}[2][\Nameless]
{
  \refstepcounter{problemsol}
  \begin{tcolorbox}[
    arc=0mm,
    colback=\ProblemColor!5!\BackgroundColor,
    boxrule=0mm,
    colframe=\BackgroundColor,
    colbacktitle=\ProblemColor!50!\BackgroundColor,
    fonttitle=\bfseries,
    fontupper=\itshape,   
    fontlower=\normalfont,
    coltext=\TextColor, 
    breakable,
    enhanced,
    title=\textcolor{\TextColor}{\ProblemSolText #2\ifx#1\Nameless\else:\textit{ #1}\fi},
    subtitle style={
      colback=\ProblemColor!25!\BackgroundColor,
      colframe=\ProblemColor!5!\BackgroundColor,
      fontupper={\normalfont\bfseries}
    },
    lower separated=false
  ]
}{
  \end{tcolorbox}
  \noindent
}

\newenvironment{namedbox}[1][\Nameless]
{
  \refstepcounter{namedbox}\begin{tcolorbox}[
    arc=0mm,
    colback=\DefinitionColor!5!\BackgroundColor, 
    boxrule=0mm, 
    colframe=\BackgroundColor,
    colbacktitle=\DefinitionColor!50!\BackgroundColor, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    coltext=\TextColor,
    title=\textcolor{\TextColor}{\ifx#1\Nameless\else{\!\textbf{#1}}\fi}]
}{
  \end{tcolorbox}
  \noindent
}



\def\solution{
  \tcblower
  \tcbsubtitle{\textcolor{\TextColor}{}}
}



% Define the environment for proofs with a gray line
\renewenvironment{leftbar}{%
  \def\FrameCommand{{\color{gray}\vrule width 2mm}\hspace{5mm}}%
  \MakeFramed{\advance\hsize-\width \FrameRestore}}
  {\endMakeFramed}
\renewenvironment{proof}[1][\Nameless]{
  \begin{leftbar}
  \noindent\textit{\ProofText\ifx#1\Nameless\else\textit{ #1}\fi:} 
}{
  \hfill $\square$
  \end{leftbar}
}


\newenvironment{bigname}[1][\Nameless]{
  \ifx#1\Nameless\errmessage{[MissingName]: bigname must have name}\fi
  \noindent\underline{\textbf{#1}}
  \begin{quote}    
}{
  \end{quote}
}



% Set global numbering style for enumerate
\setlist[enumerate,1]{label=(\roman*), left=0pt}  
\setlist[enumerate,2]{label=\alph*), left=0pt}   
\setlist[enumerate,3]{label=\arabic*., left=0pt} 


\endinput