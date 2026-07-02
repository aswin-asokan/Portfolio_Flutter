import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/app_button_type.dart';
import 'package:portfolio/features/app_page/models/icon_models.dart';
import 'package:portfolio/features/app_page/models/project_enums.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel steelDefectDetection = AppModel(
  id: "steel_defect_detection",
  title: "Steel Defect Detection",
  caption: "Real-Time AI-Powered Steel Surface Inspection",
  techStack: ["YOLO26", "MobileSAM", "SAM + LoRA", "Flask", "Flutter"],
  mainTech: "• Python",
  projectTypes: [ProjectType.aiMl, ProjectType.flutter],
  // Assuming Figure_1.png is the main visualization
  bannerPath:
      "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/steel%2Fsteel_defect.webp?alt=media",
  iconPath:
      "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/steel%2Fsteel_icon.webp?alt=media", // Placeholder icon
  githubUrl: "https://github.com/aswin-asokan/steel_defect_detection",
  subtitle: "Accurate Surface Defect Segmentation for Manufacturing",
  homeSummary:
      "A hybrid computer vision system that combines YOLO26 and MobileSAM for accurate steel defect detection. Built with a Flask backend and Flutter frontend for real-time industrial inspection.",
  liveUrl: "",
  buttonType: AppButtonType.github,
  devices: AppAvailability.codeOnly,
  screenshots: [
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/steel%2Fsteel1.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/steel%2Fsteel2.webp?alt=media",
  ],
  aboutApp:
      "Steel Surface Defect Detection is an end-to-end industrial inspection platform that automates defect detection, segmentation, and analysis on steel surfaces. The system combines YOLO26 for high-speed defect localization with MobileSAM for efficient pixel-level segmentation, while also supporting a SAM ViT-B + LoRA baseline for comparison. A Flask backend handles model inference, live camera streaming, logging, and defect pattern analysis, while a Flutter frontend provides an intuitive interface for live monitoring, image uploads, and model switching.",
  features: [
    "Hybrid Detection Pipeline:\nYOLO26 detects defect locations, followed by MobileSAM segmentation only on detected regions for fast real-time inference.",
    "Multiple AI Models:\nSupports YOLO26, MobileSAM, SAM ViT-B + LoRA, and a hybrid YOLO26 + MobileSAM inference pipeline.",
    "Real-Time Inspection:\nProcesses images and live camera feeds through a Flask backend with configurable inference modes.",
    "Flutter Monitoring Dashboard:\nCross-platform Flutter application for live monitoring, image uploads, detection visualization, and runtime model switching.",
    "Automated Logging & Analytics:\nStores CSV logs, JSON reports, masks, overlays, and generates recurring defect pattern summaries for manufacturing analysis.",
    "Industrial Ready Architecture:\nDesigned for scalable deployment with modular backend services, REST APIs, and optimized inference workflows.",
  ],
  futurePlan: [
    "Project has reached end-of-life (EOL), no additional development is planned.",
  ],
  appInfo: AppInfo(
    version: "Prototype",
    updatedOn: "May 17, 2026",
    productType: "Industrial AI / Computer Vision",
    size: "NIL",
    languages: "Python, Dart",
    links: [
      AppInfoIconModel(
        platform: AppInfoLink.github,
        link: "https://github.com/aswin-asokan/steel_defect_detection",
      ),
    ],
  ),
  aboutProject:
      "This project was developed as my Final Year B.Tech project with the goal of building a complete AI-powered industrial inspection system rather than only training a segmentation model. The initial work focused on fine-tuning SAM using LoRA for few-shot steel defect segmentation, which later evolved into a hybrid pipeline combining YOLO26 for fast defect detection and MobileSAM for efficient segmentation.\n\nBeyond model training, I designed and developed the Flask backend responsible for inference, live camera processing, logging, REST APIs, runtime model switching, and defect pattern analysis. I also built the Flutter frontend for real-time monitoring and visualization.\n\nThe project provided hands-on experience in computer vision, deep learning optimization, backend API development, Flutter application development, and integrating multiple AI models into a practical industrial solution.",
  challeges: [
    "Designing an efficient hybrid pipeline that balances detection accuracy with real-time performance.",
    "Training and optimizing multiple deep learning models (YOLO26, MobileSAM, and SAM + LoRA) on limited hardware.",
    "Building a reliable Flask backend capable of live camera streaming, image inference, and runtime model switching.",
    "Managing communication between the Python backend and Flutter frontend for seamless real-time visualization.",
    "Implementing structured logging and recurring defect pattern analysis for industrial quality monitoring.",
  ],
  outcomes: [
    "Built a complete real-time industrial inspection system combining multiple computer vision models.",
    "Successfully integrated YOLO26, MobileSAM, and SAM + LoRA into a unified inference pipeline.",
    "Developed a Flask REST API supporting live camera inference, image uploads, runtime configuration, and model switching.",
    "Designed and implemented a Flutter dashboard for real-time inspection and monitoring.",
    "Implemented automated logging, defect visualization, and recurring pattern analysis for manufacturing insights.",
    "Gained extensive experience in deploying deep learning models within production-style full-stack applications.",
  ],
  projectInfo: ProjectInfo(
    techStack: [
      TechStack.python,
      TechStack.flutter,
      TechStack.dart,
      TechStack.flask,
      TechStack.pytorch,
      TechStack.yolo,
      TechStack.sam,
      TechStack.lora,
    ],
    tools: [
      Tools.git,
      Tools.github,
      Tools.vsCode,
      Tools.anaconda,
      Tools.huggingFace,
    ],
    skills: [
      Skills.computerVision,
      Skills.deepLearningFineTuningPeft,
      Skills.aiModelIntegration,
      Skills.restApiDevelopment,
      Skills.fullStackDevelopment,
      Skills.realTimeSystems,
      Skills.teamCollaboration,
    ],
  ),
);
