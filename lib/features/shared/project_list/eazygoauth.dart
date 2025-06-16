import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel eazygoauth = AppModel(
  id: "eazygoauth",
  title: "EazyGo Authority",
  caption: "Designed for Authorities to Manage eazyGo Reports.",
  techStack: "Flutter | Firebase | OSM",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/eazygoAuth_banner.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/eazygoauth_logo.png",
  gitLink: "https://github.com/aswin-asokan/eazyGo_Auth",
  subtitle: "Streamlined eazyGo Report Management",
  releaseLink: "https://eazygo-375211.web.app/#/",
  type: "website",
  devices: AppAvailability.website,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/eazygoauth/eazygoauth1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/eazygoauth/eazygoauth2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/eazygoauth/eazygoauth3.png",
  ],
  aboutApp:
      "EazyGo-Authority is a Flutter Web application built to assist government bodies or local authorities in managing real-time reports submitted by users through the EazyGo mobile app. It features a clean, minimal UI with a map-based interface that auto-focuses on the user’s jurisdiction, enabling effortless issue tracking and resolution management.\nAuthorities can monitor reported problems in real time, remove resolved cases, and notify users—all from a unified dashboard that simplifies civic engagement and digital governance.\n\nUse username: pwdaluva@gmail.com and password: password to login",
  features: [
    "Clean and responsive design for ease of use",
    "Visualizes reports geographically for faster assessment",
    "Map zooms to the authority's area based on login credentials",
    "View all active user reports tied to specific locations",
    "Mark issues as resolved, remove them from the map, and automatically notify users",
  ],
  futurePlan: [
    "The project has reached end-of-life (EOL) with no future development planned.",
  ],
  appInfo: AppInfo(
    version: "NIL",
    updatedOn: "7th August 2024",
    productType: "Civic Tech / Governance",
    size: "NIL",
    languages: "English",
    link: "https://github.com/aswin-asokan/eazyGo_Auth",
  ),
  aboutProject:
      "EazyGo-Authority was developed as the main project for my Diploma in Computer Science. While EazyGo mobile was a team-based initiative, I chose to build the authority-side system entirely on my own to expand the project’s scope and integrate additional functionality.\nThis gave me the opportunity to explore Flutter Web, build a system that complements a mobile counterpart, and experience full-stack coordination between two independently developed applications.",
  challeges: [
    "Google maps does not fully support web (paid): switched to OSM",
    "Flutter Web Hosting Issues: Learned how to deploy the app on Firebase Hosting",
    "Cross-platform UI overflow: Implemented responsive layout handling using MediaQuery",
  ],
  outcomes: [
    "Gained practical experience working with Flutter Web",
    "Learned how to connect two applications (mobile ↔ web) via shared APIs/data structure",
    "Successfully deployed the project using Firebase Hosting",
    "Understood the nuances of cross-platform design and rendering issues",
  ],
  projectInfo: ProjectInfo(
    techStack: "Flutter, Firebase, OSM",
    tools: "Git, Github, Notion",
    skills: "Independence & Ownership, Learning by Doing",
  ),
);
