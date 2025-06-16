import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel keralaiot = AppModel(
  id: "keralaiot",
  title: "Kerala IOT Challenge",
  caption: "20 IoT Projects with Explanations and Working Videos.",
  techStack: "Arduino | ESP32",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/iot_banner.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/iot_logo.jpeg",
  gitLink: "https://github.com/aswin-asokan/Kerala-IoT-Challenge",
  subtitle: "IoT Projects with Demos.",
  releaseLink: "https://aswin-asokan.github.io/Kerala-IoT-Challenge/",
  type: "website",
  devices: AppAvailability.website,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/iotchallenge/iotchallege1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/iotchallenge/iotchallege2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/iotchallenge/iotchallege3.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/iotchallenge/iotchallege4.png",
  ],
  aboutApp:
      "This page showcases 20+ IoT projects built using Arduino and ESP32 as part of the Kerala IoT Challenge. Each project includes detailed documentation, circuit diagrams, source code, and working demo videos—making it a complete learning archive for embedded systems and IoT development.",
  features: [
    "20+ hands-on projects with real hardware",
    "Well-documented tutorials for each level",
    "Video demonstrations, circuit diagrams, code, and requirements included",
    "Integration examples using Firebase and other IoT platforms",
    "Covers inputs, outputs, sensors, displays, and wireless modules",
  ],
  futurePlan: [
    "Project has reached end-of-life (EOL) status—no further additions planned.",
  ],
  appInfo: AppInfo(
    version: "NIL",
    updatedOn: "17th June 2023",
    productType: "Hardware Education",
    size: "NIL",
    languages: "English",
    link: "https://github.com/aswin-asokan/Kerala-IoT-Challenge",
  ),
  aboutProject:
      "As part of the Kerala IoT Challenge, I embarked on a comprehensive learning program hosted on µLearn to explore Hardware and Embedded systems through Arduino and ESP32. The challenge spans 4 levels of guided exercises followed by a hackathon to nurture IoT development skills across 5,000 students in Kerala. Over the course of this program, I completed 20+ hands-on projects, documented each with code, circuit diagrams, and working videos—covering topics from LED effects and traffic light systems to sensors, displays, and control modules.",
  challeges: [
    "OS Setup Issues: To support USB drivers and development tools, I switched my workstation to Linux Mint, which improved reliability and compatibility.",
  ],
  outcomes: [
    "Developed hands-on experience with Arduino and ESP32 programming, including digital I/O, sensors, and actuator control",
    " Built and launched 20+ practical IoT modules, enhancing my hardware development skills",
    "Gained documentation experience by creating tutorials and recording demo videos",
    "Strengthened foundation in embedded systems, electronics interfacing, and project-based learning",
  ],
  projectInfo: ProjectInfo(
    techStack: "Arduino, ESP32, C/C++ for Arduino, Firebase",
    tools: "Arduino IDE, MIT App Inventor, Fritzing",
    skills:
        "Technical Proficiency, Structured Learning & Execution, Documentation & Presentation",
  ),
);
