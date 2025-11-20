% mincv.cls: A minimalistic CV class file
% Author: Gabriel N.
% Version: 1.0
% License: MIT License

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mincv}[2025/11/20 Minimalistic CV Class]

% Base Class and Packages
\LoadClass[10pt, a4paper]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{fontawesome5}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage[scaled=0.9]{helvet}
\renewcommand{\familydefault}{\sfdefault}

% Page layout
\geometry{
  left=0.75in,
  right=0.75in,
  top=0.75in,
  bottom=0.75in,
  noheadfoot
}
\pagestyle{empty} % No page numbers
\setlength{\parindent}{0pt} % No paragraph indentation

% Hyperlink setup
\hypersetup{
    colorlinks=false,
    pdfborder={0 0 0}
}

% Header setup
\newcommand{\makecvheader}[7]{%
  \begin{center}
    \begin{minipage}[c]{0.78\textwidth}
      {\Huge\bfseries #1}\\[10pt]
      {\normalsize #2}\\[2pt]
      {\small #3 \quad | \quad \href{mailto:#4}{#4}}\\[2pt]
      {\small
        \faGithub\ \href{#6}{GitHub} \quad | \quad
        \faLinkedin\ \href{#5}{LinkedIn}
      }
    \end{minipage}%
    \hfill
    \begin{minipage}[c]{0.18\textwidth}
      \ifthenelse{\equal{#7}{}}
        {} % no photo provided
        {\includegraphics[width=\linewidth,clip,trim=0 0 0 0]{#7}}
    \end{minipage}
  \end{center}
  \vspace{10pt}
}
% Formatting for section title
\titleformat{\section}
  {\Large\scshape\raggedright}
  {}{0em}{}
  [\titlerule]
\titlespacing{\section}{0pt}{10pt}{8pt}

% Reusable spacing templates for entries
\newcommand{\entrybeforelist}{%
  \begin{itemize}%
    \setlength\itemsep{-0.5em}%
    \setlength\topsep{0pt}%
}

\newcommand{\entryafterlist}{%
  \end{itemize}%
  \vspace{8pt}%
}

% Short environmnet for CV entry
\newenvironment{cventryshort}[2]
{
  \noindent\textbf{#1} \hfill \textit{#2}%
  \entrybeforelist
}
{
  \entryafterlist
}

% Environmnet for CV entry
\newenvironment{cventry}[4]
{
  \noindent\textbf{#1} \hfill \textit{#4}\\
  \noindent #2 \hfill \textit{#3}
  \entrybeforelist
}
{
  \entryafterlist
}

% Environment for all skills
\newenvironment{cvskills}
{
  \begin{itemize}
}
{
  \end{itemize}
}

% Command for one skill entry
\newcommand{\cvskill}[2]
{
  \item \textbf{#1:} #2
}