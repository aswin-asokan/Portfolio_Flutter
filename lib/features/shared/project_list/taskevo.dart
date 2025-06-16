import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel taskevo = AppModel(
  id: "taskevo",
  title: "TasksEVO",
  caption: "Supercharge your Productivity and Stay Organized.",
  techStack: "Flutter | Hive | Flutter Quill",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/taskevo1_banner.png",

  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/taskevo1_logo.jpeg",

  gitLink: "https://github.com/aswin-asokan/taskevo",
  subtitle: "Boost Productivity, Stay Organized.",
  releaseLink: "https://github.com/aswin-asokan/taskevo/releases/tag/v1.1.7",
  type: "download",
  devices: AppAvailability.androidWeb,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/taskevo/taskevo1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/taskevo/taskevo2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/taskevo/taskevo3.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/taskevo/taskevo4.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/taskevo/taskevo5.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/taskevo/taskevo6.png",
  ],
  aboutApp:
      "TasksEVO is a Flutter-based productivity app that combines a to-do list and rich note-taking experience in one place. Designed with minimalism in mind, it enables users to manage tasks and related notes seamlessly—without requiring login or internet access. It stores everything locally, ensuring both privacy and performance.\nWhether you're planning a project, managing daily goals, or jotting down quick thoughts, TasksEVO offers a focused environment with advanced features like subtasks, formatting tools, due dates, and theme customization.",
  features: [
    "Clutter-free layout offering an intuitive user experience",
    "Create, edit, and delete tasks and notes—no sign-in required",
    "Integrated with Flutter Quill for advanced note formatting (bold, lists, headings, etc.)",
    "Add color codes, subtasks, and descriptions. Manage tasks with high granularity",
    "Assign due dates to stay on top of your schedule",
    "Smooth night-mode experience for Android 10 and above",
    "Offline-first experience; all data is saved securely on the device",
  ],
  futurePlan: [
    "TasksEVO is evolving:\n\t- Firebase integration for cloud sync\n\t- New UI revamp\n\t- More platform support\n\t- More features in future iterations",
  ],
  appInfo: AppInfo(
    version: "1.1.7",
    updatedOn: "3rd December 2023",
    productType: "productType",
    size: "21.9MB",
    languages: "Englsih",
    link: "https://github.com/aswin-asokan/taskevo",
  ),
  aboutProject:
      "I started TasksEVO during a 1-week internship at LaxmiInfotek, where I was first introduced to Flutter. Back then, the app was basic, focusing only on adding tasks. However, it laid the foundation for my journey into Flutter development.\nOver time, I transformed TasksEVO into a multi-functional productivity app by adding subtasks, due dates, notes, and theme support. A major turning point came when Flutter Quill broke after an update. This taught me the importance of tracking dependencies and led to my decision to rebuild the app from scratch, which eventually helped inspire the PeekPub project.",
  challeges: [
    "Handling multiple features in one app (tasks + notes): Learned and applied Flutter data modeling and separation of logic",
    "Flutter Quill code issues after update: Understood version control and decided to reimplement core logic",
    "UI complexity due to features like subtasks and color labels: Modularized widget structure and reused components efficiently",
  ],
  outcomes: [
    "Built an app with multiple integrated features (notes, tasks, themes)",
    " Learned to work with ListView.builder, Hive, and Flutter Quill",
    "Understood importance of tracking package versions and maintaining modular architecture"
        "Gained confidence to take a simple task list app and evolve it into a scalable productivity tool",
  ],
  projectInfo: ProjectInfo(
    techStack: "Flutter, Hive, Flutter Quill",
    tools: "Git, Github",
    skills: "Iteration & Refactoring, Growth Mindset",
  ),
);
