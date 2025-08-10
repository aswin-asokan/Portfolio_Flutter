import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel snackfit = AppModel(
  id: "sncakfit",
  title: "SnackFit",
  caption: "Serve us your look! Because you're what you eat!",
  techStack: "Flutter | Gemini | CLIP",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/snackfit_banner.jpeg",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/snackfit_logo.png",
  gitLink: "https://github.com/aswin-asokan/snackfit",
  subtitle: "Serve us your look! Because you're what you eat!",
  releaseLink: "https://github.com/aswin-asokan/snackfit/releases/tag/v1.0.0",
  type: "download",
  devices: AppAvailability.android,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/snackfit/snackfit1.jpeg",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/snackfit/snackfit2.jpeg",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/snackfit/snackfit3.jpeg",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/snackfit/snackfit4.jpeg",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/snackfit/snackfit5.jpeg",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/snackfit/snackfit6.jpeg",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/snackfit/snackfit7.jpeg",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/snackfit/snackfit8.jpeg",
  ],
  aboutApp:
      "This is an AI-powered outfit-to-food suggestion app that turns your daily style into a delicious dining recommendation. Just snap or upload a picture of your outfit, and the app identifies the food you most resemble, roasts you for it, and shows you where to eat that dish nearby — whether you’re at home or traveling. Built with speed, humor, and absurdity in mind, it’s proof that technology can solve problems no one actually has.",
  features: [
    "Outfit Capture & Upload:\nTake a picture or upload an existing image of your outfit.",
    "AI Food Matching:\nMatch your clothing style to a food item using a custom-trained ML model.",
    "Nearby Dish Finder:\nSuggests where to get your edible twin dish in your current location.",
    "Offline Storage with SQLite:\nStore history of your outfit-food matches locally.",
    "Smooth & Fast UI:\nBuilt with Flutter for a consistent experience across devices.",
    "Gemini Integration:\nInstant suggestions without depending on a remote backend.",
    "Local ML Backend Option:\nTrain and test your own model using included scripts.",
  ],
  futurePlan: [
    "On-Device AI Model:\nShift the entire food-matching model to run offline for faster results and zero network dependency",
    "Smarter Location Matching:\nIntegrate with restaurant APIs (Google Places, Zomato, Swiggy) for real-time availability of dishes nearby.",
    "Social Sharing:\nLet users share their roasts and matches directly to Instagram, Threads, or WhatsApp.",
  ],
  appInfo: AppInfo(
    version: "1.0.0",
    updatedOn: "9th August 2025",
    productType: "Life style",
    size: "22.6MB",
    languages: "English",
    link: "https://github.com/aswin-asokan/snackfit",
  ),
  aboutProject:
      "This app was created as part of TinkerHub Useless Projects 2.0 — a hackathon for building delightfully pointless yet technically challenging creations. The team included:\n- Najiya Nazrin CN – AI Developer\n- Aswin Asokan – App Developer\nThe core idea was to combine fashion recognition with food image matching, wrap it in humor, and still make it technically solid enough to deploy and expand in the future.",
  challeges: [
    "Dataset Limitations:\nNo ready-made “outfit-to-food” dataset existed, so gathering and labeling data was tricky.",
    "Hosting Issues:\nDifficulties in hosting the ML backend led to direct Gemini integration for instant results.",
  ],
  outcomes: [
    "Learned how to integrate Gemini AI directly into a Flutter app for real-time predictions.",
    "Built an end-to-end pipeline from image capture to AI inference to local SQLite storage.",
    "Gained experience in working within tight hackathon timelines and constraints.",
  ],
  projectInfo: ProjectInfo(
    techStack: "Flutter, Python, SQLite",
    tools: "Gemini AI API, Git, Github",
    skills:
        "AI Model Integration in Mobile Apps, Machine Learning Dataset Preparation, Collaboration & Communication, Time Management",
  ),
);
