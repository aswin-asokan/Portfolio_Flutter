import os
import glob
import re

base_dir = "lib/features/shared/project_list"
for path in glob.glob(f"{base_dir}/*.dart"):
    with open(path, 'r') as f:
        content = f.read()

    # Find the first occurrence of techStack in AppModel
    # Usually it looks like: techStack: "A | B | C",
    # We want to replace it with techStack: ["A", "B", "C"],
    
    def repl(m):
        value = m.group(1)
        items = [x.strip() for x in value.split('|')]
        items_str = ", ".join(f'"{item}"' for item in items)
        return f'techStack: [{items_str}],'

    new_content = re.sub(r'techStack:\s*"([^"]+)",', repl, content, count=1)

    with open(path, 'w') as f:
        f.write(new_content)

print("Done updating techStack lists.")
