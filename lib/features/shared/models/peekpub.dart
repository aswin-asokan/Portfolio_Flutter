import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel peekpub = AppModel(
  title: "Trelza PeekPub",
  caption:
      "Clean and Lightweight Pub.dev Tracker. Browse, Search, and Explore.",
  techStack: "Flutter | Pub.dev API",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/peekpub_banner.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/PeekPub_logo.png",
  gitLink: "https://github.com/aswin-asokan/peekpub",
  subtitle: "Browse, Search, and Explore.",
  type: "download",
  releaseLink: "https://github.com/aswin-asokan/peekpub/releases/tag/v1.0.0",
  devices: AppAvailability.android,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/peekpub/peekpub1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/peekpub/peekpub2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/peekpub/peekpub3.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/peekpub/peekpub4.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/peekpub/peekpub5.png",
  ],
  aboutApp:
      "Trelza PeekPub is a clean and lightweight Flutter/Dart package tracker designed to simplify the lives of developers who rely on pub.dev. With an intuitive interface and real-time access to package metadata, PeekPub enables effortless browsing, searching, and exploration of open-source packages. It provides key information such as the latest version, supported platforms, SDK compatibility, and direct links to the package’s pub.dev page, documentation, and GitHub repository. With multilingual support and a system-adaptive theme, the app offers a smooth, accessible experience for developers worldwide.",
  features: [
    "Browse and search all packages from pub.dev",
    "View package details: latest version, release date, SDK & Flutter compatibility, and supported platforms",
    "Quick access to pub.dev, documentation, and GitHub links",
    "Discontinued package indicator to avoid dead dependencies",
    "Multi-language support: English, Spanish, Hindi, Malayalam",
    "Light/Dark theme support (follows system settings)",
  ],
  futurePlan: [
    "Mark packages as favorites",
    "Get notified on updates to favorited packages",
    "In-app chatbot for suggestions and user assistance",
  ],
  appInfo: AppInfo(
    version: "1.0.0",
    updatedOn: "17th May 2025",
    productType: "Developer Tools",
    size: "48.7 MB",
    languages: "English, Spanish, Hindi, Malayalam",
    link: "https://github.com/aswin-asokan/peekpub",
  ),
  aboutProject:
      "Trelza PeekPub was born out of a personal pain point I faced while working on multiple Flutter projects. I often found that some packages I had relied on were either discontinued or had breaking changes due to updates—like modified parameters or removed functions. This lack of visibility made my code unreliable and hard to maintain. That's when I decided to build something that could help not just me, but other developers too.\nPeekPub is my attempt at solving this problem by building a simple yet powerful tracker for pub.dev packages. It fetches real-time data from pub.dev and presents it in a clean UI, making it easier to stay informed and avoid broken dependencies. This project was not just about solving a problem, but also about challenging myself to build something meaningful and developer-friendly.",
  challeges: [
    "Parsing deeply nested JSON from the pub.dev API and mapping it into custom Flutter widgets",
    "Implementing efficient search logic for real-time filtering and results",
    "Ensuring UI performance while using FutureBuilder with dynamic data loading",
  ],
  outcomes: [
    "Gained hands-on experience working with real-time APIs and structured JSON parsing",
    "Built a scalable and maintainable Flutter architecture using FutureBuilder",
    "Developed a practical tool to improve development workflows for the entire Flutter community",
  ],
  projectInfo: ProjectInfo(
    techStack: "Flutter, Pub.dev API",
    tools: "Git, GitHub",
    skills:
        "Problem Solving, Project Management, Continuous Learning, User-Centric Thinking",
  ),
);
