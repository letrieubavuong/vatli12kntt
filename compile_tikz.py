import os
import re
import subprocess
import shutil

# Metadata for mapping files to lessons and chapters for Grade 12
LESSON_METADATA = {
    "3L1-1": {"title": "Bài 1: Mô hình động học phân tử về cấu tạo chất", "id": "bai-1", "chapter": "chuong-1"},
    "3L1-2": {"title": "Bài 2: Sự chuyển thể của chất", "id": "bai-2", "chapter": "chuong-1"},
    "3L1-3": {"title": "Bài 3: Nội năng. Định luật I nhiệt động lực học", "id": "bai-3", "chapter": "chuong-1"},
    "3L1-4": {"title": "Bài 4: Khái niệm nhiệt độ. Thang nhiệt độ", "id": "bai-4", "chapter": "chuong-1"},
    "3L1-5": {"title": "Bài 5: Nhiệt dung riêng", "id": "bai-5", "chapter": "chuong-1"},
    "3L1-6": {"title": "Bài 6: Nhiệt nóng chảy riêng. Nhiệt hóa hơi riêng", "id": "bai-6", "chapter": "chuong-1"},
    "3L2-1": {"title": "Bài 7: Đặc điểm chuyển động phân tử khí. Khí lí tưởng", "id": "bai-7", "chapter": "chuong-2"},
    "3L2-2": {"title": "Bài 8: Định luật Boyle", "id": "bai-8", "chapter": "chuong-2"},
    "3L2-3": {"title": "Bài 9: Định luật Charles", "id": "bai-9", "chapter": "chuong-2"},
    "3L2-4": {"title": "Bài 10: Phương trình trạng thái của khí lí tưởng", "id": "bai-10", "chapter": "chuong-2"},
    "3L2-5": {"title": "Bài 11: Áp suất khí theo mô hình động học phân tử. Động năng phân tử", "id": "bai-11", "chapter": "chuong-2"},
    "3L2-6": {"title": "Bài 12: Quá trình đẳng tích", "id": "bai-12", "chapter": "chuong-2"}
}

CHAPTERS = [
    {"id": "chuong-1", "title": "Chương I: Vật lí nhiệt", "lessons": []},
    {"id": "chuong-2", "title": "Chương II: Khí lí tưởng", "lessons": []}
]

