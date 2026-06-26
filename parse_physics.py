import os
import re
import json

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

def process_boder_commands(content):
    idx = 0
    while True:
        match = re.search(r'\\boder{', content[idx:])
        if not match:
            break
        match_start = idx + match.start()
        start_braces = match_start + 6
        
        inner_content, end_idx = parse_braces(content, start_braces)
        
        text_before = content[:match_start]
        in_align = text_before.count(r'\begin{align*}') > text_before.count(r'\end{align*}')
        in_bracket = text_before.count(r'\[') > text_before.count(r'\]')
        
        if in_align or in_bracket:
            replacement = f"\\boxed{{{inner_content}}}"
        else:
            in_center = text_before.count(r'\begin{center}') > text_before.count(r'\end{center}')
            if in_center:
                replacement = f"\n$$\n\\boxed{{{inner_content}}}\n$$\n"
            else:
                replacement = f"$\\boxed{{{inner_content}}}$"
                
        content = content[:match_start] + replacement + content[end_idx:]
        idx = match_start + len(replacement)
        
    return content

def convert_tabular_to_md(table_content):
    rows = table_content.split('\\\\')
    lines = []
    for row in rows:
        row = row.strip()
        if not row or row.startswith('%') or row.startswith('\\hline'):
            continue
        cells = row.split('&')
        cleaned_cells = []
        for cell in cells:
            cell = cell.replace('\\hline', '').replace('\\bf', '').replace('\\it', '').strip()
            cell = re.sub(r'\\textbf{([\s\S]*?)}', r'\1', cell)
            cell = re.sub(r'\\textit{([\s\S]*?)}', r'\1', cell)
            cell = cell.strip('{}')
            cleaned_cells.append(cell)
        if any(cleaned_cells):
            lines.append(cleaned_cells)
            
    if not lines:
        return ""
        
    num_cols = max(len(row) for row in lines)
    markdown_rows = []
    for i, row in enumerate(lines):
        while len(row) < num_cols:
            row.append("")
        markdown_rows.append("| " + " | ".join(row) + " |")
        if i == 0:
            markdown_rows.append("| " + " | ".join(["---"] * num_cols) + " |")
            
    return "\n" + "\n".join(markdown_rows) + "\n"

def check_image_exists(image_name):
    public_images_dir = "C:/Users/ThayVuongNTK/Documents/GitHub/vatli12kntt/public/images"
    clean_name = image_name.replace('"', '').replace("'", "").strip()
    if clean_name.startswith("Images/"):
        clean_name = clean_name[7:]
    elif clean_name.startswith("images/"):
        clean_name = clean_name[7:]
    
    for ext in ['.png', '.jpg', '.jpeg', '.svg']:
        full_path = os.path.join(public_images_dir, clean_name + ext)
        if os.path.exists(full_path):
            return f"images/{clean_name}{ext}"
    # Default fallback
    return f"images/{clean_name}.png"

