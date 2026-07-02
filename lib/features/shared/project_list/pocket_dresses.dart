import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/app_button_type.dart';
import 'package:portfolio/features/app_page/models/icon_models.dart';
import 'package:portfolio/features/app_page/models/project_enums.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel pocketDresses = AppModel(
  id: "pocketdress",
  title: "Pocket Dresses",
  caption: "Charming Shopping App that Offers a Curated Selection of Dresses.",
  techStack: ["Flutter", "Hive"],
  mainTech: "• Flutter",
  projectTypes: [ProjectType.flutter],
  bannerPath:
      "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/pocketdress%2Fpocket_dress_banner.webp?alt=media",

  iconPath:
      "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/pocketdress%2Fpocketdress_logo.webp?alt=media",

  githubUrl: "https://github.com/aswin-asokan/FlutterFly/",
  subtitle: "Your Perfect Dress, Curated.",
  homeSummary:
      "A simple shopping app with everything you need—minus the endless scrolling. Search, wishlist, and checkout with a clean, modern Flutter experience.",
  liveUrl: "https://github.com/aswin-asokan/FlutterFly/releases/tag/v1.0.1",
  buttonType: AppButtonType.download,
  devices: AppAvailability.android,
  screenshots: [
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/pocketdress%2Fpocketdress1.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/pocketdress%2Fpocketdress2.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/pocketdress%2Fpocketdress3.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/pocketdress%2Fpocketdress4.webp?alt=media",
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
    links: [
      AppInfoIconModel(
        platform: AppInfoLink.github,
        link: "https://github.com/aswin-asokan/FlutterFly/",
      ),
    ],
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
    techStack: [TechStack.flutter, TechStack.hive],
    tools: [Tools.git, Tools.github],
    skills: [Skills.uiUxDesign, Skills.projectManagement],
  ),
);
