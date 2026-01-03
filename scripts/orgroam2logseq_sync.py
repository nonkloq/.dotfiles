import re
import sqlite3

import pandas as pd


def clean_content(content: str) -> str:
    content = content.strip() 
    lines = content.split('\n')
    if len(lines) < 5:
        return ""
    lines = lines[5:]
    if len(lines) ==0:
        return ""
    tag_line = lines[0]
    if 'tag' in tag_line:
        bracket_index = tag_line.find('[')
        if bracket_index != -1:
            tag_line = lines.pop(0)
            tag_content = tag_line[bracket_index:]
            front_matter = ['---', f'tags: {tag_content}', '---']
            lines = front_matter + lines

    tab_count = 0
    after_head = False
    for i in range(len(lines)):
        lines[i] = re.sub(r'\[\[id:[^\]]*::\*([^\]]*)\]\[[^\]]*\]\]', r'((\1))', lines[i])
        lines[i] = re.sub(r'\[\[id:[^\]]*\]\[([^\]]*)\]\]', r'[[\1]]', lines[i])
        lines[i] = re.sub(r'#\+RESULTS:', '', lines[i])
    
        # Replace [[file:../.media]] with ![img](../assets/.media/..)
        lines[i] = re.sub(r'\[\[file:(\.\./\.media/[^\]]*)\]\]', r'![img](../assets/.media/\1)', lines[i])

        header_match = re.match(r'^(\*+)\s+', lines[i])
        if header_match:
            tab_count = len(header_match.group(1))
            # Convert org-mode headers to markdown headers
            lines[i] = re.sub(r'^(\*+)\s+', lambda m: '\t' * (len(m.group(1)) - 1) + '- ' + '#' * len(m.group(1)) + ' ', lines[i])
            after_head = True
        else:
            li = lines[i].strip()
            ispoint = li.startswith('- ')
            if after_head and li != '' and not ispoint:
                li = '- ' + li
                after_head = False

            if li.startswith('- '):
                lines[i] = '\t' * tab_count + li
        

        # # Convert org-mode text formatting to markdown
        lines[i] = re.sub(r'(\s|^)\*([^*\n]+)\*(\s|$)', r'\1**\2**\3', lines[i])  # *bold* -> **bold**
        lines[i] = re.sub(r'(\s|^)/([^/\n]+)/(\s|$)', r'\1*\2*\3', lines[i])      # /italic/ -> *italic*
        # lines[i] = re.sub(r'(\s|^)_([^_\n]+)_(\s|$)', r'\1__\2__\3', lines[i])    # _underline_ -> __underline__
        lines[i] = re.sub(r'(\s|^)=([^=\n]+)=(\s|$)', r'\1`\2`\3', lines[i])      # =code= -> `code`
        # lines[i] = re.sub(r'(\s|^)~([^~\n]+)~(\s|$)', r'\1`\2`\3', lines[i])      # ~verbatim~ -> `verbatim`
        # lines[i] = re.sub(r'(\s|^)\+([^\+\n]+)\+(\s|$)', r'\1~~\2~~\3', lines[i]) # +strikethrough+ -> ~~strikethrough~~
        #

    return '\n'.join(lines)

if __name__ == "__main__":
    ROAM_DB_PATH = '/home/satz/.config/emacs/.local/cache/org-roam.db'

    conn = sqlite3.connect(ROAM_DB_PATH)
    nodes = pd.read_sql("SELECT * FROM nodes", conn)
    # Remove double quotes from string columns
    for col in nodes.select_dtypes(include=['object']).columns:
        nodes[col] = nodes[col].astype(str).str.strip('"')
    conn.close()

    for _, row in nodes.iterrows():
        title = str(row['title'])
        file = str(row['file'])
        file_name = f"/home/satz/Documents/perskb/pages/{title}.md"
            
        with open(file, 'r', encoding='utf-8') as f:
            content = f.read()
        print(f"Processing file: {file}")
        content = clean_content(content=content)
        with open(file_name, 'w', encoding='utf-8') as f:
            f.write(content)

        print(f"Updated file: {file_name}")
