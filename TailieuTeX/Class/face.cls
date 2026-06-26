\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{BookVS}[2007/10/19 v1.4h  Standard LaTeX document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
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
\newif\ifbookstyle@bookstyle
\DeclareOption{a4style}{\bookstyle@bookstyletrue}
\DeclareOption{a5style}{\bookstyle@bookstylefalse}
\newif\ifmarkstyle@markstyle
\DeclareOption{mark}{\markstyle@markstyletrue}
\DeclareOption{nomark}{\markstyle@markstylefalse}
\newif\ifboderstyle@boderstyle
\DeclareOption{Frame}{\boderstyle@boderstyletrue}
\DeclareOption{NoFrame}{\boderstyle@boderstylefalse}
\newif\ifnangcao@nangcao
\DeclareOption{BNC}{\nangcao@nangcaotrue}
\DeclareOption{BCB}{\nangcao@nangcaofalse}
\ExecuteOptions{a4style,nomark,a4paper,12pt,twoside,onecolumn,final,openright}
\ProcessOptions
\input{bk1\@ptsize.clo}
%======================CÁC GÓI LỆNH QUAN TRỌNG CHO TOÁN - TIẾNG VIỆT========================
\RequirePackage{fouriernc}
\RequirePackage{fix-cm} % Tăng kích thước chữ
	\newcommand\myfont[2]{\fontsize{#1}{#2}\selectfont}
\RequirePackage[utf8]{vietnam}
\RequirePackage{amsmath,amssymb, amsfonts, amssymb, latexsym, amscd, amsthm}
\RequirePackage[version=4]{mhchem} 
\RequirePackage[cal=boondoxo]{mathalfa}
\RequirePackage{pifont}
\RequirePackage{fontawesome} 
\RequirePackage{physics}
%\RequirePackage{Fonts/casiokey}
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
%GÓI LỆNH HÌNH ẢNH==================================
\RequirePackage{tkz-tab}
\RequirePackage{tcolorbox}
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
	arrows,
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
\usepgfplotslibrary{fillbetween}
%\RequirePackage{Class/casiokey}
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
\tikzstyle{A}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, circle, fill=white, inner sep=0pt,
 minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-5.5mm]\ce{A#1}}] at (0,0) {};
}}}]  
\tikzstyle{MD}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, circle, fill=white, inner sep=0pt,
 minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-6mm]\ce{M#1}}] at (0,0) {};
}}}]  
\tikzstyle{V}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, circle, fill=white, inner sep=0pt,
 minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-3pt]}] at (0,0) {\ce{V#1}};
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
\RequirePackage{tabularx}
\newcolumntype{Y}{>{\raggedleft\arraybackslash}X}
%===================================ĐỔ BÓNG CHO TEXT================================
\newlength\st@shadowoffsetx
\newlength\st@shadowoffsety

\st@shadowoffsetx=1pt
\st@shadowoffsety=1pt

\newcommand\shadowoffset[1]{\setlength\st@shadowoffsetx{#1}\setlength\st@shadowoffsety{#1}}
\newcommand\shadowoffsetx[1]{\setlength\st@shadowoffsetx{#1}}
\newcommand\shadowoffsety[1]{\setlength\st@shadowoffsety{#1}}
\newcommand\shadowcolor[1]{\def\st@shadowcolor{#1}}
\newcommand\shadowrgb[1]{\definecolor{st@shadowcolorrgb}{rgb}{#1}\shadowcolor{st@shadowcolorrgb}}

\shadowrgb{0.66,0.66,0.66}

\newlength\st@temp@width
\newlength\st@temp@height 
\newlength\st@pic@width
\newlength\st@pic@height

\newcommand\shadowtext[1]%
{%
   \begingroup%
   \settowidth{\st@temp@width}{#1}%
   \settoheight{\st@temp@height}{#1}%
   \setlength{\st@pic@width}{\st@temp@width}%
   \setlength{\st@pic@height}{\st@temp@height}%
   \addtolength{\st@pic@width}{\st@shadowoffsetx}%
   \addtolength{\st@pic@height}{\st@shadowoffsety}%
   %
   \edef\num@tw{\strip@pt\st@temp@width}%
   \edef\num@th{\strip@pt\st@temp@height}%
   \edef\num@pw{\strip@pt\st@pic@width}%
   \edef\num@ph{\strip@pt\st@pic@height}%
   \edef\num@offsetx{\strip@pt\st@shadowoffsetx}%
   \edef\num@offsety{\strip@pt\st@shadowoffsety}%
   \raisebox{-\st@shadowoffsety}{
   \begin{picture}(\num@pw,\num@ph)(0,0)
	    \put(\num@offsetx,0){\makebox(\num@tw,\num@th)[tl]{\color{\st@shadowcolor}\def\color##1{}\ignorespaces #1}}
		\put(0,\num@offsety){\makebox(\num@tw,\num@th)[tl]{\ignorespaces #1}}
	\end{picture}}%
	\endgroup%
	\ignorespaces%
}  
%================================CÁC ĐỊNH NGHĨA MÀU SẮC=============================
\RequirePackage{xcolor}
	\definecolor{mybluei}{RGB}{52,177,201}
	\definecolor{myblueii}{RGB}{63,200,244}
	\definecolor{myblueiii}{RGB}{199,234,253}
	\definecolor{ultramarine}{RGB}{0,45,97}
	\definecolor{coolblack}{rgb}{0.0, 0.18, 0.39}
	\definecolor{myred}{rgb}{1.0, 0.01, 0.24}
	\definecolor{cornellred}{rgb}{0.7, 0.11, 0.11}
	\definecolor{coolblack}{rgb}{0.0, 0.18, 0.39}
	\definecolor{titlegrammar}{RGB}{255,128,0}
%====================================================================================
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
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
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
      \markright {\MakeUppercase{%
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
\setcounter{secnumdepth}{5}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection {\@Alph\c@subsection}
\renewcommand\thesubsubsection{\@Roman\c@subsubsection.}
\renewcommand\theparagraph {\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\@arabic\c@subparagraph}
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
\newcommand\chapter{\if@openright\clearpage\else\clearpage\fi
                    \thispagestyle{plain}%
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
  \vspace*{30\p@}%
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
    \vskip 20\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{30\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 20\p@
  }}
\newcommand\section{\@startsection {section}{1}{\z@}%
	{-2pt}%
	{2pt}%
	{\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-2pt}%
	{2pt}%
	{\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-2pt}%
	{2pt}%
	{\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{-2pt}%
	{2pt}%
	{\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	{3.25ex \@plus1ex \@minus .2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
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
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
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
\@addtoreset {equation}{chapter}
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
\newlength\abovecaptionskip
\newlength\belowcaptionskip
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
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{4}
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
	\setcounter{secnumdepth}{4}
	\setcounter{tocdepth}{4}
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
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
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
\newcommand\contentsname{Contents}
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
\usepackage{titletoc}
\titlecontents{section} % Tùy chỉnh section
[0em] % Khoảng cách từ trái
{\addvspace{0.25em}} % Khoảng cách giữa mục lục và mục lục đầu tiên
{\bfseries Bài\ \thecontentslabel.\quad} % Format của tiêu đề
{} % Số trang
{} % Điều chỉnh sau
%================================ĐỊNH DẠNG TRANG IN - PHÔNG CHỮ================================
\RequirePackage{multido}
\ifbookstyle@bookstyle
	\def\letrai{1cm}
	\def\lephai{1cm}
	\def\letren{-0.5cm}
	\def\leduoi{-0.5cm}
	\RequirePackage[a4paper,left=\letrai,right=\lephai,top=\letren,bottom=\leduoi, footskip=24pt,headsep=12pt, includeheadfoot]{geometry}
	\newcommand\standsize{\@setfontsize\normalsize{10.5}{16}}
	%Chỉnh kích cỡ chữ trong văn bản
	\renewcommand\normalsize{\@setfontsize\normalsize{12}{16}}
	\renewcommand\large{\@setfontsize\large{12}{17.45}}
	\renewcommand\Large{\@setfontsize\Large{13}{18.85}}
	\renewcommand\LARGE{\@setfontsize\LARGE{16}{20.30}}
	\renewcommand\huge{\@setfontsize\huge{22}{32}}
	\renewcommand\Huge{\@setfontsize\Huge{26}{37.7}}
	\newcommand{\Numone}{\fontsize{43.3pt}{50pt}\selectfont}
	\newcommand{\Linefont}{\fontsize{8pt}{16pt}\selectfont}
\DeclareRobustCommand{\titlefont}{% 
	\bfseries\fontfamily{phv}\fontseries{b}\myfont{13pt}{18pt}} 
\else
	\def\letrai{1cm}
	\def\lephai{1cm}
	\def\letren{-0.5cm}
	\def\leduoi{-0.5cm}
	\RequirePackage[a4paper,left=\letrai,right=\lephai,top=\letren,bottom=\leduoi, footskip=12pt,headsep=3pt, includeheadfoot]{geometry}
	\renewcommand\normalsize{\@setfontsize\normalsize{15}{20}}
	\renewcommand\large{\@setfontsize\large{15}{21.75}}
	\renewcommand\Large{\@setfontsize\Large{16.25}{23.20}}
	\renewcommand\LARGE{\@setfontsize\LARGE{17.625}{24.65}}
	\renewcommand\huge{\@setfontsize\huge{24}{34.8}}
	\renewcommand\Huge{\@setfontsize\Huge{30}{43.5}}
	\newcommand{\Numone}{\fontsize{50pt}{50pt}\selectfont}
	\newcommand{\Linefont}{\fontsize{8pt}{26.5pt}\selectfont}
	\DeclareRobustCommand{\titlefont}{% 
		\bfseries\fontfamily{phv}\fontseries{b}\myfont{15.5pt}{24pt}}
\fi 
%=================================ĐỊNH DẠNG TIÊU ĐỀ CHƯƠNG - MỤC LỤC================================
\newcommand{\Namechap}{Chương }
\RequirePackage[pagestyles, clearempty, explicit]{titlesec}
\RequirePackage{eqparbox}
%Thay đổi khoảng trống trên dưới của tiêu đề chương
\titlespacing{\chapter}{-70pt}{-20pt}{-10pt}
\titleformat{\chapter}[display]
    {\normalsize\huge\color{black}}%
    {\flushright\huge\color{coolblack}%
    \bf\fontsize{40}{12}\raisebox{0.3cm}{Chương }\hspace{1ex}%
    {\fontsize{50}{12}\selectfont\thechapter}}%
	{-10 pt}%
	{\flushright\bfseries\huge\color{coolblack}#1}%
\titleformat{\section}[hang]
	{\filcenter\normalfont}
	{}
	{0pt}
	{\begin{tcolorbox}[enhanced, skin=enhancedlast jigsaw,title=\raisebox{0.05cm}{\Large\Namesec} \huge\thesection,
		attach boxed title to top left={xshift=-4mm,yshift=-0.5mm},
fonttitle=\bfseries,varwidth boxed title=0.7\linewidth,
colbacktitle=coolblack,colframe=coolblack,
interior style={top color=white,bottom color=white},
boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
underlay boxed title={
\fill[coolblack] (title.north west) -- (title.north east)
-- +(\tcboxedtitleheight-1mm,-\tcboxedtitleheight+1mm)
-- ([xshift=4mm,yshift=0.5mm]frame.north east) -- +(0mm,-1mm)
-- (title.south west) -- cycle;
\fill[coolblack] ([yshift=-0.5mm]frame.north west)
-- +(-0.4,0) -- +(0,-0.3) -- cycle;
\fill[coolblack] ([yshift=-0.5mm]frame.north east)
-- +(0,-0.3) -- +(0.4,0) -- cycle; }]
	\vspace{0.1\baselineskip}
	\filcenter\color{coolblack}\LARGE\bfseries\MakeUppercase{#1}
\end{tcolorbox}
%\begin{tcolorbox}[enhanced jigsaw,title=\raisebox{0.05cm}{\Large\Namesec} \huge\thesection,
%		colframe=coolblack,colback=blue!5!yellow!10!white,opacityback=0.2,colbacktitle=blue!5!yellow!10!white,
%		fonttitle=\bfseries,coltitle=black,attach boxed title to top center=
%		{yshift=-0.25mm-\tcboxedtitleheight/2,yshifttext=2mm-\tcboxedtitleheight/2},
%		boxed title style={boxrule=0.5mm,
%		frame code={ \path[tcb fill frame] ([xshift=-4mm]frame.west)
%		-- (frame.north west) -- (frame.north east) -- ([xshift=4mm]frame.east)
%		-- (frame.south east) -- (frame.south west) -- cycle; },
%		interior code={ \path[tcb fill interior] ([xshift=-2mm]interior.west)
%		-- (interior.north west) -- (interior.north east)
%		-- ([xshift=2mm]interior.east) -- (interior.south east) -- (interior.south west)
%	-- cycle;} }]
%	\vspace{0.1\baselineskip}
%	\filcenter\color{coolblack}\LARGE\bfseries{#1}
%\end{tcolorbox}
}
	[\vspace{0.7ex}	]
\titleformat{\subsection}[block]
	{\flushleft\normalfont}
	{\color{coolblack}\Large\bfseries\ Bài \thesection\Large:\enspace}
	{3pt}
	{\color{coolblack}\LARGE\bfseries{#1}\LARGE}
	[\vspace{0.7ex}	]
%\titleformat{\subsection}[block]
%	{\normalfont}
%	{\raisebox{-3pt}{\begin{tikzpicture}
%	\node [rectangle,draw=coolblack,fill=coolblack,text=white]{\Large\bfseries\thesubsection};
%	\end{tikzpicture}}}
%	{3pt}
%	{\vspace*{-4.5pt}\color{coolblack}\Large\bfseries\MakeUppercase{#1}}
%	[\vspace*{3pt}\color{coolblack}{}\vspace*{2pt}]
\titleformat{\subsubsection}[block]
	{\normalfont}
	{\color{coolblack}\titlefont\bfseries\thesubsubsection}
	{3pt}
	{\color{coolblack}\titlefont\MakeUppercase{#1}}
	[ ]		
\titleformat{\paragraph}[block]
	{\normalfont}
	{\raisebox{-3pt}{\begin{tikzpicture}
		\node [circle,draw=coolblack,fill=coolblack,text=white,inner sep=1.2pt,outer sep=0pt, minimum width=3pt]{\large\bfseries\theparagraph};
	\end{tikzpicture}}}
	{3pt}
	{\color{coolblack}\large\bfseries#1}
	[\color{coolblack}]	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ĐỊNH NGHĨA PHẦN MỤC LỤC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareRobustCommand{\Slogan}[2]{\hspace*{2.5em}\textcolor{cornellred}{\textit{``#1''}}\par\hfill\textcolor{cornellred}{\textbf{(#2)}}}
\RequirePackage{titletoc}
%==================ĐÁNH DẤU BẢN QUYỀN - HEADER - FOOTER==========================================
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\DeclareRobustCommand{\sophone}{\faPhoneSquare\ Tư vấn \& đăng kí học 0978.739.566}
%\DeclareRobustCommand{\sophone}{\faPhoneSquare\ 0986578475}
\DeclareRobustCommand{\tacgia}{ThS LÊ KHÁNH LOAN}
\DeclareRobustCommand{\Namesec}{BÀI }
\DeclareRobustCommand{\Address}{Trung tâm Luyện thi THPT Quốc Gia \LaTeX}
\ifmarkstyle@markstyle
	\def\letrai{2.6cm}
	\def\lephai{1cm}
	\newcommand{\helv}{%
	\fontfamily{phv}\fontseries{b}\fontsize{10}{11}\selectfont}
	\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}
	\definecolor{gmitblue}{RGB}{93,138,168}
	\definecolor{gray}{cmyk}{0,0,0,0.4}
	\definecolor{darkgrey}{cmyk}{0,0,0,0.6}
	\newcommand\BoxColor{myblueii}
	\def\subsectiontitle{}
	\renewcommand{\sectionmark}[1]{\markright{\sffamily\normalsize#1}{}}
	\renewcommand{\subsectionmark}[1]{\def\subsectiontitle{#1}}
	\pagestyle{fancy}
	\renewcommand{\chaptermark}[1]{\markboth{\color{coolblack}\normalsize\bfseries \Namechap\ \thechapter.\ #1}{}}
	\renewcommand{\sectionmark}[1]{\markright{\color{coolblack}\normalsize\thesection. #1}{}}
	\fancyhf{} 

\fancyhead[OC]{%
\begin{tikzpicture}[remember picture, overlay]
\node[inner sep=0pt, anchor=west] at ([xshift=-\oddsidemargin,yshift=-1cm]current page.north west) {\includegraphics[width=\paperwidth]{Class/headL11}};
\end{tikzpicture}%
}
  	\fancyhead[EC]{%
\begin{tikzpicture}[remember picture,overlay]
\node[inner sep=0pt, anchor=east] at ([xshift=+\oddsidemargin,yshift=-1cm]current page.north east) {\includegraphics[width=\paperwidth]{Class/headR11}};
\end{tikzpicture}%
}
%	\fancyfoot[OC]{%
%\begin{tikzpicture}[remember picture,overlay]
%\node[inner sep=0pt, anchor=west] at ([xshift=-\oddsidemargin,yshift=0.7cm]current page.south west) {\includegraphics[width=\paperwidth]{Class/footer2}};
%\end{tikzpicture}%
%}
%  	\fancyfoot[EC]{%
%\begin{tikzpicture}[remember picture,overlay]
%\node[inner sep=0pt, anchor=east, opacity=0.3] at ([xshift=+\oddsidemargin,yshift=0.7cm]current page.south east) {\includegraphics[width=\paperwidth]{Class/footer1}};
%\end{tikzpicture}%
%}
\fancyfoot[c]{\textbf{\color{white}\thepage}} % Số trang ở giữa chân trang

% Đặt khoảng cách từ số trang đến nội dung trang
\setlength{\footskip}{1cm}
%	\pagestyle{fancy}

	%\fancyhead[LO]{\color{coolblack}\helv\leftmark}
	%\fancyhead[RE]{\color{coolblack}\helv\Namesec\rightmark}		
	%\fancyhead[RO]{\helv\normalsize\color{coolblack}\sffamily\bfseries \faGraduationCap\ \tacgia }
	%\fancyhead[LE]{\helv\normalsize\color{coolblack}\sffamily\bfseries \sophone}
	\renewcommand{\headrulewidth}{0pt}
	%\addtolength{\headheight}{2.5pt}
	%\newcommand{\footrulecolor}[1]{\patchcmd{\footrule}{\hrule}{\color{#1}\hrule}{}{}}
	%\renewcommand{\headrulewidth}{1pt}
	%\addtolength{\headheight}{2.5pt}
	%\renewcommand{\footrulewidth}{0pt}
	%\fancyfoot[RE,LO]{\footnotesize\bfseries\faMapMarker\ \color{coolblack}\Address}
	%\fancyfoot[C]{}
\else
\fancypagestyle{plain}{%
  \fancyhf{}% 
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}	
\fi
\RequirePackage{draftwatermark}
%\SetWatermarkColor{blue}
\SetWatermarkLightness{0.8}
\SetWatermarkScale{0.25}% Điều chỉnh độ lớn của text
\SetWatermarkAngle{0}% Điều chỉnh góc nghiêng
\SetWatermarkText{
%\begin{tikzpicture}[scale=1,thick,xshift=5cm,opacity=0.03] % Chỉnh độ đậm nhạt của nền opacity=0.3
%\node[rotate=20] at (current page.center){\includegraphics[scale=4]{Images/Watermark.png} };
%\end{tikzpicture}
}

	\newcommand{\footrulecolor}[1]{\patchcmd{\footrule}{\hrule}{\color{#1}\hrule}{}{}}
	\renewcommand{\headrulewidth}{0pt}
	\addtolength{\headheight}{0pt}
	\renewcommand{\footrulewidth}{1pt}
%	\fancyfoot[RE,LO]{\footnotesize\bfseries\faMapMarker\ \color{coolblack}\Address}
	\fancyfoot[LE,RO]{\footnotesize\bfseries\ \color{coolblack}\faSignIn\ Trang \thepage}
\fancyfoot[LE,RO]{}
\fancyhead[OC,EC]{}
%========================ĐỊNH NGHĨA CÁC KHUNG DẠNG TOÁN - VÍ DỤ...================================
\RequirePackage[tikz]{bclogo}
% KHUNG DẠNG TOÁN%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{dang}[subsection]
\setcounter{dang}{0}
\newtcolorbox{dang}[2][]{%
 	breakable,
 	enhanced jigsaw,
 	colback=coolblack,
 	coltitle=white,
 	fonttitle={\bfseries\large},
 	fontlower=\normalsize,
 	left=1pt,
	right=1pt,
	bottom=1pt,
	top=1pt,
	title={\faToggleOn\ Dạng \stepcounter{dang}\arabic{dang}: #2},
	colframe=coolblack,
	opacityback=0.2,
	colback=yellow!30,
	#1
} 
\newcommand{\notebox}[1]{\begingroup
\begin{tcolorbox}[%
    enhanced jigsaw,
    breakable,
    before skip=2mm,
    after skip=2mm,
    left=1mm, right=0mm, top=0mm, bottom=0mm,
    colback=white,
    borderline west={0.8mm}{0pt}{coolblack},arc=0mm,
    leftrule=2pt, toprule=0pt, rightrule=0pt,bottomrule=0pt,
     colframe=white,
     opacityback=0,
     grow to left by=-1.5cm,
     overlay={%
    \node[anchor=north west] 
      at ([xshift=-1.3cm,yshift=.15\baselineskip]interior.north west)
       {\Huge\bfseries \color{coolblack}\faLightbulbO};
         }
	]
	#1
\end{tcolorbox}
\endgroup}
\newcommand{\newghichu}[1]{\begingroup
\begin{tcolorbox}[%
    enhanced jigsaw,
    breakable,
    before skip=2mm,
    after skip=2mm,
    left=1mm, right=0mm, top=0mm, bottom=0mm,
    colback=yellow!20,
    borderline west={0.8mm}{0pt}{cornellred},arc=0mm,
    leftrule=2pt, toprule=0pt, rightrule=0pt,bottomrule=0pt,
     colframe=white,
     opacityback=0.5,
     grow to left by=-1.5cm,
     overlay={%
    \node[anchor=north west] 
      at ([xshift=-1.3cm,yshift=-.15\baselineskip]interior.north west)
       {\huge\bfseries \color{cornellred}\faPencilSquareO};
         }
	]
	#1
\end{tcolorbox}
\endgroup}
\DeclareRobustCommand{\Note}[1]{\par\noindent\textcolor{cornellred}{\faPencilSquareO\ \textbf{Chú ý:} #1}}
\newtcolorbox{dang*}[2][]{%
 	breakable,
 	enhanced jigsaw,
 	colback=coolblack,
 	coltitle=white,
 	fonttitle={\bfseries\large},
 	fontlower=\normalsize,
 	left=1pt,
	right=1pt,
	bottom=1pt,
	top=1pt,
	title={\faToggleOn\ Dạng \stepcounter{dang}\arabic{dang}: #2},
	colframe=coolblack,
	opacityback=0.2,
	colback=yellow!30,
	#1
}
\newtcolorbox{bang}[2][]{%
 	breakable,
 	enhanced jigsaw,
 	colback=coolblack,
 	coltitle=white,
 	fonttitle={\bfseries\large},
 	fontlower=\normalsize,
 	left=1pt,
	right=1pt,
	bottom=1pt,
	top=1pt,
	title={#2},
	colframe=coolblack,
	opacityback=0.2,
	colback=yellow!30,
	center title,
	#1
} 
\DeclareRobustCommand{\Dang}[1]{\begin{tcolorbox}[breakable,
 	left=1pt,
	right=1pt,
	bottom=1pt,
	top=1pt,
	lifted shadow={1mm}{-2mm}{3mm}{0.1mm}{black!50!white},
	interior style={left color=white, right color=white,middle color=white},
	colback=coolblack,
	colframe=coolblack,
	coltext=white,
]
\large\textbf{\faToggleOn\ Dạng \stepcounter{dang}\arabic{dang}: #1}\end{tcolorbox}}
\DeclareRobustCommand{\boder}[1]{%
 \tcboxmath[standard jigsaw, colback=white, colframe=blue, lowerbox=invisible, opacityback=0, arc=1pt,left=1pt, right=1pt, bottom=1pt, top=1pt,grow to left by=-5mm]%
					{#1}}
%============================Ô TÍCH ĐÚNG SAI===================================
% Lệnh cho ô vuông đánh dấu đúng
\newcommand{\dungsai}{\hfill \begin{tikzpicture}
		%\fill[left color = blue!50,right color = red!50, middle color=blue!50!black,rounded corners=2pt](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
		\fill[left color = blue!50!black,right color = green!30!blue,rounded corners=2pt](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
		\fill[white](0.05,0.05)--++(0:1)--++(90:0.4)--++(180:1)--cycle;
		\node at (1.55,0.25)[white]{$CTE$};
	\end{tikzpicture}
}
\newcommand{\ds}{\hfill \begin{tikzpicture}
		%\fill[left color = blue!50,right color = red!50, middle color=blue!50!black,rounded corners=2pt](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
		\fill[left color = blue!50!black,right color = green!30!blue,rounded corners=2pt](0,0)--++(0:2)--++(90:0.5)--++(180:2)--cycle;
		\fill[white](0.32,0.05)--++(0:0.67)--++(90:0.4)--++(180:0.67)--cycle;
		\fill[white](1.05,0.05)--++(0:0.67)--++(90:0.4)--++(180:0.67)--cycle;
		\node at (1.85,0.25)[white]{$S$};
		\node at (0.15,0.25)[white]{$\text{Đ}$};
	\end{tikzpicture}
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
%============================GÓI LỆNH ĐỀ THI CẢI TIẾN===================================
%Định nghĩa dots fill
\newcommand{\dotlineEX}[1]{
	\def\numlinedot{#1}
	\par
	\foreach \dotline in{1,...,\numlinedot}
	{
		\par\noindent\Linefont\dotfill		
	}
	\vspace*{0.5\baselineskip}
}
\newcommand{\dong}[1]{
	\def\numlinedot{#1}
	\par
	%\vspace*{\baselineskip}
	\foreach \dotline in{1,...,\numlinedot}
	{
		\noindent\Linefont\dotfill
		\par
	}
}
\newcommand{\haidong}[1]{
	\def\numlinedot{#1}
	\par
	%\vspace*{\baselineskip}
	\foreach \dotline in{1,...,\numlinedot}
	{
		\noindent\Linefont\dotfill
		\par
	}
}
\newcommand{\oneline}{
	\noindent\Linefont\dotfill
}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{multicol}
\RequirePackage{answers}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{longtable}
%CẢI TIẾN GÓI LỆNH LONGTABLE VÀ BOOKTAB========================================================
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
%======================TÍNH CHẤT=========================
\newtheorem{tc}{Tính chất}
\newtheorem{hq}{Hệ quả}
%======================GHI CHÚ ==========================
\newtcolorbox{note}[1][]{enhanced,
  before skip=2mm,after skip=3mm,
  boxrule=0.4pt,left=5mm,right=2mm,top=1mm,bottom=1mm,
  colback=yellow!50,
  colframe=yellow!20!black,
  sharp corners,rounded corners=southeast,arc is angular,arc=3mm,
  underlay={%
    \path[fill=tcbcolback!80!black] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
    \path[draw=tcbcolframe,shorten <=-0.05mm,shorten >=-0.05mm] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
    \path[fill=yellow!50!black,draw=none] (interior.south west) rectangle node[white]{\Huge\bfseries !} ([xshift=4mm]interior.north west);
    },
  drop fuzzy shadow,#1}
 \DeclareRobustCommand{\boder}[1]{%
  \tcboxmath[standard jigsaw, colback=white, colframe=blue, lowerbox=invisible, opacityback=0, arc=1pt,left=1pt, right=1pt, bottom=1pt, top=1pt]%
					{#1}} 
%Ô ghi chú ở phía trên, bên ngoài khung
%\newtcolorbox{Ghichu}[1][]{colback=yellow!60!white,
%  colframe=cornellred,fonttitle=\bfseries,
 % colbacktitle=cornellred,enhanced,
%attach boxed title to top center={yshift=-2mm},
%  title=Lưu ý,#1}	
\newtcolorbox{Ghichu}[1][]{colback=white,
colframe=coolblack,fonttitle=\bfseries,
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
		
%MỘT SỐ TIÊU ĐỀ BỔ SUNG===========================================================================
\DeclareRobustCommand{\NOTE}{\par\noindent \textbf{\textcolor{cornellred}{\faBook\ CÁC EM LƯU Ý\normalsize}}\par\noindent}
\DeclareRobustCommand{\BTVN}{\par\noindent\Large{\textbf{\textcolor{cornellred}{CÂU HỎI LÍ THUYẾT}}}\normalsize}
\DeclareRobustCommand{\BTTN}{\par\noindent\Large{\textbf{\textcolor{cornellred}{\ BÀI TẬP TRẮC NGHIỆM}}}\normalsize}
\DeclareRobustCommand{\CHTN}{\par\noindent\Large\textbf{\textcolor{cornellred}{\ BÀI TẬP TRẮC NGHIỆM\ \titlerule[4pt]}}\normalsize}
\DeclareRobustCommand{\Btvandung}{\par\centerline{\Large\textbf{\textcolor{blue}{\faGg\faGg\faGg\faGg\ BÀI TẬP VỀ NHÀ \faGg\faGg\faGg\faGg}}}}
\DeclareRobustCommand{\capdode}{\par\noindent\Large\textbf{\textcolor{cornellred}{\faAslInterpreting\ CẤP ĐỘ DỄ\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf}}}
\DeclareRobustCommand{\capdovua}{\par\noindent\Large\textbf{\textcolor{cornellred}{\faAslInterpreting\ CẤP ĐỘ VỪA\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf}}}
\DeclareRobustCommand{\capdokho}{\par\noindent\Large\textbf{\textcolor{cornellred}{\faAslInterpreting\ CẤP ĐỘ KHÓ\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf\ \faLeaf}}}
\DeclareRobustCommand{\Vidumau}{\noindent\large\textbf{\textcolor{cornellred}{\ VÍ DỤ MINH HỌA}}\normalsize\setcounter{vidu}{0}}
\DeclareRobustCommand{\Center}[1]{%
\hfill\bth{#1}\hfill\null}  
\DeclareRobustCommand{\Vehinh}[2]{%
\begin{tikzpicture}[scale=#1,thick,>=stealth']
#2
\end{tikzpicture}
}
\AfterEndEnvironment{Dang}{\setcounter{vidu}{0}}
\AfterEndEnvironment{dang}{\Vidumau}
\RequirePackage{calc}
\RequirePackage{etoolbox}
\RequirePackage{probsoln}
\RequirePackage{picinpar}
\RequirePackage{filecontents}
\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist{nolistsep}
\RequirePackage{dashrule}
%Ẩn hiện công thức tự động
\newlength\wsh
\newlength\hsh
\newlength\dsh
\newcommand{\sh}[1]{%
\settowidth\wsh{#1}%
\settoheight\hsh{#1}%
\settodepth\dsh{#1}%
\raisebox{0pt}[\hsh][\dsh]{
\hdashrule[0.5ex]{\wsh}{1pt}{1pt}
}}
\newcommand{\shct}[1]{\textcolor{white}{#1}}
\newcommand{\TF}[1]{\EXboxTF{\textbf{\colorEX#1}}}
\newcommand{\boxEX}[2][9pt]{%
	\def\sizeboxEX{#1}%
	\setbox1=\hbox{#2}%
	\ \EXbox{#2}\ %
}
%Lệnh tagEX gán nhãn công thức thủ công
\newcommand{\tagEX}[1]{%
	\hfill{\rm (#1)}%
	\par
	\@ifnextchar\begin%
	{\vspace{-\baselineskip}}
	{}
}
%Đánh dấu phương án đúng
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
\newcommand*\circEX[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,fill=cornellred,text=white,inner sep=0.5pt,xshift=-3pt] (char) {\myfont{10.5}{12}{\textbf{#1}}};;}}
\newcommand*\squareEX[1]{\tikz[baseline=(char.base)]{\node[shape=rectangle,draw=red,inner sep=2.5pt,fill=yellow!50] (char) {\color{red} #1};}}
\newcounter{dapan}
\newcommand{\TrueEX}{\stepcounter{dapan}{\circEX{\Alph{dapan}}}}
\newcommand{\FalseEX}{\stepcounter{dapan}{\textbf{\textcolor{blue}{\Alph{dapan}.}}}}
\newcommand{\dapan}{
	\@ifnextchar\True
	{\TrueEX}
	{\FalseEX}
}
\newlength\widthalpha
\newlength\widthalphaT
\newlength\widthalphaF
\settowidth\widthalphaT{\TrueEX}
\settowidth\widthalphaF{\FalseEX}
\ifdim\widthalpha<\widthalphaT\relax\setlength{\widthalpha}{\widthalphaT}\fi%
\ifdim\widthalpha<\widthalphaF\relax\setlength{\widthalpha}{\widthalphaF}\fi%
\newcommand{\begindapan}{
	\@ifnextchar\True
	{\TrueEX}
	{\FalseEX}
}
\newcommand{\begindapanhaiba}{
	\@ifnextchar\True
	{\TrueEX}
	{\FalseEX}
}
%Hiện Chọn đáp án trong lời giải chi tiết
\def\selectA{\par\noindent Chọn đáp án \circEX{A}}
\def\selectB{\par\noindent Chọn đáp án \circEX{B}}
\def\selectC{\par\noindent Chọn đáp án \circEX{C}}
\def\selectD{\par\noindent Chọn đáp án \circEX{D}}
\def\selectE{\par\noindent Chọn đáp án \circEX{E}}
\newcommand{\hidetextchoice}{
\def\selectA{}
\def\selectB{}
\def\selectC{}
\def\selectD{}
\def\selectE{}
}
\newcommand{\showtextchoice}{
\def\selectA{\par\noindent Chọn đáp án \circEX{A}}
\def\selectB{\par\noindent Chọn đáp án \circEX{B}}
\def\selectC{\par\noindent Chọn đáp án \circEX{C}}
\def\selectD{\par\noindent Chọn đáp án \circEX{D}}
\def\selectE{\par\noindent Chọn đáp án \circEX{E}}
}
%Tương thích môi trường enumerate,itemize
%=========================ĐỊNH DẠNG DANH SÁCH - LIỆT KÊ=================================
\RequirePackage{iitem}
\RequirePackage{tasks}
\renewcommand{\labelitemi}{\faCheckCircle}
\setlength\itemsep{0em}
\def\hfillEX{}
\BeforeBeginEnvironment{enumerate}
{\hfillEX}
%\BeforeBeginEnvironment{itemize}
%{\hfillEX}
\BeforeBeginEnvironment{listEX}
{\vspace*{-0.5\baselineskip}}
\AtBeginEnvironment{multicols}
{\def\hfillEX{}}
\newcommand{\listenumerate}[1]{
	\foreach \xenumerate in {#1} {%môi trường
		\AtBeginEnvironment{\xenumerate}{
			\def\hfillEX{\hfill}
		}
		\AtEndEnvironment{\xenumerate}{
			\def\hfillEX{}
		}
}}
\listenumerate{ex}
%Danh sách môi trường hiện dòng kẻ trong lời giải
\newcommand{\dotlineans}[2]{
\AtBeginEnvironment{#2}{
\def\colorEX{}
\makeatletter
\renewcommand{\begindapan}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
}
\renewcommand{\begindapanhaiba}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
}
\makeatletter
\renewcommand{\loigiai}[1]{
\dotlineEX{#1}
}}}
%Danh sách môi trường hiện dòng kẻ trong lời giải
\newcommand{\showansEX}[1]{
\AtBeginEnvironment{#1}{
\makeatletter
\renewcommand{\begindapan}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
}
\renewcommand{\begindapanhaiba}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
}
\def\True{\setcounter{numTrue}{\thedapan}\setcounter{numTrueSol}{\thedapan}}
\def\loigiaiEX{\color{cornellred}\normalsize\faFileText\ Hướng dẫn:}
\showanswers
%Xuất hiện chữ Lời giải trong môi trường onlysolution
\renewcommand{\do@onlysolution}[1]{%
\par\noindent\textbf{\loigiaiEX}
\ifshowanswers
 \@ifnextchar\immini
{}
{ \@ifnextchar\begin
{}
{\par\noindent}
}
##1%
%{}
\fi
\ifnum\the\value{numTrueSol}=1
\selectA
\fi
\ifnum\the\value{numTrueSol}=2
\selectB
\fi
\ifnum\the\value{numTrueSol}=3
\selectC
\fi
\ifnum\the\value{numTrueSol}=4
\selectD
\fi
\ifnum\the\value{numTrueSol}=5
\selectE 
\fi
\setcounter{numTrueSol}{0}
}
\renewcommand{\loigiai}[1]{
\labelex
\def\labelex{}
\begin{onlysolution}
##1
\end{onlysolution}
}
}}
%Danh sách môi trường hiện dòng kẻ trong lời giải
\newcommand{\hideansEX}[1]{
\AtBeginEnvironment{#1}{
\makeatletter
\renewcommand{\begindapan}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
}
\renewcommand{\begindapanhaiba}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
}
\def\colorEX{}
\makeatletter
\renewcommand{\begindapan}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
}
\renewcommand{\begindapanhaiba}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
}
\renewenvironment{onlysolution}{%
   \long@collect@body\do@onlysolution
}{}
\renewcommand{\loigiai}[1]{
}
}}
%Định nghĩa QED kết thúc chứng minh
\def\qedEX{\ensuremath{\square}}
%%Môi trường loigiai từ phiên bản  2.4.3
%\makeatletter
%\newenvironment{solEX}[1][]{%
%   \setkeys{probsoln}{#1}%
%   \long@collect@body\do@onlysolution
%}{}
%Đáp số câu hỏi tự luận
\Newassociation{solshort}{Solshort}{ansshort}
\renewcommand{\Solshortlabel}[1]{\color{violet}\textbf{#1.}
}
\newcommand{\shortsolnum}[1]
{
	\renewenvironment{Solshort}[1]
	{\begin{minipage}{\linewidth/#1-1.2\fboxsep}
\color{violet}\textbf{##1.}
\color{black}
		}
		{\end{minipage}}
}
\newcommand{\shortsol}[1]{
\scantokens{
\begin{solshort}
#1
\end{solshort}}
}
%Trích dẫn nguồn
\def\labelex{}
%\newcounter{dapan}
\newcommand{\nameex}{\normalsize\ Câu}
\newcommand{\namebt}{Bài}
%Dấu chấm, phảy sau mỗi phương án
\def\dotEX{.}
%Tương thích gói picinpar
\def\picinpar{\setlength{\linewidth}{\linewidth}}
\AtBeginEnvironment{window}{\def\picinpar{\setlength{\linewidth}{\linewidth-\picwd-\lwindowsep-2\fboxsep}}}
%Tùy chọn lời giải
\newcommand{\choicew}[1]{\setlength{\widthch}{#1}}
\newcommand{\loigiai}[1]{
\begin{onlysolution}
#1
\end{onlysolution}
}
\def\colorEX{\color{red}}
\newcounter{numTrue}
\newcounter{numTrueSol}
\DeclareOption{solcolor}{
\renewcommand{\TF}[1]{\EXboxTF{\textbf{\colorEX#1}}}
\renewcommand{\boxEX}[2][9pt]{%
	\setbox1=\hbox{#2}%
	\def\sizeboxEX{#1}%
    \ \EXbox{#2}\ %
}
\renewcommand{\sh}[1]{#1}
\makeatletter
\renewcommand{\begindapan}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\TrueEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
}
\renewcommand{\begindapanhaiba}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\TrueEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
}
\def\True{\leavevmode\colorEX\setcounter{numTrue}{\thedapan}\setcounter{numTrueSol}{\thedapan}}
\def\loigiaiEX{\color{cornellred}\normalsize\faFileText\ Hướng dẫn:}
\showanswers
%Xuất hiện chữ Lời giải trong môi trường onlysolution
\renewcommand{\do@onlysolution}[1]{%
\par\noindent\textbf{\loigiaiEX }
\ifshowanswers
 \@ifnextchar\immini
{}
{ \@ifnextchar\begin
{}
{\par\noindent}
}
#1%
%{}
\fi
\ifnum\the\value{numTrueSol}=1
\selectA
\fi
\ifnum\the\value{numTrueSol}=2
\selectB
\fi
\ifnum\the\value{numTrueSol}=3
\selectC
\fi
\ifnum\the\value{numTrueSol}=4
\selectD
\fi
\ifnum\the\value{numTrueSol}=5
\selectE 
\fi
\setcounter{numTrueSol}{0}
}
\renewcommand{\loigiai}[1]{
\labelex
\def\labelex{}
\begin{onlysolution}
#1
\end{onlysolution}
}
}
\newenvironment{cauhoiTN}[1]{
\Opensolutionfile{ansshort}[SLoigiai/#1]
\Opensolutionfile{ansbook}[Loigiai/#1]
\Opensolutionfile{ans}[Dapan/#1]
\setcounter{ex}{0}
\relax
}{
\Closesolutionfile{ans}
\Closesolutionfile{ansbook}
\Closesolutionfile{ansshort}
}
\DeclareOption{Teacher}{
\newcommand{\loai}[1]{\par\noindent\textbf{#1}}
\renewcommand{\TF}[1]{\EXboxTF{\textbf{\colorEX#1}}}
\renewcommand{\boxEX}[2][9pt]{%
	\setbox1=\hbox{#2}%
	\def\sizeboxEX{#1}%
	\ \EXbox{#2}\ %
}
\renewcommand{\shct}[1]{#1}
\renewcommand{\haidong}[1]{
}
\renewcommand{\sh}[1]{#1}
\renewcommand{\begindapan}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\TrueEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
}
\renewcommand{\begindapanhaiba}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\TrueEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
}
\def\colorEX{\color{cornellred}}
\def\True{\setcounter{numTrue}{\thedapan}\setcounter{numTrueSol}{\thedapan}}
\def\loigiaiEX{\color{cornellred}\normalsize\faFileText\ Hướng dẫn:}
\showanswers
%Xuất hiện chữ Lời giải trong môi trường onlysolution
\renewcommand{\do@onlysolution}[1]{%
\par\noindent\textbf{\loigiaiEX }
\ifshowanswers
 \@ifnextchar\immini
{}
{ \@ifnextchar\begin
{}
{\par\noindent}
}
#1%
{}
\fi
\ifnum\the\value{numTrueSol}=1
\selectA
\fi
\ifnum\the\value{numTrueSol}=2
\selectB
\fi
\ifnum\the\value{numTrueSol}=3
\selectC
\fi
\ifnum\the\value{numTrueSol}=4
\selectD
\fi
\ifnum\the\value{numTrueSol}=5
\selectE 
\fi
\setcounter{numTrueSol}{0}
}
\renewcommand{\loigiai}[1]{
\labelex
\def\labelex{}
\begin{onlysolution}
#1
\end{onlysolution}
}
\hidetextchoice
}
\DeclareOption{Dapan}{
\makeatletter
\renewcommand{\begindapan}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\TrueEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
}
\renewcommand{\begindapanhaiba}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\TrueEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
}
\def\colorEX{\color{cornellred}}
\def\True{\leavevmode\colorEX\setcounter{numTrue}{\thedapan}\setcounter{numTrueSol}{\thedapan}}
}
\DeclareOption{Student}{
\newcommand{\loai}[1]{}
\renewcommand{\TF}[1]{\EXboxTF{}}
\renewcommand{\boxEX}[2][9pt]{%
	\def\sizeboxEX{#1}%
	\setbox1=\hbox{#2}%
	\ \EXbox{}\ %
}
\makeatletter
\renewcommand{\begindapan}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{\dorong}
}
}
\renewcommand{\begindapanhaiba}{
\@ifnextchar\True
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
{
\begin{minipage}[t]{\widthalpha}
\FalseEX
\end{minipage}
\begin{minipage}[t]{0.67\dorong}
}
}
\def\True{\setcounter{numTrue}{\thedapan}\setcounter{numTrueSol}{\thedapan}} 
}
\ExecuteOptions{dethi}
\ProcessOptions
%Nội dung gói ex_test
\newlength\dorongfix
\dorongfix=\linewidth
\newlength\dorong
\dorong=\linewidth
%Danh sách môi trường trích dẫn nguồn câu hỏi
\newcommand{\listtheorem}[1]{
\foreach \x in {#1} {%môi trường
\AtEndEnvironment{\x}{
\labelex
}}}
%\makeatother
\Newassociation{solbook}{Solbook}{ansbook}
\renewcommand{\Solbooklabel}[1]{\textbf{\nameex\ #1.}
}
\Newassociation{EXsol}{Solution}{ans}
\Newassociation{sol}{Solution}{ans_old}
\def\starthaicot{\begin{multicols}{2}}
\def\endhaicot{\end{multicols}}
\newtheoremstyle{ex}% style name 
	{0ex}% above space 
	{0ex}% below space 
	{\normalfont}% body font 
	{}% indent amount 
	{\bfseries\color{blue}\Large}% head font 
	{: \color{red}[VNA]}% post head punctuation 
	{ }% post head punctuation 
	{}% head spec
\theoremstyle{ex}
\newtheorem{ex}{\nameex}
\newtheorem{baitap}{\namebt}
\tcbset{examplebox/.style={
enhanced jigsaw,
colback=white,
opacityback=0,
colframe=green!65!black,
}}
\ifboderstyle@boderstyle
%\newcounter{vidu}[subsection]
%\setcounter{vidu}{0}
\newtheoremstyle{vidu}% style name 
	{0ex}% above space 
	{0ex}% below space 
	{\normalfont}% body font 
	{}% indent amount 
	{\bfseries\color{blue}}% head font 
	{: }% post head punctuation 
	{0.1em}% post head punctuation 
	{}% head spec
\theoremstyle{vidu}
\newtheorem{vidu}{Ví dụ}
\def\beginbox{\begin{tcolorbox}[
	examplebox,
	left=1pt,
	right=1pt, 	
	bottom=1pt, 	
	top=2pt
	]}
\def\endbox{\end{tcolorbox}}
\AtBeginEnvironment{vidu}{
\beginbox
\renewcommand{\loigiai}[1]{
\renewcommand{\immini}[2]{
\setbox\imbox=\vbox{\hbox{##2}}
\widthimmini=\wd\imbox
\IMleftright{\normalsize ##1}{##2}
}
\endbox
\begin{onlysolution}
\normalsize #1
\end{onlysolution}
\def\endbox{}
}
}
\AtEndEnvironment{vidu}{
\endbox
}
\else
	\newtheoremstyle{vidu}% style name 
		{0ex}% above space 
		{0ex}% below space 
		{\normalfont}% body font 
		{}% indent amount 
		{\bfseries\color{blue}}% head font 
		{: }% post head punctuation 
		{0em}% post head punctuation 
		{}% head spec
	\theoremstyle{vidu}
	\newtheorem{vidu}{Ví dụ}
	\def\beginbox{\begin{tcolorbox}[
		blanker,
		left=1pt,
		right=1pt, 	
		bottom=1pt, 	
		top=2pt,
	]}
	\def\endbox{\end{tcolorbox}}
\fi

\newcounter{vdu}[vidu]
\setcounter{vdu}{0}
\newlength{\leftpar}
\newlength{\rightpar}
\setlength{\leftpar}{0.5\textwidth-0.01\dorongfix}
\setlength{\rightpar}{0.5\textwidth-0.01\dorongfix}
\newcommand{\haipar}[2]{\par\noindent\begin{minipage}[t][][t]{\leftpar}
#1
\end{minipage}
\begin{minipage}[t][][t]{\rightpar}
#2
\end{minipage}
}
\newcommand{\picline}[2]{\par\noindent\begin{minipage}[t][][t]{0.7\textwidth-0.01\dorongfix}
\haidong{#1}
\end{minipage}
\begin{minipage}[c][][c]{0.3\textwidth-0.01\dorongfix}
#2
\end{minipage}
}
%====================================================
\usepackage{pgf}
\newlength{\parline}
\newlength{\paroutindent}
\newlength{\lineheight}
\setlength{\lineheight}{\heightof{ABCDEefghijklmnoprstuvwxyz}}

\newcommand{\countlines}[1]{%
    \setlength{\paroutindent}{\expandafter\parindent}
    \setlength{\parline}{\heightof{\noindent\begin{minipage}{\linewidth}%
                \setlength{\parindent}{\paroutindent}#1\end{minipage}}}%
    \pgfmathparse{round(\parline / (0.9*\lineheight))}
    #1\par \noindent \texttt{line count: (\pgfmathresult)}
}

\AtBeginEnvironment{ex}{
	\setcounter{numTrueSol}{0}
	\def\dotEX{.}
	\setcounter{numChoice}{0}
}
\AtEndEnvironment{ex}{
\ifnum\the\value{numTrue}=1
\scantokens{\begin{EXsol}A\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=2
\scantokens{\begin{EXsol}B\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=3
\scantokens{\begin{EXsol}C\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=4
\scantokens{\begin{EXsol}D\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=5
\scantokens{\begin{EXsol}E\end{EXsol}}
\fi
\setcounter{numTrue}{0}
\setcounter{numTrueSol}{0}
\labelex
}
\AtBeginEnvironment{ex*}{
	\setcounter{numTrueSol}{0}
	\def\dotEX{.}
	\setcounter{numChoice}{0}
}
\AtEndEnvironment{ex*}{
\ifnum\the\value{numTrue}=1
\scantokens{\begin{EXsol}A\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=2
\scantokens{\begin{EXsol}B\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=3
\scantokens{\begin{EXsol}C\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=4
\scantokens{\begin{EXsol}D\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=5
\scantokens{\begin{EXsol}E\end{EXsol}}
\fi
\setcounter{numTrue}{0}
\setcounter{numTrueSol}{0}
\labelex
}
\AtBeginEnvironment{baitap}{
	\setcounter{numTrueSol}{0}
	\def\dotEX{.}
	\setcounter{numChoice}{0}
}
\AtEndEnvironment{baitap}{
\ifnum\the\value{numTrue}=1
\scantokens{\begin{EXsol}A\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=2
\scantokens{\begin{EXsol}B\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=3
\scantokens{\begin{EXsol}C\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=4
\scantokens{\begin{EXsol}D\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=5
\scantokens{\begin{EXsol}E\end{EXsol}}
\fi
\setcounter{numTrue}{0}
\setcounter{numTrueSol}{0}
\labelex
}
\AtBeginEnvironment{baitap*}{
	\setcounter{numTrueSol}{0}
	\def\dotEX{.}
	\setcounter{numChoice}{0}
}
\AtEndEnvironment{baitap*}{
\ifnum\the\value{numTrue}=1
\scantokens{\begin{EXsol}A\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=2
\scantokens{\begin{EXsol}B\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=3
\scantokens{\begin{EXsol}C\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=4
\scantokens{\begin{EXsol}D\end{EXsol}}
\fi
\ifnum\the\value{numTrue}=5
\scantokens{\begin{EXsol}E\end{EXsol}}
\fi
\setcounter{numTrue}{0}
\setcounter{numTrueSol}{0}
\labelex
}
\newtheorem{vdex}{Ví dụ}
\newtheorem{vd}{Ví dụ}
\newtheorem{bt}{Bài}
\newtheorem{dn}{Định nghĩa}
\AtBeginEnvironment{vdex}{\setcounter{numTrueSol}{0}\def\dotEX{.}}
\AtBeginEnvironment{vidu}{\setcounter{numTrueSol}{0}\def\dotEX{.}}
\AtBeginEnvironment{vidu*}{\setcounter{numTrueSol}{0}\def\dotEX{.}}
\newcommand{\boncot}[4]{
	\picinpar
	\setlength{\dorong}{0.25\linewidth-0.02\dorongfix-\widthalpha-2\fboxsep}
	\par\setcounter{dapan}{0}
	\noindent\hspace{0.02\dorongfix}\begindapan
	#1\dotEX
	\end{minipage}
	\noindent\begindapan
	#2\dotEX
	\end{minipage}
	\noindent\begindapan
	#3\dotEX
	\end{minipage}
	\noindent\begindapan
	#4\dotEX
	\end{minipage}
	\par\setcounter{dapan}{0}
}
\newcommand{\haicot}[4]{
	\picinpar
	\setlength{\dorong}{0.5\linewidth-0.02\dorongfix-\widthalpha-2\fboxsep}
	\par\setcounter{dapan}{0}
	\noindent\hspace{0.02\dorongfix}\begindapan
	#1\dotEX
	\end{minipage}
	\noindent\begindapan
	#2\dotEX
	\end{minipage}
	\par\noindent\hspace{0.02\dorongfix}\begindapan
	#3\dotEX
	\end{minipage}
	\noindent\begindapan
	#4\dotEX
	\end{minipage}
	\par\setcounter{dapan}{0}
}
\newcommand{\motcot}[4]{
	\picinpar
	\setlength{\dorong}{\linewidth-0.02\dorongfix-\widthalpha-2\fboxsep}
	\par\setcounter{dapan}{0}
	\noindent\hspace{0.02\dorongfix}\begindapan
	#1\dotEX\strut
	\end{minipage}

	\noindent\hspace{0.02\dorongfix}\begindapan
	#2\dotEX\strut
	\end{minipage}

	\noindent\hspace{0.02\dorongfix}\begindapan
	#3\dotEX\strut
	\end{minipage}

	\noindent\hspace{0.02\dorongfix}\begindapan
	#4\dotEX\strut
	\end{minipage}
	\par\setcounter{dapan}{0}
}
%%%%%%%Tự động chọn \motcot, \haicot, \boncot
\newlength\widthcha
\newlength\widthchb
\newlength\widthchc
\newlength\widthchd
\newlength\widthche
\newlength\widthch
\newlength\tabmaxwidth
\newlength\fourthtabwidth
\newlength\halftabwidth
\newlength\fifthtabwidth
\newlength\thirdtabwidth
\newcommand{\choice}[4]{%
	\setlength\tabmaxwidth{\linewidth-0.02\dorongfix-\widthalpha-3\fboxsep}
	\setlength\fourthtabwidth{0.25\linewidth-0.02\dorongfix-\widthalpha-3\fboxsep}
	\setlength\halftabwidth{0.5\linewidth-0.02\dorongfix-\widthalpha-3\fboxsep}
	\settowidth\widthcha{#1}
	\ifdim\widthch<\widthcha\relax\setlength{\widthch}{\widthcha}\fi%
	\settowidth\widthchb{#2}%
	\ifdim\widthch<\widthchb\relax\setlength{\widthch}{\widthchb}\fi%
	\settowidth\widthchc{#3}%
	\ifdim\widthch<\widthchc\relax\setlength{\widthch}{\widthchc}\fi%
	\settowidth\widthchd{#4}%
	\ifdim\widthch<\widthchd\relax\setlength{\widthch}{\widthchd}\fi%
	\ifdim\widthch<\fourthtabwidth
	\boncot{#1}{#2}{#3}{#4}
	\else\ifdim\widthch<\halftabwidth
	  \haicot{#1}{#2}{#3}{#4}
	\else
	  \motcot{#1}{#2}{#3}{#4}
	\fi\fi
}
\newcommand{\choicefix}[4]{%
	\setlength\tabmaxwidth{\linewidth-0.02\dorongfix-\widthalpha-3\fboxsep}
	\setlength\fourthtabwidth{0.25\linewidth-0.02\dorongfix-\widthalpha-3\fboxsep}
	\setlength\halftabwidth{0.5\linewidth-0.02\dorongfix-\widthalpha-3\fboxsep}
	\settowidth\widthcha{#1}
	\ifdim\widthch<\widthcha\relax\setlength{\widthch}{\widthcha}\fi%
	\settowidth\widthchb{#2}%
	\ifdim\widthch<\widthchb\relax\setlength{\widthch}{\widthchb}\fi%
	\settowidth\widthchc{#3}%
	\ifdim\widthch<\widthchc\relax\setlength{\widthch}{\widthchc}\fi%
	\settowidth\widthchd{#4}%
	\ifdim\widthch<\widthchd\relax\setlength{\widthch}{\widthchd}\fi%
	\ifdim\widthch<\fourthtabwidth
	\boncot{#1}{#2}{#3}{#4}
	\else\ifdim\widthch<\halftabwidth
	\haicot{#1}{#2}{#3}{#4}
	\else
	\motcot{#1}{#2}{#3}{#4}
	\fi\fi
}
%Trắc nghiệm 5 lựa chọn
\newcommand{\nammot}[5]{
	\picinpar
	\setlength{\dorong}{0.2\linewidth-0.022\dorongfix-2\fboxsep-\widthalpha}
	\par\setcounter{dapan}{0}
	\noindent\hspace{0.02\dorongfix}\begindapan
	#1\dotEX
	\end{minipage}
	\noindent\begindapan
	#2\dotEX
	\end{minipage}
	\noindent\begindapan
	#3\dotEX
	\end{minipage}
	\noindent\begindapan
	#4\dotEX
	\end{minipage}
	\noindent\begindapan
	#5\dotEX
	\end{minipage}

}
\newcommand{\bahai}[5]{
	\picinpar
	\setlength{\dorong}{0.5\linewidth-0.02\dorongfix-\fboxsep-3\widthalpha}
	\setcounter{dapan}{0}
	\par\noindent\hspace{0.02\dorongfix}\begindapanhaiba
	#1\dotEX
	\end{minipage}
	\noindent\begindapanhaiba
	#2\dotEX
	\end{minipage}
	\noindent\begindapanhaiba
	#3\dotEX
	\end{minipage}
	\par\noindent\hspace{0.02\dorongfix}\begindapan
	#4\dotEX
	\end{minipage}
	\noindent\begindapan
	#5\dotEX
	\end{minipage}

}

\newcommand{\haiba}[5]{
	\picinpar
	\setlength{\dorong}{0.5\linewidth-0.02\dorongfix-\fboxsep-3\widthalpha}
	\setcounter{dapan}{0}
	\par\noindent\hspace{0.02\dorongfix}\begindapan
	#1\dotEX
	\end{minipage}
	\noindent\begindapan
	#2\dotEX
	\end{minipage}
	\par\noindent\hspace{0.02\dorongfix}\begindapanhaiba
	#3\dotEX
	\end{minipage}
	\noindent\begindapanhaiba
	#4\dotEX
	\end{minipage}
	\noindent\begindapanhaiba
	#5\dotEX
	\end{minipage}

}
\newcommand{\motnam}[5]{
	\picinpar
	\setlength{\dorong}{\linewidth-0.02\dorongfix-\fboxsep-2\widthalpha}
	\par\setcounter{dapan}{0}
	\noindent\hspace{0.02\dorongfix}\begindapan
	#1\dotEX\strut
	\end{minipage}
	\par\noindent\hspace{0.02\dorongfix}\begindapan
	#2\dotEX\strut
	\end{minipage}
	\par\noindent\hspace{0.02\dorongfix}\begindapan
	#3\dotEX\strut
	\end{minipage}
	\par\noindent\hspace{0.02\dorongfix}\begindapan
	#4\dotEX\strut
	\end{minipage}
	\par\noindent\hspace{0.02\dorongfix}\begindapan
	#5\dotEX\strut
	\end{minipage}

}
\newlength\wmothai
\newlength\wmothaiba
\newlength\wmothaibabon
\newlength\wbonnam
\newlength\wbabonnam
\newlength\whaibabonnam
\newcounter{numChoice}
\newcommand{\choicefive}[5]{%
	\setlength\tabmaxwidth{\linewidth-\picwd-\lwindowsep}
	\setlength\fourthtabwidth{0.25\linewidth-0.25\picwd-0.25\lwindowsep-\widthalpha}
	\setlength\halftabwidth{0.5\linewidth-0.5\picwd-0.5\lwindowsep-\widthalpha}
	\setlength\fifthtabwidth{0.2\linewidth-0.2\picwd-0.2\lwindowsep-\widthalpha}
	\setlength\thirdtabwidth{0.33\linewidth-0.33\picwd-0.33\lwindowsep-\widthalpha}
	\settowidth\widthcha{AM.#1}
	\ifdim\widthch<\widthcha\relax\setlength{\widthch}{\widthcha}\fi%
	\ifdim\wmothai<\widthcha\relax\setlength{\wmothai}{\widthcha}\fi%
	\ifdim\wmothaiba<\widthcha\relax\setlength{\wmothaiba}{\widthcha}\fi%
	\ifdim\wmothaibabon<\widthcha\relax\setlength{\wmothaibabon}{\widthcha}\fi%
	\settowidth\widthchb{BM.#2}%
	\ifdim\widthch<\widthchb\relax\setlength{\widthch}{\widthchb}\fi%
	\ifdim\wmothai<\widthchb\relax\setlength{\wmothai}{\widthchb}\fi%
	\ifdim\wmothaiba<\widthchb\relax\setlength{\wmothaiba}{\widthchb}\fi%
	\ifdim\wmothaibabon<\widthchb\relax\setlength{\wmothaibabon}{\widthchb}
	\fi%
	\ifdim\whaibabonnam<\widthchb\relax\setlength{\whaibabonnam}{\widthchb}
	\fi%
	\settowidth\widthchc{CM.#3}%
	\ifdim\widthch<\widthchc\relax\setlength{\widthch}{\widthchc}\fi%
	\ifdim\wmothaiba<\widthchc\relax\setlength{\wmothaiba}{\widthchc}\fi%
	\ifdim\wmothaibabon<\widthchc\relax\setlength{\wmothaibabon}{\widthchc}\fi%
	\ifdim\wbabonnam<\widthchc\relax\setlength{\wbabonnam}{\widthchc}\fi%
	\ifdim\whaibabonnam<\widthchc\relax\setlength{\whaibabonnam}{\widthchc}
	\fi%
	\settowidth\widthchd{DM.#4}%
	\ifdim\widthch<\widthchd\relax\setlength{\widthch}{\widthchd}\fi%
	\ifdim\wmothaibabon<\widthchd\relax\setlength{\wmothaibabon}{\widthchd}\fi%
	\ifdim\wbabonnam<\widthchd\relax\setlength{\wbabonnam}{\widthchd}\fi%
	\ifdim\wbonnam<\widthchd\relax\setlength{\wbonnam}{\widthchd}\fi%
	\ifdim\whaibabonnam<\widthchd\relax\setlength{\whaibabonnam}{\widthchd}
	\fi%
	\settowidth\widthche{EM.#5}%
	\ifdim\widthch<\widthche\relax\setlength{\widthch}{\widthche}\fi%
	\ifdim\wbabonnam<\widthche\relax\setlength{\wbabonnam}{\widthche}\fi%
	\ifdim\wbonnam<\widthche\relax\setlength{\wbonnam}{\widthche}\fi%
	\ifdim\whaibabonnam<\widthchd\relax\setlength{\whaibabonnam}{\widthchd}
	\fi%
	%Khởi tạo điều kiện 
	\setcounter{numChoice}{0}
	\ifdim\wmothai<\halftabwidth
	\ifdim\wbabonnam<\thirdtabwidth	
	\setcounter{numChoice}{1}
	\fi\fi
	\ifdim\wmothaiba<\thirdtabwidth	
	\ifdim\wbonnam<\halftabwidth
	\setcounter{numChoice}{2}
	\fi\fi
	\ifdim\widthch<\fifthtabwidth
	\setcounter{numChoice}{3}
	\fi
	%Lựa chọn cách sắp xếp
	\ifnum\the\value{numChoice}=3
	\nammot{#1}{#2}{#3}{#4}{#5}
	\else
	\ifnum\the\value{numChoice}=2
	\bahai{#1}{#2}{#3}{#4}{#5}
	\else
	\ifnum\the\value{numChoice}=1
	\haiba{#1}{#2}{#3}{#4}{#5}
	\else
	\motnam{#1}{#2}{#3}{#4}{#5}
	\fi\fi\fi
}
%HẾT trắc nghiệm 5 lựa chọn
%Các phương pháp đưa hình vào văn bản
\def\vspaceIM{\vspace{-13pt}}
\def\breakIM{}
\def\numpicinpar{0}
\newdimen\widthimmini
\newdimen\heightimmini
\newdimen\spaceleft
\newbox\imbox
\newcommand{\hspaceIM}[1]{
	\def\hspaceIMEX{\hspace{#1\linewidth}}
	\def\hspaceEXIM{#1\linewidth}
}
\newcommand{\IMleftright}[3]{
	\hfill\par\noindent
	\begin{minipage}[t][][t]{\linewidth-\widthimmini-4\fboxsep-#1\linewidth}
		#2
	\end{minipage}
	\hspace{#1\linewidth}\hspace{2\fboxsep}
	\begin{minipage}[t][][b]{\widthimmini}\vspaceIM
		#3
	\end{minipage}
	\par\nointerlineskip
}
\newcommand{\immini}[3][0]{
	\setbox\imbox=\vbox{\hbox{#3}}
	\widthimmini=\wd\imbox
	\heightimmini=\ht\imbox
	\spaceleft=\dimexpr\textheight-\pagetotal-2\baselineskip\relax
	\ifdim\heightimmini>\spaceleft
	\breakIM
	\fi
	\IMleftright{#1}{#2}{#3}
}
\newcommand{\impicinpar}[2]{
\begin{window}[\numpicinpar,r,{
#2
}, {}]
\begin{flushleft}
#1
\end{flushleft}
\end{window}
}
%Hết cách đưa hình vào văn bản
\RequirePackage{comment}
\ifnangcao@nangcao
	\newtheoremstyle{exx}% style name 
	{0ex}% above space 
	{0ex}% below space 
	{\normalfont}% body font 
	{}% indent amount 
	{\bfseries\color{blue}}% head font 
	{:}% post head punctuation 
	{ }% post head punctuation 
	{}% head spec
	\theoremstyle{exx}
	\newtheorem{ex*}[ex]{\nameex}
	\newtheorem{baitap*}[baitap]{\namebt}
	\newtheoremstyle{vidux}% style name 
	{0ex}% above space 
	{0ex}% below space 
	{\normalfont}% body font 
	{}% indent amount 
	{\bfseries\color{blue}}% head font 
	{}% post head punctuation 
	{ }% post head punctuation 
	{}% head spec
	\theoremstyle{vidux}
	\newtheorem*{vidu*}{}
\AtBeginEnvironment{vidu*}{
\beginbox
\renewcommand{\loigiai}[1]{
\renewcommand{\immini}[2]{
\setbox\imbox=\vbox{\hbox{##2}}
\widthimmini=\wd\imbox
\IMleftright{\normalsize ##1}{##2}
}
\endbox
\begin{onlysolution}
\normalsize #1
\end{onlysolution}
\def\endbox{}
}
}
\AtEndEnvironment{vidu*}{
\endbox
}
\else
	\excludecomment{ex*}
	\excludecomment{vidu*}
	\excludecomment{baitap*}
\fi
% Biểu diễn khoảng, đoạn trên trục số
\usetikzlibrary{decorations.pathreplacing,decorations.markings,patterns}
\def\colorInterval{black}
\def\skipInterval{0.4cm}
\newcommand{\Interval}[4]{%
        \coordinate [label={center:$#1$},label=below:$\rule{0pt}{\skipInterval}#2$] (a) at (#2,0); 
        \coordinate [label={center:$#3$},label=below:$\rule{0pt}{\skipInterval}#4$] (b) at (#4,0); 
        \draw[color=\colorInterval] decorate[decoration={ticks,amplitude=3pt,segment length=1mm}] {(a)--(b)};
}
\newcommand{\IntervalR}[4]{%
        \coordinate [label={center:$#1$},label=below:$\rule{0pt}{\skipInterval}#2$] (a) at (#2,0); 
        \coordinate [label={center:$#3$},label=below:$\rule{0pt}{\skipInterval}#4$] (b) at (#4,0); 
        \draw decorate[decoration={markings,mark=% actually add a mark
      between positions 0 and 1 step 1mm
      with
      {
\draw[color=\colorInterval] (-3pt,-3pt) -- (3pt,3pt);
      }}] {(a)--(b)};
}
\newcommand{\IntervalL}[4]{%
        \coordinate [label={center:$#1$},label=below:$\rule{0pt}{\skipInterval}#2$] (a) at (#2,0); 
        \coordinate [label={center:$#3$},label=below:$\rule{0pt}{\skipInterval}#4$] (b) at (#4,0); 
        \draw decorate[decoration={
		markings,
		mark=between positions 0 and 1 step 1mm
      	with
      	{
		\draw[color=\colorInterval] (-3pt,3pt) -- (3pt,-3pt);
      	}
		}
		] {(a)--(b)};
}
\newcommand{\IntervalLF}[4]{%
        \coordinate [label={center:$#1$},label=below:$\rule{0pt}{\skipInterval}#2$] (a) at (#2,0); 
        \coordinate [label={center:$#3$},label=below:$\rule{0pt}{\skipInterval}#4$] (b) at (#4,0); 
   		\fill[pattern=north west lines,pattern color=\colorInterval](#2,-3pt)rectangle(#4,3pt);
}
\newcommand{\IntervalRF}[4]{%
        \coordinate [label={center:$#1$},label=below:$\rule{0pt}{\skipInterval}#2$] (a) at (#2,0); 
        \coordinate [label={center:$#3$},label=below:$\rule{0pt}{\skipInterval}#4$] (b) at (#4,0); 
   		\fill[pattern=north east lines,pattern color=\colorInterval](#2,-3pt)rectangle(#4,3pt);
}
\def\pre{0}
\def\next{2}
\newcommand{\IntervalLR}[2]{
\def\pre{#1}
\def\next{#2}
}
\newcommand{\IntervalG}[4]{%
        \coordinate [label={center:$#1$},label=below:$\rule{0pt}{\skipInterval}#2$] (a) at (\pre,0); 
        \coordinate [label={center:$#3$},label=below:$\rule{0pt}{\skipInterval}#4$] (b) at (\next,0); 
       \draw[color=\colorInterval] decorate[decoration={ticks,amplitude=3pt,segment length=1mm}] {(a)--(b)};
}
\newcommand{\IntervalGL}[4]{%
        \coordinate [label={center:$#1$},label=below:$\rule{0pt}{\skipInterval}#2$] (a) at (\pre,0); 
        \coordinate [label={center:$#3$},label=below:$\rule{0pt}{\skipInterval}#4$] (b) at (\next,0); 
        \draw decorate[decoration={markings,mark=% actually add a mark
      between positions 0 and 1 step 1mm
      with
      {
\draw[color=\colorInterval] (-3pt,3pt) -- (3pt,-3pt);
      }}] {(a)--(b)};
}
\newcommand{\IntervalGR}[4]{%
        \coordinate [label={center:$#1$},label=below:$\rule{0pt}{\skipInterval}#2$] (a) at (\pre,0); 
        \coordinate [label={center:$#3$},label=below:$\rule{0pt}{\skipInterval}#4$] (b) at (\next,0); 
        \draw decorate[decoration={markings,mark=% actually add a mark
      between positions 0 and 1 step 1mm
      with
      {
\draw[color=\colorInterval] (-3pt,-3pt) -- (3pt,3pt);
      }}] {(a)--(b)};
}

\newcommand{\IntervalGLF}[4]{%
        \coordinate [label={center:$#1$},label=below:$\rule{0pt}{\skipInterval}#2$] (a) at (\pre,0); 
        \coordinate [label={center:$#3$},label=below:$\rule{0pt}{\skipInterval}#4$] (b) at (\next,0); 
        \fill[pattern=north west lines,pattern color=\colorInterval](\pre,-3pt)rectangle(\next,3pt);
}
\newcommand{\IntervalGRF}[4]{%
        \coordinate [label={center:$#1$},label=below:$\rule{0pt}{\skipInterval}#2$] (a) at (\pre,0); 
        \coordinate [label={center:$#3$},label=below:$\rule{0pt}{\skipInterval}#4$] (b) at (\next,0); 
        \fill[pattern=north east lines,pattern color=\colorInterval](\pre,-3pt)rectangle(\next,3pt);
}
%============LIỆT KÊ DANH SÁCH ĐÁP ÁN==================
\newcommand{\Phieudapan}[1]{\begingroup %
			\begin{tcolorbox}[
					enhanced jigsaw, 
					breakable,
					colbacktitle=white,
					colback=white,
					colframe=coolblack,
					before=\vspace{10pt},
					left=1pt,
					right=1pt,
					bottom=1pt,
					top=1pt,
					opacityback=0,
					coltitle=coolblack,
					center title,
					title={\textbf{ĐÁP ÁN CÂU HỎI TRẮC NGHIỆM}}]
					\vspace{10pt}		
					\rowans
					\input{Dapan/#1}
				\end{tcolorbox}
		\endgroup}	
\newcommand{\GiaiVDC}[1]{
\centerline{\textbf{HƯỚNG DẪN GIẢI CÂU HỎI VẬN DỤNG CAO}}
\input{SLoigiai/#1} 
}
\newsavebox{\myboxans}
\newcommand{\boxans}
{
\renewenvironment{Solution}[1]
{\begin{lrbox}{\myboxans}\begin{minipage}{0.1\linewidth-4\fboxsep}
				\parbox[b]{0.55\linewidth}{\color{blue}##1.}
				\color{violet}
}
{\end{minipage}\end{lrbox}\fbox{\usebox{\myboxans}}}
}
\newcommand{\listans}
{
\renewenvironment{Solution}[1]
{{\color{blue}##1}\hspace*{-4pt}}
{\hspace*{-5pt}}
}
\newcommand{\tabans}[1]
{
	\renewenvironment{Solution}[1]
	{\begin{minipage}{\linewidth/#1-1.2\fboxsep}
			\parbox[b]{0.45\linewidth}{
			\raggedleft\color{blue}##1.
			}
			\color{violet}
		}
		{\end{minipage}}
}
\newcommand{\rowans}
{
	\renewenvironment{Solution}[1]
	{\begin{minipage}{0.1\linewidth-1.2\fboxsep}
			\parbox[b]{0.45\linewidth}{
			\raggedleft\color{blue}##1.
			}
			\color{violet}
		}
		{\end{minipage}}
}
\newcommand{\inputans}[2]{
	\renewenvironment{Solution}[1]
	{\begin{minipage}{\linewidth/#1-1.2\fboxsep}
			\parbox[b]{0.45\linewidth}{
				\raggedleft\color{blue}##1.
			}
			\color{violet}
		}
		{\end{minipage}}
\begin{flushleft}
\input{#2} 
\end{flushleft}
}
\newcommand{\inputansbox}[2]{
\renewenvironment{Solution}[1]
{\begin{lrbox}{\myboxans}\begin{minipage}{\linewidth/#1-4\fboxsep}
				\parbox[b]{0.55\linewidth}{\color{blue}##1.}
				\color{violet}
}
{\end{minipage}\end{lrbox}\fbox{\usebox{\myboxans}}}
\begin{flushleft}
\input{#2} 
\end{flushleft}
}
\makeatletter
\@ifclasswith{article}{a5paper}
{%
	\renewcommand{\rowans}
	{
		\renewenvironment{Solution}[1]
		{\begin{minipage}{0.2\linewidth-1.2\fboxsep}
				\parbox[b]{0.45\linewidth}{\color{blue}##1.}
				\color{violet}
			}
			{\end{minipage}}
	}
}{%
}
\@ifclasswith{book}{a5paper}
{%
	\renewcommand{\rowans}
	{
		\renewenvironment{Solution}[1]
		{\begin{minipage}{0.2\linewidth-1.2\fboxsep}
				\parbox[b]{0.45\linewidth}{\color{blue}##1.}
				\color{violet}
			}
			{\end{minipage}}
	}
}{%
}
\makeatother
%Hỗ trợ gói ex_test_rd
\newenvironment{fileEX}{\filecontents}{\endfilecontents}
\newcommand{\bankEX}[2]{
\input{#1}
}
\newtheorem{exrd}{Câu}
\def\listfile{
\bankEX{onefile.tex}{50}
}
\def\testname{
\begin{center}
\textbf{ĐỀ THI MẪU}
\end{center}
\rightline{
\setlength\fboxrule{2pt} 
\setlength\fboxsep{5pt} 
\fbox{\textbf{Mã đề thi\ \x}}
}
}
\newcommand{\randombank}[1]{
%\testname
\begin{center}
\textbf{
\color{cornellred}
Bạn đang chạy bằng gói ex\_test xuất ra MỌI CÂU HỎI của ngân hàng nhằm soát lỗi.\\
Khi mọi thứ đã OK, hãy thay khai báo gói ex\_test  bằng gói ex\_test\_rd
}
\end{center}
\Opensolutionfile{ans}[ans/ans_ex_test]
\listfile
\Closesolutionfile{ans}
}
\newcommand{\showansfull}{\par Các mã đề: }
\newcommand{\showans}{\par Các mã đề: }
%Đường tròn LG
\usetikzlibrary{plotmarks}
\newcommand{\trucLG}{
\draw[->] (0,-1.3) -- (0,1.3) node[left] {$\sin$};
\draw[->] (-1.3,0) -- (1.3,0) node[below] {$\cos$};
\draw (0,0) circle (1cm);
}
\newcommand{\pointLG}[4]
{
\foreach \i in {0,...,#2}
{
 \draw[color=#4]
      plot[mark=#3] coordinates {({#1+\i*360/#2}:1)};
}
}
\makeatletter
\def\sizeboxEX{9pt}
\def\EXbox#1{%
	\begingroup%
	\setlength{\fboxsep}{0.3ex}%
	\setlength{\@tempdima}{\sizeboxEX}%
	\setlength{\@tempdimb}{(\@tempdima-\ht1+\dp1)/2}%
	\raise-\@tempdimb\hbox{\fbox{\vbox to \@tempdima{%
				\vfil\hbox to \@tempdima{\hfil#1\hfil}\vfil}}}%
	\endgroup%
}
\def\EXboxTF#1{%
	\begingroup%
	\setlength{\fboxsep}{0.3ex}%
	\setbox1=\hbox{#1}%
	\setlength{\@tempdima}{\sizeboxEX}%
	\fbox{\vbox to \@tempdima{%
				\vfil\hbox to \@tempdima{\hfil\copy1\hfil}\vfil}}%
	\endgroup%
}
\makeatother
% Môi trường liệt kê dàn theo nhiều dòng khác nhau
% Môi trường liệt kê dàn theo nhiều dòng khác nhau
\ExplSyntaxOn
% variants of kernel functions:
\cs_generate_variant:Nn \tl_if_eq:nnTF { V }
\cs_generate_variant:Nn \tl_if_eq:nnT  { V }

% --------------------------------------------------------------------------
% variables:
\seq_new:N    \l__listsEX_seq

\int_new:N    \l__listsEX_depth_int
\int_new:N    \g__listsEX_int
\int_new:N    \g__listsEX_total_items_int
\int_new:N    \l__listsEX_columns_int
\int_new:N    \l__listsEX_rows_int
\int_new:N    \g__listsEX_current_col_num_int
\int_new:N    \g__listsEX_current_row_num_int
\int_new:N    \l__listsEX_item_columns_int

\bool_new:N   \l__listsEX_enumerate_bool
\bool_new:N   \l__listsEX_resume_bool
\bool_new:N   \l__listsEX_load_listsEX_bool
\bool_new:N   \l__listsEX_label_width_bool
\bool_new:N   \l__listsEX_item_indent_bool
\bool_new:N   \l__listsEX_label_offset_bool
\bool_new:N   \l__listsEX_custom_label_bool
\bool_new:N   \l__listsEX_custom_after_item_skip_bool
\bool_new:N   \l__listsEX_debug_bool
\bool_new:N   \l__listsEX_item_full_line_bool
\bool_new:N   \l__listsEX_item_rest_of_line_bool

\tl_new:N     \l__listsEX_instance_tl
\tl_new:N     \l__listsEX_label_tl
\tl_new:N     \l__listsEX_custom_label_tl
\tl_new:N     \l__listsEX_label_pattern_tl
\tl_new:N     \l__listsEX_custom_label_pattern_tl
\tl_new:N     \l__listsEX_label_format_tl
\tl_new:N     \l__listsEX_custom_label_format_tl
\tl_new:N     \l__listsEX_item_format_tl
\tl_new:N     \l__listsEX_custom_item_format_tl
\tl_new:N     \l__listsEX_item_fill_left_tl
\tl_new:N     \l__listsEX_item_fill_right_tl
\tl_new:N     \l__listsEX_label_align_tl
% \tl_new:N     \listEX
\tl_new:N     \l__listsEX_item_tl
\tl_new:N     \l__listsEX_tmp_label_tl

\dim_new:N    \l__listsEX_item_indent_dim
\dim_new:N    \l__listsEX_item_default_indent_dim
\dim_new:N    \l__listsEX_item_width_dim
\dim_new:N    \l__listsEX_label_width_dim
\dim_new:N    \l__listsEX_label_default_width_dim
\dim_new:N    \l__listsEX_label_offset_dim
\dim_new:N    \l__listsEX_label_default_offset_dim
\dim_new:N    \l__listsEX_column_sep_dim

\skip_new:N   \l__listsEX_after_item_skip
\skip_new:N   \l__listsEX_custom_after_item_skip
\skip_new:N   \l__listsEX_before_list_skip
\skip_new:N   \l__listsEX_after_list_skip

\coffin_new:N \l__listsEX_item_coffin
\coffin_new:N \l__listsEX_label_coffin

\NewCounterPattern* [ listsEX ] { listEX } { tsk }
\ReadCounterFrom [ listsEX ] { listEX } \g__listsEX_int

% temporary variables:
\int_new:N    \l__listsEX_tmpa_int
\int_new:N    \l__listsEX_tmpb_int
\tl_new:N     \l__listsEX_tmpa_tl
\coffin_new:N \l__listsEX_tmpa_coffin

\cs_new:Npn \__listsEX_debug:n #1
  {
    \bool_if:NTF \l__listsEX_debug_bool
      { \fbox {#1} }
      { \use:n {#1} }
  }

% --------------------------------------------------------------------------
% collect the listsEX:
\cs_new_protected:Npn \__listsEX_collect_listsEX:nww #1#2 \end #3
  {
    \tl_put_right:Nn \l__listsEX_body_tl {#1}
    \end {#3}
    \tl_if_eq:nnF {#1} {#3}
      { \__listsEX_collect_listsEX:nww {#1} }
  }

%  #1: instance
%  #2: number of columns
%  #3: item separator
%  #4: environment body
\cs_new_protected:Npn \__listsEX:nnnn #1#2#3#4
  {
    \bool_if:NT \l__listsEX_debug_bool { \dim_set:Nn \fboxsep {0pt} }
    \seq_set_split:Nnn \l__listsEX_seq {#3} {#4}
    % remove the first (empty) item:
    \seq_pop_left:NN \l__listsEX_seq \l__listsEX_tmpa_tl
    \tl_if_blank:VF \l__listsEX_tmpa_tl { \@noitemerr }
    \int_gset:Nn \g__listsEX_total_items_int
      { \seq_count:N \l__listsEX_seq }
    \UseInstance {listsEX} {#1}
      { \g__listsEX_total_items_int }
      {#2}
      { \l__listsEX_custom_label_pattern_tl }
    % just to be sure:
    \seq_clear:N \l__listsEX_seq
  }
\cs_generate_variant:Nn \__listsEX:nnnn { VnnV }

% #1: label
% #2: item format
% #3: item
\cs_new_protected:Npn \__listsEX_listEX:nnn #1#2#3
  {
    % start a new item line if \l__listsEX_item_full_line_bool
    \bool_if:NT \l__listsEX_item_full_line_bool
      {
        % add skip if we were in the middle of a line, i.e., in horizontal
        % mode:
        \mode_if_horizontal:T
          { \skip_vertical:N \l__listsEX_after_item_skip }
        \listsEX_new_row:
      }
    % step column position:
    \int_gincr:N \g__listsEX_current_col_num_int
    \dim_set:Nn \l__listsEX_item_width_dim
      {
        \bool_if:NTF \l__listsEX_item_full_line_bool
          { \linewidth }
          {
            (
              \linewidth
              - \l__listsEX_columns_int \l__listsEX_column_sep_dim
              + \l__listsEX_column_sep_dim
            ) / \l__listsEX_columns_int
          }
        - \l__listsEX_depth_int \l__listsEX_item_indent_dim
        \bool_if:NT \l__listsEX_debug_bool { -2\fboxrule }
      }
    \__listsEX_gset_rows_num:NN
      \g__listsEX_total_items_int
      \l__listsEX_columns_int
    % set \g__listsEX_current_col_num_int to 1 if at the start of a row,
    % then also step \g__listsEX_current_row_num_int :
    \int_compare:nNnT
      { \g__listsEX_current_col_num_int } > { \l__listsEX_columns_int }
      {
        \int_gset:Nn \g__listsEX_current_col_num_int { 1 }
        \int_incr:N \g__listsEX_current_row_num_int
      }
    \bool_if:NT \l__listsEX_item_rest_of_line_bool
      {
        \int_set:Nn \l__listsEX_tmpa_int
          { \l__listsEX_columns_int - \g__listsEX_current_col_num_int + 1 }
        \int_compare:nNnTF { \l__listsEX_item_columns_int } = { 0 }
          {
            \int_set:Nn \l__listsEX_tmpb_int { \l__listsEX_tmpa_int - 1 } % 8
          }
          {
            \int_compare:nNnTF
              { \l__listsEX_tmpa_int } > { \l__listsEX_item_columns_int }
              { \int_set_eq:NN \l__listsEX_tmpa_int \l__listsEX_item_columns_int }
              { \int_zero:N \l__listsEX_item_columns_int }
            \bool_if:nT
              {
                \l__listsEX_item_rest_of_line_bool &&
                !\int_compare_p:nNn { \l__listsEX_item_columns_int} = { 0 }
              }
              {
                \int_gadd:Nn \g__listsEX_current_col_num_int
                  { \l__listsEX_item_columns_int -1 }
                \int_gadd:Nn \g__listsEX_total_items_int
                  { \l__listsEX_item_columns_int -1 }
              }
            \int_set:Nn \l__listsEX_tmpb_int { \l__listsEX_tmpa_int -1 }
          }
        \dim_set:Nn \l__listsEX_item_width_dim
          {
            \l__listsEX_tmpa_int \l__listsEX_item_width_dim
            + \l__listsEX_tmpb_int \l__listsEX_column_sep_dim
            + \l__listsEX_tmpb_int \l__listsEX_item_indent_dim
            \bool_if:NT \l__listsEX_debug_bool
              { + \int_eval:n { \l__listsEX_tmpb_int * 2 } \fboxrule }
          }
      }
    % set the item box:
    \hcoffin_set:Nn \l__listsEX_item_coffin
      {
        \vcoffin_set:Nnn \l__listsEX_tmpa_coffin
          { \l__listsEX_item_width_dim }
          { \__listsEX_setup: #2 {#3} \strut }
        \__listsEX_debug:n
          {
            \coffin_typeset:Nnnnn \l__listsEX_tmpa_coffin
              {l} {T} {0pt} {0pt}
          }
      }
    % set the label box:
    \hcoffin_set:Nn \l__listsEX_label_coffin
      {
        \vcoffin_set:Nnn \l__listsEX_tmpa_coffin
          {
            \l__listsEX_label_width_dim
            \bool_if:NT \l__listsEX_debug_bool {-2\fboxrule }
          }
          {
            \noindent
            \tl_use:N \l__listsEX_item_fill_left_tl
            \strut #1
            \tl_use:N \l__listsEX_item_fill_right_tl
          }
        \__listsEX_debug:n
          {
            \coffin_typeset:Nnnnn \l__listsEX_tmpa_coffin
              {l} {T} {0pt} {0pt}
          }
      }
    % attach the label box at the left of the item box, shifted by
    % \l__listsEX_label_offset_dim :
    \coffin_attach:NnnNnnnn
      \l__listsEX_item_coffin  {l} {T}
      \l__listsEX_label_coffin {l} {T}
      {
        \dim_compare:nNnTF
          { \l__listsEX_item_indent_dim }
          <
          { \l__listsEX_label_offset_dim + \l__listsEX_label_width_dim }
          {0pt}
          { - \l__listsEX_label_width_dim - \l__listsEX_label_offset_dim }
      } { 0pt }
    % when a new row starts enter vertical mode:
    \int_compare:nNnT { \g__listsEX_current_col_num_int } = { 1 }
      { \skip_vertical:N \c_zero_skip }
    % skip horizontally by \l__listsEX_item_indent_dim
    \noindent
    \skip_horizontal:N \l__listsEX_item_indent_dim
    % typeset the item (with the attached label protruding to the left):
    \coffin_typeset:Nnnnn \l__listsEX_item_coffin
      {l}
      {T}
      {0pt}
      {0pt}
    \bool_if:nT
      {
        \l__listsEX_item_full_line_bool ||
        (
          \l__listsEX_item_rest_of_line_bool &&
          \int_compare_p:nNn { \l__listsEX_item_columns_int } = { 0 }
        )
      }
      { \listsEX_new_row: }
    % are we between items in a row? The skip by \l__listsEX_column_sep_dim :
    \int_compare:nNnT
      { \g__listsEX_current_col_num_int } < { \l__listsEX_columns_int }
      { \skip_horizontal:N \l__listsEX_column_sep_dim }
    % if we ended a row and a new row is still to come skip vertically by
    % \l__listsEX_after_item_skip :
    \bool_if:nT
      {
        ( \int_compare_p:nNn { \g__listsEX_current_col_num_int } = { \l__listsEX_columns_int } )
        &&
        ( \int_compare_p:n { \g__listsEX_current_row_num_int != \l__listsEX_rows_int } )
      }
      { \skip_vertical:N \l__listsEX_after_item_skip }
    % clean up:
    \coffin_clear:N \l__listsEX_item_coffin
    \coffin_clear:N \l__listsEX_label_coffin
    \coffin_clear:N \l__listsEX_tmpa_coffin
    \bool_set_false:N \l__listsEX_item_full_line_bool
    \bool_set_false:N \l__listsEX_item_rest_of_line_bool
  }
\cs_generate_variant:Nn \__listsEX_listEX:nnn { VVV }

\cs_new_protected:Npn \__listsEX_setup:
  {
    \dim_set:Nn \parskip { 0pt }
    \skip_set:Nn \parfillskip { 0pt plus 1fil }
    \dim_set_eq:NN \parskip \parsep
    \dim_set_eq:NN \parindent \listparindent
    \noindent
    \dim_compare:nNnT
      { \l__listsEX_item_indent_dim }
       <
      { \l__listsEX_label_offset_dim + \l__listsEX_label_width_dim }
      {
        \skip_horizontal:n
          {
            \l__listsEX_label_offset_dim
            + \l__listsEX_label_width_dim
            - \l__listsEX_item_indent_dim
          }
      }
    \strut
  }

\cs_new_protected:Npn \__listsEX_gset_rows_num:NN #1#2
  {
    \int_gset:Nn \l__listsEX_rows_int { \int_div_truncate:nn {#1} {#2} }
    \int_compare:nNnT { \int_mod:nn {#1} {#2} } > { 0 }
      { \int_gincr:N \l__listsEX_rows_int }
  }

\cs_new_protected:Npn \__listsEX_label_align:n #1
  {
    \str_case:nnF {#1}
      {
        {left}
          {
            \tl_clear:N   \l__listsEX_item_fill_left_tl
            \tl_set_eq:NN \l__listsEX_item_fill_right_tl \hfill
          }
        {right}
          {
            \tl_set_eq:NN \l__listsEX_item_fill_left_tl \hfill
            \tl_clear:N   \l__listsEX_item_fill_right_tl
          }
        {center}
          {
            \tl_set_eq:NN \l__listsEX_item_fill_left_tl  \hfill
            \tl_set_eq:NN \l__listsEX_item_fill_right_tl \hfill
          }
      }
      {
        \tl_clear:N   \l__listsEX_item_fill_left_tl
        \tl_set_eq:NN \l__listsEX_item_fill_right_tl \hfill
      }
  }
\cs_generate_variant:Nn \__listsEX_label_align:n { V }
\__listsEX_label_align:n {left}

% --------------------------------------------------------------------------
% the `listsEX' object:
%   #1: number of items
%   #2: number of columns
%   #3: label-format
\DeclareObjectType {listsEX} {3}
% the `default' template interface:
\DeclareTemplateInterface {listsEX} {default} {3}
  {
    enumerate       : boolean   = true    ,
    label           : tokenlist           ,
    indent          : length    = 2.5em   ,
    counter-format  : tokenlist = tsk[a]) ,
    label-format    : tokenlist ,
    label-width     : length    = 1em     ,
    label-offset    : length    = .3333em ,
    item-format     : tokenlist ,
    after-item-skip : skip      = 1ex plus 1ex minus 1ex
  }

% in the next three commands we want a really unlikely to occur marker; for
% this we use $ with unusual catcode in ``$listsEX$default$label$'':
\cs_set:Nx \__listsEX_restore_dollar:
  { \char_set_catcode:nn {36} { \char_value_catcode:n {36} } }
\char_set_catcode_alignment:N \$

% the `default' template code:
\DeclareTemplateCode {listsEX} {default} {3}
  {
    enumerate       = \l__listsEX_enumerate_bool           ,
    label           = \l__listsEX_label_tl                 ,
    indent          = \l__listsEX_item_default_indent_dim  ,
    counter-format  = \l__listsEX_label_pattern_tl         ,
    label-format    = \l__listsEX_label_format_tl          ,
    label-width     = \l__listsEX_label_default_width_dim  ,
    label-offset    = \l__listsEX_label_default_offset_dim ,
    item-format     = \l__listsEX_item_format_tl           ,
    after-item-skip = \l__listsEX_after_item_skip
  }
  {
    \AssignTemplateKeys
    \bool_if:NF \l__listsEX_label_width_bool
      {
        \dim_set_eq:NN
          \l__listsEX_label_width_dim
          \l__listsEX_label_default_width_dim
      }
    \bool_if:NF \l__listsEX_item_indent_bool
      {
        \dim_set_eq:NN
          \l__listsEX_item_indent_dim
          \l__listsEX_item_default_indent_dim
      }
    \bool_if:NF \l__listsEX_label_offset_bool
      {
        \dim_set_eq:NN
          \l__listsEX_label_offset_dim
          \l__listsEX_label_default_offset_dim
      }
    \bool_if:NT \l__listsEX_custom_after_item_skip_bool
      {
        \skip_set_eq:NN
          \l__listsEX_after_item_skip
          \l__listsEX_custom_after_item_skip
      }
    \bool_if:NT \l__listsEX_custom_label_bool
      {
        \tl_set_eq:NN
          \l__listsEX_label_tl
          \l__listsEX_custom_label_tl
        \bool_set_false:N \l__listsEX_enumerate_bool
      }
    \__listsEX_label_align:V \l__listsEX_label_align_tl
    % need this for enumerate list:
    \bool_if:nT { !\l__listsEX_resume_bool && \l__listsEX_enumerate_bool }
      { \int_gzero:N \g__listsEX_int }
    \int_set:Nn \l__listsEX_columns_int {#2}
    % set all the items in their own coffins and join with the ground:
    \int_gzero:N \g__listsEX_current_col_num_int
    \int_set:Nn \g__listsEX_current_row_num_int {1}
    \tl_if_blank:VF \l__listsEX_custom_label_pattern_tl
      {
        \tl_set_eq:NN
          \l__listsEX_label_pattern_tl
          \l__listsEX_custom_label_pattern_tl
      }
    \tl_if_blank:VF \l__listsEX_custom_label_format_tl
      {
        \tl_set_eq:NN
          \l__listsEX_label_format_tl
          \l__listsEX_custom_label_format_tl
      }
    \tl_if_blank:VF \l__listsEX_custom_item_format_tl
      {
        \tl_set_eq:NN
          \l__listsEX_item_format_tl
          \l__listsEX_custom_item_format_tl
      }
    \seq_map_inline:Nn \l__listsEX_seq
      {
        \__listsEX_read_item:www ##1 \q_stop
        \bool_if:NTF \l__listsEX_enumerate_bool
          {
            \tl_if_eq:VnT \l__listsEX_tmp_label_tl { $listsEX$default$label$ }
              {
                \int_gincr:N \g__listsEX_int
                \SaveCounterPatternFrom [listsEX]
                  \l__listsEX_tmpa_tl
                  \l__listsEX_label_tl
                  \l__listsEX_label_pattern_tl
              }
          }
          {
            \tl_if_blank:VT \l__listsEX_label_tl
              { \tl_set_eq:NN \l__listsEX_label_tl \labelitemi }
          }
        \tl_put_left:NV \l__listsEX_label_tl \l__listsEX_label_format_tl
        % \tl_put_left:NV \l__listsEX_item_tl \l__listsEX_item_format_tl
        \tl_if_eq:VnTF \l__listsEX_tmp_label_tl { $listsEX$default$label$ }
          {
            \__listsEX_listEX:VVV
              \l__listsEX_label_tl
              \l__listsEX_item_format_tl
              \l__listsEX_item_tl
          }
          {
            \__listsEX_listEX:VVV
              \l__listsEX_tmp_label_tl
              \l__listsEX_item_format_tl
              \l__listsEX_item_tl
            \tl_clear:N \l__listsEX_tmp_label_tl
          }
      }
  }

\cs_new_protected:Npn \__listsEX_read_item:www
  {
    \peek_meaning_remove:NTF !
      {
        \bool_set_true:N \l__listsEX_item_full_line_bool
        \__listsEX_read_item_aux:ww
      }
      {
        \peek_meaning_remove:NTF *
          {
            \bool_set_true:N \l__listsEX_item_rest_of_line_bool
            \__listsEX_read_item_rest_of_line:ww
          }
          { \__listsEX_read_item_aux:ww }
      }
  }

\cs_new_protected:Npn \__listsEX_read_item_rest_of_line:ww
  {
    \peek_meaning:NTF ( % )
      { \__listsEX_read_item_rest_of_line_aux:ww }
      { \__listsEX_read_item_rest_of_line_aux:ww (0) }
  }

\cs_new_protected:Npn \__listsEX_read_item_rest_of_line_aux:ww (#1)
  {
    \int_set:Nn \l__listsEX_item_columns_int {#1}
    \__listsEX_read_item_aux:ww
  }

\cs_new_protected:Npn \__listsEX_read_item_aux:ww
  {
    \peek_meaning:NTF [ % ]
      { \__listsEX_read_item_aux_ii:ww }
      { \__listsEX_read_item_aux_ii:ww [$listsEX$default$label$] }
  }
  
\cs_new_protected:Npn \__listsEX_read_item_aux_ii:ww [#1]#2 \q_stop
  {
    \tl_set:Nn \l__listsEX_tmp_label_tl {#1}
    \tl_if_eq:nnF { #1 } { $listsEX$default$label$ }
      { \tl_put_left:NV \l__listsEX_tmp_label_tl \l__listsEX_label_format_tl }
    \tl_set:Nx \l__listsEX_item_tl { \tl_trim_spaces:n {#2} }
  }

\__listsEX_restore_dollar:

% --------------------------------------------------------------------------
% choice box:
\bool_new:N \l__listsEX_choice_checked_bool
\dim_new:N  \l__listsEX_choice_width_dim
\dim_set:Nn \l__listsEX_choice_width_dim { 1.25ex }
\dim_new:N  \l__listsEX_choice_linewidth_dim
\dim_set:Nn \l__listsEX_choice_linewidth_dim { .3pt }
\dim_new:N  \l__listsEX_choice_checkwidth_dim
\dim_set:Nn \l__listsEX_choice_checkwidth_dim { .5pt }
\dim_new:N  \l__listsEX_choice_raise_dim
\dim_set:Nn \l__listsEX_choice_raise_dim { .1ex }

\cs_new_protected:Npn \listsEX_choice:
  {
    \leavevmode
    \group_begin:
      \bool_set_false:N \l__listsEX_choice_checked_bool
      \box_move_up:nn
        { \l__listsEX_choice_raise_dim }
        { \hbox:n { \__listsEX_choice: } }
    \group_end:
  }

\cs_new_protected:Npn \listsEX_choice_checked:
  {
    \leavevmode
    \group_begin:
      \bool_set_true:N \l__listsEX_choice_checked_bool
      \box_move_up:nn
        { \l__listsEX_choice_raise_dim }
        { \hbox:n { \__listsEX_choice: } }
    \group_end:
  }

\cs_new_protected:Npn \__listsEX_choice:
  {%
    \dim_set:Nn \unitlength { .1\l__listsEX_choice_width_dim }
    \begin{picture}(10,0)
      \linethickness \l__listsEX_choice_linewidth_dim
      \drawline(0,0)(0,10)(10,10)(10,0)(0,0)
      \linethickness \l__listsEX_choice_checkwidth_dim
      \bool_if:NT \l__listsEX_choice_checked_bool
        {
          \drawline(2,2)(8,8)
          \drawline(2,8)(8,2)
        }
    \end{picture}%
  }

\providecommand* \choicebox { \listsEX_choice: }
\providecommand* \checkedchoicebox { \listsEX_choice_checked: }

% --------------------------------------------------------------------------
% base instance:
% ALPHABETIZE: a) b) c)
\DeclareInstance {listsEX} {alphabetize} {default} { }

\keys_define:nn {listsEX/list}
  {
    debug           .bool_set:N = \l__listsEX_debug_bool ,
    style           .tl_set:N   = \l__listsEX_instance_tl ,
    style           .initial:n  = alphabetize ,
    counter-format  .tl_set:N   = \l__listsEX_custom_label_pattern_tl ,
    label           .code:n     =
      \bool_set_true:N \l__listsEX_custom_label_bool
      \tl_set:Nn \l__listsEX_custom_label_tl {#1} ,
    label-format    .tl_set:N   = \l__listsEX_custom_label_format_tl ,
    label-width     .code:n     =
      \dim_set:Nn \l__listsEX_label_width_dim {#1}
      \bool_set_true:N \l__listsEX_label_width_bool ,
    label-offset    .code:n     =
      \dim_set:Nn \l__listsEX_label_offset_dim {#1}
      \bool_set_true:N \l__listsEX_label_offset_bool ,
    label-align     .tl_set:N   = \l__listsEX_label_align_tl ,
    item-format     .tl_set:N   = \l__listsEX_custom_item_format_tl ,
    item-indent     .code:n     =
      \dim_set:Nn \l__listsEX_item_indent_dim {#1}
      \bool_set_true:N \l__listsEX_item_indent_bool ,
    column-sep      .dim_set:N  = \l__listsEX_column_sep_dim ,
    before-skip     .skip_set:N = \l__listsEX_before_list_skip ,
    after-skip      .skip_set:N = \l__listsEX_after_list_skip ,
    after-item-skip .code:n     =
      \bool_set_true:N \l__listsEX_custom_after_item_skip_bool
      \skip_set:Nn \l__listsEX_custom_after_item_skip {#1} ,
    resume          .bool_set:N = \l__listsEX_resume_bool
  }

% --------------------------------------------------------------------------
% the generic environment:
\NewEnviron {__listsEX_env:} [3]
  {
    \if@inlabel
      \noindent\par\nobreak\vskip-\parskip\vskip-\baselineskip\hrule\@height\z@
    \fi
    \dim_compare:nNnF { \l__listsEX_before_list_skip } = { 0pt }
      { \vspace {\l__listsEX_before_list_skip} }
    \list {}
      {
        \keys_set:nn {listsEX/list} {#2}
        \dim_set:Nn \leftmargin  {0pt}
        \dim_set:Nn \rightmargin {0pt}
      }
    \item \scan_stop:
    \int_incr:N \l__listsEX_depth_int
    \__listsEX:VnnV \l__listsEX_instance_tl {#3} {#1} \BODY
    \endlist
    \dim_compare:nNnF { \l__listsEX_after_list_skip } = { 0pt }
      { \vspace {\l__listsEX_after_list_skip} }
  }

% --------------------------------------------------------------------------
% command to start a new row:
\cs_new_protected:Npn \listsEX_new_row:
  {
    \int_gset:Nn \g__listsEX_total_items_int
      {
        \g__listsEX_total_items_int +
        \l__listsEX_columns_int -
        \g__listsEX_current_col_num_int
      }
    \__listsEX_gset_rows_num:NN
      \g__listsEX_total_items_int
      \l__listsEX_columns_int
    \int_gset_eq:NN \g__listsEX_current_col_num_int \l__listsEX_columns_int
  }

\NewDocumentCommand \startnewitemlineEX {}
  { \listsEX_new_row: }

% --------------------------------------------------------------------------
% the user environment:
\NewDocumentCommand \NewListsEX { O{}mO{\listEX}D(){1} }
  {
    \NewDocumentEnvironment {#2} { O{}D(){#4} }
      { \__listsEX_env: {#3} { #1,##1 } {##2} }
      { \end__listsEX_env: }
  }

\NewDocumentCommand \RenewListsEX { O{}mO{\listEX}D(){1} }
  {
    \RenewDocumentEnvironment {#2} { O{}D(){#4} }
      { \__listsEX_env: {#3} { #1,##1 } {##2} }
      { \end__listsEX_env: }
  }

% --------------------------------------------------------------------------
% default list:
\NewListsEX {listsEX}

\file_if_exist:nT {listsEX.cfg} { \file_input:n {listsEX.cfg} }

% --------------------------------------------------------------------------
% setup:
\cs_new_protected:Npn \listsEX_setup:n #1
  { \keys_set:nn {listsEX/list} {#1} }

\NewDocumentCommand \setlistsEX { m }
  { \listsEX_setup:n {#1} }
\newcommand{\StartNumber}[1]{
  \int_gset:Nn \g__listsEX_int {#1}
}
%tasks
\NewListsEX{taskEX}[\item]
\NewEnviron{listEX}[1][]{%
\ifstrempty{#1}{%
\def\tempbegin{\begin{taskEX}(1)}%
}{%
\def\tempbegin{\begin{taskEX}(#1)}%
}
\expandafter\tempbegin\BODY
\end{taskEX}
}
\NewEnviron{enumEX}[2][]{%
\ifstrempty{#1}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[a])](#2)}%
}{%
\ifthenelse{\equal{#1}{a.}}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[a].](#2)}%
}{
\ifthenelse{\equal{#1}{(a)}}{%
\def\tempbegin{\begin{taskEX}[counter-format=(tsk[a]),label-width=1.3em](#2)}%
}{
\ifthenelse{\equal{#1}{a)}}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[a])](#2)}%
}{
\ifthenelse{\equal{#1}{A.}}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[A].](#2)}%
}{
\ifthenelse{\equal{#1}{(A)}}{%
\def\tempbegin{\begin{taskEX}[counter-format=(tsk[A]),label-width=1.3em](#2)}%
}{
\ifthenelse{\equal{#1}{A)}}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[A])](#2)}%
}{
\ifthenelse{\equal{#1}{1.}}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[1].](#2)}%
}{
\ifthenelse{\equal{#1}{(1)}}{%
\def\tempbegin{\begin{taskEX}[counter-format=(tsk[1]),label-width=1.3em](#2)}%
}{
\ifthenelse{\equal{#1}{1)}}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[1])](#2)}%
}{
\ifthenelse{\equal{#1}{i.}}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[r].](#2)}%
}{
\ifthenelse{\equal{#1}{(i)}}{%
\def\tempbegin{\begin{taskEX}[counter-format=(tsk[r]),label-width=1.4em](#2)}%
}{
\ifthenelse{\equal{#1}{i)}}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[r])](#2)}%
}{
\ifthenelse{\equal{#1}{I.}}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[R].,label-width=1.4em](#2)}%
}{
\ifthenelse{\equal{#1}{(I)}}{%
\def\tempbegin{\begin{taskEX}[counter-format=(tsk[R]),label-width=1.6em](#2)}%
}{
\ifthenelse{\equal{#1}{I)}}{%
\def\tempbegin{\begin{taskEX}[counter-format=tsk[R]),label-width=1.4em](#2)}%
}{
\def\tempbegin{\begin{taskEX}[label=#1](#2)}%
}}}}}}}}}}}}}}}
}
\expandafter\tempbegin\BODY
\end{taskEX}
}
\newcounter{soitem}
\setcounter{soitem}{0}
\DeclareRobustCommand{\num}[1]{\circEX{\stepcounter{soitem}\arabic{soitem}}} 
\NewTasks[
label-width=1.3em,
after-item-skip= -6pt,
label-offset  = 0em,
before-skip =-0.5\baselineskip,
after-skip =-0.5\baselineskip,
after-item-skip =-0.3\baselineskip,
counter-format = tsk[a])]{listch}[\item]
\NewTasks[label-width=1.3em,after-item-skip= 0ex,
label-offset  = 0em,
counter-format = tsk[1].]{enumch}[\item]
\NewTasks[
label-width=1.3em,
after-item-skip= -6pt,
label-offset  = 0em,
before-skip =-0.5\baselineskip,
after-skip =-0.5\baselineskip,
after-item-skip =-0.3\baselineskip,
style=itemize]{itemch}[\item]
%\BeforeBeginEnvironment{itemch}
%{\vspace*{-0.3\baselineskip}}
\AfterEndEnvironment{itemch}{\setcounter{soitem}{0}}
\AfterEndEnvironment{listch}{\setcounter{soitem}{0}}
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
\DeclareRobustCommand{\Sola}{%
  \ifmmode\ \ct{Đáp án \textbf{A}.}\else Đáp án \textbf{A}.\xspace\fi}
\DeclareRobustCommand{\Solb}{%
  \ifmmode\ \ct{Đáp án \textbf{B}.}\else Đáp án \textbf{B}.\xspace\fi}  
\DeclareRobustCommand{\Solc}{%
  \ifmmode\ \ct{Đáp án \textbf{C}.}\else Đáp án \textbf{C}.\xspace\fi}  
\DeclareRobustCommand{\Sold}{%
  \ifmmode\ \ct{Đáp án \textbf{D}.}\else Đáp án \textbf{D}.\xspace\fi}  
\DeclareRobustCommand{\CuSO4}{%
  \ifmmode\ CuSO_4\else\ce{CuSO4}\xspace\fi}
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
\DeclareRobustCommand{\Check}{%
 \faCheck\xspace}       
\DeclareRobustCommand{\Bookmark}{%
\faBookmark\xspace}  
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
%\DeclareRobustCommand{\Hn}[3]{% 
%  \ce{_{#1}^{#2}#3}\xspace}    
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
%===============================MÔI TRƯỜNG ĐỊNH LÝ===================================	
\RequirePackage[tikz]{bclogo}
\AtBeginDocument{%
	\normalsize
	\allowdisplaybreaks
	\setlength{\belowdisplayskip}{2pt} \setlength{\belowdisplayshortskip}{2pt}
	\setlength{\abovedisplayskip}{2pt} \setlength{\abovedisplayshortskip}{2pt}
	\everymath{\rm}
}

\endinput