TEX_TEMPLATE = r"""\documentclass[tikz,border=5pt]{standalone}
\usepackage[utf8]{inputenc}
\usepackage[vietnamese]{babel}
\usepackage{amsmath,amssymb,amsfonts,latexsym,amscd}
\usepackage{mathrsfs}
\usepackage{physics}
\usepackage[version=4]{mhchem}
\usepackage{tikzpagenodes}
\usepackage[siunitx]{circuitikz}
\usepackage{tikz-3dplot}
\usepackage{pgfplots}
\usepgfplotslibrary{fillbetween}
\usepackage{nicefrac}
\usepackage{parallel}
\usepackage{xspace}
\usepackage{esvect}
\usepackage{fontawesome5}
\usepackage{tkz-tab}
\usepackage{tkz-euclide}

\usetikzlibrary{arrows, backgrounds, calc, shapes, shapes.symbols, shapes.misc, shapes.arrows, shapes.geometric, snakes, shadows, spy, through, trees, chains, intersections, matrix, patterns, positioning, plotmarks, petri, quotes, angles, scopes, decorations, decorations.pathmorphing, decorations.pathreplacing, decorations.markings, decorations.text, circuits, circuits.ee.IEC}

\definecolor{Mapcolor}{cmyk}{0, 0.948, 0.948, 0.502}
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

\tikzstyle{mybox} = [draw=red, very thick,rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle} =[fill=blue, text=white]
\tikzset{arrow data/.style 2 args={decoration={markings,mark=at position #1 with \arrow{#2}},postaction=decorate}}
\tikzset{middlearrow/.style={decoration={markings,mark= at position 0.5 with {\arrow{#1}},},postaction={decorate}}}
\tikzstyle directed=[postaction={decorate,decoration={markings, mark=at position .5 with {\arrow{>}}}}]
\tikzstyle undirected=[postaction={decorate,decoration={markings, mark=at position .5 with {\arrow{<}}}}]
\tikzset{cross/.style={cross out, draw=black, minimum size=2.5*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt}, cross/.default={1pt}}
\tikzset{hbox/.style={anchor=west,draw, rectangle,right,minimum height = 0.4cm,minimum width=1cm,label={[label distance=-4pt]$#1$}}}
\tikzset{vbox/.style={anchor=north,draw, rectangle,below,minimum height = 1cm,minimum width=0.4cm,label={[label distance=-3pt]right:$#1$}}}
\tikzset{dot/.style={circle=(1.5pt),inner sep=1.5pt,fill,label={[label distance=-2pt]#1},name=#1}}
\tikzset{ampe/.style={anchor=center,draw, circle,fill=white,inner sep=0pt, text width=6mm,align=center,label={[label distance=-3pt]\ce{#1}}}}
\tikzset{partial ellipse/.style args={#1:#2:#3}{insert path={+ (#1:#3) arc (#1:#2:#3)}}}
\tikzset{lpin/.style={shape=circle,inner sep=+0pt,minimum size=+1.2mm,label={[label distance=-3pt]left:{#1}},fill=black}}
\tikzset{rpin/.style={shape=circle,inner sep=+0pt,minimum size=+1.2mm,label={[label distance=-3pt]right:{#1}},fill=black}}
\tikzset{apin/.style={shape=circle,inner sep=+0.1pt,minimum size=+1.2mm,label={[label distance=-4pt]above:{\myfont{12}{16}#1}},fill=black}}
\tikzset{bpin/.style={shape=circle,inner sep=+0pt,minimum size=+1.2mm,label={[label distance=-5pt]below:{#1}},fill=black}}
\tikzstyle{nonamcham}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\draw[fill=white] (0,0)--(0.6,0.2)--(1.2,0)--(0.6,-0.2)--cycle; \draw[fill=white] (0,0)--(0.6,0.2)--(1.2,0)--(0.6,-0.2)--cycle (0.6,0.2)--(0.6,-0.2);}}}]
\tikzstyle{D}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\draw[fill=white] (0,0)circle(2.5mm); \node[cross] at (0,0) {\color{white}{A}}; \node[pos=-0.5,sloped,above=4pt] at (0,0) {\myfont{12.55}{16}$#1$};}}}]
\tikzstyle{L}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\fill[white] (-0.5,-0.1) rectangle (0.5,0.15); \draw [sloped,snake=coil, segment amplitude=5pt,segment length=5pt] (-0.5,0) -- (0.5,0); \node[pos=-0.5,sloped,align=center,label={[label distance=-1pt]\ce{#1}}] at (0,0) {};}}}]
\tikzstyle{vL}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\fill[white] (-0.5,-0.1) rectangle (0.5,0.15); \draw[->] (-0.4,-0.3)--(0.35,0.35); \draw [sloped,snake=coil, segment amplitude=5pt,segment length=5pt] (-0.5,0) -- (0.5,0); \node[pos=-0.5,sloped,align=center,label={[label distance=-1pt]\ce{#1}}] at (0,0) {};}}}]
\tikzstyle{K}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\fill[white] (-0.2,-0.1) rectangle (0.2,0.15); \draw (-0.2,0)--(0.2,0.15); \filldraw[black] (0.2,0) circle(1pt); \filldraw[black] (-0.2,0) circle(1pt); \node[pos=-0.5,sloped,align=center,label={[label distance=-1pt]\ce{#1}}] at (0,0) {};}}}]
\def\cucA{A} \def\cucB{B}
\tikzstyle{NU}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\draw[white] (-0.3,0)--(0.3,0); \draw(-0.3,0)--++(45:0.2); \draw(-0.3,0)--++(-135:0.2); \draw(0.3,0)--++(45:0.2); \draw(0.3,0)--++(-135:0.2); \filldraw[black] (0.3,0) circle(1pt); \filldraw[black] (-0.3,0) circle(1pt); \node[sloped,align=center,label={[label distance=-1pt]\cucB}] at (0.3,0) {}; \node[sloped,align=center,label={[label distance=-1pt]\cucA}] at (-0.3,0) {}; \node[sloped,align=center,label={[label distance=-18pt]$-$}] at (0.3,0) {}; \node[sloped,align=center,label={[label distance=-18pt]$+$}] at (-0.3,0) {};}}}]
\tikzstyle{volt}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\fill[white] (-0.075,-0.3) rectangle (0.075,0.3); \foreach \x in {-0.075} {\draw (\x,-0.25)--(\x,0.25);} \foreach \y in {0.075} {\draw (\y,0.1)--(\y,-0.1);} \node[pos=-0.5,sloped,align=center,label={[label distance=-1pt]$#1$}] at (0,1) {};}}}]
\tikzstyle{avolt}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\fill[white] (-0.075,-0.3) rectangle (0.075,0.3); \foreach \x in {-0.075} {\draw (\x,-0.1)--(\x,0.1);} \foreach \y in {0.075} {\draw (\y,0.25)--(\y,-0.25);} \node[pos=-0.5,sloped,align=center,label={[label distance=-1pt]$#1$}] at (0,1) {};}}}]
\tikzstyle{volt1}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\fill[white] (-0.075,-0.3) rectangle (0.075,0.3); \foreach \x in {-0.075} {\draw (\x,-0.15)node[below left]{-}--(\x,0.15);} \foreach \y in {0.075} {\draw (\y,0.3)--(\y,-0.3)node[right]{+};} \node[pos=-0.5,sloped,above=6pt] at (0,1) {$#1$};}}}]
\tikzstyle{volt2}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\fill[white] (-0.225,-0.3) rectangle (0.225,0.3); \foreach \x in {-0.075,0.225} {\draw (\x,-0.15)--(\x,0.15);} \foreach \y in {-0.225,0.075} {\draw (\y,0.3)--(\y,-0.3);} \node[pos=-0.5,sloped,above=3pt] at (0,1) {$#1$};}}}]
\tikzstyle{volt3}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\fill[white] (-0.4,-0.3) rectangle (0.4,0.3); \foreach \x in {-0.375,-0.075,0.225} {\draw (\x,-0.3)--(\x,0.3);} \foreach \y in {-0.225,0.075,0.375} {\draw (\y,0.15)--(\y,-0.15);} \node[pos=-0.5,align=center,label={[label distance=-1pt]$#1$}] at (0,1) {};}}}]
\tikzstyle{volt4}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\draw[white,line width=0.6mm,fill=white] (-0.525,0)--(0.525,0); \foreach \x in {-0.525,-0.225,0.075,0.375} {\draw (\x,-0.25)--(\x,0.25);} \foreach \y in {-0.375,-0.075,0.225,0.525} {\draw (\y,0.1)--(\y,-0.1);} \node[pos=-0.5,align=center,label={[label distance=-3pt]$#1$}] at (0,1) {};}}}]
\tikzstyle{volt5}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\fill[white] (-0.675,-0.3) rectangle (0.675,0.3); \foreach \x in {-0.675,-0.375,-0.075,0.225,0.525} {\draw (\x,-0.25)--(\x,0.25);} \foreach \y in {-0.525,-0.225,0.075,0.375,0.525,0.675} {\draw (\y,0.1)--(\y,-0.1);} \node[pos=-0.5,align=center,label={[label distance=-3pt]$#1$}] at (0,1) {};}}}]
\tikzstyle{voltn}=[postaction={decorate, decoration={markings, mark= at position 0.5 with{\fill[white] (-0.675,-0.05) rectangle (0.675,0.05); \foreach \x in {-0.675,-0.375,0.525} {\draw[very thick] (\x,-0.25)--(\x,0.25); \draw[very thick, dashed] (-0.225,0)--(0.525,0);} \foreach \y in {-0.525,-0.225,0.675} {\draw[very thick] (\y,0.1)--(\y,-0.1);} \node[pos=-0.5,align=center,label={[label distance=-2pt]\myfont{12}{12}$#1$}] at (0,1) {};}}}]
\tikzstyle{C}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\draw[white,line width=0.6mm,fill=white] (-0.1,0)--(0.1,0); \draw (-0.1,0.2) -- (-0.1,-0.2) (0.1,0.2) -- (0.1,-0.2); \node[pos=-0.5,sloped,above=3pt] at (0,1) {\ce{#1}};}}}]
\tikzstyle{vC}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\draw[white,line width=0.6mm,fill=white] (-0.1,0)--(0.1,0); \draw (-0.1,0.2) -- (-0.1,-0.2) (0.1,0.2) -- (0.1,-0.2); \draw[->] (-0.4,-0.3)--(0.35,0.35); \node[pos=-0.5,sloped,above=3pt] at (0,1) {\ce{#1}};}}}]
\tikzstyle{M}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\fill[white] (-0.1,-0.3) rectangle (0.1,0.3); \draw (0,0)circle(7pt); \node[pos=-0.5,sloped,above=3pt] at (0,1) {\ce{#1}};}}}]
\tikzstyle{R}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, rectangle, fill=white, inner sep=0pt, minimum width=10mm, minimum height = 4mm,align=center,label={[label distance=-1pt]\ce{#1}}] at (0,0) {};}}}]
\tikzstyle{RX}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, rectangle, fill=white, inner sep=0pt, minimum width=10mm, minimum height = 6mm,align=center,label={[label distance=-3pt]$#1$}] at (0,0) {X};}}}]
\tikzstyle{vR}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, rectangle, fill=white, inner sep=0pt, minimum width=10mm, minimum height = 4mm,align=center,label={[label distance=-3pt]\ce{#1}}] at (0,0) {}; \draw[->] (-0.4,-0.3)--(0.35,0.35);}}}]
\tikzstyle{xR}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, rectangle, fill=white, inner sep=0pt, minimum width=10mm, minimum height = 4mm,align=center,label={[label distance=-1pt]\ce{#1}}] at (0,0) {}; \draw[-] (-0.5,-0.2)--(0.5,0.2);}}}]
\tikzstyle{A}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5, draw, circle, fill=white, inner sep=0pt, minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-3pt]}] at (0,0) {\ce{A#1}};}}}]
\tikzstyle{V}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, circle, fill=white, inner sep=0pt, minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-3pt]}] at (0,0) {\ce{V#1}};}}}]
\tikzstyle{MD}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, circle, fill=white, inner sep=0pt, minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-6mm]\ce{M#1}}] at (0,0) {};}}}]
\tikzstyle{DP}=[postaction={decorate, decoration={markings, mark= at position 0.5 with {\node[pos=0.5,sloped, draw, circle, fill=white, inner sep=0pt, minimum width=6mm, minimum height = 6mm,align=center,label={[label distance=-3pt]\ce{#1}}] at (0,0) {\normalsize{\ce{| |}}};}}}]
\tikzset{hidden/.style = {thick, dashed}}
\tikzset{line/.style = {ultra thick}}

\newcommand\myfont[2]{\fontsize{#1}{#2}\selectfont}
\DeclareRobustCommand{\Up}[1]{\MakeUppercase{#1}}
\DeclareRobustCommand{\bth}[1]{\ensuremath{\displaystyle{#1}}}
\DeclareRobustCommand{\ct}[1]{\text{#1}}
\def\vec{\vv}
\def\overrightarrow{\vv}
\DeclareRobustCommand{\pso}[2]{\bth{\frac{#1}{#2}}\xspace}
\DeclareRobustCommand{\angstrom}{\textup{\AA}\xspace}
\DeclareRobustCommand{\microc}{\ifmmode\ \mu C\else\ensuremath{\ \mu C}\xspace\fi}
\DeclareRobustCommand{\microm}{\ifmmode\ \mu m\else\ensuremath{\ \mu m}\xspace\fi}
\DeclareRobustCommand{\microf}{\ifmmode\ \mu F\else\ensuremath{\ \mu F}\xspace\fi}
\DeclareRobustCommand{\microh}{\ifmmode\ \mu H\else\ensuremath{\ \mu H}\xspace\fi}
\DeclareRobustCommand{\degree}{\ifmmode^\circ\else\ensuremath{^\circ}\xspace\fi}
\DeclareRobustCommand{\doC}{\ifmmode^\circ C\else\ensuremath{^\circ C}\xspace\fi}
\DeclareRobustCommand{\canps}[2]{\ifmmode \sqrt{\frac{#1}{#2}}\else\ensuremath{\displaystyle{\sqrt{\frac{#1}{#2}}}}\xspace\fi}
\DeclareRobustCommand{\ohm}{\ifmmode\ \Omega\else\ensuremath{\Omega}\xspace\fi}
\DeclareRobustCommand{\pit}{\ifmmode\pi t\else\ensuremath{\pi t}\xspace\fi}
\DeclareRobustCommand{\met}{\ifmmode\ m\else \ m\xspace\fi}
\DeclareRobustCommand{\cm}{\ifmmode\ cm\else \ cm\xspace\fi}
\def\cung#1{\buildrel \frown \over{#1}}
\def\g.#1.{\widehat{#1}}
\DeclareRobustCommand{\hoac}[1]{\left[\begin{aligned}#1\end{aligned}\right.}
\DeclareRobustCommand{\heva}[1]{\left\{\begin{aligned}#1\end{aligned}\right.}
\DeclareRobustCommand{\Hn}[3]{\ce{_{#1}^{#2}#3}\xspace}

\begin{document}
\pagestyle{empty}
__TIKZ_CODE__
\end{document}
"""

