% mincv.cls: A minimalistic CV class file
% Author: Gabriel N.
% Version: 1.0
% License: MIT License

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mincv}[2025/11/21 Minimalistic CV Class]

\LoadClass[10pt, a4paper]{article}

% Required packages
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{fontawesome5}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage{xcolor}
\RequirePackage{etoolbox}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage[scaled=0.9]{helvet}
\renewcommand{\familydefault}{\sfdefault}

% Color definitions
\definecolor{textgray}{HTML}{3D3D3D}
\definecolor{primarycolor}{HTML}{00014A} 

% Page layout configuration
\geometry{
  left=0.5in,
  right=0.5in,
  top=0.5in,
  bottom=0.5in,
  noheadfoot
}
\pagestyle{empty}
\setlength{\parindent}{0pt}

% Hyperlink configuration
\hypersetup{
    colorlinks=true,
    linkcolor=primarycolor,
    urlcolor=textgray,
    pdftitle={CV},
}

% Variables for header data
\newcommand{\@firstname}{}
\newcommand{\@lastname}{}
\newcommand{\@jobtitle}{}
\newcommand{\@location}{}
\newcommand{\@phone}{}
\newcommand{\@email}{}
\newcommand{\@github}{}
\newcommand{\@linkedin}{}
\newcommand{\@photo}{}

% Commands to set header data
\newcommand{\cvname}[2]{\renewcommand{\@firstname}{#1}\renewcommand{\@lastname}{#2}}
\newcommand{\cvjob}[1]{\renewcommand{\@jobtitle}{#1}}
\newcommand{\cvlocation}[1]{\renewcommand{\@location}{#1}}
\newcommand{\cvphone}[1]{\renewcommand{\@phone}{#1}}
\newcommand{\cvemail}[1]{\renewcommand{\@email}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\@github}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\@linkedin}{#1}}
\newcommand{\cvphoto}[1]{\renewcommand{\@photo}{#1}}

% Header rendering
\newcommand{\makecvheader}{%
  \begin{center}
    \begin{minipage}[c]{0.82\textwidth}
      {\Huge\bfseries\color{textgray}\@firstname\ \color{primarycolor}\@lastname}\\[6pt]
      \ifdefempty{\@jobtitle}{}{{\Large\color{textgray}\@jobtitle}\\[4pt]}
      {\small\color{textgray}
       \ifdefempty{\@location}{}{\@location \hspace{0.5em}|\hspace{0.5em}}%
       \href{mailto:\@email}{\@email}%
       \ifdefempty{\@phone}{}{\hspace{0.5em}|\hspace{0.5em}\@phone}
      }\\[2pt]
      {\small
        \ifdefempty{\@github}{}{%
            \faGithub\ \href{\@github}{GitHub}\hspace{1em}%
        }%
        \ifdefempty{\@linkedin}{}{%
            \faLinkedin\ \href{\@linkedin}{LinkedIn}%
        }%
      }
    \end{minipage}%
    \hfill
    \begin{minipage}[c]{0.15\textwidth}
      \ifdefempty{\@photo}{}{%
        \includegraphics[width=\linewidth,clip,trim=0 0 0 0]{\@photo}%
      }
    \end{minipage}
  \end{center}
  \vspace{5pt}
}

% Section formatting
\titleformat{\section}
  {\Large\bfseries\color{primarycolor}\raggedright}
  {}{0em}{}
  [\titlerule]
\titlespacing{\section}{0pt}{8pt}{6pt}

% List formatting helper
% rightmargin prevents bullet text from hitting the far right edge
\newcommand{\entrybeforelist}{%
  \begin{itemize}[rightmargin=1.5cm]% 
    \setlength\itemsep{-0.3em}%
    \setlength\topsep{0pt}%
    \setlength\partopsep{0pt}%
    \setlength\parsep{0pt}%
}

\newcommand{\entryafterlist}{%
  \end{itemize}%
  \vspace{6pt}%
}

% Short entry environment (Title + Date only)
\newenvironment{cventryshort}[2]
{
  \noindent\textbf{#1} \hfill \textit{#2}%
  \entrybeforelist
}
{
  \entryafterlist
}

% Full entry environment (Title, Org, Date, Location)
\newenvironment{cventry}[4]
{
  \noindent\textbf{#1} \hfill \textit{#4}\\
  {\noindent \color{textgray}#2 \hfill \textit{#3}} 
  \entrybeforelist
}
{
  \entryafterlist
}

% Skills environment
\newenvironment{cvskills}
{
  \begin{itemize}
    \setlength\itemsep{0em}
    \setlength\parskip{0pt}
}
{
  \end{itemize}
}

% Skill item command
\newcommand{\cvskill}[2]
{
  \item \textbf{#1:} #2
}