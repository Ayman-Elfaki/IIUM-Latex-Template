
% Copyright (c) 2021 Ayman Elfaki <Ayman-Elfaki@outlook.com>


% THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
% REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
% AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
% INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
% LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
% OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
% PERFORMANCE OF THIS SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iium}[2021/11/09 IIUM Thesis Template]



\LoadClass[12pt]{report}

\RequirePackage[a4paper,margin=2.5cm,left=3.8cm,bottom=3cm,footskip=1.7cm]{geometry}
\RequirePackage{enumerate,setspace,ragged2e,array,tabularx,float}
\RequirePackage{titlesec,tocloft,scrextend,xfp}
\RequirePackage{fmtcount,etoolbox,graphicx}
\RequirePackage[none]{hyphenat}
\RequirePackage[notocbib]{apacite}

\RequirePackage[xindy,toc,section=part]{glossaries}
\RequirePackage[printonlyused]{acronym}

\makeglossaries

\RequirePackage{listings}

% Fix under full warnings 
\RequirePackage{parskip}
\setlength{\parindent}{0cm}


% Begin Language Related Settings
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage{fontspec}

\RequirePackage[main=english, bidi=default]{babel}

\defaultfontfeatures[TraditionalArabic]{Path=./fonts/arabic/, Extension = .ttf, UprightFont=*, BoldFont=*-Bold}
\defaultfontfeatures[TimesNewRoman]{Path=./fonts/english/, Extension = .ttf,  ItalicFont = *-Italic, BoldItalicFont = *-BoldItalic, UprightFont=*, BoldFont=*-Bold}

\babelprovide[import]{arabic}
\babelfont[english]{rm}{TimesNewRoman}

\babelfont[arabic]{rm}{TraditionalArabic}

% End Language Related Settings
\RequirePackage{tikz}
\def\checkmark{\tikz\fill[scale=0.4](0,.35) -- (.25,0) -- (1,.7) -- (.25,.15) -- cycle;}

