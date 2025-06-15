import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel ancientLang = AppModel(
  title: "Ancient Text Preservation",
  caption: "IndicBERT Model that Predict and Reconstruct Missing Words.",
  techStack: "BERT | GCP",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/ancient_banner.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/ancient_logo.png",
  gitLink: "https://github.com/Najiya-Nazrin/ancient-language-preservation",
  subtitle: "Filling in the Blanks, Intelligently",
  releaseLink: "",
  type: "github",
  devices: AppAvailability.codeOnly,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/ancient/ancient.png",
  ],
  aboutApp:
      "This project focuses on the digital restoration of ancient Sanskrit manuscripts by leveraging IndicBERT, a multilingual language model tuned for Indian languages. The goal is to intelligently fill in missing or damaged words in old Sanskrit texts using masked language modeling. Users can upload scanned document images, extract the text using OCR, and use the model to predict the most probable replacements for missing parts. This tool serves as a technological bridge to preserve India’s literary heritage using modern NLP techniques.",
  features: [
    "Image Upload & OCR:\nExtracts Sanskrit text from scanned ancient manuscripts using Google Vision OCR, due to its better Sanskrit character recognition.",
    "Masked Word Prediction\nAllows users to replace uncertain or missing words with [MASK] and retrieves predictions using a fine-tuned IndicBERT model.",
    "Direct Text Input Option\nUsers can input Sanskrit text manually if image input isn't preferred.",
    "Real-time Suggestions\nReturns top probable words for each [MASK], offering contextual restoration suggestions.",
  ],
  futurePlan: [
    "The project has reached end-of-life (EOL) with no future updates planned.",
  ],
  appInfo: AppInfo(
    version: "NIL",
    updatedOn: "26th February 2025",
    productType: "AI for Humanities",
    size: "NIL",
    languages: "English, Sanskrit",
    link: "https://github.com/Najiya-Nazrin/ancient-language-preservation",
  ),
  aboutProject:
      "This was a collaborative project I worked on during Hacktopia, a 24-hour hackathon. The inspiration came from a research paper titled Ancient Chinese Poetry Collation Based on BERT, which sparked the idea: “Why not use similar NLP techniques to preserve our ancient Indian scriptures?”\nWe decided to explore the use of IndicBERT for Sanskrit text restoration. This project was especially meaningful for me because it combined technology, linguistics, and cultural preservation. Our team was selected as a finalist, and we received a special mention, which validated our concept and execution.",
  challeges: [
    "OCR Limitations for Sanskrit:\nMost open-source Python OCR libraries struggled with Sanskrit. We eventually switched to Google Vision API for better accuracy.",
    "Lack of Proper Datasets:\nFinding reliable, annotated Sanskrit corpora suitable for masked language modeling was difficult and limited our model’s accuracy.",
    "Model Training Hurdles:\nIndicBERT occasionally produced unrelated predictions due to noisy input or insufficient fine-tuning data.",
    "Near but Not Exact Predictions\nWhile the model came close to predicting the right word, achieving perfect semantic restoration remained a challenge.",
  ],
  outcomes: [
    "Built my first NLP project using a Hugging Face model",
    "Learned to fine-tune and integrate BERT-based models in a real-time app",
    "Collaborated effectively in a high-pressure, time-limited hackathon environment",
    "Earned finalist recognition and special mention, reinforcing the project’s impact",
  ],
  projectInfo: ProjectInfo(
    techStack:
        "Flask, Google Vision API, Fine-tuned IndicBERT, Deep Translator",
    tools: "Git, Github, Notion",
    skills:
        "Research-Driven Innovation, Time Management, Team Collaboration, Presentation & Pitching",
  ),
);
