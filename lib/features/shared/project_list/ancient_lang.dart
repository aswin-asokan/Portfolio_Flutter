import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/app_button_type.dart';
import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';
import 'package:simple_icons/simple_icons.dart';

AppModel ancientLang = AppModel(
  id: "ancientlang",
  title: "Ancient Text Preservation",
  caption: "IndicBERT Model that Predict and Reconstruct Missing Words.",
  techStack: ["BERT", "GCP"],
  mainTech: "• Python",
  projectType: ProjectType.aiMl,
  bannerPath:
      "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/ancient_lang%2Fancient_banner.webp?alt=media",
  iconPath:
      "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/ancient_lang%2Fancient_logo.webp?alt=media",
  gitLink: "https://github.com/Najiya-Nazrin/ancient-language-preservation",
  subtitle: "Filling in the Blanks, Intelligently",
  homeSummary:
      "Ancient manuscripts lost words over time. Scan them with OCR, mark the missing parts, and let IndicBERT suggest the most likely Sanskrit restorations.",
  releaseLink: "",
  type: AppButtonType.github,
  devices: AppAvailability.codeOnly,
  screenshots: [
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/ancient_lang%2Fancient.webp?alt=media",
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
    links: [
      IconLabelModel(
        label: "Link",
        link: "https://github.com/Najiya-Nazrin/ancient-language-preservation",
        icon: SimpleIcons.github,
        color: AppColors.brandGithubAlt,
      ),
    ],
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
    techStack: [
      IconLabelModel(
        label: "Flask",
        icon: SimpleIcons.flask,
        color: SimpleIconColors.flask,
      ),
      IconLabelModel(
        label: "Google Vision API",
        icon: Symbols.camera,
        color: SimpleIconColors.googlecardboard,
      ),
      IconLabelModel(
        label: "Fine-tuned IndicBERT",
        icon: Symbols.short_text,
        color: SimpleIconColors.acode,
      ),
      IconLabelModel(
        label: "Deep Translator",
        icon: SimpleIcons.googletranslate,
        color: SimpleIconColors.googletranslate,
      ),
    ],
    tools: [
      IconLabelModel(
        label: "Git",
        icon: SimpleIcons.git,
        color: SimpleIconColors.git,
      ),
      IconLabelModel(
        label: "Github",
        icon: SimpleIcons.github,
        color: AppColors.brandGithubAlt,
      ),
      IconLabelModel(
        label: "Notion",
        icon: SimpleIcons.notion,
        color: SimpleIconColors.claude,
      ),
    ],
    skills: [
      IconLabelModel(label: "Research & Innovation", icon: Symbols.lightbulb),
      IconLabelModel(label: "Time Management", icon: Symbols.access_time),
      IconLabelModel(label: "Team Collaboration", icon: Symbols.people),
      IconLabelModel(
        label: "Presentation & Pitching",
        icon: Symbols.co_present,
      ),
    ],
  ),
);
