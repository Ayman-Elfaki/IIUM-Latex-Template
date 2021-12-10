# IIUM-Latex-Template
International Islamic University Malaysia Dissertation/Thesis Latex Template.


## Prerequisites

This templates requires XeLatex or LuaLatex for compilation.


## Usage

### Basics

1 - Copy the content of src folder to the root of your project.

2 - Add the following line to the top your main .tex file.

```latex

\documentclass{iium}

```

3 - Add the dissertation/thesis details.

```latex

\documentclass{iium}


\title{The Title Goes Here}
\date{\today}
\author{Author Name}
\supervisor{Supervisor Name}
\cosupervisor{Co-Supervisor Name}
\programme{Master of Science in Computer and Information Engineering}
\institution{International Islamic University Malaysia}
\departmenthead{Head of Department Name}
\examiner{The Examiner Name }
\faculty{Kulliyyah of Engineering}
\facultydean{Faculty Dean Name}
\department{Electrical and Computer Engineering}
\reporttype{dissertation} % Or thesis if by Research Mode  


```

### General Layout 

```latex

\begin{document}

    \makecover

    \maketitle


    \frontmatter

    \begin{abstract}
    
        % Your English Abstract Goes Here

    \end{abstract}


    \begin{abstractarabic}

        % Your Arabic Abstract Goes Here

    \end{abstractarabic}

    \makeapproval

    \makedeclaration

    \makejointcopyright

    \makeiiumcopyright


    \begin{acknowledgements}

        % Your Acknowledgements Goes Here

    \end{acknowledgements}


    \maketableofcontents

    \makelistoftables

    \makelistoffigures

    \makelistofabbreviations

    \mainmatter

    \begin{Chapter}{Introduction}
        % Contents Goes Here
    \end{Chapter}

    \begin{Chapter}{Literature Review}
        % Contents Goes Here
    \end{Chapter}

    \begin{Chapter}{Methodology}
        % Contents Goes Here
    \end{Chapter}

    \begin{Chapter}{Methodology}
        % Contents Goes Here
    \end{Chapter}

    \begin{Chapter}{Results and Discussion}
        % Contents Goes Here
    \end{Chapter}

    \begin{Chapter}{Conclusion}
        % Contents Goes Here
    \end{Chapter}

    \makereferences{myReferences.bib}

    \begin{Appendix}{Appendix Title}
    % Contents Goes Here
    \end{Appendix}


\end{document}

```
### Commands and Environments 

- You can use `\the` command to reference the supervisor or co-supervisor.

```latex

    \the\supervisor{} % The Supervisor Name

    \the\cosupervisor{}  % The Co-Supervisor Name

```

- You can use the following commands to add sections and sub sections etc.

```latex

    \section{This is Level 2}
    
    \subsection{This is Level 3}
    
    \subsubsection{This is Level 4}
    
    \paragraph{This is Level 5}

```

-  You can use the command `\input` to orgnaize your files into folders.

For example :

```latex    
    \input{chapters/introduction.tex}
```
- You must use the command `\newacronym` to add abbreviations to the list of abbreviations page.

For example :

```latex

    % To Define a new Acronym use :
    \newacronym{stft}{STFT}{Short-Time Fourier Transform}

    % To Reference it use any of the following :

    \acrshort{stft} % (STFT) 

    \acrlong{stft} % Short-Time Fourier Transform

    \acrfull{stft} % Short-Time Fourier Transform (STFT)
    
```

- You can use the command `\cite` for citation.

For example :

```latex

   \cite{thearticlecitation}
    
```

- You can use the enviroment `\equation` and `\conditions` for equations.

For example :

```latex

    \begin{equation}
        \label{eq:normaliztionEquation}
        z = \frac{x - \mu}{\sigma}
    \end{equation}
    
    where : 
    
    \begin{conditions}
        \mu & the mean \\
        \sigma & standard deviation 
    \end{conditions}
    
```
- You can use the enviroment `\figure` and `\table`.

For example :

```latex

    % To Define the figure use 
    \begin{figure}[H]
        \centering
        \includegraphics[scale=0.4]{path to image.png}
        \caption{This the caption for the figure and it should be below \protect\cite{thearticle}}
        \label{fig:nameforrefs}
    \end{figure}

     % To Define the table use 
    \begin{table}[H]
        \centering
        \caption{This the caption for the table and it should be above \protect\cite{thearticle}}
        \begin{tabular}{|c|c|}
            \hline
            A & B \\ 
            \hline
            1 & 2 \\ 
            \hline
            3 & 4 \\ 
            \hline
            5 & 6 \\ 
            \hline
        \end{tabular}
        \label{tbl:nameforrefs}
    \end{table}

    % To Reference either
    
    (see Table or Figure \ref{tbl:nameforrefs})

```

## Author 

Ayman Elfaki

## Copyright

This project is under the GPL-3.0 License.