def compile_tikz_to_svg(tikz_code, lesson_id, index):
    scratch_dir = r"C:\Users\ThayVuongNTK\.gemini\antigravity-ide\brain\d10bc6ab-e840-4f65-b28d-13c019a26ad0\scratch"
    tikz_name = f"tikz_{lesson_id}_{index}"
    tex_path = os.path.join(scratch_dir, f"{tikz_name}.tex")
    pdf_path = os.path.join(scratch_dir, f"{tikz_name}.pdf")
    svg_path = os.path.join(scratch_dir, f"{tikz_name}.svg")
    
    # Destination in public/images/tikz/
    dest_dir = "C:/Users/ThayVuongNTK/Documents/GitHub/vatli12kntt/public/images/tikz"
    os.makedirs(dest_dir, exist_ok=True)
    dest_path = os.path.join(dest_dir, f"{tikz_name}.svg")
    web_url = f"/images/tikz/{tikz_name}.svg"
    
    # Ensure images link exists in scratch
    images_scratch = os.path.join(scratch_dir, "images")
    if not os.path.exists(images_scratch):
        try:
            real_images_dir = "C:/Users/ThayVuongNTK/Documents/GitHub/vatli12kntt/public/images"
            subprocess.run(["cmd.exe", "/c", "mklink", "/J", "images", real_images_dir], cwd=scratch_dir)
        except Exception as e:
            pass
            
    # Write tex
    with open(tex_path, "w", encoding="utf-8") as f:
        f.write(TEX_TEMPLATE.replace("__TIKZ_CODE__", tikz_code))
        
    # Run pdflatex
    print(f"  Compiling {tikz_name} to PDF...")
    res1 = subprocess.run(
        ["pdflatex", "-interaction=nonstopmode", f"{tikz_name}.tex"],
        cwd=scratch_dir,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        encoding="utf-8",
        errors="ignore"
    )
    
    if res1.returncode != 0:
        print(f"  pdflatex compilation failed for {tikz_name}! Defaulting to placeholder.")
        # Print tail of LaTeX error log if possible
        log_path = os.path.join(scratch_dir, f"{tikz_name}.log")
        if os.path.exists(log_path):
            try:
                with open(log_path, "r", encoding="utf-8", errors="ignore") as lf:
                    log_lines = lf.readlines()
                    print("  LaTeX error log tail:")
                    for line in log_lines[-30:]:
                        print("   ", line.strip())
            except Exception as e:
                pass
        # Clean up
        for ext in ['.tex', '.pdf', '.aux', '.log']:
            path = os.path.join(scratch_dir, f"{tikz_name}{ext}")
            if os.path.exists(path):
                try: os.remove(path)
                except: pass
        return None
        
    # Run pdftocairo
    print(f"  Converting PDF to SVG using pdftocairo...")
    res2 = subprocess.run(
        ["pdftocairo", "-svg", f"{tikz_name}.pdf", f"{tikz_name}.svg"],
        cwd=scratch_dir,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        encoding="utf-8",
        errors="ignore"
    )
    
    # Clean up TeX intermediate files
    for ext in ['.tex', '.pdf', '.aux', '.log']:
        path = os.path.join(scratch_dir, f"{tikz_name}{ext}")
        if os.path.exists(path):
            try: os.remove(path)
            except: pass
            
    if res2.returncode != 0 or not os.path.exists(svg_path):
        print(f"  pdftocairo conversion failed for {tikz_name}!")
        return None
        
    # Copy SVG to public/images/tikz/
    shutil.copy(svg_path, dest_path)
    try: os.remove(svg_path) # remove from scratch
    except: pass
    print(f"  Successfully compiled Tikz -> {web_url}")
    return web_url

