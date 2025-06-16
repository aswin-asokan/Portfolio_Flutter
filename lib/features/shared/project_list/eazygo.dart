import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel eazygo = AppModel(
  id: "eazygo",
  title: "EazyGo",
  caption: "Efficiently Report Infrastructural Damages on Map.",
  techStack: "Flutter | Firebase | GCP",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/eazygo_banner.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/eazygo_logo.png",
  gitLink: "https://github.com/aswin-asokan/EazyGo-MAp",
  subtitle: "Map & Report Infrastructural Damage.",
  releaseLink: "https://github.com/aswin-asokan/EazyGo-MAp/releases/tag/v1.0.0",
  type: "download",
  devices: AppAvailability.android,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/eazygo/eazygo1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/eazygo/eazygo2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/eazygo/eazygo3.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/eazygo/eazygo4.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/eazygo/eazygo5.png",
  ],
  aboutApp:
      "EazyGo is a Flutter-based mobile application that empowers citizens to report public infrastructure issues such as pipeline leaks, road damages, and more—directly to the authorities. With a map-driven UI and live Firebase backend, the app makes it easy for users to submit complaints, track updates, and even flag misinformation.\nDesigned as a community engagement tool, EazyGo bridges the gap between the public and local governance by streamlining issue reporting and resolution in real-time.",
  features: [
    "Map-Based Interface\n- Users can visually locate and tag issue areas directly on a map",
    "Report an Issue\n- Choose from a comprehensive list (pipelines, roads, lighting, etc.) and submit detailed complaints",
    "Track Local Issues\n- View and monitor ongoing problems in your area and see their progress",
    "Flag Misinformation\n- Report misleading or false submissions to maintain report quality",
    "Firebase Connectivity\n- Real-time sync for complaint submission, status updates, and user feedback",
  ],
  futurePlan: [
    "The project has reached end-of-life (EOL) with no new updates planned.",
  ],
  appInfo: AppInfo(
    version: "1.0.0",
    updatedOn: "16th June 2023",
    productType: "Civic Tech",
    size: "29.1MB",
    languages: "English",
    link: "https://github.com/aswin-asokan/EazyGo-MAp",
  ),
  aboutProject:
      "EazyGo was the core idea for our Diploma main project, and it was built collaboratively as a team effort. The goal was to create a civic-tech solution that helps citizens report infrastructure problems with ease.\nAs the team lead, I was responsible not only for development but also for coordinating efforts across the group. This project taught me the fundamentals of app architecture, Firebase integration, and multi-user data flow. It was also my first time building a live-updating app using cloud services.",
  challeges: [
    "Integrating code from multiple team members: Established a shared Github repo",
    "Difficulty in brainstorming and coordination: Used Notion to structure tasks, ideas, and documentation collaboratively",
    "Issues with Google Cloud Platform map integration: Resolved with step-by-step GCP credential setup and billing configuration",
  ],
  outcomes: [
    "Led a development team through all stages of planning, development, and testing",
    "Successfully built a map-driven reporting app integrated with Firebase",
    "Created my first multi-user application with real-time updates",
    "Gained experience in app design, feature delegation, and cloud integration",
  ],
  projectInfo: ProjectInfo(
    techStack: "Flutter, Firebase, GCP",
    tools: "Git, GIthub, Notion",
    skills: "Team Leadership, Presentation, Idea Structuring",
  ),
);
