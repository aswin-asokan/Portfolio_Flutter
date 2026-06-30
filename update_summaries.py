import os
import glob

summaries = {
    "ancient_lang.dart": "Teaching AI to read ancient Malayalam so you don't have to squint at palm leaves anymore. Vattezhuthu meets neural networks!",
    "dairymgmt.dart": "Moo-ving dairy farming into the digital age. Less time on paperwork, more time for the cows.",
    "eazygo.dart": "Skip the line and book bus tickets from your couch. Because running after a moving bus is so last decade.",
    "eazygoauth.dart": "The conductor's best friend. Validate tickets with a tap instead of a hole puncher!",
    "flysoft_floorplan.dart": "Playing The Sims, but for restaurant seating. Drag, drop, and optimize those tables!",
    "gradgate.dart": "Digitizing college gate passes. No more forging signatures to get out of campus early!",
    "kerala_iot_challenge.dart": "Connecting things to the internet before it was cool. Award-winning IoT wizardry.",
    "nyaytra.dart": "An extra pair of AI eyes for the visually impaired. It's like a smart superpower in your pocket!",
    "peekpub.dart": "Spill the tea securely. Anonymous polling that keeps your secrets safer than the CIA.",
    "pocket_dresses.dart": "Window shopping, but in your pocket. Because your closet definitely needs one more dress.",
    "snackfit.dart": "Counting calories so you can feel slightly less guilty about that midnight pizza slice.",
    "steel_defect.dart": "Teaching AI to spot scratches on steel better than a highly caffeinated inspector.",
    "system_monitor.dart": "Obsessively tracking your PC's CPU temperature from your phone. Nerd out in style.",
    "taskevo.dart": "A task manager that actually helps you get things done, instead of just reminding you that you're procrastinating."
}

base_path = "lib/features/shared/project_list"

for filename, summary in summaries.items():
    filepath = os.path.join(base_path, filename)
    if os.path.exists(filepath):
        with open(filepath, 'r') as f:
            content = f.read()
        
        # Insert homeSummary right after subtitle: "...",
        if "subtitle:" in content and "homeSummary:" not in content:
            # find the end of the subtitle line
            lines = content.split('\n')
            for i, line in enumerate(lines):
                if line.strip().startswith("subtitle:"):
                    lines.insert(i + 1, f'  homeSummary: "{summary}",')
                    break
            
            with open(filepath, 'w') as f:
                f.write('\n'.join(lines))
            print(f"Updated {filename}")
        else:
            print(f"Skipped {filename}")
