import os
import glob
import re

base_dir = "lib/features/shared/project_list"

for path in glob.glob(f"{base_dir}/*.dart"):
    with open(path, 'r') as f:
        content = f.read()

    # 1. Add imports
    if "import 'package:portfolio/features/app_page/models/app_button_type.dart';" not in content:
        content = content.replace("import 'package:portfolio/features/app_page/models/app_model.dart';", "import 'package:portfolio/features/app_page/models/app_model.dart';\nimport 'package:portfolio/features/app_page/models/app_button_type.dart';\nimport 'package:portfolio/features/app_page/models/info_model.dart';")

    # 2. Change `type: "github"` etc.
    content = re.sub(r'type:\s*"github"', 'type: AppButtonType.github', content)
    content = re.sub(r'type:\s*"download"', 'type: AppButtonType.download', content)
    content = re.sub(r'type:\s*"website"', 'type: AppButtonType.website', content)

    # 3. AppInfo links
    def repl_link(m):
        link_val = m.group(1)
        return f'links: [IconLabelModel(label: "Link", link: {link_val})],'

    content = re.sub(r'link:\s*(".*?"),', repl_link, content)

    # 4. ProjectInfo techStack, tools, skills
    # They are usually: techStack: "A, B, C",
    # We want to replace it with: techStack: [IconLabelModel(label: "A"), IconLabelModel(label: "B"), IconLabelModel(label: "C")],
    def convert_to_icon_labels(string_val):
        items = [x.strip() for x in string_val.split(',')]
        return "[" + ", ".join(f'IconLabelModel(label: "{x}")' for x in items if x) + "]"

    def repl_project_info(m):
        # find techStack, tools, skills inside ProjectInfo(...)
        pi_content = m.group(0)
        
        for field in ["techStack", "tools", "skills"]:
            pattern = field + r':\s*"([^"]*)",'
            match = re.search(pattern, pi_content)
            if match:
                val = match.group(1)
                replacement = f'{field}: {convert_to_icon_labels(val)},'
                pi_content = pi_content.replace(match.group(0), replacement)
        
        return pi_content

    # We match ProjectInfo(...) content
    content = re.sub(r'ProjectInfo\((.*?)\)', repl_project_info, content, flags=re.DOTALL)

    with open(path, 'w') as f:
        f.write(content)

print("Updated project files.")
