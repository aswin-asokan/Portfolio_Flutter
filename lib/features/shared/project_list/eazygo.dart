import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/app_button_type.dart';
import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';
import 'package:simple_icons/simple_icons.dart';

AppModel eazygo = AppModel(
  id: "eazygo",
  title: "EazyGo",
  caption: "Efficiently Report Infrastructural Damages on Map.",
  techStack: ["Flutter", "Firebase", "GCP"],
  mainTech: "• Flutter",
  projectTypes: [ProjectType.flutter],
  bannerPath:
      "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/eazygo%2Feazygo_banner.webp?alt=media",
  iconPath:
      "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/eazygo%2Feazygo_logo.webp?alt=media",
  gitLink: "https://github.com/aswin-asokan/EazyGo-MAp",
  subtitle: "Map & Report Infrastructural Damage.",
  homeSummary:
      "See it. Pin it. Report it. EazyGo makes reporting public infrastructure issues simple with map-based reporting, live updates, and community-driven accountability.",
  releaseLink: "https://github.com/aswin-asokan/EazyGo-MAp/releases/tag/v1.0.0",
  type: AppButtonType.download,
  devices: AppAvailability.android,
  screenshots: [
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/eazygo%2Feazygo1.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/eazygo%2Feazygo2.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/eazygo%2Feazygo3.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/eazygo%2Feazygo4.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/eazygo%2Feazygo5.webp?alt=media",
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
    links: [
      IconLabelModel(
        label: "Link",
        link: "https://github.com/aswin-asokan/EazyGo-MAp",
        icon: SimpleIcons.github,
        color: AppColors.brandGithubAlt,
      ),
    ],
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
    techStack: [
      IconLabelModel(
        label: "Flutter",
        icon: SimpleIcons.flutter,
        color: SimpleIconColors.flutter,
      ),
      IconLabelModel(
        label: "Firebase",
        icon: SimpleIcons.firebase,
        color: SimpleIconColors.firebase,
      ),
      IconLabelModel(
        label: "GCP",
        icon: SimpleIcons.googlecloud,
        color: SimpleIconColors.googlecloud,
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
      IconLabelModel(
        label: "Team Leadership",
        icon: Symbols.social_leaderboard,
      ),
      IconLabelModel(label: "Presentation", icon: Symbols.co_present),
      IconLabelModel(label: "Idea Structuring", icon: Symbols.lightbulb),
    ],
  ),
);
