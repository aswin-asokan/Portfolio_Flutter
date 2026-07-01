import os
import re

updates = {
    'ancient_lang.dart': {'projectType': 'ProjectType.aiMl', 'mainTech': '"• Python"'},
    'dairymgmt.dart': {'projectType': 'ProjectType.tools', 'mainTech': '"• Java"'},
    'eazygoauth.dart': {'projectType': 'ProjectType.flutter', 'mainTech': '"• Flutter"'},
    'eazygo.dart': {'projectType': 'ProjectType.flutter', 'mainTech': '"• Flutter"'},
    'flysoft_floorplan.dart': {'projectType': 'ProjectType.flutter', 'mainTech': '"• Flutter"'},
    'gradgate.dart': {'projectType': 'ProjectType.flutter', 'mainTech': '"• Flutter"'},
    'kerala_iot_challenge.dart': {'projectType': 'ProjectType.other', 'mainTech': '"• Arduino"'},
    'nyaytra.dart': {'projectType': 'ProjectType.aiMl', 'mainTech': '"• Web"'},
    'peekpub.dart': {'projectType': 'ProjectType.tools', 'mainTech': '"• Flutter"'},
    'pocket_dresses.dart': {'projectType': 'ProjectType.flutter', 'mainTech': '"• Flutter"'},
    'snackfit.dart': {'projectType': 'ProjectType.aiMl', 'mainTech': '"• Flutter"'},
    'steel_defect.dart': {'projectType': 'ProjectType.aiMl', 'mainTech': '"• Python"'},
    'system_monitor.dart': {'projectType': 'ProjectType.tools', 'mainTech': '"• Flutter"'},
    'taskevo.dart': {'projectType': 'ProjectType.tools', 'mainTech': '"• Flutter"'},
}

base_dir = "lib/features/shared/project_list"

for filename, data in updates.items():
    path = os.path.join(base_dir, filename)
    with open(path, 'r') as f:
        content = f.read()
    
    # We want to insert `mainTech: ...,\n    projectType: ...,` after `techStack: ...,`
    # in the AppModel(...) call.
    
    pattern = r'(techStack:\s*".*?",)'
    replacement = r'\1\n    mainTech: {}, \n    projectType: {},'.format(data['mainTech'], data['projectType'])
    
    # we only want to replace the FIRST occurrence (which is AppModel(techStack: ...))
    # the second occurrence might be in ProjectInfo(...)
    
    def repl(m):
        return m.group(1) + '\n    mainTech: ' + data['mainTech'] + ',\n    projectType: ' + data['projectType'] + ','
    
    new_content = re.sub(pattern, repl, content, count=1)
    
    with open(path, 'w') as f:
        f.write(new_content)

print("Updated all projects.")
