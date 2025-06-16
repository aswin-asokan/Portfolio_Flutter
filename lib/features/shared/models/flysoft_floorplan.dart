import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel flysoftFloorplan = AppModel(
  id: "floorplan",
  title: "Flysoft Floor Plan",
  caption: "Create, Modify, and Manage Restaurant Layouts Effortlessly.",
  techStack: "Internship | Flutter | JSON",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/floorplan_banner.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/internship_logo.jpeg",
  gitLink: "https://github.com/aswin-asokan/Flysoft_Floorplan/",
  subtitle: "Restaurant Layouts, Simplified",
  releaseLink: "",
  type: "github",
  devices: AppAvailability.all,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/floorplan/flysoft_floorplan1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/floorplan/flysoft_floorplan2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/floorplan/flysoft_floorplan3.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/floorplan/flysoft_floorplan4.png",
  ],
  aboutApp:
      "The Flysoft Floor Plan Application is a cross-platform desktop and Android app that allows users—especially restaurant owners and managers—to design custom floor layouts using a user-friendly drag-and-drop interface. With support for multi-floor layouts, interactive table management, export/import functionality, and localization in multiple languages, the app delivers a powerful yet accessible solution for visual space planning.\nUsers can draw floor boundaries, add tables, customize their properties, and export layouts in JSON format for cross-device usage. The interface is intuitive and lightweight, with precise control made possible through grid snapping and custom UI components.",
  features: [
    "Floor Plan Layout Customization:\n- Drag-to-edit control points to define custom walls\n- Snap-to-grid support for layout precision\n- Add/delete points with visual editing tools",
    "Interactive Table Management\n- Add circular or rectangular tables\n- Resize, reposition, rename, recolor, toggle status\n- Tables snap to grid and update in real time",
    "Multi-Floor Management\n- Add, rename, reorder, and delete multiple floors\n- Seamless switching and editing across floors",
    "Import/Export Floor Plans\n- Export layout to JSON\n- Import JSON for reloading and cross-platform support",
    "Localization Support\n- App supports English, German, and Chinese\n- Language switching built-in",
    "User Experience\n- Clean Material 3-based UI\n- Platform-optimized layout\n- Logs generated for debug and QA use",
  ],
  futurePlan: ["EOL reached after internship"],
  appInfo: AppInfo(
    version: "1.0.6",
    updatedOn: "2nd January 2025",
    productType: "Business Tools",
    size: "NIL",
    languages: "English, German, Chinese",
    link: "https://github.com/aswin-asokan/Flysoft_Floorplan/",
  ),
  aboutProject:
      "During my internship at Flysoft, I worked on the Floor Plan Builder project where I focused on developing critical UI and interaction components like the boundary wall canvas and table customization system. These features were challenging but crucial, as they involved custom widget creation and deep understanding of Flutter’s rendering system.\nThis was my first real-world exposure to working within a structured software team using Jira, Bitbucket, and Confluence. I handled both frontend logic and user experience improvements, and helped deliver version 1.0.6. It was a great hands-on experience in building a scalable, cross-platform Flutter application from the ground up.",
  challeges: [
    "Challenge	SolutionFlutter dependencies not working as intended (like flutter_box_transform)\nSolution: Developed a fully custom table widget",
    "Table deletion bug (wrong table removed)\nSolution: Introduced unique GlobalKey for each table",
    "Table IDs clashing across floors\nSolution: Switched from GlobalKey to ValueKey",
    "Incorrect drag offset after tab bar addition\nSolution: Adjusted drag offset to account for UI elements",
    "OCR/scrolling issues on Android\nSolution: Custom scroll bars and touch handling logic",
    "Export file conflicts and naming\nSolution: Handled with dynamic filename generation",
    "Poor Flutter support for file exports on Web\nSolution: Workarounds attempted, not fully resolved",
    "App performance drops with some key changes\nSolution: Switched from ObjectKey to optimized ValueKey",
    "Color dropdown limitations\nSolution: Built a fully custom color dropdown component",
  ],
  outcomes: [
    "Delivered a working release build (v1.0.6) of a multi-platform app",
    "Built multiple core features from scratch without relying on external UI libraries",
    "Improved my understanding of Flutter’s rendering, gesture, and layout systems",
    "Learned how to export/import structured data using JSON across platforms",
    "Applied unit testing, logging, and clean code principles for a production-grade build",
  ],
  projectInfo: ProjectInfo(
    techStack: "Flutter, JSON",
    tools: "Confluence, Jira, Bitbucket, Git, Genymotion",
    skills:
        "Project Planning, Problem Solving, Collaboration & Communication, Time Management, Tool Familiarity, Clean code",
  ),
);
