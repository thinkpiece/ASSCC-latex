\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{asscc2026}[IEEE A-SSCC 2026 paper template]

\LoadClass[twocolumn]{article}

\RequirePackage[
  letterpaper,
  top=0.5in,
  bottom=0.3in,
  left=0.4in,
  right=0.4in,
  headheight=18pt,
  headsep=4pt,
  footskip=3pt
]{geometry}
\RequirePackage{array}
\RequirePackage{caption}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{iftex}
\RequirePackage{xcolor}

\setlength{\columnsep}{0.2in}
\setlength{\parindent}{0pt}
\setlength{\parskip}{3pt}
\setlength{\emergencystretch}{1em}
\pagestyle{fancy}

\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \IfFileExists{phvr8t.tfm}{\RequirePackage[scaled=0.92]{helvet}}{}
  \renewcommand{\familydefault}{\sfdefault}
  \newcommand{\ASSCCBodyFont}{\sffamily}
  \newcommand{\ASSCCTitleFont}{\sffamily}
\else
  \RequirePackage{fontspec}
  \IfFontExistsTF{Arial}
    {%
      \setmainfont{Arial}%
      \setsansfont{Arial}%
    }
    {%
      \setmainfont{TeX Gyre Heros}%
      \setsansfont{TeX Gyre Heros}%
    }
  \newcommand{\ASSCCBodyFont}{\rmfamily}
  \newcommand{\ASSCCTitleFont}{\sffamily}
\fi

\renewcommand\normalsize{%
  \@setfontsize\normalsize{9pt}{9.8pt}%
  \abovedisplayskip 5pt plus 1pt minus 1pt%
  \belowdisplayskip 5pt plus 1pt minus 1pt%
  \abovedisplayshortskip 4pt plus 1pt minus 1pt%
  \belowdisplayshortskip 4pt plus 1pt minus 1pt%
}
\renewcommand\small{\@setfontsize\small{9pt}{9.8pt}}
\renewcommand\footnotesize{\@setfontsize\footnotesize{9pt}{9.8pt}}
\renewcommand\scriptsize{\@setfontsize\scriptsize{8pt}{9pt}}
\renewcommand\large{\@setfontsize\large{10pt}{11pt}}
\normalsize

\definecolor{ASSCCHeaderGray}{RGB}{203,210,220}

\fancypagestyle{asscc}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
  \fancyhead[C]{%
    \begingroup
      \setlength{\fboxsep}{1.5pt}%
      \begin{minipage}{\textwidth}
        \centering
        \setlength{\fboxrule}{0pt}%
        \fcolorbox{ASSCCHeaderGray}{ASSCCHeaderGray}{%
          \makebox[\dimexpr\textwidth-2\fboxsep\relax][c]{%
            \ASSCCTitleFont\bfseries\fontsize{10pt}{11pt}\selectfont IEEE ASSCC 2026%
          }%
        }%
        \par\nointerlineskip
        \rule{\textwidth}{0.4pt}\par
      \end{minipage}%
    \endgroup
  }%
}
\pagestyle{asscc}

\renewcommand{\title}[1]{\gdef\@title{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\title{}
\author{}
\affiliation{}

\renewcommand{\maketitle}{%
  \begingroup
    \ASSCCTitleFont\bfseries\fontsize{10pt}{11pt}\selectfont\@title\par
    \vspace{3pt}
    \ASSCCTitleFont\normalfont\normalsize\@author\par
    \vspace{2pt}
    \ASSCCTitleFont\normalfont\normalsize\@affiliation\par
    \vspace{5pt}
  \endgroup
}

\renewcommand\section{\@startsection{section}{1}{0pt}%
  {6pt plus 1pt minus 1pt}{2pt}%
  {\ASSCCTitleFont\bfseries\normalsize}}
\renewcommand\subsection{\@startsection{subsection}{2}{0pt}%
  {5pt plus 1pt minus 1pt}{1pt}%
  {\ASSCCTitleFont\itshape\normalsize}}

\captionsetup[figure]{%
  name=Fig.,
  labelsep=period,
  font=normalsize,
  justification=raggedright,
  singlelinecheck=false,
  skip=2pt
}
\renewcommand{\figurename}{Fig.}
\renewcommand{\refname}{References:}

\let\ASSCC@thebibliography\thebibliography
\let\ASSCC@endthebibliography\endthebibliography
\renewenvironment{thebibliography}[1]{%
  \ASSCC@thebibliography{#1}%
  \setlength{\itemsep}{0pt}%
  \setlength{\parsep}{0pt}%
  \setlength{\parskip}{0pt}%
}{%
  \ASSCC@endthebibliography
}

\newlength{\ASSCCFigureRowHeight}
\setlength{\ASSCCFigureRowHeight}{3.27in}
\newlength{\ASSCCFigureCellWidth}

\newcommand{\ASSCCFigureSlot}[2]{%
  \setlength{\ASSCCFigureCellWidth}{\dimexpr0.5\textwidth-2\tabcolsep-1.5\arrayrulewidth\relax}%
  \parbox[b][\ASSCCFigureRowHeight][b]{\ASSCCFigureCellWidth}{%
    \centering #1\par
    \vfill
    \raggedright #2\par
  }%
}

\newcommand{\ASSCCFigurePlaceholder}[2][]{\ASSCCFigureSlot{#1}{#2}}

\newcommand{\ASSCCFigurePage}[6]{%
  \thispagestyle{asscc}%
  \noindent
  \begingroup
    \setlength{\tabcolsep}{4pt}%
    \renewcommand{\arraystretch}{1}%
    \begin{tabular}{@{}|p{\dimexpr0.5\textwidth-2\tabcolsep-1.5\arrayrulewidth\relax}|p{\dimexpr0.5\textwidth-2\tabcolsep-1.5\arrayrulewidth\relax}|@{}}
      \hline
      #1 & #2 \\ \hline
      #3 & #4 \\ \hline
      #5 & #6 \\ \hline
    \end{tabular}%
  \endgroup
  \clearpage
}

\AtBeginDocument{\ASSCCBodyFont\normalsize}
\endinput