def parse_tex_file(file_path, lesson_id):
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

    # 2. Extract Tikzpictures and replace with [TIKZ: url|code] tags
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
        
        # Check if the compiled SVG exists
        svg_url = f"/images/tikz/tikz_{lesson_id}_{tikz_counter}.svg"
        dest_path = f"C:/Users/ThayVuongNTK/Documents/GitHub/vatli12kntt/public/images/tikz/tikz_{lesson_id}_{tikz_counter}.svg"
        
        if os.path.exists(dest_path):
            replacement = f"\n__TIKZ_START__{svg_url}|{tikz_code}__TIKZ_END__\n"
        else:
            replacement = f"\n__TIKZ_START__placeholder|{tikz_code}__TIKZ_END__\n"
            
        content = content[:match_start] + replacement + content[end_idx:]
        idx = match_start + len(replacement)
        tikz_counter += 1

    # 3. Parse \Binhluan{TEXT1}{TEXT2}
    idx = 0
    while True:
        match = re.search(r'\\Binhluan', content[idx:])
        if not match:
            break
        match_start = idx + match.start()
        start_braces = match_start + 9
        
        text_content, next_idx = parse_braces(content, start_braces)
        second_start = content.find('{', next_idx)
        comment_content, end_idx = parse_braces(content, second_start)
        
        replacement = f"\n\n{text_content}\n\n> *Bình luận:* {comment_content}\n\n"
        content = content[:match_start] + replacement + content[end_idx:]
        idx = match_start + len(replacement)

    # 4. Parse \immini{TEXT}{ILLUSTRATION}
    idx = 0
    while True:
        match = re.search(r'\\immini', content[idx:])
        if not match:
            break
        match_start = idx + match.start()
        start_braces = match_start + 7
        if start_braces < len(content) and content[start_braces] == '[':
            end_bracket = content.find(']', start_braces)
            if end_bracket != -1:
                start_braces = end_bracket + 1
        
        text_content, next_idx = parse_braces(content, start_braces)
        second_start = content.find('{', next_idx)
        illustration_content, end_idx = parse_braces(content, second_start)
        
        replacement = f"\n\n{text_content}\n\n{illustration_content}\n\n"
        content = content[:match_start] + replacement + content[end_idx:]
        idx = match_start + len(replacement)

    # 5. Parse \begin{tabular} ... \end{tabular}
    idx = 0
    while True:
        match = re.search(r'\\begin{tabular}', content[idx:])
        if not match:
            break
        match_start = idx + match.start()
        end_match = re.search(r'\\end{tabular}', content[match_start:])
        if not end_match:
            break
        end_idx = match_start + end_match.end()
        
        table_start_brace = content.find('{', match_start + 15)
        _, table_content_start_idx = parse_braces(content, table_start_brace)
        
        table_body = content[table_content_start_idx : end_idx - 13]
        md_table = convert_tabular_to_md(table_body)
        
        content = content[:match_start] + md_table + content[end_idx:]
        idx = match_start + len(md_table)

    # 6. Replace custom class macros context-aware
    content = process_boder_commands(content)

    # Headings
    content = re.sub(r'\\subsection\*?{([\s\S]*?)}', r'## \1', content)
    content = re.sub(r'\\subsubsection\*?{([\s\S]*?)}', r'### \1', content)
    content = re.sub(r'\\paragraph\*?{([\s\S]*?)}', r'#### \1', content)
    
    # Text styles
    content = re.sub(r'\\newghichu{([\s\S]*?)}', r'> **\1**', content)
    content = re.sub(r'\\textbf{([\s\S]*?)}', r'**\1**', content)
    content = re.sub(r'\\textit{([\s\S]*?)}', r'*\1*', content)
    content = re.sub(r'{\\bf\s+([\s\S]*?)}', r'**\1**', content)
    content = re.sub(r'{\\it\s+([\s\S]*?)}', r'*\1*', content)

    # Emojis and FontAwesome replacements
    content = content.replace(r'\faSignIn', '👉')
    content = content.replace(r'\faTags', '🏷️')
    content = content.replace(r'\faEdit', '📝')

    # Clean environments list
    content = content.replace('\\begin{itemize}', '\n').replace('\\end{itemize}', '\n')
    content = content.replace('\\begin{enumerate}', '\n').replace('\\end{enumerate}', '\n')
    content = content.replace('\\begin{enumEX}', '\n').replace('\\end{enumEX}', '\n')
    content = content.replace('\\begin{enumEX}[\\faEdit]{3}', '\n').replace('\\begin{enumEX}[\\faEdit]{2}', '\n').replace('\\begin{enumEX}[\\faEdit]{1}', '\n')
    content = content.replace('\\begin{note}', '\n> **Lưu ý:**\n').replace('\\end{note}', '\n')

    # Convert \item
    content = re.sub(r'\\item\s*\[(.*?)\]', r'- **\1** ', content)
    content = re.sub(r'\\item', r'- ', content)

    # Convert \includegraphics
    def replace_image(match):
        img_path = match.group(1).strip()
        clean_path = check_image_exists(img_path)
        return f"\n![Hình ảnh](/{clean_path})\n"
        
    content = re.sub(r'\\includegraphics\[.*?\]{([\s\S]*?)}', replace_image, content)
    content = re.sub(r'\\includegraphics{([\s\S]*?)}', replace_image, content)

    # Math environments
    content = content.replace('\\begin{align*}', '\n$$\n').replace('\\end{align*}', '\n$$\n')
    content = content.replace('\\begin{center}', '\n').replace('\\end{center}', '\n')
    content = content.replace('\\[', '\n$$\n').replace('\\]', '\n$$\n')
    content = content.replace('\\(', '$').replace('\\)', '$')

    # Clean other LaTeX clutter
    content = content.replace('\\noindent', '')
    content = content.replace('\\par', '\n\n')
    content = content.replace('\\cleardoublepage', '')
    content = re.sub(r'\\pagestyle{.*?}', '', content)
    content = re.sub(r'\\thispagestyle{.*?}', '', content)
    content = re.sub(r'\\setcounter{.*?}{.*?}', '', content)
    content = re.sub(r'\\resizebox{.*?}{.*?}{', '', content)
    content = re.sub(r'\\tkzClip', '', content)
    content = re.sub(r'\\tkzInit.*?\n', '', content)

    # Clean duplicate newlines
    content = re.sub(r'\n{3,}', '\n\n', content)
    
    return content.strip()

def main():
    tex_dir = "C:/Users/ThayVuongNTK/Documents/GitHub/vatli12kntt/TailieuTeX/Lythuyet"
    output_js = "C:/Users/ThayVuongNTK/Documents/GitHub/vatli12kntt/src/data/physicsData.js"

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
    
    chapter_lessons_map = {c["id"]: [] for c in CHAPTERS}
    
    for f in files_to_process:
        base_name = os.path.splitext(f)[0]
        meta = LESSON_METADATA[base_name]
        file_path = os.path.join(tex_dir, f)
        
        print(f"Parsing TeX: {f}...")
        parsed_theory = parse_tex_file(file_path, meta["id"])
        
        lesson_data = {
            "id": meta["id"],
            "title": meta["title"],
            "theory": parsed_theory,
            "exercises": [] # Empty per user instruction
        }
        
        chapter_lessons_map[meta["chapter"]].append(lesson_data)
        
    # Build final list
    final_curriculum = []
    for c in CHAPTERS:
        final_curriculum.append({
            "id": c["id"],
            "title": c["title"],
            "lessons": chapter_lessons_map[c["id"]]
        })
        
    js_content = "export const physicsData = "
    json_str = json.dumps(final_curriculum, ensure_ascii=False, indent=2)
    js_content += json_str + ";\n"
    
    with open(output_js, "w", encoding="utf-8") as out:
        out.write(js_content)
        
    print(f"SUCCESS: Generated {output_js} with {len(files_to_process)} lessons.")

if __name__ == "__main__":
    main()
