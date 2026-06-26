\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{MAPClass}[2025/06/01 by LE TRIEU BA VUONG]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{a4paper}
{\setlength\paperheight{297mm}%
    \setlength\paperwidth{210mm}}
\DeclareOption{a5paper}
{\setlength\paperheight{210mm}%
    \setlength\paperwidth{148mm}}
\DeclareOption{b5paper}
{\setlength\paperheight{250mm}%
    \setlength\paperwidth{176mm}}
\DeclareOption{letterpaper}
{\setlength\paperheight{11in}%
    \setlength\paperwidth{8.5in}}
\DeclareOption{legalpaper}
{\setlength\paperheight{14in}%
    \setlength\paperwidth{8.5in}}
\DeclareOption{executivepaper}
{\setlength\paperheight{10.5in}%
    \setlength\paperwidth{7.25in}}
\DeclareOption{landscape}
{\setlength\@tempdima{\paperheight}%
    \setlength\paperheight{\paperwidth}%
    \setlength\paperwidth{\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{letterpaper,10pt,twoside,onecolumn,final,openright}
\ProcessOptions
\input{bk1\@ptsize.clo}
\RequirePackage{fouriernc}
\RequirePackage{fix-cm} % Tăng kích thước chữ
\newcommand\myfont[2]{\fontsize{#1}{#2}\selectfont}
\RequirePackage{amsmath,amssymb, amsfonts, amssymb, latexsym, amscd}	
\RequirePackage{mathrsfs}
\RequirePackage{polynom}
\RequirePackage{physics}
%TỰ ĐIỀU CHỈNH DẤU NGOẶC===========================
\DeclareDocumentCommand\pbrace{l m }{\braces#1{(}{)}{#2}}
\DeclareDocumentCommand\vbrace{l m }{\braces#1{\{}{\}}{#2}}
\DeclareDocumentCommand\vlbrace{l m }{\braces#1{\{}{.}{#2}}
\DeclareDocumentCommand\slbrace{l m }{\braces#1{[}{.}{#2}}
\DeclareDocumentCommand\sbrace{l m }{\braces#1{[}{]}{#2}}
\newenvironment{sqcases}{%
 \matrix@check\sqcases\env@sqcases
}{%
 \endarray\right.%
}
\def\env@sqcases{%
 \let\@ifnextchar\new@ifnextchar
 \left\lbrack
 \def\arraystretch{1.2}%
 \array{@{}l@{\quad}l@{}}%
}
\let\@afterindentfalse\@afterindenttrue
\@afterindentfalse
\let\p\par
\RequirePackage[utf8]{vietnam}
\RequirePackage{tkz-tab}
\RequirePackage[version=4]{mhchem} 
\RequirePackage[most]{tcolorbox}
\tcbuselibrary{skins,theorems, breakable, raster}
\RequirePackage{tikzpagenodes}
\RequirePackage{tikz}
\usetikzlibrary{%
	arrows, backgrounds, calc, shapes, shapes.symbols, shapes.misc,% wg. rounded rectangle
	shapes.arrows,%
	shapes.geometric,%
	snakes,%
	shadows,%
	spy,
	through,%
	trees,
	chains,%
	intersections,%
	matrix,%
	patterns,
	positioning,% wg. " of "
	plotmarks,
	petri,
	quotes,%
	angles,%
	scopes,%
	decorations,
	decorations.pathmorphing,% /pgf/decoration/random steps | erste Graphik
	decorations.pathreplacing,%
	decorations.markings,
	decorations.text,%
}
\RequirePackage{tkz-euclide}
\usetkzobj{all}
\RequirePackage{tikz-3dplot}
\RequirePackage{tabvar}
\RequirePackage{contour}
\RequirePackage{pgfplots}
\tikzstyle{mybox} = [draw=red, very thick,rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle} =[fill=blue, text=white]
\usepgfplotslibrary{fillbetween}
\tikzset{arrow data/.style 2 args={%
decoration={%
markings,mark=at position #1 with \arrow{#2}},postaction=decorate}
}%  
\tikzstyle directed=[postaction={decorate,decoration={markings,
 mark=at position .5 with {\arrow{>}}}}]
\tikzstyle undirected=[postaction={decorate,decoration={markings,
 mark=at position .5 with {\arrow{<}}}}]
\tikzset{cross/.style={cross out, draw=black, minimum size=2.5*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt},
%default radius will be 1pt. 
cross/.default={1pt}}		 
\tikzset{hbox/.style={anchor=west,draw, rectangle,right,minimum height = 0.4cm,minimum width=1cm,label={[label distance=-4pt]$#1$}}} 
\tikzset{vbox/.style={anchor=north,draw, rectangle,below,minimum height = 1cm,minimum width=0.4cm,label={[label distance=-3pt]right:$#1$}}} 
\tikzset{dot/.style={circle=(1.5pt),inner sep=1.5pt,fill,label={[label distance=-2pt]#1},name=#1}}
\tikzset{ampe/.style={anchor=center,draw, circle,fill=white,inner sep=0pt,
 text width=6mm,align=center,label={[label distance=-3pt]\ce{#1}}}}

\tikzset{lpin/.style={shape=circle,inner sep=+0pt,minimum size=+1.2mm,label={[label distance=-3pt]left:{#1}},fill=black}}            
\tikzset{rpin/.style={shape=circle,inner sep=+0pt,minimum size=+1.2mm,label={[label distance=-3pt]right:{#1}},fill=black}}            
\tikzset{apin/.style={shape=circle,inner sep=+0.1pt,minimum size=+1.2mm,label={[label distance=-4pt]above:{\myfont{12}{16}#1}},fill=black}}            
\tikzset{bpin/.style={shape=circle,inner sep=+0pt,minimum size=+1.2mm,label={[label distance=-5pt]below:{#1}},fill=black}}            
\tikzstyle{nonamcham}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \draw[fill=white] (0,0)--(0.6,0.2)--(1.2,0)--(0.6,-0.2)--cycle;
       \draw[fill=white] (0,0)--(0.6,0.2)--(1.2,0)--(0.6,-0.2)--cycle (0.6,0.2)--(0.6,-0.2);
%\draw[pattern=north west lines] (0,0)--(0.6,0.2)--(0.6,-0.2)--cycle;
 }}}]
\tikzstyle{D}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {
\draw[fill=white] (0,0)circle(2.5mm);
\node[cross] at (0,0) {\color{white}{A}};
\node[pos=-0.5,sloped,above=4pt] at (0,0) {\myfont{12.55}{16}$#1$};
 }}}]  
\tikzstyle{L}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \fill[white] (-0.5,-0.1) rectangle (0.5,0.15);
       \draw [sloped,snake=coil, segment amplitude=5pt,segment length=5pt] (-0.5,0) -- (0.5,0); 
       \node[pos=-0.5,sloped,align=center,label={[label distance=-1pt]\ce{#1}}] at (0,0) {};
 }}}]
\tikzstyle{vL}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \fill[white] (-0.5,-0.1) rectangle (0.5,0.15);
       \draw[->] (-0.4,-0.3)--(0.35,0.35);
       \draw [sloped,snake=coil, segment amplitude=5pt,segment length=5pt] (-0.5,0) -- (0.5,0); 
       \node[pos=-0.5,sloped,align=center,label={[label distance=-1pt]\ce{#1}}] at (0,0) {};
 }}}]                       
\tikzstyle{K}=[
postaction={decorate, decoration={markings, mark= at position 0.5 with
{
	\fill[white] (-0.2,-0.1) rectangle (0.2,0.15);   
	\draw (-0.2,0)--(0.2,0.15); 		
	\filldraw[black] (0.2,0) circle(1pt);
	\filldraw[black] (-0.2,0) circle(1pt); 
	\node[pos=-0.5,sloped,align=center,label={[label distance=-1pt]\ce{#1}}] at (0,0) {};
 }}}] 
\def\cucA{A}
\def\cucB{B}
\tikzstyle{NU}=[
postaction={decorate, decoration={markings, mark= at position 0.5 with
{
	%\draw (-0.2,0)--(0.2,0.2);
	\draw[white] (-0.3,0)--(0.3,0);  
	\draw(-0.3,0)--++(45:0.2);
	\draw(-0.3,0)--++(-135:0.2);
	\draw(0.3,0)--++(45:0.2);	
	\draw(0.3,0)--++(-135:0.2);
	\filldraw[black] (0.3,0) circle(1pt);
	\filldraw[black] (-0.3,0) circle(1pt); 
	\node[sloped,align=center,label={[label distance=-1pt]\cucB}] at (0.3,0) {};
	\node[sloped,align=center,label={[label distance=-1pt]\cucA}] at (-0.3,0) {};
	\node[sloped,align=center,label={[label distance=-18pt]$-$}] at (0.3,0) {};
	\node[sloped,align=center,label={[label distance=-18pt]$+$}] at (-0.3,0) {};
}}}] 
\tikzstyle{volt}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \fill[white] (-0.075,-0.3) rectangle (0.075,0.3);
       \foreach \x in {-0.075} {\draw (\x,-0.25)--(\x,0.25);}
							\foreach \y in {0.075} {\draw (\y,0.1)--(\y,-0.1);} 
        \node[pos=-0.5,sloped,align=center,label={[label distance=-1pt]$#1$}] at (0,1) {};
 }}}]     
\tikzstyle{avolt}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \fill[white] (-0.075,-0.3) rectangle (0.075,0.3);
       \foreach \x in {-0.075} {\draw (\x,-0.1)--(\x,0.1);}
							\foreach \y in {0.075} {\draw (\y,0.25)--(\y,-0.25);} 
        \node[pos=-0.5,sloped,align=center,label={[label distance=-1pt]$#1$}] at (0,1) {};
 }}}]          
\tikzstyle{volt1}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \fill[white] (-0.075,-0.3) rectangle (0.075,0.3);
       \foreach \x in {-0.075} {\draw (\x,-0.15)node[below left]{-}--(\x,0.15);}
							\foreach \y in {0.075} {\draw (\y,0.3)--(\y,-0.3)node[right]{+};} 
        \node[pos=-0.5,sloped,above=6pt] at (0,1) {$#1$};
 }}}]       
\tikzstyle{volt2}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \fill[white] (-0.225,-0.3) rectangle (0.225,0.3);
       \foreach \x in {-0.075,0.225} {
	`								\draw (\x,-0.15)--(\x,0.15);
							}
							\foreach \y in {-0.225,0.075} {
									\draw (\y,0.3)--(\y,-0.3);
							} 
        \node[pos=-0.5,sloped,above=3pt] at (0,1) {$#1$};
 }}}] 
\tikzstyle{volt3}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \fill[white] (-0.4,-0.3) rectangle (0.4,0.3);
       \foreach \x in {-0.375,-0.075,0.225} {
	`								\draw (\x,-0.3)--(\x,0.3);}
							\foreach \y in {-0.225,0.075,0.375} {
									\draw (\y,0.15)--(\y,-0.15);
							} 
        \node[pos=-0.5,align=center,label={[label distance=-1pt]$#1$}] at (0,1) {};
 }}}] 
\tikzstyle{volt4}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {
       \draw[white,line width=0.6mm,fill=white] (-0.525,0)--(0.525,0);     
       \foreach \x in {-0.525,-0.225,0.075,0.375} {
		\draw (\x,-0.25)--(\x,0.25);}
		\foreach \y in {-0.375,-0.075,0.225,0.525} {
		\draw (\y,0.1)--(\y,-0.1);}
        \node[pos=-0.5,align=center,label={[label distance=-3pt]$#1$}] at (0,1) {};
 }}}]                           
\tikzstyle{volt5}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \fill[white] (-0.675,-0.3) rectangle (0.675,0.3);
       \foreach \x in {-0.675,-0.375,-0.075,0.225,0.525} {
	`	\draw (\x,-0.25)--(\x,0.25);}
		\foreach \y in {-0.525,-0.225,0.075,0.375,0.525,0.675} {
		\draw (\y,0.1)--(\y,-0.1);} 
        \node[pos=-0.5,align=center,label={[label distance=-3pt]$#1$}] at (0,1) {};
 }}}] 
\tikzstyle{voltn}=[postaction={decorate, decoration={markings, mark= at position 0.5 with{
\fill[white] (-0.675,-0.05) rectangle (0.675,0.05);
\foreach \x in {-0.675,-0.375,0.525} {
	\draw[very thick] (\x,-0.25)--(\x,0.25);
	\draw[very thick, dashed] (-0.225,0)--(0.525,0);
}
\foreach \y in {-0.525,-0.225,0.675} {\draw[very thick] (\y,0.1)--(\y,-0.1);} 
\node[pos=-0.5,align=center,label={[label distance=-2pt]\myfont{12}{12}$#1$}] at (0,1) {};
 }}}]        
\tikzstyle{rvR}=[
postaction={decorate, decoration={markings, mark= at position 0.5 with
	{
 	\draw[->] (0,0.8)--(0,0.3);
 	\draw (-0.02,0.8)--(1,0.8)--(1,0);	
	\fill[white] (0.5,-0.3) rectangle (0.978,0.1);	
	\node[right,sloped, draw, rectangle, fill=white, inner sep=0pt,
 minimum width=10mm, minimum height = 4mm,align=center,label={[label distance=-1pt]\ce{#1}}] at (-0.5,0) {};
 \node[right] at (-0.8,0.45) {\bth{R_b}};
 	}}}]  
\tikzstyle{lvR}=[
postaction={decorate, decoration={markings, mark= at position 0.5 with
	{
 	\draw[->] (0.5,0.8)--(0.5,0.3);
 	\draw (0.52,0.8)--(-0.5,0.8)--(-0.5,0);	
	\fill[white] (-0.478,-0.3) rectangle (0,0.1);	
	\node[right,sloped, draw, rectangle, fill=white, inner sep=0pt,
 minimum width=10mm, minimum height = 4mm,align=right] at (0,0) {};
 \node[right] at (0.4,0.45) {\bth{R_b}};
 	}}}] 
\tikzstyle{dvR}=[
postaction={decorate, decoration={markings, mark= at position 0.5 with
	{
	\clip(-0.7,-0.2) rectangle (1,1) ;
 	\draw[->] (0.2,0.6)--(0.2,0.2);
 	\draw (-0.7,0)--(-0.7,0.6)--(0.22,0.6);	
	\fill[white] (-0.678,-0.2) rectangle (0,0.1);	
	\node[sloped, draw, rectangle, fill=white, inner sep=0pt,
 minimum width=4mm, minimum height = 10mm] at (0.2,0) {};
 \node[sloped, above right=3pt] at (1,0) {\bth{R_b}};
 	}}}] 
% TỤ ĐIỆN
\tikzstyle{C}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \draw[white,line width=0.6mm,fill=white] (-0.1,0)--(0.1,0);
       \draw (-0.1,0.2) -- (-0.1,-0.2) (0.1,0.2) -- (0.1,-0.2);
        \node[pos=-0.5,sloped,above=3pt] at (0,1) {\ce{#1}};
 }}}] 
\tikzstyle{vC}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \draw[white,line width=0.6mm,fill=white] (-0.1,0)--(0.1,0);
       \draw (-0.1,0.2) -- (-0.1,-0.2) (0.1,0.2) -- (0.1,-0.2);
        \draw[->] (-0.4,-0.3)--(0.35,0.35);
        \node[pos=-0.5,sloped,above=3pt] at (0,1) {\ce{#1}};
 }}}]  
%Bình điện phân
\tikzstyle{M}=[
 postaction={decorate, decoration={markings, mark= at position 0.5 with
       {
       \fill[white] (-0.1,-0.3) rectangle (0.1,0.3);
       %\draw (-0.1,0.15) -- (-0.1,-0.15) (0.1,0.15) -- (0.1,-0.15);
       \draw (0,0)circle(7pt);
        \node[pos=-0.5,sloped,above=3pt] at (0,1) {\ce{#1}};
 }}}]        
% ĐIỆN TRỞ
\tikzstyle{R}=[
postaction={decorate, decoration={markings, mark= at position 0.5 with
	{
  \node[pos=0.5,sloped, draw, rectangle, fill=white, inner sep=0pt, minimum width=10mm, minimum height = 4mm,align=center,label={[label distance=-1pt]\ce{#1}}] at (0,0) {};
  }}}]
\tikzstyle{RX}=[
postaction={decorate, decoration={markings, mark= at position 0.5 with
{
	\node[pos=0.5,sloped, draw, rectangle, fill=white, inner sep=0pt,
 	minimum width=10mm, minimum height = 6mm,align=center,label={[label 		distance=-3pt]$#1$}] at (0,0) {X};
}}}]  
\tikzstyle{vR}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, rectangle, fill=white, inner sep=0pt,
 minimum width=10mm, minimum height = 4mm,align=center,label={[label distance=-3pt]\ce{#1}}] at (0,0) {};
	\draw[->] (-0.4,-0.3)--(0.35,0.35);
}}}]  
\tikzstyle{xR}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, rectangle, fill=white, inner sep=0pt,
 minimum width=10mm, minimum height = 4mm,align=center,label={[label distance=-1pt]\ce{#1}}] at (0,0) {};
	\draw[-] (-0.5,-0.2)--(0.5,0.2);
}}}]  
%AMPE KẾ
\tikzstyle{A}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5, draw, circle, fill=white, inner sep=0pt,
 minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-3pt]}] at (0,0) {\ce{A#1}};
}}}]  
\tikzstyle{V}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, circle, fill=white, inner sep=0pt,
 minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-3pt]}] at (0,0) {\ce{V#1}};
}}}] 
\tikzstyle{MD}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, circle, fill=white, inner sep=0pt,
 minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-6mm]\ce{M#1}}] at (0,0) {};
}}}]  
\tikzstyle{DP}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, circle, fill=white, inner sep=0pt,
 minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-3pt]\ce{#1}}] at (0,0) {\normalsize{\ce{| |}}};
}}}] 
% VÔN KẾ
\tikzset{lpin/.style={shape=circle,inner sep=+0pt,minimum size=+1.2mm,label={[label distance=-3pt]left:{#1}},fill=black}}            
\tikzset{rpin/.style={shape=circle,inner sep=+0pt,minimum size=+1.2mm,label={[label distance=-3pt]right:{#1}},fill=black}}            
\tikzset{apin/.style={shape=circle,inner sep=+0.1pt,minimum size=+1.2mm,label={[label distance=-3pt]above:{\myfont{12}{16}#1}},fill=black}}            
\tikzset{bpin/.style={shape=circle,inner sep=+0pt,minimum size=+1.2mm,label={[label distance=-3pt]below:{#1}},fill=black}}            
\newenvironment{machdien}[1]{%
			\centering\begin{tikzpicture}[scale=1,very thick,>=stealth']
			#1
			}{\end{tikzpicture} }	
\newcommand{\apin}[1]{node[apin=#1]{}}
\newcommand{\bpin}[1]{node[bpin=$#1$]{}}
\newcommand{\lpin}[1]{node[lpin=#1]{}}
\newcommand{\rpin}[1]{node[rpin=#1]{}}
\tikzset{ hidden/.style = {thick, dashed}}
\tikzset{line/.style = {ultra thick}}
\tkzSetUpPoint[fill=black,size=6]
\tikzstyle{mybox} = [draw=red, very thick,
rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle} =[fill=blue, text=white]
\RequirePackage{nicefrac}
\RequirePackage{parallel}
\tikzset{arrow data/.style 2 args={%
decoration={%
	markings,mark=at position #1 with \arrow{#2}},postaction=decorate}
}%

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth{\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright{\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright{\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
 {\LARGE \@title \par}%
    \vskip 3em%
 {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
 {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
 {\LARGE \@title \par}%
    \vskip 1.5em%
 {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
 {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{4}
\newcounter{part}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand \thepart{\@Roman\c@part}
\renewcommand \thechapter{\@arabic\c@chapter}
\renewcommand \thesection{\@arabic\c@section}
\renewcommand\thesubsection{\@Roman\c@subsection}
\renewcommand\thesubsubsection{\@arabic\c@subsubsection}
\renewcommand\theparagraph{\@alph\c@paragraph}
\renewcommand\thesubparagraph{\@alph\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
 {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
 {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{fancy}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
{\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
{\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
\newcommand\section{\@startsection{section}{1}{\z@}%
{-2pt}%
{2pt}%
{\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-1pt}%
	{2pt}%
	{\normalfont\Large\bfseries\fontfamily{qag}\selectfont}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-2pt}%
	{2pt}%
	{\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{-2pt}%
	{2pt}%
	{\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	{-2pt}%
	{2pt}%
	{normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini{2em}
\else
  \setlength\leftmargini{2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii{2.2em}
\setlength\leftmarginiii{1.87em}
\setlength\leftmarginiv{1.7em}
\if@twocolumn
  \setlength\leftmarginv{.5em}
  \setlength\leftmarginvi{.5em}
\else
  \setlength\leftmarginv{1em}
  \setlength\leftmarginvi{1em}
\fi
\setlength  \labelsep{.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\color{Mapcolor}\faCheckCircle}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
              \let\makelabel\descriptionlabel}}
  {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\bfseries #1}
\newenvironment{verse}
  {\let\\\@centercr
    \list{}{\itemsep      \z@
            \itemindent   -1.5em%
            \listparindent\itemindent
            \rightmargin  \leftmargin
            \advance\leftmargin 1.5em}%
    \item\relax}
  {\endlist}
\newenvironment{quotation}
  {\list{}{\listparindent 1.5em%
    \itemindent    \listparindent
    \rightmargin   \leftmargin
    \parsep        \z@ \@plus\p@}%
    \item\relax}
  {\endlist}
\newenvironment{quote}
  {\list{}{\rightmargin\leftmargin}%
      \item\relax}
  {\endlist}
\if@compatibility
\newenvironment{titlepage}
  {%
    \cleardoublepage
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse\newpage
    \fi
    \thispagestyle{empty}%
    \setcounter{page}\z@
  }%
  {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
 {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
 {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset{equation}{chapter}
\renewcommand\theequation
{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
  {\@float{figure}}
  {\end@float}
\newenvironment{figure*}
  {\@dblfloat{figure}}
  {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
  {\@float{table}}
  {\end@float}
\newenvironment{table*}
  {\@dblfloat{table}}
  {\end@dblfloat}
%\newlength\abovecaptionskip
%\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\normalsize\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\normalsize\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\normalsize\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\normalsize\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\normalsize\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\normalsize\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\normalsize\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
    \if@twocolumn      
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
	\thispagestyle{fancy}
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
   {\leavevmode
       \large \bfseries #1\hfil
       \hb@xt@\@pnumwidth{\hss #2%
                          \kern-\p@\kern\p@}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil
      \nobreak\hb@xt@\@pnumwidth{\hss #2%
                                 \kern-\p@\kern\p@}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\listfigurename}%
    \@mkboth{\MakeUppercase\listfigurename}%
          {\MakeUppercase\listfigurename}%
  \@starttoc{lof}%
  \if@restonecol\twocolumn\fi
  }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\listtablename}%
    \@mkboth{%
        \MakeUppercase\listtablename}%
    {\MakeUppercase\listtablename}%
  \@starttoc{lot}%
  \if@restonecol\twocolumn\fi
  }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
{\chapter*{\bibname}%
  \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}
{\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
  {\if@twocolumn
        \@restonecolfalse
      \else
        \@restonecoltrue
      \fi
      \twocolumn[\@makeschapterhead{\indexname}]%
      \@mkboth{\MakeUppercase\indexname}%
            {\MakeUppercase\indexname}%
      \thispagestyle{plain}\parindent\z@
      \parskip\z@ \@plus .3\p@\relax
      \columnseprule \z@
      \columnsep 35\p@
      \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{MỤC LỤC}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\newlength{\letren}
\newlength{\leduoi}
\newlength{\letrai}
\newlength{\lephai}
\setlength{\letren}{0.8cm} 
\setlength{\leduoi}{0.8cm} 
\setlength{\letrai}{1.8cm} 
\setlength{\lephai}{0.8cm} 
\DeclareRobustCommand{\subject}{VẬT LÍ 10}
\DeclareRobustCommand{\headtitle}{PHONG TỎA VẬT LÍ - Tập 2}
\DeclareRobustCommand{\foottitle}{ĐỊNH VỊ TRI THỨC - DẪN LỐI TƯ DUY}
\RequirePackage[a4paper, left=\letrai,right=\lephai,top=\letren,bottom=\leduoi, footskip=24pt,headsep=6pt, includeheadfoot]{geometry}
  \renewcommand\normalsize{\@setfontsize\normalsize{12}{16}}
  \newcommand{\Numone}{\fontsize{50pt}{50pt}\selectfont}
  \newcommand{\Linefont}{\fontsize{8pt}{26.5pt}\selectfont}
  \DeclareRobustCommand{\titlefont}{% 
  \bfseries\fontfamily{phv}\fontseries{b}\myfont{15.5pt}{24pt}}
\RequirePackage[cal=boondoxo]{mathalfa}
\RequirePackage{pifont}
\RequirePackage{fontawesome}

\newcommand{\myfancyhead}{
\begin{tikzpicture}[remember picture,overlay]
	\draw[Mapcolor,line width=9pt] ($(current page.north west)-(0,0.17)$)--($(current page.north east)-(0,0.17)$);
	\checkoddpage
	\ifoddpage	
		\filldraw[Mapcolor!50] ($(current page.north east)$)--++(180:10cm)--++(-45:1.9cm)--++(0:9cm);
		\filldraw[Mapcolor] ($(current page.north east)$)--++(180:10.2cm)--++(-45:1.7cm)--++(0:9.2cm);
		\filldraw[Mapcolor!50] ($(current page.north east)$) ++(180:10.4cm) --++(180:0.2cm) --++(-45:1.7cm) --++(0:0.2cm) --cycle;
		\filldraw[Mapcolor!50] ($(current page.north east)$) ++(180:10.8cm) --++(180:0.2cm) --++(-45:1.7cm) --++(0:0.2cm) --cycle;		
		\draw[white,line width=2pt] ($(current page.north east)-(1,1)$) ++(180:3.6cm)coordinate (vachsoc)--++(90:0.7cm);
		\node[right,white] at ($(vachsoc)+(0.3,0.35)$){\bf\fontsize{11}{11}\fontfamily{qag}\selectfont \subject};
		\node[left,white] at ($(vachsoc)+(-0.3,0.4)$){\bf\fontsize{11}{11}\fontfamily{qag}\selectfont \headtitle};
		\draw[Mapcolor,line width=9pt] ($(current page.north west)-(0,0.16)$)--($(current page.north east)-(0,0.16)$);
	\else
		\filldraw[Mapcolor!50] ($(current page.north west)$)--++(0:10cm)--++(-135:1.9cm)--++(180:9cm);
		\filldraw[Mapcolor] ($(current page.north west)$)--++(0:10.2cm)--++(-135:1.7cm)--++(180:9.2cm);
		\filldraw[Mapcolor!50] ($(current page.north west)$) ++(0:10.4cm) --++(0:0.2cm) --++(-135:1.7cm) --++(180:0.2cm) --cycle;
		\filldraw[Mapcolor!50] ($(current page.north west)$) ++(0:10.8cm) --++(0:0.2cm) --++(-135:1.7cm) --++(180:0.2cm) --cycle;			
		\draw[white,line width=2pt] ($(current page.north west)+(1.35cm,-0.95cm)$)--++(90:0.5cm)--++(-45:0.35cm)--++(45:0.35cm)--++(-90:0.3cm)coordinate (A);
		\draw[white,line width=2pt] ($(A)-(0.05,0.1)$)--++(0:0.2cm);
		\node[right,white] at ($(A)-(-0.3,-0.1)$){\bf\Large\fontfamily{qag}\selectfont MAPSTUDY};
		\draw[white,line width=2pt] ($(A)-(-3.2,0.2)$)coordinate (vachtrai)--++(90:0.6);	
		\node[right,white] at ($(vachtrai)+(0.3,0.3)$){\bf\fontsize{10}{11}\fontfamily{qag}\selectfont mapstudy.edu.vn};	
		\draw[Mapcolor,line width=9pt] ($(current page.north west)-(0,0.16)$)--($(current page.north east)-(0,0.16)$);	
		\draw[white,line width=2pt] ($(current page.north west)+(\lephai+0.2cm,-0.29cm)$) rectangle ($(current page.north west)+(2.1cm,-1.07cm)$);
		
	\fi
\end{tikzpicture}
}
\newcommand{\myfancyfoot}{
	\begin{tikzpicture}[remember picture,overlay]		
	\checkoddpage		
	\ifoddpage
		\filldraw[Mapcolor] ($(current page.south east)+(0,1.2)$)--++(180:7cm)--++(-45:1.7cm)--++(0:8cm);
		\filldraw[Mapcolor] ($(current page.south east)+(0,1.2)$)--++(180:7.2cm)--++(-45:1.5cm)--++(0:8.2cm);
		\filldraw[Mapcolor!50] ($(current page.south east)+(0,1.2)$) ++(180:7.4cm) --++(180:0.2cm) --++(-45:1.5cm) --++(0:0.2cm) --cycle;
		\filldraw[Mapcolor!50] ($(current page.south east)+(0,1.2)$) ++(180:7.8cm) --++(180:0.2cm) --++(-45:1.5cm) --++(0:0.2cm) --cycle;
		\node[right, Mapcolor] at ($(current page.south west)+(\letrai,0.6)$){\bf\fontfamily{qag}\selectfont \foottitle};
		\node[left,white] at ($(current page.south east)-(\lephai,-0.6)$){\fontfamily{qag}\selectfont\faHandORight~Trang \thepage};
	\else
		\filldraw[Mapcolor] ($(current page.south west)+(0,1.2)$)--++(0:7cm)--++(-135:1.7cm)--++(180:8cm);
		\filldraw[Mapcolor] ($(current page.south west)+(0,1.2)$)--++(0:7.2cm)--++(-135:1.5cm)--++(180:8.2cm);
		\filldraw[Mapcolor!50] ($(current page.south west)+(0,1.2)$) ++(0:7.4cm) --++(0:0.2cm) --++(-135:1.5cm) --++(180:0.2cm) --cycle;
		\filldraw[Mapcolor!50] ($(current page.south west)+(0,1.2)$) ++(0:7.8cm) --++(0:0.2cm) --++(-135:1.5cm) --++(180:0.2cm) --cycle;
		\node[left, Mapcolor] at ($(current page.south east)-(\letrai,-0.6)$){\bf\fontfamily{qag}\selectfont \foottitle};
		\node[right,white] at ($(current page.south west)+(\lephai,0.6)$){\fontfamily{qag}\selectfont\faHandORight~Trang \thepage};
	\fi
	\draw[Mapcolor,line width=2pt] ($(current page.south west)+(0,1.2)$)--($(current page.south east)+(0,1.2)$);
	\end{tikzpicture}
}
\newcommand{\headmucluc}{%
	\boldmath
	\begin{tikzpicture}[remember picture,overlay,>=stealth]
		\checkoddpage\ifoddpage %nếu trang lẻ
		\def\kctrai{\phai} \def\kcphai{\trai}
		\pgfmathsetmacro{\letren}{-\letren+0.5*\topset} 
		\path ([xshift=\kctrai cm, yshift=-1 cm]current page.north west) coordinate (AA)
		++(\textwidth,0)coordinate (BB); 
		%---- bên phải
		\foreach \ii/\mau in {1.35/Mapcolor!30,1/Mapcolor!50,0.5/Mapcolor!70,-0.1/Mapcolor}{
			\fill[\mau,draw=white,line width=2pt] ([xshift=1pt,yshift=1pt]BB)--++(-0.75 cm-\ii cm-3pt,0)
			--++(-0.3,0.5cm+1pt)--++(0.75 cm +\ii cm+3pt+0.3 cm,0)--cycle
			;
		}
		\node[anchor=south east,text=Mapcolor,inner sep=0pt] at ([xshift=-0.75 cm-1.35cm-10pt]BB){\fontfamily{qag}\fontsize{10pt}{12pt}\selectfont\nouppercase{\trenchanphai}};
		%-----đường kẻ
		\draw[\maukefoot, line width=1.5pt] (AA) --(BB);
		\node[text=Mapcolor, anchor=west,inner sep=0pt] (trang) at ([yshift=6pt]AA){\fontfamily{qag}\fontsize{10pt}{12pt}\selectfont Trang};
		\node[rectangle, fill=Mapcolor, text=white, anchor=west,inner sep=3pt, rounded corners=4pt] at ([xshift=3pt,yshift=1.5pt]trang.east){\fontfamily{qag}\fontsize{10pt}{18pt}\selectfont\bfseries\thepage};
		\else
		\def\kctrai{\trai} \def\kcphai{\phai}
		\pgfmathsetmacro{\kctren}{-\tren+0.5*\topset} 
		\path ([xshift=\kctrai cm, yshift=\kctren cm]current page.north west) coordinate (AA)
		++(\textwidth,0)coordinate (BB); 
		%---- màu bên trái
		\foreach \ii/\mau in {1.35/Mapcolor!30,1/Mapcolor!50,0.5/Mapcolor!70,-0.1/Mapcolor}{
			\fill[\mau,draw=white,line width=2pt] ([xshift=-1pt,yshift=1pt]AA)--++(0.75 cm+\ii cm+3pt,0)--++(0.3,0.5cm+1pt)--++(-0.75 cm -\ii cm-3pt-0.3cm,0)--cycle;
		}
		%---- chữ
		\node[anchor=south west,text=Mapcolor,inner sep=0pt] at ([xshift=0.75 cm+1.35cm+10pt,yshift=1pt]AA){\fontfamily{qag}\fontsize{10pt}{12pt}\selectfont\nouppercase{\trenletrai}};
		%-----đường kẻ
		\draw[\maukefoot, line width=1.5pt] (AA) -- (BB);
		%-----bên phải
		\node[rectangle, fill=Mapcolor, text=white, anchor=south east,inner sep=3pt, rounded corners=4pt] (sotrang) at ([xshift=0cm,yshift=1.5pt]BB){\fontfamily{qag}\fontsize{10pt}{12pt}\selectfont\bfseries\thepage};
		\node[text=Mapcolor, anchor=east,inner sep=0pt] at ([xshift=-3pt,yshift=-1pt]sotrang.west){\fontfamily{qag}\fontsize{10pt}{18pt}\selectfont Trang};
		%-------------------
		\fi
	\end{tikzpicture}%
}
\RequirePackage{afterpage}
\RequirePackage[explicit]{titlesec} % để gọi #1
%--------------Tròn
\newcommand{\tron}[1]{
	\begin{tikzpicture}[baseline=(A.base)]%
		\node[circle,draw=blue,line width=0.5pt,fill=white,inner sep=2pt,outer sep=1pt] (A){\color{white} #1};
		\node[circle,draw=none,fill=blue,inner sep=1pt,outer sep=1pt] (A){\color{white} #1};
	\end{tikzpicture}%
}
%================= Đn chương
\titlespacing{\chapter}{0cm}{1.25cm}{0.5cm}[0cm] %1: , 2: Trên, 3: dưới
\titleformat{\chapter}
{\fontsize{25pt}{30pt}\fontfamily{qag}\selectfont\bfseries\color{white}} %định dạng chung
{} %đánh số
{-0.4cm}
{
	\parbox{15cm}{\raggedleft\MakeUppercase{#1}} %neo vitri
	\begin{tikzpicture}[remember picture,overlay,line join=round,line cap=round] 
		\fill[top color=Mapcolor!40,bottom color=white] (current page.north west) rectangle ([yshift=-8.5cm]current page.north east);
		\begin{scope}
			\clip (current page.north west) rectangle ([yshift=-7cm]current page.north east);
			\draw[line width=1pt,white,step=0.75cm,rotate=45] (current page.north west) grid ([yshift=-7cm]current 	page.north east);
		\end{scope}	
		%------------------------------------
		\checkoddpage\ifoddpage %nếu trang lẻ
		\def\sokc{\lephai}
		\else
		\def\sokc{\letrai}
		\fi
		%==============
		\node[scale=2.5,text=Mapcolor,anchor=north east,inner sep=0pt]  (tam) at ([xshift=-\sokc,yshift=-1.75*1.25cm]current page.north east){
			{\thechapter}
		};
		%--	chương
		\node[anchor=south east, text=Mapcolor, inner sep=0pt,scale=1,yshift=-2pt] (chuong) at ([xshift=-4mm]tam.south west){\chaptername
		};
		%============= Nền màu trái
		\foreach \ii/\mau in{0/Mapcolor!50,0.5/Mapcolor!70,1.2/Mapcolor!90}{
			\fill[\mau,draw=white,line width=4pt] 
			([xshift=-4mm-\ii cm]chuong.north west)
			--++(-0.5,-1)--++(-\paperwidth,0)--++(0,1)--cycle;
		}
		%-- nội dung chương
		\node[scale=1,text=Mapcolor,anchor=north east,inner sep=0pt] at ([yshift=-0.25cm]tam.south east){
			\parbox{15cm}{\raggedleft\MakeUppercase{#1}}
		};
		\node[left,Mapcolor] at ($(current page.north west)+(10.3cm,-0.9cm)$){\large\bf\fontfamily{qag}\selectfont mapstudy.edu.vn};
		\draw[Mapcolor,line width=2pt] ($(current page.north west)+(\letrai,-0.45cm)$) rectangle ($(current page.north west)+(3.1cm,-1.25cm)$);
		\draw[Mapcolor,line width=2pt] ($(current page.north west)+(2.35cm,-1.15cm)$)--++(90:0.5cm)--++(-45:0.35cm)--++(45:0.35cm)--++(-90:0.3cm)coordinate (A);
		\draw[Mapcolor,line width=2pt] ($(A)-(0.05,0.1)$)--++(0:0.2cm);
		\node[right,Mapcolor] at ($(A)-(-0.3,-0.1)$){\bf\Large\fontfamily{qag}\selectfont MAPSTUDY};
		\draw[Mapcolor,line width=2pt] ($(A)-(-3.3,0.2)$)--++(90:0.6);
	\end{tikzpicture}
}
[\vspace{1cm}]
%============================Mục lục - Chapter*
\titleformat{name=\chapter,numberless}[display]
    {\fontsize{21pt}{18pt}\fontfamily{qag}\selectfont\bfseries\color{blue}} %định dạng chung
    {}
    {-3em}
    {%
      \begin{tikzpicture}[remember picture,overlay,line join=round,line cap=round] 
        \fill[top color=Mapcolor!40,bottom color=white] (current page.north west) rectangle ([yshift=-8.5cm]current page.north east);
        \begin{scope}
          \clip (current page.north west) rectangle ([yshift=-7cm]current page.north east);
          \draw[line width=1pt,white,step=0.75cm,rotate=45] (current page.north west) grid ([yshift=-7cm]current 	page.north east);
        \end{scope}	
        %------------------------------------
        \checkoddpage\ifoddpage %nếu trang lẻ
        \def\sokc{\lephai}
        \else
        \def\sokc{\letrai}
        \fi
        %==============
        \node[scale=2.5,text=Mapcolor,anchor=north east,inner sep=0pt]  (tam) at ([xshift=-\sokc,yshift=-1.75*1.25cm]current page.north east){
          {}
        };
        %--	chương
        \node[anchor=south east, text=Mapcolor, inner sep=0pt,scale=1] (chuong) at ([xshift=-4mm,yshift=-8mm]tam.south west){\MakeUppercase #1};
        %============= Nền màu trái
        \foreach \ii/\mau in{0/Mapcolor!50,0.5/Mapcolor!70,1.2/Mapcolor!90}{
          \fill[\mau,draw=white,line width=4pt] 
          ([xshift=-4mm-\ii cm]chuong.north west)
          --++(-0.5,-1)--++(-\paperwidth,0)--++(0,1)--cycle;
        }
        \node[left,Mapcolor] at ($(current page.north west)+(10.3cm,-0.9cm)$){\large\bf\fontfamily{qag}\selectfont mapstudy.edu.vn};
		\draw[Mapcolor,line width=2pt] ($(current page.north west)+(\letrai+0.3cm,-0.45cm)$) rectangle ($(current page.north west)+(3.1cm,-1.25cm)$);
		\draw[Mapcolor,line width=2pt] ($(current page.north west)+(2.35cm,-1.15cm)$)--++(90:0.5cm)--++(-45:0.35cm)--++(45:0.35cm)--++(-90:0.3cm)coordinate (A);
		\draw[Mapcolor,line width=2pt] ($(A)-(0.05,0.1)$)--++(0:0.2cm);
		\node[right,Mapcolor] at ($(A)-(-0.3,-0.1)$){\bf\Large\fontfamily{qag}\selectfont MAPSTUDY};
		\draw[Mapcolor,line width=2pt] ($(A)-(-3.3,0.2)$)--++(90:0.6);
      \end{tikzpicture}
    }
    [
    \vspace{1.25cm}
    \thispagestyle{fancy}
    ]
\titleformat{\section}
				{\color{white}\fontfamily{qag}\fontsize{18pt}{22pt}\selectfont\bfseries}
				{}
				{0cm}
				{\begin{tikzpicture}[line join=round,line cap=round]
						\def\ndbai{\parbox{15cm}{\centering{\MakeUppercase{#1}}}}
						\def\canhlg{0.65}
						\pgfmathsetmacro{\kchm}{2*\canhlg*cos(30)} 
						%-- Lục giác
						\fill[Mapcolor] (0,0)--++(-30:\canhlg)--([turn]60:\canhlg cm)--([turn]60:\canhlg cm)--([turn]60:\canhlg cm)--([turn]60:\canhlg cm)--cycle; 		
						%-- kẻ dưới
						\draw[draw=Mapcolor, line width=2pt] 
						(0,0)++(-30:\canhlg)++(0,-5pt) --++(30:\canhlg)--++(\textwidth-\kchm cm-1.5 cm,0) coordinate (tronphai)
						(0,0)++(-30:\canhlg)++(0,-5pt)--++(150:\canhlg)--++(-1.2,0) coordinate (bai);
						\fill[fill=Mapcolor] (tronphai) circle (3pt) (bai) circle (3pt);
						%-- Nội dung chính --	
						\draw (0,0)++(-30:\canhlg)++(0,-5pt) ++(30:\canhlg)++(0.5*\textwidth-0.5*\kchm cm-0.5*1.5 cm,0) node[inner sep=0pt,text=Mapcolor,above=4pt]{\ndbai};
						%--Bài và số bài
						\node[text=white] at (30:\canhlg){\fontsize{20pt}{1pt}\selectfont\thesection};
						\draw ([yshift=4mm,xshift=-3pt]bai) node[inner sep=0pt,right,Mapcolor]{Bài};
				\end{tikzpicture}
        \setcounter{dang}{0}
        }
		[]
\titleformat{\subsection}
    {\fontfamily{qag}\selectfont\bfseries\color{Mapcolor}}
    {\hspace*{-2.5mm}
      \begin{tikzpicture}[baseline=(SonA.base),line join=round,line cap=round]%
        \node[diamond,draw=none,ball color=Mapcolor,inner sep=2pt,outer sep=1pt] (SonA) {\color{white} {\thesubsection}};
        \draw[red,line width=0.6pt] ([xshift=1pt]SonA.east)--++(135:0.35) ([xshift=1pt]SonA.east)--++(-135:0.35);
        \draw[red,line width=0.6pt] ([xshift=-1pt]SonA.west)--++(45:0.35) ([xshift=-1pt]SonA.west)--++(-45:0.35);
        \draw[red,line width=0.6pt] ([xshift=3.5pt]SonA.east)--++(135:0.2) ([xshift=3pt]SonA.east)--++(-135:0.2);
        \draw[red,line width=0.6pt] ([xshift=-3.5pt]SonA.west)--++(45:0.2) ([xshift=-3pt]SonA.west)--++(-45:0.2);
      \end{tikzpicture}%
    }
    {0.45em}
    {#1\setcounter{subsubsection}{0}}
    []
\titleformat{\subsubsection}
  {\fontfamily{qag}\selectfont\bfseries\color{Mapcolor}}
  {
    \hspace*{-2mm}
    \begin{tikzpicture}[baseline=(char.base),line join=round,line cap=round]
      \node[text=white, fill=Mapcolor!85,rounded corners=3pt, inner sep=5pt, outer sep=2pt] (char) at (0,0){\thesubsubsection};
    \end{tikzpicture}%
  }
  {0.75em}
  {#1}
  []
\newcommand\paratron[1]{\tikz[baseline=(char.base)]{
      \draw (char) circle(0.5cm);
      \node[shape=circle,draw,inner sep=0.5pt] (char) {#1};}}
\titleformat{\paragraph}
  {
  \bfseries\color{Mapcolor}}
  {
  \hspace*{-2mm}
  \begin{tikzpicture}[baseline=(char.base),line join=round,line cap=round]
      \draw[fill=Mapcolor!85, double,double distance=0.5mm] (char) circle(0.3cm);
      \node[white] (char) at (0,0){\,\theparagraph\,};
  \end{tikzpicture}%
  }
  {0.75em}
  {#1}
  []
%%%----------------------------------------------------------------------------------------------
%%%ĐIỀU CHỈNH MỤC LỤC
  \RequirePackage{titletoc} 
  \titlecontents{chapter}[6.5pc] % nd cách trái
    {\addvspace{0pt}%
      \color{coolblack}\fontsize{13pt}{16pt}\fontfamily{put}\selectfont\bfseries
    }%
    {\contentslabel[\chaptertitlename\,\huge{\thecontentslabel}\normalsize.]{6.5pc}} %nhãn
    {\fontfamily{qag}\selectfont}
    {\hrulefill\bfseries\thecontentspage
    }%
  \titlecontents{section}[6pc]
    {\addvspace{0pt}\bfseries\color{colorF}}
    {\fontsize{12.5pt}{15pt}\selectfont\sffamily\contentslabel[{Bài\,\thecontentslabel:}]{3.5pc}}
    {}
    {\hrulefill\thecontentspage
    }
    []
  \newcommand*\tronsub[1]{\raisebox{0.1cm}{\tikz[baseline=(char.base)]{
      \draw[fill = coolblack,double, double distance = 1pt,line width = 1.5pt,draw=coolblack] (0,0.3) coordinate(char) circle (0.25cm);
      \node[white] at (0,0.3) {\bf\small #1};}}}
  \titlecontents{subsection}[6pc]
    {\addvspace{0pt}\color{teal}}
    {\fontsize{12pt}{15pt}\selectfont\sffamily\contentslabel[\tronsub{\thecontentslabel}
      ]{2pc}}
    {}
    {{\tiny\dotfill}\thecontentspage}
    []
\RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[LO,RE]{\myfancyhead}
  \fancyfoot[LO,RE]{\myfancyfoot}
  \def\subsectiontitle{}
  \renewcommand{\footrulewidth}{0pt}
  \renewcommand{\headrulewidth}{0pt}
  \newcounter{coter}
  \setcounter{coter}{0}
  \def\sodem{\stepcounter{coter}\thecoter}
  \definecolor{Mapcolor}{cmyk}{0, 0.948, 0.948, 0.502}
  \definecolor{coolblack}{cmyk}{1.0, 0.538, 0.0, 0.61}

\newcommand{\vien}[1]{
        \path[fill=#1,draw=#1] (interior.south east)--++(0,0.2)
        --([xshift=-2cm,yshift=0.2cm]interior.south east) to[bend right=3pt] ([xshift=-2.75cm,yshift=0mm]interior.south east)--cycle;
}

\newcommand{\gapgoc}[1]{
        \path[fill=white!60!#1]
        ([yshift=6mm]interior.south east)-- ++ (-0.7,-0.1)--++(0.1,-0.5);
        \path[draw=#1,shorten <=-0.05mm,shorten >=-0.05mm] ([yshift=6mm]interior.south east) -- ++(-0.7,-0.1)--++(0.1,-0.5);
}

\newcommand{\loxoh}[1]{%
    \tikzpicture[transform shape,scale=0.5]
    \node[circle,scale=1.2,draw=#1,fill=lightgray](1){};
    \foreach \i in{0,2}{
    \draw[#1,line width=.3mm]([shift={(-0.\i,-.08)}]1.north east)arc(-40:-338:1.3mm and 5.3mm);}
    \endtikzpicture}

\def\xegiay#1{\begin{tcolorbox}[enhanced,sharp corners,frame hidden,
interior style={draw=blue,line width=1pt,left color=blue!0,right color=white,
decoration={random steps,segment length=0.3cm,amplitude=.1cm},
decorate,blur shadow},
boxsep=0mm,top=5mm,halign=left,after skip=5mm,bottom=4mm]		
#1
\end{tcolorbox}
}
%%%%%%%%
\newtcolorbox{outerbox}{enhanced, sharp corners, boxrule=0pt, interior style={top color=yellow, bottom color=yellow!50!red}, notitle}
%%%%%%%%%%%%%%%
\newcommand{\numi}[2][regular polygon,regular polygon sides=5,inner sep=.5mm]{
\renewcommand{\labelenumi}{%
 \begin{tikzpicture}[baseline=(1.base)]
 \node[draw,#1,fill=#2,font=\bfseries](1){\arabic{enumi}};
\end{tikzpicture} }
}

\newcommand{\numii}[2][chamfered rectangle,inner sep=.2mm]{
\renewcommand{\labelenumii}{%
 \begin{tikzpicture}[baseline=(1.base)]
 \node[draw,#1,fill=#2,font=\bfseries\footnotesize,minimum size=5mm](1){\alph{enumii}};
\end{tikzpicture}}
}

\newcommand{\datnumsec}[3][regular polygon,regular polygon sides=5,inner sep=.1mm]{
 \begin{tikzpicture}[baseline=(1.base)]
 \node[draw,#1,fill=#2,font=\bfseries](1){#3};
\end{tikzpicture} 
}
\DeclareTColorBox[auto counter,list inside=listtcb09]{kienthuc}{O{teal} m d"" O{} d''}
 {enhanced,
    breakable,
    colframe=Mapcolor,
    colback=white!95!#1,
    colbacktitle=red!50!black,
    coltitle=white,
    fonttitle=\large\bfseries,
    IfValueTF={#3}{watermark text={#3}}{},
    before skip=2mm,
    after skip=2mm,
    top=0mm,
    boxrule=0.5mm,
    attach boxed title to top center={
        yshift*=1mm-\tcboxedtitleheight
        },
    boxed title style={
        frame code={
            \draw[color=Mapcolor,thick,fill=Mapcolor]
            ([yshift=-1mm,xshift=-1mm]frame.north west)
            arc[start angle=0,end angle=180,radius=1mm]
            ([yshift=-1mm,xshift=1mm]frame.north east)
            arc[start angle=180,end angle=0,radius=1mm];
            \draw[color=Mapcolor,thick,fill=Mapcolor]
            ([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
            [rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
            -- (frame.south east)--(frame.south)[sharp corners]--(frame.south west)
            --([xshift=-1mm,yshift=-1mm]frame.north west)
            [sharp corners]-- cycle;
            },
        interior engine=empty,
        },
    overlay unbroken and first={
        \foreach \i in{0.1,0.2,...,0.9}
         {
            \node at ($([yshift=-2.4mm,xshift=2mm]title.north east)!\i!([yshift=-1.4mm]frame.north east)$){\loxoh{#1}};
            }
        \foreach \i in{0.1,0.2,...,0.9}
         {
            \node at ($([yshift=-2.4mm,xshift=-2mm]title.north west)!\i!([yshift=-1.4mm]frame.north west)$){\loxoh{#1}};
            }
        },
    title style={right color=Mapcolor,left color=blue},
IfValueTF={#5}{title={#2~#5},list entry={#2~#5}}{title={\fontfamily{qag}\selectfont#2},list entry={#2}},
#4}
%============================Ô TÍCH ĐÚNG SAI===================================
% Lệnh cho ô vuông đánh dấu đúng
\newcommand{\dungsai}{\hfill \begin{tikzpicture}
		%\fill[left color = blue!50,right color = red!50, middle color=blue!50!black,rounded corners=2pt](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
		\fill[left color = Mapcolor,right color = Mapcolor,rounded corners=2pt](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
		\fill[white](0.05,0.05)--++(0:1)--++(90:0.4)--++(180:1)--cycle;
		\node at (1.55,0.25)[white]{$CTE$};
	\end{tikzpicture}
}
\newcommand{\ds}[1]{%
    \begin{tabular}[b]{@{}p{\dimexpr\linewidth-2cm}@{}p{2cm}@{}}
    #1 & 
    \begin{tikzpicture}
        \fill[left color = Mapcolor,right color = Mapcolor,rounded corners=2pt](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
        \fill[white](0.32,0.05)--++(0:0.67)--++(90:0.4)--++(180:0.67)--cycle;
        \fill[white](1.05,0.05)--++(0:0.67)--++(90:0.4)--++(180:0.67)--cycle;
        \node at (1.85,0.25)[white]{$S$};
        \node at (0.15,0.25)[white]{$\text{Đ}$};
    \end{tikzpicture}
    \end{tabular}%
}
%============================Ô TÍCH TRẢ LỜI NGẮN===================================
% Lệnh cho ô vuông đánh dấu đúng
\newcommand{\traloingan}{\begin{tikzpicture}
		%\fill[left color = blue!50,right color = red!50, middle color=blue!50!black,rounded corners=2pt](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
		\draw[green!40!blue,rounded corners=2pt,thick](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
		\draw[green!40!blue, thick](0.5,0)--(0.5,0.5)(1,0)--(1,0.5)(1.5,0)--(1.5,0.5);
\end{tikzpicture}
}
\newcommand{\tln}{\begin{tikzpicture}
		%\fill[left color = blue!50,right color = red!50, middle color=blue!50!black,rounded corners=2pt](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
		\draw[green!40!blue,rounded corners=2pt,thick](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
		\draw[green!40!blue, thick](0.5,0)--(0.5,0.5)(1,0)--(1,0.5)(1.5,0)--(1.5,0.5);
\end{tikzpicture}
}

	\newcommand{\nguon}[1]{(#1)}
	\newcommand{\gv}[1]{\par\noindent\large{\textbf{\textcolor{red}{GV chú ý: #1}}}\normalsize}
	\DeclareRobustCommand{\loai}[1]{\par\noindent\textbf{Loại: }#1}
	\newcommand{\Anlythuyet}[1]{#1}
	\RequirePackage{Packages/ex_test}
	\RequirePackage{enumitem}
	\RequirePackage{kvoptions}
	\SetupKeyvalOptions{
	  family=MAPClass,
	  prefix=MAPClass@
	}
	\newcommand{\namevidu}{\color{Mapcolor}\faBook~Ví dụ}
\newtheorem{vidu}{\namevidu}
\RequirePackage{tabularx}
	\newcolumntype{Y}{>{\raggedleft\arraybackslash}X}
\RequirePackage{booktabs, array, rotating, varwidth}
\newbox\LT@firstfoot
\def\endfirstfoot{\LT@end@hd@ft\LT@firstfoot}
\newdimen\LT@footdiff
\def\LT@start{%
  \let\LT@start\endgraf
  \endgraf\penalty\z@
  \vskip\LTpre
  \LT@footdiff-\ht\LT@foot
  \advance\LT@footdiff\ht\LT@firstfoot
  \dimen@\pagetotal
  \advance\dimen@ \ht\ifvoid\LT@firsthead\LT@head\else\LT@firsthead\fi
  \advance\dimen@ \dp\ifvoid\LT@firsthead\LT@head\else\LT@firsthead\fi
  \advance\dimen@ \ht\ifvoid\LT@firstfoot\LT@foot\else\LT@firstfoot\fi
  \dimen@ii\vfuzz
  \vfuzz\maxdimen
  \setbox\tw@\copy\z@
  \setbox\tw@\vsplit\tw@ to \ht\@arstrutbox
  \setbox\tw@\vbox{\unvbox\tw@}%
  \vfuzz\dimen@ii
  \advance\dimen@ \ht
      \ifdim\ht\@arstrutbox>\ht\tw@\@arstrutbox\else\tw@\fi
  \advance\dimen@\dp
      \ifdim\dp\@arstrutbox>\dp\tw@\@arstrutbox\else\tw@\fi
  \advance\dimen@ -\pagegoal
  \ifdim \dimen@>\z@\vfil\break\fi
  \global\@colroom\@colht
  \ifvoid\LT@firstfoot
    \ifvoid\LT@foot
    \else
      \advance\vsize-\ht\LT@foot
      \global\advance\@colroom-\ht\LT@foot
      \dimen@\pagegoal\advance\dimen@-\ht\LT@foot\pagegoal\dimen@
      \maxdepth\z@
    \fi
  \else
    \advance\vsize-\ht\LT@firstfoot
    \global\advance\@colroom-\ht\LT@firstfoot
    \dimen@\pagegoal\advance\dimen@-\ht\LT@firstfoot\pagegoal\dimen@
    \maxdepth\z@
  \fi
  \ifvoid\LT@firsthead\copy\LT@head\else\box\LT@firsthead\fi\nobreak
  \output{\LT@output}%
}
\def\LT@output{%
  \ifnum\outputpenalty <-\@Mi
    \ifnum\outputpenalty > -\LT@end@pen
      \LT@err{floats and marginpars not allowed in a longtable}\@ehc
    \else
      \setbox\z@\vbox{\unvbox\@cclv}%
      \ifdim \ht\LT@lastfoot>\ht\LT@foot
        \dimen@\pagegoal
        \advance\dimen@-\ht\LT@lastfoot
        \ifdim\dimen@<\ht\z@
          \setbox\@cclv\vbox{\unvbox\z@\copy\LT@foot\vss}%
          \@makecol
          \@outputpage
          \setbox\z@\vbox{\box\LT@head}%
        \fi
      \fi  
      \global\@colroom\@colht
      \global\vsize\@colht   
      \vbox
        {\unvbox\z@\box\ifvoid\LT@lastfoot\LT@foot\else\LT@lastfoot\fi}%
    \fi
  \else
    \ifvoid\LT@firstfoot
      \setbox\@cclv\vbox{\unvbox\@cclv\copy\LT@foot\vss}%
      \@makecol
      \@outputpage
      \global\vsize\@colroom
    \else
      \setbox\@cclv\vbox{\unvbox\@cclv\box\LT@firstfoot\vss}%
      \@makecol
      \@outputpage
      \global\advance\@colroom\LT@footdiff
      \global\vsize\@colroom
    \fi
    \copy\LT@head\nobreak
  \fi
}
\RequirePackage{colortbl}
	\renewcommand{\nameex}{\raisebox{-0.1cm}{\tikz{
	\draw[Mapcolor,line width=2pt,rounded corners = 1pt,fill=Mapcolor] (0,-0.25) rectangle (0.6,0.25);
	\draw[white,line width=2pt] (0.1,-0.2)--++(90:0.3)--++(-45:0.2)--++(45:0.2)--++(-90:0.2)coordinate(b);
	\draw[white,line width=2pt] ($(b)-(0,0.05)$)--++(0:0.15);
		}}\color{Mapcolor}\bf\normalsize~Câu}
  

\newcommand{\choicehaicot}[2]{
	\picinpar
	\setlength{\dorong}{\dimexpr0.5\linewidth-0.01\dorongfix-\widthalpha-3.5\fboxsep\relax}
	\par\setlength{\parskip}{\parskipchoice}%
	\setcounter{dapan}{0}%
	\ifnum\chType<1
		\setcounter{numTrue}{0}
		\setcounter{numTrueSol}{0}
	\fi
	\noindent\hspace{0.02\dorongfix}\begindapan
	#1\dotEX\strut
		\ifnum\addanswers=1 \ifnum\chType=1\ifnum\addquestions=1\gdef\deA{#1}\fi\fi\fi
	\end{minipage}%
	\noindent\begindapan
	#2\dotEX\strut
		\ifnum\addanswers=1 \ifnum\chType=1\ifnum\addquestions=1\gdef\deB{#2}\fi\fi\fi
	\end{minipage}%

}
\newcommand{\choicebacot}[3]{
	\picinpar
	\setlength{\dorong}{\dimexpr0.33\linewidth-0.01\dorongfix-\widthalpha-3.5\fboxsep\relax}
	\par\setlength{\parskip}{\parskipchoice}%
	\setcounter{dapan}{0}%
	\ifnum\chType<1
		\setcounter{numTrue}{0}
		\setcounter{numTrueSol}{0}
	\fi
	\noindent\hspace{0.02\dorongfix}\begindapan
	#1\dotEX\strut
		\ifnum\addanswers=1 \ifnum\chType=1\ifnum\addquestions=1\gdef\deA{#1}\fi\fi\fi
	\end{minipage}%
	\noindent\begindapan
	#2\dotEX\strut
		\ifnum\addanswers=1 \ifnum\chType=1\ifnum\addquestions=1\gdef\deB{#2}\fi\fi\fi
	\end{minipage}%
	\noindent\begindapan
	#3\dotEX\strut
		\ifnum\addanswers=1 \ifnum\chType=1\ifnum\addquestions=1\gdef\deC{#3}\fi\fi\fi
	\end{minipage}%
}

\newcommand{\choicemotcot}[2]{
	\picinpar
	\setlength{\dorong}{\dimexpr\linewidth-0.02\dorongfix-\widthalpha-3.5\fboxsep\relax}
	\par\setlength{\parskip}{\parskipchoice}%
	\setcounter{dapan}{0}
	\ifnum\chType<1
		\setcounter{numTrue}{0}
		\setcounter{numTrueSol}{0}
	\fi
	\noindent\hspace{0.02\dorongfix}\begindapan
	#1\dotEX\strut
		\ifnum\addanswers=1 \ifnum\chType=1\ifnum\addquestions=1\gdef\deA{#1}\fi\fi\fi
	\end{minipage}%
	\par\setlength{\parskip}{\parskipchoice}
	\noindent\hspace{0.02\dorongfix}\begindapan
	#2\dotEX\strut
		\ifnum\addanswers=1 \ifnum\chType=1\ifnum\addquestions=1\gdef\deB{#2}\fi\fi\fi
	\end{minipage}%

}
\newcommand{\choicemotcotb}[3]{
	\picinpar
	\setlength{\dorong}{\dimexpr\linewidth-0.02\dorongfix-\widthalpha-3.5\fboxsep\relax}
	\par\setlength{\parskip}{\parskipchoice}%
	\setcounter{dapan}{0}
	\ifnum\chType<1
		\setcounter{numTrue}{0}
		\setcounter{numTrueSol}{0}
	\fi
	\noindent\hspace{0.02\dorongfix}\begindapan
	#1\dotEX\strut
		\ifnum\addanswers=1 \ifnum\chType=1\ifnum\addquestions=1\gdef\deA{#1}\fi\fi\fi
	\end{minipage}%
	\noindent\begindapan
	#2\dotEX\strut
		\ifnum\addanswers=1 \ifnum\chType=1\ifnum\addquestions=1\gdef\deB{#2}\fi\fi\fi
	\end{minipage}%
	\noindent\begindapan
	#3\dotEX\strut
		\ifnum\addanswers=1 \ifnum\chType=1\ifnum\addquestions=1\gdef\deC{#2}\fi\fi\fi
	\end{minipage}%
}
\newcommand{\choiceH}[3][0]{%
    \gdef\chType{0}\setcounter{dapan}{0}%
    % Tương thích môi trường{center}
    \let\originalcenter\center%
    \let\originalendcenter\endcenter%
    \renewenvironment{center}%
     {\par\centering\bgroup}%
     {\egroup\par}%
    %
    \setlength{\halftabwidth}{\dimexpr0.5\linewidth-0.01\dorongfix-\widthalpha-3.5\fboxsep\relax}%
    \settowidth\widthcha{#2\dotEX}%
    \settowidth\widthchb{#3\dotEX}%
    \setlength{\widthch}{\widthcha}%
    \ifdim\widthch<\widthchb\relax\setlength{\widthch}{\widthchb}\fi%
    \ifthenelse{\equal{#1}{0}}
 {\ifdim\widthch<\halftabwidth\relax
          \choicehaicot{#2}{#3}%
        \else
          \choicemotcot{#2}{#3}%
      \fi
    }
 {\ifthenelse{\equal{#1}{1}}
 {\choicemotcot{#2}{#3}}
 {\ifthenelse{\equal{#1}{2}}
 {\setlength{\parskip}{\parskipchoice}%
    \haicot{#2}{#3}}
 {\def\parskipchoice{#1}%
    \ifdim\widthch<\halftabwidth
          \choicehaicot{#2}{#3}
        \else
          \choicemotcot{#2}{#3}
      \fi\fi
    }}}%
    % Trả lại định nghĩa gốc môi trường{center}
    \let\center\originalcenter%
    \let\endcenter\originalendcenter%
}
\newcommand{\choiceB}[4][0]{%
    \gdef\chType{0}\setcounter{dapan}{0}%
    % Tương thích môi trường{center}
    \let\originalcenter\center%
    \let\originalendcenter\endcenter%
    \renewenvironment{center}%
     {\par\centering\bgroup}%
     {\egroup\par}%
    %
    \setlength{\thirdtabwidth}{\dimexpr0.33\linewidth-0.005\dorongfix-\widthalpha-3.5\fboxsep\relax}%
    \setlength{\halftabwidth}{\dimexpr0.5\linewidth-0.01\dorongfix-\widthalpha-3.5\fboxsep\relax}%
    \settowidth\widthcha{#2\dotEX}%
    \settowidth\widthchb{#3\dotEX}%
    \settowidth\widthchc{#4\dotEX}%
    \setlength{\widthch}{\widthcha}%
    \ifdim\widthch<\widthchb\relax\setlength{\widthch}{\widthchb}\fi%
    \ifdim\widthch<\widthchc\relax\setlength{\widthch}{\widthchc}\fi%
    \ifthenelse{\equal{#1}{0}}
 {\ifdim\widthch<\thirdtabwidth\relax
          \choicebacot{#2}{#3}{#4}%
        \else
          \choicemotcotb{#2}{#3}{#4}%
      \fi
    }
 {\ifthenelse{\equal{#1}{1}}
 {\choicebacot{#2}{#3}{#4}}
 {\ifthenelse{\equal{#1}{2}}
 {\setlength{\parskip}{\parskipchoice}%
    \choicebacot{#2}{#3}{#4}}
 {\def\parskipchoice{#1}%
    \ifdim\widthch<\thirdtabwidth
          \choicebacot{#2}{#3}{#4}
        \else
          \choicebacot{#2}{#3}{#4}
      \fi\fi
    }}}%
    % Trả lại định nghĩa gốc môi trường{center}
    \let\center\originalcenter%
    \let\endcenter\originalendcenter%
}
\newenvironment{cauhoiTN}[1]{
    \setcounter{ex}{0}
    \Opensolutionfile{ansbook}[Loigiai/LGTN#1]
    \Opensolutionfile{ans}[Loigiai/TN#1]
  }{
    \Closesolutionfile{ans}
    \Closesolutionfile{ansbook}
  }
\newenvironment{cauhoiDS}[1]{
    \setcounter{ex}{0}
    \Opensolutionfile{ansbook}[Loigiai/LGDS#1]
    \Opensolutionfile{ans}[Loigiai/DS#1]
  }{
    \Closesolutionfile{ans}
    \Closesolutionfile{ansbook}
  }
\newenvironment{cauhoiTLN}[1]{
    \setcounter{ex}{0}
    \Opensolutionfile{ansbook}[Loigiai/LGTLN#1]
    \Opensolutionfile{ans}[Loigiai/TLN#1]
  }{
    \Closesolutionfile{ans}
    \Closesolutionfile{ansbook}
  }
\newenvironment{cauhoiTL}[1]{
    \setcounter{ex}{0}
    \Opensolutionfile{ansbook}[Loigiai/LGTL#1]
    \Opensolutionfile{ans}[Loigiai/TL#1]
  }{
    \Closesolutionfile{ans}
    \Closesolutionfile{ansbook}
  }

\newenvironment{note}
{\begin{tcolorbox}[
	enhanced jigsaw,breakable,pad at break*=1mm,
	colframe=Mapcolor, %nền (opacityback=0, %ko nền)
	%--Trc sau
	before skip=1mm,
	after skip=1mm,
	%--
	boxrule=1pt, %đường viền dày
	%toprule=1pt,
	%bottomrule=1pt,
	%leftrule=1pt,
	%rightrule=0pt,
	%frame hidden,
	drop fuzzy shadow=gray, %đổ bóng
	left=1mm,right=1mm,top=1mm,bottom=1mm,
	%borderline west={1.5mm}{1cm}{tsblue}]} %0mm lề trái
	%--cong góc
	sharp corners,
	rounded corners=southwest, rounded corners=northeast,
	arc is angular,
	arc=2mm,
	fonttitle=\color{Mapcolor}\sffamily\bfseries\fontsize{10}{0}\selectfont,
	title={CHÚ Ý},
	colback=white,
	coltitle=red,
	attach boxed title to top left={xshift=0.5cm,yshift=-0.3cm},
	boxed title style={empty},
	underlay boxed title={
	\fill[white]
	([xshift=4pt]title.south west) rectangle ([xshift=-4pt]title.north east);
	},
	underlay unbroken and first={
	\path[fill=Mapcolor!70,draw=none] (interior.north west)--++(0.2,0)
	--([yshift=0.5cm,xshift=0.2cm]interior.west)
	to[bend left=3pt]([yshift=-0.25cm,xshift=0mm]interior.west)
	--cycle;
	},
	underlay unbroken and last={
	\path[fill=Mapcolor!70,draw=none] (interior.south east)--++(0,0.2)
	-- ([xshift=-1.5cm,yshift=0.2cm]interior.south east)
	to[bend right=3pt]([xshift=-2.25cm,yshift=0mm]interior.south east)
	--cycle;}
	]
	}
{\end{tcolorbox}}
\newcounter{dang}\setcounter{dang}{0}
\renewcommand{\thedang}{\arabic{dang}}
%---Dạng 1
\newtcolorbox{dangg}[1]{%
	fonttitle=\fontfamily{qag}\bfseries,%fontupper=\itshape,
	enhanced jigsaw,
	colframe=Mapcolor,colback=white,coltitle=white,%
	sharp corners, breakable, halign title=center,%adjusted title=center, %canh giữa DẠNG
	opacityback=0.5,
	before skip=2mm,after skip=3mm,%
	left=2mm,right=2mm,top=2mm,bottom=2mm,%
	boxrule=1pt,%
	title={\faFolderOpen~Dạng~\stepcounter{dang}\thedang.\ #1}%
	\setcounter{subsubsection}{0}%
	\addcontentsline{toc}{subsection}{\fontsize{11}{11}\selectfont\color{Mapcolor}\it\sffamily \faFolderOpen~Dạng~\thedang.~#1~}%
}
%====
\newenvironment{dang}[1]{
	\begin{dangg}{#1}
	}
	{
	\end{dangg}
}
\DeclareRobustCommand{\Note}[1]{\par\noindent\textcolor{Mapcolor}{\faPencilSquareO\ \textbf{Chú ý:} #1}}
\newcommand{\newghichu}[1]{\begingroup
\begin{tcolorbox}[%
    enhanced jigsaw,
    breakable,
    before skip=2mm,
    after skip=2mm,
    left=1mm, right=0mm, top=0mm, bottom=0mm,
    colback=yellow!20,
    borderline west={0.8mm}{0pt}{Mapcolor},arc=0mm,
    leftrule=2pt, toprule=0pt, rightrule=0pt,bottomrule=0pt,
     colframe=white,
     opacityback=0.5,
     grow to left by=-1.5cm,
     overlay={%
    \node[anchor=north west] 
      at ([xshift=-1.3cm,yshift=-.15\baselineskip]interior.north west)
    {\huge\bfseries \color{Mapcolor}};
         }
	]
	#1
\end{tcolorbox}
\endgroup}
\newtcolorbox{Ghichu}[1][]{colback=white,colframe=Mapcolor,fonttitle=\bfseries,
	title=Em có biết?,#1}					
\newcommand\Binhluan[2]{\begingroup
\noindent\begin{minipage}[t]{0.68\textwidth}
#1
\end{minipage}\hfill
\begin{minipage}[t]{0.3\textwidth}\vspace{0.2\baselineskip}
\begin{Ghichu}
#2
\end{Ghichu}
\end{minipage}
\endgroup
}
\newtcolorbox{bang}[2][]{%
 	breakable,
 	enhanced jigsaw,
 	colback=Mapcolor,
 	coltitle=white,
 	fonttitle={\bfseries\large},
 	fontlower=\normalsize,
 	left=1pt,
	right=1pt,
	bottom=1pt,
	top=1pt,
	title={#2},
	colframe=Mapcolor,
	opacityback=0.2,
	colback=yellow!30,
	center title,
	#1
} 
\newtcolorbox{bangchoice}[2][]{%
 	breakable,
 	enhanced jigsaw,
 	colback=Mapcolor,
 	coltitle=white,
 	fonttitle={\bfseries\large},
 	fontlower=\normalsize,
 	left=1pt,
	right=1pt,
	bottom=1pt,
	top=1pt,
  nobeforeafter,
	title={#2},
	colframe=Mapcolor,	
	colback=yellow!30,
  opacityback=0,
	center title,
	#1
} 
\newcommand{\ghichu}[1]{\begingroup
\begin{tcolorbox}[%
    enhanced jigsaw,
    breakable,
    before skip=2mm,
    after skip=2mm,
    left=1mm, right=0mm, top=6mm, bottom=1mm,
    colback=yellow!20,
    %borderline west={0.8mm}{0pt}{Mapcolor},arc=0mm,
    leftrule=0pt, toprule=0pt, rightrule=0pt,bottomrule=0pt,
     colframe=Mapcolor!30,
     opacityback=0.5,
     grow to left by=-0.5cm,
     overlay={%
	\begin{scope}
			%Vẽ đoạn thẳng từ góc trên bên trái đến góc dưới bên trái
		\draw[line width=1pt,Mapcolor] 
            ([xshift=0.1cm,yshift=-0.7cm]frame.north west) -- 
            ([xshift=0.1cm,yshift=0.1cm]frame.south west);
			 %Vẽ chấm tròn ở hai đầu (góc trên bên trái và dưới bên trái)
		\fill[draw=Mapcolor!30, fill=Mapcolor] ([xshift=0.1cm,yshift=-0.7cm]frame.north west) circle[radius=0.5mm];
       	\fill[draw=Mapcolor!30, fill=Mapcolor] ([xshift=0.1cm,yshift=0.1cm]frame.south west) circle[radius=0.5mm];
     \end{scope}
    \node[anchor=north west] 
      at ([xshift=-0.5cm,yshift=0.5\baselineskip]interior.north west)
    {\huge\bfseries \color{Mapcolor}\faPaperclip};
	\node[anchor=north west] 
      at ([xshift=0.3cm,yshift=0\baselineskip]interior.north west)
    {\large\bfseries \color{Mapcolor}Ghi chú:};
         }
	]
	#1
\end{tcolorbox}
\endgroup}
\RequirePackage{dashrule}
\flushbottom

% Định nghĩa lại lệnh \haidong để sử dụng các dòng gạch ngang liền nét mờ đi 30%
\newcommand{\haidong}[1]{
  \def\numlinedot{#1}
  \par
  \foreach \dotline in{1,...,\numlinedot}{
    \noindent\Linefont\color{Mapcolor!50}\hrulefill % Sử dụng lệnh hrulefill để tạo dòng gạch ngang liền nét
    \par
  }
}
\newcommand{\badong}[1]{
  \def\numlinedot{#1}
  \par
  \foreach \dotline in{1,...,\numlinedot}{
    \noindent\Linefont\color{Mapcolor!50}\hrulefill % Sử dụng lệnh hrulefill để tạo dòng gạch ngang liền nét
    \par
  }
}
\newcommand{\oneline}{
	\noindent\Linefont\dotfill
}
%MỘT SỐ TIÊU ĐỀ BỔ SUNG===========================================================================
\DeclareRobustCommand{\Slogan}[2]{\hspace*{2.5em}\textcolor{Mapcolor}{\textit{``#1''}}\par\hfill\textcolor{Mapcolor}{\textbf{(#2)}}}
\DeclareRobustCommand{\boder}[1]{%
 \tcboxmath[standard jigsaw, colback=white, colframe=Mapcolor, lowerbox=invisible, opacityback=0, arc=1pt,left=1pt, right=1pt, bottom=1pt, top=1pt,grow to left by=-5mm]%
					{#1}}
\DeclareRobustCommand{\NOTE}{\par\noindent \textbf{\textcolor{Mapcolor}{\faBook\ CÁC EM LƯU Ý\normalsize}}\par\noindent}
\DeclareRobustCommand{\BTVN}{\par\noindent\Large{\textbf{\textcolor{Mapcolor}{CÂU HỎI LÍ THUYẾT}}}\normalsize}
\DeclareRobustCommand{\BTTN}{\par\noindent\Large{\textbf{\textcolor{Mapcolor}{\ BÀI TẬP TRẮC NGHIỆM}}}\normalsize}
\DeclareRobustCommand{\CHTN}{\par\noindent\Large\textbf{\textcolor{Mapcolor}{\ BÀI TẬP TRẮC NGHIỆM\ \titlerule[4pt]}}\normalsize}
\DeclareRobustCommand{\Btvandung}{\par\centerline{\Large\textbf{\textcolor{blue}{\faGg\faGg\faGg\faGg\ BÀI TẬP VỀ NHÀ \faGg\faGg\faGg\faGg}}}}
\DeclareRobustCommand{\capdode}{\par\noindent\Large\textbf{\textcolor{Mapcolor}{\faAslInterpreting\ CẤP ĐỘ DỄ\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf}}}
\DeclareRobustCommand{\capdovua}{\par\noindent\Large\textbf{\textcolor{Mapcolor}{\faAslInterpreting\ CẤP ĐỘ VỪA\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf}}}
\DeclareRobustCommand{\capdokho}{\par\noindent\Large\textbf{\textcolor{Mapcolor}{\faAslInterpreting\ CẤP ĐỘ KHÓ\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf}}}
\DeclareRobustCommand{\Vidumau}{\noindent\large\textbf{\textcolor{Mapcolor}{\ VÍ DỤ MINH HỌA}}\normalsize\setcounter{vidu}{0}}
\DeclareRobustCommand{\Center}[1]{%
\hfill\bth{#1}\hfill\null}  
\DeclareRobustCommand{\Vehinh}[2]{%
\begin{tikzpicture}[scale=#1,thick,>=stealth']
#2
\end{tikzpicture}
}
%%%KHAI BÁO BẢNG MÃ MÀU
\definecolor{coolblack}{cmyk}{1.0, 0.538, 0.0, 0.61}
\definecolor{colorA}{cmyk}{0.78, 0.46, 0.0, 0.06}
\definecolor{colorB}{cmyk}{0.0, 0.72, 0.80, 0.11}
\definecolor{colorC}{cmyk}{0.70, 0.0, 0.55, 0.36}
\definecolor{colorD}{cmyk}{0.0, 0.68, 0.77, 0.09}
\definecolor{colorE}{cmyk}{0.64, 0.0, 0.29, 0.58}
\definecolor{colorF}{cmyk}{0.92, 0.37, 0.0, 0.27}
\definecolor{colorG}{cmyk}{1.0, 0.22, 0.0, 0.14}
\definecolor{colorH}{cmyk}{0.0, 1.0, 0.85, 0.41}
\definecolor{colorY}{cmyk}{0.0, 0.84, 0.84, 0.3}
\definecolor{colorK}{cmyk}{1.0, 0.26, 0.0, 0.35}
\definecolor{colorL}{cmyk}{0.0, 0.58, 0.58, 0.57}
\definecolor{colorM}{cmyk}{0.88, 0.40, 0.0, 0.52}
\definecolor{colorN}{cmyk}{0.0, 0.47, 0.87, 0.03}


\newcommand{\Chonmau}[1]{
  \ifnum#1=01
    \colorlet{Mapcolor}{colorA}
  \else\ifnum#1=02
    \colorlet{Mapcolor}{colorB}
  \else\ifnum#1=03
    \colorlet{Mapcolor}{colorC}
  \else\ifnum#1=04
    \colorlet{Mapcolor}{colorD}
  \else\ifnum#1=05
    \colorlet{Mapcolor}{colorE}
  \else\ifnum#1=06
    \colorlet{Mapcolor}{colorF}
  \else\ifnum#1=07
    \colorlet{Mapcolor}{colorG}
  \else\ifnum#1=08
    \colorlet{Mapcolor}{colorH}
  \else\ifnum#1=09
    \colorlet{Mapcolor}{colorY}
  \else\ifnum#1=10
    \colorlet{Mapcolor}{colorK} 
  \else\ifnum#1=11
    \colorlet{Mapcolor}{colorL} 
  \else\ifnum#1=12
    \colorlet{Mapcolor}{colorM} 
  \else\ifnum#1=13
    \colorlet{Mapcolor}{colorN} 
  \else
    \PackageError{myclass}{Mã màu bạn chọn không hợp lệ}
  \fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
}
\RequirePackage{ifthen}
\DeclareStringOption[HS1]{tuychon}
	\ProcessKeyvalOptions*\relax
	\AtEndOfClass{
		\ifthenelse{\equal{\MAPClass@tuychon}{HS1}}{%
		  \DeclareRobustCommand{\loai}[1]{}
		  \DeclareRobustCommand{\gv}[1]{}
		  \createbox{vidu}
		  \createbox{ex}    
		}{%
		  \ifthenelse{\equal{\MAPClass@tuychon}{HS2}}{%
        \DeclareRobustCommand{\loai}[1]{}
        \DeclareRobustCommand{\gv}[1]{}
        \createbox{vidu}
        \createbox{ex}
        \dotlinefull{vidu}
        \dotlinefull{ex}
		  }{%
        \ifthenelse{\equal{\MAPClass@tuychon}{GV1}}{%
          \def\applykindSA{0} % Để huỷ áp dụng \kindSA
          \def\colorEX{\color{Mapcolor}}
          \renewcommand{\TrueTF} {\stepcounter{dapan}\squareEX{\bf\DapAnTF}\ignorespaces}
          \renewcommand{\TrueEX} {\stepcounter{dapan}\squareEX{\bf\Alph{dapan}}\ignorespaces}
          \renewcommand{\True}{%
            \ifnum\chType=0\setcounter{numTrue}{\thedapan}\setcounter{numTrueSol}{\thedapan}%
            \else \gdef\TrueX{\circEX{\tickT}}\gdef\FalseX{}\fi%
            \leavevmode\colorEX%
          }
          %\choiceTF
          \renewcommand{\writekeyTFone}{\gdef\TrueX{}\gdef\FalseX{\tickF}}
          \renewcommand{\writekeyTF}{%
            &\vspace{-1pt}\centering\leavevmode\TrueX%
            &\vspace{-3pt}\parbox[t]{\linewidth}{\centering\leavevmode\FalseX}%
              \gdef\TrueX{}\gdef\FalseX{\tickF}%
          }
        }{%
          \ifthenelse{\equal{\MAPClass@tuychon}{GV2}}{%								
            \renewcommand{\Anlythuyet}[1]{#1}
            \def\applykindSA{0} % Để huỷ áp dụng \kindSA
            \def\colorEX{\color{Mapcolor}}
            \renewcommand{\TrueTF} {\stepcounter{dapan}\squareEX{\bf\DapAnTF}\ignorespaces}
            \renewcommand{\TrueEX} {\stepcounter{dapan}\squareEX{\bf\Alph{dapan}}\ignorespaces}
            \renewcommand{\True}{%
              \ifnum\chType=0\setcounter{numTrue}{\thedapan}\setcounter{numTrueSol}{\thedapan}%
              \else \gdef\TrueX{\circEX{\tickT}}\gdef\FalseX{}\fi%
              \leavevmode\colorEX%
            }
            %\choiceTF
            \renewcommand{\writekeyTFone}{\gdef\TrueX{}\gdef\FalseX{\tickF}}
            \renewcommand{\writekeyTF}{%
              &\vspace{-1pt}\centering\leavevmode\TrueX%
              &\vspace{-3pt}\parbox[t]{\linewidth}{\centering\leavevmode\FalseX}%
                \gdef\TrueX{}\gdef\FalseX{\tickF}%
            }
            \showanswers
            \showtextchoice
            \renewcommand{\do@onlysolution}[1]{%
              \par\noindent\textbf{\loigiaiEX}%
              \ifshowanswers
              \@ifnextchar\immini
              {}
              { \@ifnextchar\begin
              {}
              {\par\noindent}
              }
              #1%
              \fi
              \ifthenelse{\equal{\keyEX}{}}{}
                  {\leavevmode\unskip\textchoice\ignorespaces\xdef\keyEX{}}%
              \setcounter{numTrueSol}{0}%
            }
          }{%
          \ifthenelse{\equal{\MAPClass@tuychon}{HS3}}{%
            \newgeometry{top=1cm,left=1cm,right=1cm,bottom=1cm}
            \DeclareRobustCommand{\loai}[1]{}
            \DeclareRobustCommand{\gv}[1]{}
            \createbox{vidu}
            \createbox{ex}
            \dotlinefull{vidu}
            \dotlinefull{ex}
            \renewcommand{\myfancyfoot}{}
            \renewcommand{\myfancyhead}{}
          }{%
            \typeout{Tùy chọn tuychon không hợp lệ, sử dụng mặc định.}%
            }%
			}%
		  }%
		}
    }
	}

%============================ĐỊNH NGHĨA GÕ TẮT=====================================
\DeclareRobustCommand{\Up}[1]{\MakeUppercase{#1}} 
\DeclareRobustCommand{\bth}[1]{\ensuremath{\displaystyle{#1}}} 
\RequirePackage{xspace}
%\tcbuselibrary{xparse}
\DeclareRobustCommand{\linepic}[2]{
\tcbsidebyside[sidebyside,righthand width=3cm,blanker,nobeforeafter]{%
\haidong{#1}
}{%
#2
}
} 
\def\imagetop#1{\raisebox{-\height+\baselineskip}{#1}}
\DeclareRobustCommand{\ct}[1]{\text{#1}}
\DeclareRobustCommand{\notext}{\textcolor{white}{Không hiển thị}\par\noindent}
\DeclareRobustCommand{\Finish}{\par\noindent\faScissors\dotfill\par}
%Lệnh song song
%\DeclareSymbolFont{symbolsC}{U}{txsyc}{m}{n}
%\DeclareMathSymbol{\varparallel}{\mathrel}{symbolsC}{9}
%\DeclareMathSymbol{\parallel}{\mathrel}{symbolsC}{9}
\RequirePackage{xspace}
\def\A{\textbf{A}}
\def\B{\textbf{B}}
\def\C{\textbf{C}}
\def\D{\textbf{D}}
\RequirePackage{esvect}
\DeclareRobustCommand{\vec}[1]{
	\ifmmode\ \overrightarrow{#1}\else\ensuremath{\overrightarrow{#1}}\xspace\fi} 
\DeclareRobustCommand{\pso}[2]{\bth{\frac{#1}{#2}}\xspace}
\DeclareRobustCommand{\angstrom}{\textup{\AA}\xspace}
\DeclareRobustCommand{\microc}{%
  \ifmmode\ \mu C\else\ensuremath{\ \mu C}\xspace\fi}
\DeclareRobustCommand{\microm}{%
  \ifmmode\ \mu m\else\ensuremath{\ \mu m}\xspace\fi}
\DeclareRobustCommand{\nodaik}[1]{%
  \ifmmode\alpha = #1\ K^{-1}\else\ensuremath{\alpha = #1\ K^{-1}}\xspace\fi}  
\DeclareRobustCommand{\nodaic}[1]{%
  \ifmmode\alpha = #1\ \ct{độ}^{-1}\else\ensuremath{\alpha = #1\ \ct{độ}^{-1}}\xspace\fi}   
\DeclareRobustCommand{\microf}{%
  \ifmmode\ \mu F\else\ensuremath{\ \mu F}\xspace\fi}
\DeclareRobustCommand{\microh}{%
  \ifmmode\ \mu H\else\ensuremath{\ \mu H}\xspace\fi}      
\DeclareRobustCommand{\degree}{%
  \ifmmode^\circ\else\ensuremath{^\circ}\xspace\fi}
\DeclareRobustCommand{\doC}{%
  \ifmmode^\circ C\else\ensuremath{^\circ C}\xspace\fi}
\DeclareRobustCommand{\lido}{%
  \ifmmode x=A\cos(\omega t+\varphi)\else\ensuremath{x=A\cos(\omega t+\varphi)}\xspace\fi}
\DeclareRobustCommand{\canps}[2]{%
  \ifmmode \sqrt{\frac{#1}{#2}}\else\ensuremath{\displaystyle{\sqrt{\frac{#1}{#2}}}}\xspace\fi}    
\DeclareRobustCommand{\ohm}{%
  \ifmmode\ \Omega\else\ensuremath{\Omega}\xspace\fi}
\DeclareRobustCommand{\pit}{%
  \ifmmode\pi t\else\ensuremath{\pi t}\xspace\fi}  
\DeclareRobustCommand{\gttd}[1]{%
  \ifmmode\ g=#1\ m/s^2\else\ensuremath{g=#1\ m/s^2}\xspace\fi}
\DeclareRobustCommand{\met}{%
  \ifmmode\ m\else \ m\xspace\fi}      
\DeclareRobustCommand{\cm}{%
  \ifmmode\ cm\else \ cm\xspace\fi}        
\DeclareRobustCommand{\bs}[2]{% 
  \ensuremath{\displaystyle{#1 = #2}}\xspace}
\DeclareRobustCommand{\sola}{% 
  \begin{sol}\textbf{A} \end{sol}}  
\DeclareRobustCommand{\Check}{\faCheck\xspace}       
\DeclareRobustCommand{\Bookmark}{\faBookmark\xspace}  
\def\cung#1{\buildrel \frown \over{#1}}
\def\vec{\vv}
\def\overrightarrow{\vv}
\def\g.#1.{\widehat{#1}}
\DeclareRobustCommand{\chia}{\;\vdots\;} 
\DeclareRobustCommand{\kchia}{\not\vdots\;\;} 
\DeclareRobustCommand{\R}{\mathbb R} 
\DeclareRobustCommand{\N}{\mathbb N} 
\DeclareRobustCommand{\Z}{\mathbb Z} 
\DeclareRobustCommand{\hoac}[1]{ 
	\left[\begin{aligned}#1\end{aligned}\right.}
\DeclareRobustCommand{\heva}[1]{
	\left\{\begin{aligned}#1\end{aligned}\right.}
\DeclareRobustCommand{\Hn}[3]{% 
  \ce{_{#1}^{#2}#3}\xspace}    
\DeclareRobustCommand{\textbi}[1]{\textsl{\textbf{#1}}}
\DeclareRobustCommand{\Textbox}[2]{\noindent\parbox{#1\textwidth}{#2}}
\DeclareRobustCommand{\tile}{1} 
\DeclareRobustCommand{\Picbox}[2]{\noindent\parbox{#1\textwidth}{\centering
	\begin{tikzpicture}[scale=1,thick,>=stealth']
		#2
	\end{tikzpicture}}}
\DeclareRobustCommand{\Imabox}[2]{\noindent\parbox{#1\textwidth}{\centering
	\begin{tikzpicture}[scale=1,opacity=0,thick,>=stealth']
		#2
	\end{tikzpicture}}}	

\newcommand{\emcobiet}[1]{\begingroup
\begin{tcolorbox}[%
    enhanced jigsaw,
    breakable,
    before skip=2mm,
    after skip=2mm,
    left=-6mm, right=3mm, top=8mm, bottom=3mm,
    colback=white,
    %borderline west={0.8mm}{0pt}{Mapcolor},arc=5mm,
    leftrule=0pt, toprule=0pt, rightrule=0pt,bottomrule=0pt,
     colframe=white,
     opacityback=0.5,
     grow to left by=-1.5cm,
     overlay={%
	 \begin{scope}
			%Vẽ nền của khung
		\fill[Mapcolor!60, rounded corners=10pt,opacity=0.15]([xshift=-1cm,yshift=-0.6cm]frame.north west) -- ([xshift=0cm,yshift=-0.6cm]frame.north east)[rounded corners=5pt]-- ([xshift=0cm]frame.south east)[rounded corners=5pt]-- ([xshift=-1cm]frame.south west)[rounded corners=5pt]--cycle;
     \end{scope}
	\node[anchor=north west,scale=0.7] 
      at ([xshift=-1.35cm,yshift=-0.15cm]interior.north west)
    {\huge\bfseries \color{Mapcolor!70}\faQuestion};
    \node[anchor=north west] 
      at ([xshift=-1.2cm,yshift=0.05cm]interior.north west)
    {\huge\bfseries \color{Mapcolor}\faQuestion};
	\node[anchor=north west] 
      at ([xshift=-0.5cm,yshift=0.15\baselineskip]interior.north west)
    {\large\bf\fontfamily{qag}\selectfont \color{Mapcolor}EM CÓ BIẾT};
         }
	,coltext=Mapcolor]#1
\end{tcolorbox}
\endgroup}
\newcommand{\mobai}[1]{\begingroup
\begin{tcolorbox}[%
    enhanced jigsaw,
    breakable,
    before skip=2mm,
    after skip=2mm,
    left=-6mm, right=3mm, top=8mm, bottom=3mm,
    colback=white,
    leftrule=0pt, toprule=0pt, rightrule=0pt,bottomrule=0pt,
     colframe=white,
     opacityback=0.5,
     grow to left by=-1.5cm,
     overlay={%
	 \begin{scope}
			%Vẽ nền của khung
		\fill[cyan, rounded corners=10pt,opacity=0.15]([xshift=-1cm,yshift=-0.6cm]frame.north west) -- ([xshift=0cm,yshift=-0.6cm]frame.north east)[rounded corners=4pt]-- ([xshift=0cm]frame.south east)[rounded corners=4pt]-- ([xshift=-1cm]frame.south west)[rounded corners=4pt]--cycle;
		\draw[Mapcolor, rounded corners=4pt,line width=2pt]([xshift=-1cm,yshift=-0.6cm]frame.north west) -- ([xshift=0cm,yshift=-0.6cm]frame.north east)[rounded corners=4pt]-- ([xshift=0cm]frame.south east)[rounded corners=4pt]-- ([xshift=-1cm]frame.south west)[rounded corners=4pt]--cycle;
     \end{scope}
	\node[anchor=north west] 
      at ([xshift=-1.61cm,yshift=0.05cm]interior.north west)
    {\Huge\bfseries \color{Mapcolor}\scalebox{1.25}{\faCircle}};
	\node[anchor=north west] 
      at ([xshift=-1.46cm,yshift=-0.05cm]interior.north west)
    {\huge\bfseries \color{white}\faPowerOff};
         }
	,coltext=black]#1
\end{tcolorbox}
\endgroup}
\newcommand{\lichsu}[1]{\begingroup
\begin{tcolorbox}[%
    enhanced jigsaw,
    breakable,
    before skip=2mm,
    after skip=2mm,
    left=-6mm, right=3mm, top=8mm, bottom=3mm,
    colback=white,
    %borderline west={0.8mm}{0pt}{Mapcolor},arc=5mm,
    leftrule=0pt, toprule=0pt, rightrule=0pt,bottomrule=0pt,
     colframe=white,
     opacityback=0.5,
     grow to left by=-1.5cm,
     overlay={%
	 \begin{scope}
			%Vẽ nền của khung
		\fill[cyan, rounded corners=10pt,opacity=0.15]([xshift=-1cm,yshift=-0.6cm]frame.north west) -- ([xshift=0cm,yshift=-0.6cm]frame.north east)[rounded corners=10pt]-- ([xshift=0cm]frame.south east)[rounded corners=10pt]-- ([xshift=-1cm]frame.south west)[rounded corners=10pt]--cycle;
		\draw[Mapcolor!30, rounded corners=10pt,line width=2pt]([xshift=-1cm,yshift=-0.6cm]frame.north west) -- ([xshift=0cm,yshift=-0.6cm]frame.north east)[rounded corners=10pt]-- ([xshift=0cm]frame.south east)[rounded corners=10pt]-- ([xshift=-1cm]frame.south west)[rounded corners=10pt]--cycle;
     \end{scope}
	\node[anchor=north west] 
      at ([xshift=-1.6cm,yshift=-0.05cm]interior.north west)
    {\Huge\bfseries \color{Mapcolor!30}\scalebox{1.2}{\faCircle}};
	\node[anchor=north west] 
      at ([xshift=-1.46cm,yshift=-0.19cm]interior.north west)
    {\huge\bfseries \color{white}\faHistory};
         }
	,coltext=cyan!50!blue]#1
\end{tcolorbox}
\endgroup}
\newcommand{\ungdung}[1]{\begingroup
\begin{tcolorbox}[%
    enhanced jigsaw,
    breakable,
    before skip=2mm,
    after skip=2mm,
    left=-6mm, right=3mm, top=8mm, bottom=3mm,
    colback=white,
    %borderline west={0.8mm}{0pt}{Mapcolor},arc=5mm,
    leftrule=0pt, toprule=0pt, rightrule=0pt,bottomrule=0pt,
     colframe=white,
     opacityback=0.5,
     grow to left by=-1.5cm,
     overlay={%
	 \begin{scope}
			%Vẽ nền của khung
		\fill[cyan, rounded corners=10pt,opacity=0.15]([xshift=-1cm,yshift=-0.6cm]frame.north west) -- ([xshift=0cm,yshift=-0.6cm]frame.north east)[rounded corners=15pt]-- ([xshift=0cm]frame.south east)[rounded corners=10pt]-- ([xshift=-1cm]frame.south west)[rounded corners=10pt]--cycle;
		\draw[Mapcolor!30, rounded corners=10pt,line width=2pt]([xshift=-1cm,yshift=-0.6cm]frame.north west) -- ([xshift=0cm,yshift=-0.6cm]frame.north east)[rounded corners=10pt]-- ([xshift=0cm]frame.south east)[rounded corners=10pt]-- ([xshift=-1cm]frame.south west)[rounded corners=10pt]--cycle;
     \end{scope}
	\node[anchor=north west] 
      at ([xshift=-1.5cm,yshift=-0.05cm]interior.north west)
    {\huge\bfseries \color{Mapcolor!30}\scalebox{1.25}{\faSquare}};
	\node[anchor=north west] 
      at ([xshift=-1.41cm,yshift=-0.13cm]interior.north west)
    {\huge\bfseries \color{white}\faForward};
         }
	,coltext=cyan!50!blue]#1
\end{tcolorbox}
\endgroup}
	\DeclareRobustCommand{\PhanI}{\noindent\fontfamily{qag}\textbf{\color{Mapcolor} Phần 1: CÂU HỎI TRẮC NGHIỆM. Mỗi câu học sinh chỉ chọn một phương án}\setcounter{ex}{0}\relax}
	\DeclareRobustCommand{\PhanII}{\fontfamily{qag}\textbf{\color{Mapcolor}Phần 2: CÂU HỎI TRẮC NGHIỆM ĐÚNG SAI. Trong mỗi ý a), b), c), d) ở mỗi câu học sinh chọn đúng hoặc sai.}\setcounter{ex}{0}\relax}
	\DeclareRobustCommand{\PhanIII}{\fontfamily{qag}\textbf{\color{Mapcolor}Phần 3: CÂU HỎI TRẢ LỜI NGẮN. Học sinh ghi đáp án vào ô kết quả}\par\setcounter{ex}{0}\relax\noindent}
\AtBeginDocument{%
	\normalsize
	
  \raggedbottom 
	\allowdisplaybreaks
	\setlength{\belowdisplayskip}{2pt} \setlength{\belowdisplayshortskip}{2pt}
	\setlength{\abovedisplayskip}{2pt} \setlength{\abovedisplayshortskip}{2pt}
	\everymath{\rm}
	%\createbox{vidu}
}
%TÙY CHỈNH MỤC LỤC
\usepackage{xcolor} % Đảm bảo gói xcolor đã được nạp
\definecolor{myOrange}{HTML}{89171A}
\definecolor{myCyan}{HTML}{3F657A}
\definecolor{myGreen}{HTML}{002E63}
%\definecolor{myGreen}{HTML}{00849E}
\definecolor{myRed}{HTML}{F05761}
\definecolor{myBlue}{HTML}{00849E}	

\setcounter{tocdepth}{1}
\endinput
