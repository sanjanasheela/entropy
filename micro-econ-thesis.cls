% =============================================================================
% micro-econ-thesis.cls
% A thin wrapper around article for FSU‑Jena master theses.
% =============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{micro-econ-thesis}[2025/10/21 v1.3]

\LoadClass[12pt,a4paper]{article}

% -------------------------------------------------------------------------
% Packages that the class itself needs
% -------------------------------------------------------------------------
\RequirePackage{ifthen}
\RequirePackage{tabularx}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{geometry}
% \RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
% \RequirePackage[english]{babel}
% \RequirePackage{microtype}
% \RequirePackage{hyperref}

% -------------------------------------------------------------------------
% Page geometry (the only place where margins are set)
% -------------------------------------------------------------------------
\geometry{
  a4paper,
  left=10mm,
  right=10mm,
  top=20mm,
  bottom=15mm,
  headheight=12pt,
  headsep=5mm,
  footskip=8mm,
  bindingoffset=3mm,
  includeheadfoot
  %showframe  % uncomment to visualize margins
}


% -------------------------------------------------------------------------
% Paragraph, float and pagination settings
% -------------------------------------------------------------------------
\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 2pt minus 1pt}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
\setcounter{topnumber}{9}
\setcounter{totalnumber}{9}
\renewcommand{\topfraction}{0.99}
\renewcommand{\textfraction}{0.01}
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

% -------------------------------------------------------------------------
% Internal macros for title‑page data
% -------------------------------------------------------------------------
\newcommand{\@thesisTitle}{}
\newcommand{\@thesisType}{}
\newcommand{\@thesisAuthor}{}
\newcommand{\@thesisMail}{}
\newcommand{\@thesisGrade}{}
\newcommand{\@thesisTutora}{}
\newcommand{\@thesisTutorb}{}
\newcommand{\@thesisDate}{}
\newcommand{\@thesisCompany}{}
\newcommand{\@thesisMatrikel}{}
\newcommand{\@thesisAddress}{}

% Apply current data
\newcommand{\thesisTitle}[1]{\renewcommand{\@thesisTitle}{#1}}
\newcommand{\thesisType}[1]{\renewcommand{\@thesisType}{#1}}
\newcommand{\thesisAuthor}[1]{\renewcommand{\@thesisAuthor}{#1}}
\newcommand{\thesisMail}[1]{\renewcommand{\@thesisMail}{#1}}
\newcommand{\thesisGrade}[1]{\renewcommand{\@thesisGrade}{#1}}
\newcommand{\thesisTutora}[1]{\renewcommand{\@thesisTutora}{#1}}
\newcommand{\thesisTutorb}[1]{\renewcommand{\@thesisTutorb}{#1}}
\newcommand{\thesisDate}[1]{\renewcommand{\@thesisDate}{#1}}
\newcommand{\thesisCompany}[1]{\renewcommand{\@thesisCompany}{#1}}
\newcommand{\thesisMatrikel}[1]{\renewcommand{\@thesisMatrikel}{#1}}
\newcommand{\thesisAddress}[1]{\renewcommand{\@thesisAddress}{#1}}


% -------------------------------------------------------------------------
% Hyperref options (wrapped so the user can change them before \begin{document})
% -------------------------------------------------------------------------
\AtBeginDocument{%
  \hypersetup{
  plainpages = {false}, % Seitenanker-Formatierung
  colorlinks = {true}, % Links farbig machen, sonst umrandet
  linkcolor = {DarkBlue}, % normale Links (Inhalt, Abb.)
  citecolor = {DarkBlue}, % Literaturverweise
  urlcolor = {DarkBlue}, % URL-Links
  bookmarksnumbered = {true}, % Nummerierung der Kapitel
  bookmarksopen = {false}, % alle aufgebl"attert
  breaklinks = {true},
    pdfauthor    = {\@thesisAuthor},
    pdftitle     = {\@thesisTitle},
    pdfsubject   = {Master thesis}
  }%
}

% -------------------------------------------------------------------------
% Title‑page macros (English / German)
% -------------------------------------------------------------------------
\newcommand{\thesisMakeTitleEN}{%
  \begin{titlepage}
    \centering\Large
    {\huge\bfseries\@thesisTitle\par}
    \vfill
    \textbf{-- \@thesisType{} --}\par
    \vfill
    \ifthenelse{\equal{\@thesisGrade}{}}{}{to be awarded}\par
    \vskip 1ex\@thesisGrade\par
    \vfill
    {\large submitted by}\par
    \@thesisAuthor\par
    \vfill
    {\large\@thesisDate}\par
    \vfill
    \begin{minipage}{\textwidth}\normalsize
      \@thesisAuthor\\
      \texttt{\@thesisMail}\\
      Student ID: \@thesisMatrikel\\
      Address:\\\@thesisAddress
    \end{minipage}\par
    \vfill
    \begin{minipage}{\textwidth}\normalsize
      Supervisor \\[1ex]
      \ifthenelse{\equal{\@thesisTutora}{}}{}{1st: \@thesisTutora\\}
      \ifthenelse{\equal{\@thesisTutorb}{}}{}{2nd: \@thesisTutorb\\}

      \bigskip
      Friedrich‑Schiller‑Universität Jena\\
      Fakultät für Wirtschaftswissenschaften\\
      Lehrstuhl für Mikroökonomik\\
      Carl‑Zeiß‑Str. 3\\
      07743 Jena \\[2ex]
      \@thesisCompany
    \end{minipage}
  \end{titlepage}
}

\newcommand{\thesisMakeTitleDE}{%
  \begin{titlepage}
    \centering\Large
    {\huge\bfseries\@thesisTitle\par}
    \vfill
    \textbf{-- \@thesisType{} --}\par
    \vfill
    \ifthenelse{\equal{\@thesisGrade}{}}{}{zur Erlangung des akad. Grades}\par
    \vskip1ex\@thesisGrade\par
    \vfill
    {\large eingereicht von}\par
    \@thesisAuthor\par
    \vfill
    {\large\@thesisDate}\par
    \vfill
    \begin{minipage}{\textwidth}\normalsize
      \@thesisAuthor\\
      \texttt{\@thesisMail}\\
      Matrikel: \@thesisMatrikel\\
      Addresse:\\\@thesisAddress
    \end{minipage}\par
    \vfill
    \begin{minipage}{\textwidth}\normalsize
      Betreuer\\[1ex]
      \ifthenelse{\equal{\@thesisTutora}{}}{}{1st: \@thesisTutora\\}
      \ifthenelse{\equal{\@thesisTutorb}{}}{}{2nd: \@thesisTutorb\\}
      
      \bigskip
      Friedrich‑Schiller‑Universität Jena\\
      Fakultät für Wirtschaftswissenschaften\\
      Lehrstuhl für Mikroökonomik\\
      Carl‑Zeiß‑Str. 3\\
      07743 Jena\\[2ex]
      \@thesisCompany
    \end{minipage}
  \end{titlepage}
}

