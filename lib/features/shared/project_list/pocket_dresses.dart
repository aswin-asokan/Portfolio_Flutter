import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel pocketDresses = AppModel(
  id: "pocketdress",
  title: "Pocket Dresses",
  caption: "Charming Shopping App that Offers a Curated Selection of Dresses.",
  techStack: "Flutter | Hive",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/pocket_dress_banner.png",

  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/pocketdress_logo.png",

  gitLink: "https://github.com/aswin-asokan/FlutterFly/",
  subtitle: "Your Perfect Dress, Curated.",
  releaseLink: "https://github.com/aswin-asokan/FlutterFly/releases/tag/v1.0.1",
  type: "download",
  devices: AppAvailability.android,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/pocketdress/pocketdress1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/pocketdress/pocketdress2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/pocketdress/pocketdress3.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/pocketdress/pocketdress4.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/pocketdress/pocketdress5.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/pocketdress/pocketdress6.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/pocketdress/pocketdress7.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/pocketdress/pocketdress8.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/pocketdress/pocketdress9.png",
  ],
  aboutApp:
      "Pocket Dresses is a charming and modern shopping app built during the Flutter Fly Bootcamp. With a clean UI and smooth navigation, the app offers a curated selection of stylish dresses for every occasion. The goal was to simulate a real-world e-commerce experience — from browsing to checkout — using Flutter and local storage tools. Designed for simplicity and user delight, Pocket Dresses lets you explore products, manage your account, and make purchases with ease.",
  features: [
    "Secure login to access personalized features",
    "Option to reset forgotten credentials",
    "Quickly find dresses by name or keyword",
    "Save products for later purchase",
    "Simulate a checkout flow for completing purchases",
    "Update personal information like name and email",
  ],
  futurePlan: [
    "Project has reached end-of-life (EOL), no additional development is planned.",
  ],
  appInfo: AppInfo(
    version: "1.0.1",
    updatedOn: "11th August 2024",
    productType: "Fashion & Lifestyle",
    size: "22.8MB",
    languages: "English",
    link: "https://github.com/aswin-asokan/FlutterFly/",
  ),
  aboutProject:
      "Pocket Dresses was my submission for the Flutter Fly Bootcamp, where participants were asked to build a real-world style app using Flutter. I chose to develop a minimalist shopping app focused on women’s dresses, combining design, logic, and local storage techniques.\nI’m proud that this project helped me become one of the top 10 participants in the workshop. The experience pushed me out of my comfort zone and gave me hands-on insight into what it takes to build production-like apps using Flutter.",
  challeges: [
    "UI Confusion and layout issues",
    "Local database integration (first time using one):	Learned to implement local storage using Hive",
  ],
  outcomes: [
    "Built a fully functional shopping app using Flutter",
    "Learned to implement Hive for local data persistence",
    "Made it to the top 10 finalists of Flutter Fly Bootcamp",
  ],
  projectInfo: ProjectInfo(
    techStack: "Flutter, Hive",
    tools: "Git, Github",
    skills: "UI/UX Awareness, Goal-Oriented Execution",
  ),
);
