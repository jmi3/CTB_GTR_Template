\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CBTGTR}[2024/09/19 v1.0 CBT book class]


% Define variables for envs
\def\Nameless{}
\def\LemmishColor{lime}
\def\LemmaColor{green}
\def\TheoremColor{teal}
\def\ClaimColor{cyan}
\def\DefinitionColor{magenta}


\DeclareOption{colored}{
  \def\LemmishColor{lime}
  \def\LemmaColor{green}
  \def\TheoremColor{teal}
  \def\ClaimColor{cyan}
  \def\DefinitionColor{magenta}
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
\LoadClass[11pt]{book}

% Load the language
\RequirePackage[czech]{babel}

% Load fontspec for handling system fonts
\RequirePackage{fontspec}


% Load graphical packages
\RequirePackage{tcolorbox}
\RequirePackage{graphicx}
\RequirePackage{framed}
\RequirePackage{xcolor}  
\RequirePackage{hyperref}
\RequirePackage{geometry}


% Load math packages
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{tensor}



% Chapter headings
\renewcommand{\chapter}{%
  \cleardoublepage
  \thispagestyle{plain}
  \@startsection{chapter}{0}{0mm}{12pt}{6pt}{\bfseries\Huge}
}



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


% Define envs
\newenvironment{lemmish}[1][\Nameless]
{
  \refstepcounter{lemmish}\begin{tcolorbox}[
    arc=0mm,
    colback=\LemmishColor!5!white, 
    boxrule=0mm, 
    colframe=white,
    colbacktitle=\LemmishColor!50!white, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    title=\textcolor{black}{Lemmátko \thesection.\arabic{lemmish}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{lemma}[1][\Nameless]
{
  \refstepcounter{lemma}\begin{tcolorbox}[
    arc=0mm,
    colback=\LemmaColor!5!white, 
    boxrule=0mm, 
    colframe=white,
    colbacktitle=\LemmaColor!50!white, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    title=\textcolor{black}{Lemma \thesection.\arabic{lemma}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{theorem}[1][\Nameless]
{
  \refstepcounter{theorem}\begin{tcolorbox}[
    arc=0mm,
    colback=\TheoremColor!5!white, 
    boxrule=0mm, 
    colframe=white,
    colbacktitle=\TheoremColor!50!white, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    title=\textcolor{black}{Věta \thesection.\arabic{theorem}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{claim}[1][\Nameless]
{
  \refstepcounter{claim}\begin{tcolorbox}[
    arc=0mm,
    colback=\ClaimColor!5!white, 
    boxrule=0mm, 
    colframe=white,
    colbacktitle=\ClaimColor!50!white, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    title=\textcolor{black}{Tvrzení \thesection.\arabic{claim}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}
\newenvironment{definition}[1][\Nameless]
{
  \refstepcounter{definition}\begin{tcolorbox}[
    arc=0mm,
    colback=\DefinitionColor!5!white, 
    boxrule=0mm, 
    colframe=white,
    colbacktitle=\DefinitionColor!50!white, 
    fonttitle=\bfseries, 
    fontupper=\itshape,
    title=\textcolor{black}{Definice \thesection.\arabic{definition}\ifx#1\Nameless\else:\textit{ #1}\fi}]
}{
  \end{tcolorbox}
  \noindent
}

% Define the environment for proofs with a gray line
\renewenvironment{leftbar}{%
  \def\FrameCommand{{\color{gray}\vrule width 2mm}\hspace{5mm}}%
  \MakeFramed{\advance\hsize-\width \FrameRestore}}
  {\endMakeFramed}
\renewenvironment{proof}[1][\Nameless]{
  \begin{leftbar}
  \noindent\textit{Důkaz\ifx#1\Nameless\else\textit{ #1}\fi:} 
}{
  \hfill $\square$
  \end{leftbar}
}



\endinput