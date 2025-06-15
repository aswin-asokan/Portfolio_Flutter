import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel nyaytra = AppModel(
  title: "Nyaytra",
  caption: "BERT Powered Indian Legal Document Summarizer & Assistant.",
  techStack: "BERT | T5 | Gemini Api",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/nyaytra_banner.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/nayaytra_logo.jpeg",
  gitLink:
      "https://github.com/aswin-asokan/Nyaytra_Indian_Legal_Document_Summarizer",
  subtitle: "BERT-driven Legal Insights for India",
  releaseLink: "",
  type: "github",
  devices: AppAvailability.codeOnly,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/nyaytra/nyaytra1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/nyaytra/nyaytra2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/nyaytra/nyaytra3.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/nyaytra/nyaytra4.png",
  ],
  aboutApp:
      "Nyaytra (न्याय + यंत्र) means Machine of Justice. It is an intelligent legal assistant designed to simplify the interpretation of complex Indian legal documents. Tailored for legal professionals, students, and the curious mind, it uses advanced NLP techniques to provide section-wise summaries and conversational access to legal insights. With features like document upload, automated classification, summarization, and a chatbot powered by Gemini, Nyaytra bridges the gap between raw legal text and accessible understanding—making legal knowledge less intimidating and more actionable.",
  features: [
    "PDF Upload & Text Extraction:\nUsers can upload legal PDFs, which are parsed using PyPDF2 for clean text extraction.",
    "Automated Legal Section Classification:\nSentences are intelligently categorized into FACTS, ARGUMENTS, JUDGMENTS, ANALYSIS, and STATUTES using a fine-tuned InCaseLawBERT model.",
    "Summarization & Paraphrasing:\nEach section is paraphrased using the chatgpt_paraphraser_on_T5_base model to improve readability without losing legal accuracy.",
    "Gemini-Powered Chatbot:\nAsk context-aware questions based on summaries or Interact conversationally about legal matters for better understanding",
  ],
  futurePlan: [
    "Project has reached end-of-life (EOL) with no further development planned.",
  ],
  appInfo: AppInfo(
    version: "NIL",
    updatedOn: "30th April 2025",
    productType: "AI Assistant",
    size: "NIL",
    languages: "English",
    link:
        "https://github.com/aswin-asokan/Nyaytra_Indian_Legal_Document_Summarizer",
  ),
  aboutProject:
      "Nyaytra was inspired by a personal experience—when I lost my phone and felt overwhelmed trying to understand the legal steps to report and protect myself. I realized how hard it is for an average person to interpret legal documents. That insight led to the creation of Nyaytra.\nAs a part of our mini project during BTech CSE, I worked with a team where I handled the project management—assigning tasks, ensuring clear communication, and driving progress. My goal was to build something that genuinely helps people interact with law in a simple, tech-driven way.",
  challeges: [
    "Finding the Right Model:\nEvaluated multiple models like InlegalBERT, InCaseLawBERT, and others before settling on the best fit.",
    "Model Integration Issues:\nFaced significant challenges integrating pre-trained NLP models into a functional web application.",
    "Hardware Limitations\nTraining and fine-tuning large models locally took a lot of time and pushed the hardware to its limits.",
  ],
  outcomes: [
    "Gained hands-on knowledge of legal-specific BERT models and their strengths",
    "Learned how to deploy Hugging Face models for classification and summarization tasks",
    "Built an end-to-end NLP pipeline from document input to chatbot output",
  ],
  projectInfo: ProjectInfo(
    techStack: "React, BERT, T5, Gemini Api",
    tools: "Git, Github, Hugging face, Overleaf",
    skills:
        "Problem Identification & Ideation, Project Management, Communication, Time Management",
  ),
);
