import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel steelDefectDetection = AppModel(
  id: "steel_defect_detection",
  title: "Steel Defect Detection",
  caption: "Few-Shot Defect Segmentation using SAM",
  techStack: "SAM | LoRA | Python | Flutter",
  // Assuming Figure_1.png is the main visualization
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/steel_defect.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/steel_icon.png", // Placeholder icon
  gitLink: "https://github.com/aswin-asokan/steel_defect_detection",
  subtitle: "Accurate Surface Defect Segmentation for Manufacturing",
  releaseLink: "",
  type: "github",
  devices: AppAvailability.codeOnly,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/steel_defect/steel1.png",
  ],
  aboutApp:
      "This project automates quality control in manufacturing by precisely detecting and segmenting defects on steel surfaces. It leverages the Segment Anything Model (SAM), fine-tuned using Parameter-Efficient Fine-Tuning (PEFT) with LoRA, enabling high-precision segmentation with minimal training data (few-shot learning). The system integrates a Python machine learning backend with a cross-platform Flutter frontend, providing a robust, deployable solution for real-time industrial inspection and quality assurance.",
  features: [
    "SAM-Powered Segmentation:\nUtilizes the Segment Anything Model for highly granular pixel-level defect identification (pits, cracks, scratches).",
    "Parameter-Efficient Fine-Tuning (PEFT/LoRA):\nAchieves strong domain adaptation (steel defects) using LoRA, minimizing computational cost and training time.",
    "Full-Stack Deployment:\nFeatures a Python backend for model inference and a responsive Flutter frontend for easy user interaction and visualization. The frontend and backend connection is now successfully established.",
    "Industrial Inspection Ready:\nDesigned to handle standard industrial imaging datasets for defect classification and segmentation.",
  ],
  futurePlan: [
    "Implement real-time streaming inference using optimized models like MobileSAM.",
  ],
  appInfo: AppInfo(
    version: "NIL",
    updatedOn: "27th October 2025",
    productType: "Computer Vision / AI",
    size: "NIL",
    languages: "Python, Dart",
    link: "https://github.com/aswin-asokan/steel_defect_detection",
  ),
  aboutProject:
      "This mini-project was driven by the critical need for automation in industrial quality control, where manual defect inspection is slow and prone to human error. It was developed as part of the Final Year Project (Phase 1) of BTech CSE. I was fascinated by the zero-shot capabilities of SAM and aimed to explore how efficiently it could be adapted to a highly specific domain like steel inspection using LoRA.\n\nMy primary contributions involved setting up the frontend and backend connection. The core AI Model Training (fine-tuning SAM-LoRA) was expertly executed by Bineesha.\n\nThis project was a major learning curve in merging cutting-edge foundation models with practical, deployable applications.",
  challeges: [
    "Integrating the large SAM model efficiently with limited hardware resources for fine-tuning.",
    "Developing a reliable data pipeline to handle image data and corresponding segmentation masks from the Kaggle dataset.",
    "Bridging the Python backend (ML server) with the Dart/Flutter frontend for seamless image and result transfer.",
  ],
  outcomes: [
    "Successfully implemented and applied LoRA to a Vision Transformer (SAM) for domain-specific tasks.",
    "Gained practical experience in building and deploying a computer vision API using Python frameworks, including successful full-stack integration.",
    "Demonstrated the feasibility of few-shot learning in industrial inspection, reducing the need for massive labeled datasets.",
    "Successfully managed a collaborative development effort, clearly defining and integrating the ML training (done by Bineesha) and the application development (frontend/backend connection).",
  ],
  projectInfo: ProjectInfo(
    techStack: "Python, PyTorch, SAM, LoRA, Flutter, Dart",
    tools: "Git, Hugging Face, VS Code, Anaconda",
    skills:
        "Computer Vision, Deep Learning Fine-Tuning (PEFT), Full-Stack Development, Industrial Automation Concept, Team Collaboration.",
  ),
);
