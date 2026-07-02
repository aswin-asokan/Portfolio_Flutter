# Project Enum Values and Meaning

This document serves as a reference guide for all enums defined in [project_enums.dart](file:///home/aswin/Documents/Github/Portfolio_Flutter/lib/features/app_page/models/project_enums.dart). These enums are used to display technology badges, tool tags, project details, and key skills across different project pages and cards.

---

## 1. TechStack (`enum TechStack`)
Represents the programming languages, frameworks, libraries, APIs, and hardware platforms used directly in the projects.

| Enum Value | Label / Display Name | Icon / Color | Purpose |
| :--- | :--- | :--- | :--- |
| `arduino` | Arduino | Default | Microcontroller boards and programming environment. |
| `bert` | BERT | Default | Bidirectional Encoder Representations from Transformers (NLP). |
| `cCppForArduino` | C/C++ for Arduino | Default | Firmware development for hardware components. |
| `dart` | Dart | Default | Primary language for Flutter applications. |
| `deepTranslator` | Deep Translator | Google Translate / Blue | Python translation library wrapper. |
| `esp32` | ESP32 | Default | Low-cost microcontroller with Wi-Fi and Bluetooth. |
| `fineTunedIndicBERT` | Fine-tuned IndicBERT | Text / Acode | BERT model optimized for Indian languages. |
| `firebase` | Firebase | Firebase / Amber | Backend services (Database, Authentication, Storage). |
| `flask` | Flask | Flask / Charcoal | Lightweight Python web framework for APIs. |
| `flutter` | Flutter | Flutter / Light Blue | Cross-platform mobile/web application framework. |
| `flutterQuill` | Flutter Quill | Default | Rich-text editor library for Flutter. |
| `gcp` | GCP | Google Cloud / Blue | Google Cloud Platform APIs and cloud compute. |
| `geminiApi` | Gemini Api | Default | Google's Gemini generative AI service API. |
| `googleVisionApi` | Google Vision API | Camera / Purple | Google Cloud Vision image processing/OCR API. |
| `hive` | Hive | Default | Lightweight, fast local key-value database for Dart. |
| `json` | JSON | JSON / Yellow | Data serialization and structured storage format. |
| `java` | Java | Coffee / Brand Java | Object-oriented language for desktop or backend. |
| `lora` | LoRA | Default | Low-Rank Adaptation for parameter-efficient model tuning. |
| `mysql` | MySQL | MySQL / Brand Blue | Relational database management system. |
| `osm` | OSM | OpenStreetMap / Green | OpenStreetMap mapping integrations. |
| `pubDevApi` | Pub.dev API | Default | Package indexing API for Flutter/Dart libraries. |
| `pytorch` | PyTorch | Default | Deep learning framework. |
| `python` | Python | Default | Scripting, data science, and backend web APIs. |
| `react` | React | Default | Frontend JavaScript framework for web apps. |
| `sam` | SAM | Default | Segment Anything Model (Computer Vision segmentation). |
| `sqlite` | SQLite | Default | Local relational database for mobile apps. |
| `t5` | T5 | Default | Text-to-Text Transfer Transformer model. |

---

## 2. Tools (`enum Tools`)
Represents the software applications, IDEs, platforms, and utilities used during project planning, design, and development.

| Enum Value | Label / Display Name | Icon / Color | Purpose |
| :--- | :--- | :--- | :--- |
| `anaconda` | Anaconda | Anaconda / Green | Python distribution and environment manager. |
| `arduinoIde` | Arduino IDE | Arduino / Teal | Development environment for Arduino controllers. |
| `bitbucket` | Bitbucket | Bitbucket / Blue | Version control repository hosting. |
| `confluence` | Confluence | Confluence / Blue | Team documentation and collaboration platform. |
| `fritzing` | Fritzing | Default | Schematic and PCB layout tool. |
| `geminiAiApi` | Gemini AI API | Default | AI model development tooling. |
| `genymotion` | Genymotion | Android / Green | Android emulator for testing mobile apps. |
| `git` | Git | Git / Orange | Distributed version control system. |
| `github` | Github | Github / Dark Grey | Repository hosting and project deployment. |
| `huggingFace` | Hugging Face | Default | Model repository and deployment hub. |
| `jira` | Jira | Jira / Blue | Agile project tracking and issue management. |
| `mitAppInventor` | MIT App Inventor | Default | Visual blocks-based mobile app creator. |
| `netbeans` | Netbeans | NetBeans / Brand Orange | IDE for Java desktop development. |
| `notion` | Notion | Notion / Claude Slate | Documentation and task planning. |
| `overleaf` | Overleaf | Default | Collaborative LaTeX document editor. |
| `vsCode` | VS Code | Default | General-purpose code editor. |

---

## 3. Skills (`enum Skills`)
Represents engineering methodologies, technical domains, soft skills, and leadership capabilities demonstrated in each project.

| Enum Value | Label / Display Name | Icon | Meaning / Scope |
| :--- | :--- | :--- | :--- |
| `aiModelIntegration` | AI Model Integration in Mobile Apps | Default | Embedding and executing machine learning models within mobile packages. |
| `cleanCodeAndRefactoring` | Clean Code & Refactoring | `code_xml` | Clean architecture principles, code reviews, and structured code refinement. |
| `teamCollaboration` | Team Collaboration | `people` | Active teamwork, team communication, and synchronization. |
| `computerVision` | Computer Vision | Default | Image processing, feature detection, object classification, and segmentation. |
| `continuousLearning` | Continuous Learning | `book_2` | Learning agility, learning by doing, quick learning, and adopting new technologies. |
| `deepLearningFineTuningPeft` | Deep Learning Fine-Tuning (PEFT) | Default | Adapting large foundation models using PEFT methods (e.g., LoRA). |
| `presentationAndPitching` | Presentation & Pitching | `co_present` | Project presentation, pitching ideas, and authoring technical documentation. |
| `problemSolving` | Problem Solving | `lightbulb` | Root cause identification, ideation, and structuring algorithmic solutions. |
| `projectManagement` | Project Management | `potted_plant` | Project planning, deadline awareness, time management, and milestone execution. |
| `persistenceAndResilience` | Persistence & Resilience | `mountain_flag` | Overcoming technical roadblocks, persistence in debugging, and self-confidence. |
| `stewardship` | Stewardship | `shield` | Security alignment, auth flow compliance, and safe data handling. |
| `teamLeadership` | Team Leadership | `social_leaderboard` | Team coordination, project ownership, and task delegation. |
| `technicalProficiency` | Technical Proficiency | Default | Mastery over core libraries, platforms, and tool familiarity. |
| `uiUxDesign` | UI/UX Design | `palette` | User-centric thinking, interface wireframing, and visual aesthetics. |
| `fullStackDevelopment` | Full-Stack Development | Default | End-to-end implementation including database, backend APIs, and frontend. |
| `industrialAutomationConcept` | Industrial Automation Concept | Default | Applying technical automation models to manufacturing/industrial workflows. |
| `machineLearningDatasetPreparation` | Machine Learning Dataset Preparation | Default | Data collection, annotation, cleanup, and preprocessing for ML models. |

---

## 4. AppInfoLink (`enum AppInfoLink`)
Represents external links associated with project metadata (e.g., on the project info page).

* **`github`**: Displays a Github icon (colored in slate/dark grey) with the label `"Link"`.