def parse_braces(text, start):
    if start >= len(text) or text[start] != '{':
        return "", start
    count = 1
    i = start + 1
    while i < len(text) and count > 0:
        if text[i] == '{':
            count += 1
        elif text[i] == '}':
            count -= 1
        i += 1
    return text[start+1:i-1], i

def process_file_tikz(file_path, lesson_id):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Normalize missing backslashes in source typos
    content = re.sub(r'\\?immini', r'\\immini', content)
    content = re.sub(r'\\?includegraphics', r'\\includegraphics', content)

    # 1. Strip comments (lines starting with %) but not inside Tikz/code
    lines = content.split('\n')
    cleaned_lines = []
    for line in lines:
        if line.strip().startswith('%') and not line.strip().startswith('%mac'):
            continue
        cleaned_lines.append(line)
    content = '\n'.join(cleaned_lines)

    # 2. Extract Tikzpictures and compile them
    tikz_counter = 1
    idx = 0
    while True:
        match = re.search(r'\\begin{tikzpicture}', content[idx:])
        if not match:
            break
        match_start = idx + match.start()
        end_match = re.search(r'\\end{tikzpicture}', content[match_start:])
        if not end_match:
            break
        end_idx = match_start + end_match.end()
        tikz_code = content[match_start:end_idx]
        
        # Compile Tikz to SVG
        compile_tikz_to_svg(tikz_code, lesson_id, tikz_counter)
        
        idx = end_idx

def main():
    tex_dir = "C:/Users/ThayVuongNTK/Documents/GitHub/vatli12kntt/TailieuTeX/Lythuyet"
    files = [f for f in os.listdir(tex_dir) if f.endswith(".tex")]
    
    files_to_process = []
    for f in files:
        base_name = os.path.splitext(f)[0]
        if base_name in LESSON_METADATA:
            files_to_process.append(f)
            
    def get_sort_key(filename):
        base = os.path.splitext(filename)[0]
        parts = re.findall(r'\d+', base)
        return [int(x) for x in parts]
        
    files_to_process.sort(key=get_sort_key)
    
    for f in files_to_process:
        base_name = os.path.splitext(f)[0]
        meta = LESSON_METADATA[base_name]
        file_path = os.path.join(tex_dir, f)
        print(f"\nProcessing TikZ in {f}...")
        process_file_tikz(file_path, meta["id"])

if __name__ == "__main__":
    main()
