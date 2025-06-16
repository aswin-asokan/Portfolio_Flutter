import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel systemMonitor = AppModel(
  id: "systemmonitor",
  title: "System Monitor",
  caption: "Keep an Eye on Your Server’s Performance Effortlessly.",
  techStack: "Flutter | API call",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/system_monitor_banner.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/sysmonitor_logo.jpeg",
  gitLink: "https://github.com/aswin-asokan/System-Monitor",
  subtitle: "Effortless Server Monitoring.",
  releaseLink:
      "https://github.com/aswin-asokan/System-Monitor/releases/tag/v1.0.0",
  type: "download",
  devices: AppAvailability.android,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/sysmonitor/sysmonitor1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/sysmonitor/sysmonitor2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/sysmonitor/sysmonitor3.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/sysmonitor/sysmonitor4.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/sysmonitor/sysmonitor5.png",
  ],
  aboutApp:
      "System Monitor App is a lightweight, Flutter-based tool designed to let you monitor server performance in real-time. With a focus on simplicity and privacy, the app fetches system statistics via a JSON API and presents them through intuitive visualizations—without requiring login or uploading your data. It’s perfect for developers, sysadmins, or anyone who wants a fast, no-frills overview of server health.",
  features: [
    "Minimal User Interface\nClean, clutter-free UI focused purely on performance stats",
    "Real-Time Monitoring\nConnects to a JSON API to show live updates from any server",
    "Dynamic API Configuration\nChange the API endpoint URL at any time from within the app",
    "Multiple Chart Types\nSupports graphs, pie charts, and linear charts for diverse data visualization",
    "No Login Required\nFully functional without account creation or authentication",
    "Privacy First\nNo user data is stored or uploaded—fully local usage",
  ],
  futurePlan: [
    "Project has reached end-of-life (EOL) with no further development planned.",
  ],
  appInfo: AppInfo(
    version: "1.0.0",
    updatedOn: "29th August 2024",
    productType: "System Utilities",
    size: "21.4MB",
    languages: "English",
    link: "https://github.com/aswin-asokan/System-Monitor",
  ),
  aboutProject:
      "This app was built as part of my internship selection task at Flysoft. The company provided a live API link that exposed server system stats, and the task was to create a Flutter app that could read and display the data.\nEven though it was a small project, it became a pivotal moment in my journey—I got selected, and that internship turned into one of the best learning experiences of my academic career. The task helped me understand practical API integration and how to visualize live data effectively.",
  challeges: [
    "Difficulty choosing chart styles that matched my design vision: Explored different packages like fl_chart, syncfusion_flutter_charts to find a match",
    "API integration issues (first time working with live APIs): Studied basic API calls using http and handled responses using FutureBuilder",
  ],
  outcomes: [
    "Learned how to connect and consume live APIs in a Flutter app",
    "Gained experience working with data visualization libraries",
    "Understood the importance of minimal design when dealing with real-time data",
    "Gained confidence working on fast-paced, goal-driven development tasks",
  ],
  projectInfo: ProjectInfo(
    techStack: "Flutter",
    tools: "Git, Github",
    skills: "Quick Learning, Deadline Focused, Self-Confidence",
  ),
);
