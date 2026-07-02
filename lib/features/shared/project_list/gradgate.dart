import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/app_button_type.dart';
import 'package:portfolio/features/app_page/models/icon_models.dart';
import 'package:portfolio/features/app_page/models/project_enums.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel gradgate = AppModel(
  id: "gradgate",
  title: "Gradgate",
  caption:
      "Minimal Interface that allows Students to Apply for Jobs and Internships.",
  techStack: ["SQLite", "sqflite"],
  mainTech: "• Flutter",
  projectTypes: [ProjectType.flutter],
  bannerPath:
      "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/gradgate%2Fgradgate_banner.webp?alt=media",
  iconPath:
      "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/gradgate%2Fgradgate_logo.webp?alt=media",
  githubUrl: "https://github.com/aswin-asokan/GradGate",
  subtitle: "Easy Job & Internship Applications",
  homeSummary:
      "One app. Three users. Zero internet required. GradGate connects students, colleges, and employers with offline-first access to jobs, records, and analytics.",
  liveUrl: "https://github.com/aswin-asokan/GradGate/releases/tag/v1.5.0",
  buttonType: AppButtonType.download,
  devices: AppAvailability.androidDesktop,
  screenshots: [
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/gradgate%2Fgradgate1.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/gradgate%2Fgradgate2.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/gradgate%2Fgradgate3.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/gradgate%2Fgradgate4.webp?alt=media",
    "https://firebasestorage.googleapis.com/v0/b/portfolio-assets-337f2.firebasestorage.app/o/gradgate%2Fgradgate5.webp?alt=media",
  ],
  aboutApp:
      "GradGate is a feature-rich campus companion app built to help college students manage and access academic and career-related resources in one place. Designed for offline use, it allows users to explore job openings, student records, college details, and more without needing an internet connection, thanks to a local SQLite backend. Initially backed by a PHP-MySQL server, the app was later rebuilt to be fully offline-compatible using Flutter and the sqflite package.\nThe app aims to be a practical tool for students and institutions, delivering smooth access to essential modules with a clean UI, multilingual support, and efficient data handling.",
  features: [
    "College Module\n- Register and manage student entries.\n- Track placement analytics like total applicants, selected students, average salary, etc.",
    "Student Module\n- View and apply for jobs based on department eligibility.\n- Receive application status and employer replies.\n- Profile with editable About Me section using rich text.",
    "Employer Module\n- Post jobs with filters by eligible departments.\n- View applicant lists and update application statuses (selected, waiting, rejected).\n- View student profiles with resume-style information.",
    "Authentication System\n- Separate login for students, colleges, and employers.",
    "Analytics\n- Student, college and company dashboards showing job and application metrics.",
    "Local Persistence\n- Entire system functions offline using sqflite.",
    "Multi platform support\n- Supports Android(Tablet), Linux(Prerequisites should be met), Windows",
  ],
  futurePlan: [
    "Project has reached end-of-life (EOL) with no further development planned.",
  ],
  appInfo: AppInfo(
    version: "1.5.0",
    updatedOn: "15th June 2025",
    productType: "Campus Utilities",
    size: "Android: 56.8MB\nLinux: 20.2MB\nWindows: 14.7MB",
    languages: "English",
    links: [
      AppInfoIconModel(
        platform: AppInfoLink.github,
        link: "https://github.com/aswin-asokan/GradGate",
      ),
    ],
  ),
  aboutProject:
      "GradGate originally started as an offline-capable app using a local MySQL server setup. While it worked, the architecture wasn't ideal for mobile-first platforms — requiring external servers or dependencies to function fully offline. During my internship period, I realized the need to simplify this and make it truly platform-native.\nThat's when I decided to migrate the entire backend to SQLite using sqflite, making it lightweight, self-contained, and Flutter-optimized. However, this shift exposed another layer of issues — the project’s old codebase lacked modular structure and clean practices, making migration more difficult than expected.\nThis challenge pushed me to refactor the entire codebase, structure models cleanly, separate logic from UI, and adopt better coding standards. The experience significantly improved my understanding of scalable Flutter development and the importance of maintainable architecture.",
  challeges: [
    "Poor code structure from previous PHP-MySQL app",
    "Migrating data models to local database",
    "Lacked separation of UI and logic",
    "Compatibility issues across different devices",
  ],
  outcomes: [
    "Successfully migrated from remote MySQL backend to local SQLite",
    "Learned the value of clean code, separation of concerns, and proper file structure",
    "Built a fully offline-capable Flutter app with CRUD functionality across multiple modules",
    "Improved skills in data modeling, local persistence, and modular Flutter architecture",
    "Used the experience to improve code testability and maintainability",
    "Used Github actions to generate a working Windows build without relying on Windows system",
  ],
  projectInfo: ProjectInfo(
    techStack: [TechStack.flutter, TechStack.sqlite],
    tools: [Tools.git, Tools.github],
    skills: [
      Skills.cleanCodeAndRefactoring,
      Skills.continuousLearning,
      Skills.persistenceAndResilience,
    ],
  ),
);