\newcommand\spaceof[1]{ \fpeval{14.5 * #1} pt }


\RequirePackage{caption} 
\captionsetup[table]{skip=\spaceof{1}}
\captionsetup[figure]{skip=\spaceof{1}}
\captionsetup{tableposition=above}
\captionsetup{figureposition=below}

% Begin Chapters and Sections Settings

\titleclass{\part}{top}
\titleformat{\part}[hang]{\large\filcenter\bfseries}
{\large\MakeUppercase{\parttitlename}}{0pt}{\MakeUppercase}
\titlespacing{\part}{0pt}{0pt}{\spaceof{4}}


\titleclass{\chapter}{top}
\titleformat{\chapter}[hang]{\large\filcenter\bfseries}
{\large\MakeUppercase{\chaptertitlename}}{0pt}{}
\titlespacing{\chapter}{0pt}{0pt}{\spaceof{2}}

\titleformat{\section}{\normalsize\bfseries}
{\thesection\hspace{5pt}}{0pt}{\MakeUppercase}
\titlespacing{\section}{0pt}{\spaceof{0}}{\spaceof{0}}

\titleformat{\subsection}[block]{\normalsize\bfseries}
{\thesubsection\hspace{5pt}}{0pt}{}
\titlespacing{\subsection}{0pt}{\spaceof{0}}{\spaceof{0}}


\titleformat{\subsubsection}[block]{\normalsize\bfseries\itshape}
{\thesubsubsection\hspace{5pt}}{0pt}{}
\titlespacing{\subsubsection}{0pt}{\spaceof{0}}{\spaceof{0}}


\titleformat{\paragraph}[block]{\normalsize\itshape}
{\theparagraph\hspace{5pt}}{0pt}{}

\titlespacing{\paragraph}{0pt}{\spaceof{0}}{\spaceof{0}}



% End Chapters and Sections Settings


\newenvironment{conditions}
  {\par\vspace{\abovedisplayskip}\noindent\begin{tabular}{>{$}l<{$} @{${}={}$} l}}
  {\end{tabular}\par\vspace{\belowdisplayskip}}

% Header and Footer Settings

% \RequirePackage{showframe}


\newcommand{\frontmatter}{
	\pagenumbering{roman}
}

\newcommand{\mainmatter}{
    \pagebreak
	\pagenumbering{arabic}
}

% Report Information Settings

\newtoks\supervisor

\newtoks\department

\newtoks\cosupervisor

\newtoks\examiner

\newtoks\departmenthead

\newtoks\facultydean

\newtoks\programme

\newtoks\institution

\newtoks\faculty

\newtoks\reporttype

% Cover and Title Page Settings


\newcommand{\makecover}{
	\begin{center}
		\vspace*{3.5cm}
		\Large \MakeUppercase{\@title}\\
		\vfill
		\MakeUppercase{by}\\
		\vfill
		\MakeUppercase{\@author}\\
		\vfill
		\MakeUppercase{\the\institution}\\
		\vfill
		\the\year\\
		\vspace*{3cm}
	\end{center}
	\pagenumbering{gobble}
	\clearpage
}

\renewcommand{\maketitle}{
	\begin{center}
		\vspace*{3.5cm}
		\Large \MakeUppercase{\@title}\\
		\vfill
		\MakeUppercase{by}\\
		\vfill
		\MakeUppercase{\@author}\\
		\vfill
		A \the\reporttype{} submitted in fulfillment of the requirement for the
		degree of \the\programme \\
		\vfill
		\the\faculty \\
		\the\institution\\
		\vfill
		\the\month\hspace{0.5mm} -\hspace{0.5mm} \the\year\\
		\vspace*{3cm}
	\end{center}
	\pagenumbering{gobble}
	\clearpage
}


% Begin Table of contents settings


\setcounter{secnumdepth}{4} % Numbering subsubsection and showing it Level 5
\setcounter{tocdepth}{4}

\renewcommand{\cftbeforetoctitleskip}{0pt}
\renewcommand{\cftaftertoctitleskip}{\spaceof{4}}

\addto\captionsenglish{
	\renewcommand{\contentsname}
	{
		\centering
		\large\MakeUppercase{\textbf{Table of Contents}}\\
	}
}



\renewcommand\cftdotsep{1}

\let\oldl@chapter\l@chapter
\renewcommand*\l@chapter[2]{\oldl@chapter{\MakeUppercase{#1}}{#2}}

% Part Settings
\renewcommand{\cftpartdotsep}{\cftdotsep}
\renewcommand{\cftbeforepartskip}{\spaceof{0.1}}
\renewcommand{\cftpartfont}{\normalsize}
\renewcommand{\cftpartpagefont}{\normalsize}
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftpartindent}{0pt}

% Chapter Settings

\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftchappresnum}{}
\renewcommand{\cftchapfont}{\normalsize\bfseries}
\renewcommand{\cftchappagefont}{\normalsize\bfseries}
\renewcommand{\cftchapleader}{\bfseries\cftdotfill{\cftchapdotsep}}

\setlength\cftchapnumwidth{0pt}
\setlength\cftbeforechapskip{\baselineskip}


% Indentation Settings
\setlength\cftsecindent{1.2cm}
\setlength\cftsubsecindent{2cm}
\setlength\cftsubsubsecindent{2.8cm}
\setlength\cftparaindent{3.6cm}

\setlength\cftsecnumwidth{20pt}
\setlength\cftsubsecnumwidth{27pt}
\setlength\cftsubsubsecnumwidth{35pt}
\setlength\cftparanumwidth{45pt}


% End Table of contents settings


% Begin List of Table  settings

\addto\captionsenglish{
	\renewcommand{\listtablename}
	{
		\centering
		\large\MakeUppercase{\textbf{List of Tables}}\\
	}
}

\renewcommand{\cftbeforelottitleskip}{0pt}
\renewcommand{\cftafterlottitleskip}{\spaceof{4}}

\cftsetindents{table}{0em}{5em} % Add indentation after the label
\renewcommand{\cfttabpresnum}{Table } % prefix "Table " to table number
\renewcommand{\cfttabdotsep}{\cftnodots} % Remove the dots

\setlength\cftbeforetabskip{\baselineskip}

% End List of Table settings


% Begin List of Figures  settings

\addto\captionsenglish{
	\renewcommand{\listfigurename}
	{
		\centering
		\large\MakeUppercase{\textbf{List of Figures}}\\
	}
}

\renewcommand{\cftbeforeloftitleskip}{0pt}
\renewcommand{\cftafterloftitleskip}{\spaceof{4}}

\cftsetindents{figure}{0em}{5em} % Add indentation after the label
\renewcommand{\cftfigpresnum}{Figure } % prefix "Table " to table number
\renewcommand{\cftfigdotsep}{\cftnodots} % Remove the dots


\setlength\cftbeforefigskip{\baselineskip}

% End List of Figures settings


% Begin Chapters Counter

\newcounter{chpatersCounters}
\setcounter{chpatersCounters}{0}

\renewcommand{\thechpatersCounters}{\NUMBERstring{chpatersCounters}}


\newcounter{appendixCounter}
\setcounter{appendixCounter}{0}

\renewcommand{\theappendixCounter}{\Roman{appendixCounter}}

% End Chapters Counter



% Front matter Pages Settings

\renewenvironment{abstract}
{
    \addcontentsline{toc}{part}{Abstract}
    \part*{Abstract}
    \begin{justify}
        \normalsize
        \noindent
        \setstretch{1}
        \begin{sloppypar}
        }
        {
        \end{sloppypar}
    \end{justify}
    \setcounter{page}{2}
    \clearpage
}

\newenvironment{abstractarabic}
{
    \addcontentsline{toc}{part}{Abstract in Arabic}
    \begin{justify}
        \begin{center}
            \LARGE\textbf{\foreignlanguage{arabic}{ملخص البحث}}
            \vspace{48pt}
        \end{center}
        \begin{otherlanguage}{arabic}
            \Large
            \begin{sloppypar}
            }
            {
            \end{sloppypar}
        \end{otherlanguage}
    \end{justify}
    \clearpage
}

\newenvironment{acknowledgements}
{
	\addcontentsline{toc}{part}{Acknowledgements}
	\part*{Acknowledgements}

	\begin{fixMargin}{1pt}
		\begin{justify}
			\normalsize
			\setstretch{1}
			\noindent
			}
			{
		\end{justify}
	\end{fixMargin}
	\clearpage
}

\newenvironment{Chapter}[1]
{
	\label{#1}
	\refstepcounter{chpatersCounters}
	\addcontentsline{toc}{chapter}{Chapter \thechpatersCounters{}: #1}
	\chapter*{\uppercase{Chapter \thechpatersCounters{} \\[\spaceof{0.35}] #1}}
	\addtocounter{chapter}{1}
	\setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    \setcounter{paragraph}{0}
	\begin{justify}
		\normalsize
		\noindent
		\setstretch{2}
		\begin{sloppypar}
		}
		{
		\end{sloppypar}
	\end{justify}
	\clearpage
}

\newenvironment{Appendix}[1]
{
	\refstepcounter{appendixCounter}
	\addcontentsline{toc}{chapter}{Appendix \theappendixCounter{}: #1}
	\chapter*{\uppercase{Appendix \theappendixCounter{} \\[\spaceof{0.35}] #1}}
	\begin{justify}
		\normalsize
		\noindent
		\setstretch{2}
		}
		{
	\end{justify}
	\clearpage
}

\newcommand{\maketableofcontents}{
	\tableofcontents
	\clearpage
}

\newcommand{\makelistoftables}{
	\addcontentsline{toc}{part}{List of Tables}
	\listoftables
	\clearpage
}

\newcommand{\makelistoffigures}{
	\addcontentsline{toc}{part}{List of Figures}
	\listoffigures
	\clearpage
}


\newcommand{\makelistofabbreviations}{
   
    \printglossary[nonumberlist, type=\acronymtype, title=\MakeUppercase{List of Abbreviations}, toctitle=List of Abbreviations]
}


\newcommand{\makeapproval}
{
	\addcontentsline{toc}{part}{Approval Page}

	\part*{Approval Page}
	\begin{justify}
		\begin{fixMargin}{1pt}
			\normalsize
			\noindent
			I certify that I have supervised and read this study
			and that in my opinion, it conforms to acceptable standards of scholarly
			presentation and is fully adequate, in scope and
			quality, as a \the\reporttype{} for the degree of \the\programme.
			
			
			\begin{FlushRight}
				\begin{tabularx}{0.45\textwidth} {>{\RaggedRight\arraybackslash}X}
					\dotfill        \\
					\the\supervisor \\
					Supervisor      \\
				\end{tabularx}
			\end{FlushRight}

			\begin{FlushRight}
				\begin{tabularx}{0.45\textwidth} {>{\RaggedRight\arraybackslash}X}
					\dotfill          \\
					\the\cosupervisor \\
					Co-Supervisor     \\
				\end{tabularx}
			\end{FlushRight}

			\noindent
			I certify that I have read this study and that in my
			opinion it conforms to acceptable standards of scholarly
			presentation and is fully adequate, in scope and quality, as a
			\the\reporttype{} for the degree of \the\programme.

			\begin{FlushRight}
				\begin{tabularx}{0.45\textwidth} {>{\RaggedRight\arraybackslash}X}
					\dotfill      \\
					\the\examiner \\
					Examiner      \\
				\end{tabularx}
			\end{FlushRight}

			\noindent
			This \the\reporttype{} was submitted to the Department of \the\department{}
			and is accepted as a fulfillment of the requirement for the
			degree of \the\programme.

			\begin{FlushRight}
				\begin{tabularx}{0.45\textwidth} {>{\RaggedRight\arraybackslash}X}
					\dotfill                            \\
					\the\departmenthead                 \\
					Head, Department of \the\department \\
				\end{tabularx}
			\end{FlushRight}

			\vfill

			\noindent
			This \the\reporttype{} was submitted to the \the\faculty{} and is accepted as a
			fulfillment of the requirement for the degree of \the\programme.

			\vfill

			\begin{FlushRight}
				\begin{tabularx}{0.45\textwidth} {>{\RaggedRight\arraybackslash}X}
					\dotfill           \\
					\the\facultydean   \\
					Dean, \the\faculty \\
				\end{tabularx}
			\end{FlushRight}

			\vfill

		\end{fixMargin}
	\end{justify}
	\clearpage
}

\newenvironment{fixMargin}[1]
{
	\begin{addmargin}{#1}{}
		\begin{sloppypar}
			}
			{
		\end{sloppypar}
	\end{addmargin}
}

\newcommand{\makedeclaration}
{
	\addcontentsline{toc}{part}{Declaration}

	\part*{Declaration}
	\begin{fixMargin}{2pt}

		\justifying
		\normalsize
		\setstretch{1}
		\noindent
		I hereby declare that this \the\reporttype{} is the result of my own investigations, except
		where otherwise stated. I also declare that it has not been previously or concurrently
		submitted as a whole for any other degrees at IIUM or other institutions.

		\begin{justify}
			\noindent
			\begin{tabular}{@{}p{2.8in}p{2.7in}@{}}
				\@author           &               \\
				                   &               \\
				                   &               \\
				Signature \dotfill & Date \dotfill \\
			\end{tabular}
		\end{justify}

	\end{fixMargin}

	\clearpage
}

\newenvironment{Framed}
{
	\begin{center}
		\begin{tabular}{|p{0.95\textwidth}|}
			\hline \\
			}
			{
			\\\\\hline
		\end{tabular}
	\end{center}
}

\newcommand{\makejointcopyright}
{
	\addcontentsline{toc}{part}{Joint Copyright}
	\begin{Framed}
		\begin{center}
			\large\MakeUppercase{\textbf{\the\institution}}\\[24pt]
			\large\MakeUppercase{\textbf{Declaration of copyright and affirmation of Fair
					use of unpublished research}}\\[24pt]
			\large\MakeUppercase{\textbf{\@title{}}}\\[24pt]
			
			\normalsize
			I declare that the copyright holder of this \the\reporttype{} are jointly owned by
			the student and IIUM.\\
			\vspace*{24pt}
			\footnotesize
			Copyright © \the\year{} \@author{} and International Islamic University Malaysia.
			All rights reserved.
           
			\vspace*{24pt}
			\normalsize
			\begin{flushleft}
				No part of this unpublished research may be reproduced, stored in a retrieval
				system, or transmitted, in any form or by any means, electronic, mechanical,
				photocopying, recording or otherwise without prior written permission of the
				copyright holder except as provided below\\[24pt]
				
				\begin{enumerate}[\hspace{1.2cm}1.]
					\item Any material contained in or derived from this unpublished research
					      may only be used by others in their writing with due acknowledgement.\\[12pt]
					\item IIUM or its library will have the right to make and transmit copies
					      (print or electronic) for institutional and academic purpose.\\[12pt]
					\item The IIUM library will have the right to make, store in a retrieval system
					      and supply copies of this unpublished research if requested by other
					      universities and research libraries.\\
				\end{enumerate}
				By signing this form, I acknowledged that I have read and understand the
				IIUM Intellectual Property Right and Commercialization policy.\\
				\vspace*{\spaceof{4}}
				Affirmed by \@author
			\end{flushleft}
			
			\vspace{\spaceof{3}}
            
			\begin{center}
				\begin{tabularx}{0.9\textwidth} {
						>{\centering\arraybackslash}X
						>{\centering\arraybackslash}X}
					\dotfill  & \dotfill \\
					Signature & Date     \\
				\end{tabularx}
			\end{center}
		\end{center}
	\end{Framed}

	\clearpage
}


\newcommand{\makeiiumcopyright}
{
	\addcontentsline{toc}{part}{IIUM Copyright}
	\begin{Framed}
		\begin{center}
			\large\MakeUppercase{\textbf{\the\institution}}\\[24pt]

			\large\MakeUppercase{\textbf{Declaration of copyright and affirmation of Fair
					use of unpublished research}}\\[24pt]

			\large\MakeUppercase{\textbf{\@title{}}}\\[24pt]

			\normalsize
			I declare that the copyright holder of this \the\reporttype{} is
			\@author\\

			\vspace*{24pt}
			\footnotesize
			Copyright © \the\year{} \@author{}. All rights reserved.\\[24pt]

			\normalsize
			\begin{flushleft}
				No part of this unpublished research may be reproduced, stored in a retrieval
				system, or transmitted, in any form or by any means, electronic, mechanical,
				photocopying, recording or otherwise without prior written permission of the
				copyright holder except as provided below\\[24pt]
				\begin{enumerate}[\hspace{1.2cm}1.]
					\item Any material contained in or derived from this unpublished research
					      may only be used by others in their writing with due acknowledgement.\\[12pt]
					\item IIUM or its library will have the right to make and transmit copies
					      (print or electronic) for institutional and academic purpose.\\[12pt]
					\item The IIUM library will have the right to make, store in a retrieval system
					      and supply copies of this unpublished research if requested by other
					      universities and research libraries.\\
				\end{enumerate}
				By signing this form, I acknowledged that I have read and understand the
				IIUM Intellectual Property Right and Commercialization policy.\\
				\vspace*{\spaceof{4}}
				Affirmed by \@author

			\end{flushleft}
			\vspace{\spaceof{3}}
			\begin{center}
				\begin{tabularx}{0.9\textwidth} {
						>{\centering\arraybackslash}X
						>{\centering\arraybackslash}X}
					\dotfill  & \dotfill \\
					Signature & Date     \\
				\end{tabularx}
			\end{center}
		\end{center}
	\end{Framed}

	\clearpage
}


\addto\captionsenglish{
	\renewcommand{\bibname}{\large\MakeUppercase{References}}
}


\newcommand{\makereferences}[1]{
	\addcontentsline{toc}{chapter}{References}
	\clearpage
	\bibliographystyle{apacite}
    \bibliography{#1}
}
