import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel dairyManagement = AppModel(
  id: "dairymanagement",
  title: "Dairy Management",
  caption: "A Simple Java App for Managing Sales, Purchases and Staffs.",
  techStack: "Java | MySQL",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/dairymanagement_banner.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/dairy_logo.jpeg",
  gitLink: "https://github.com/aswin-asokan/DairyManagement-App",
  subtitle: "Streamlined Sales, Purchases, Staff.",
  releaseLink:
      "https://github.com/aswin-asokan/DairyManagement-App/releases/tag/v1.0.0",
  type: "download",
  devices: AppAvailability.desktop,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/dairymgmt/dairymgmt1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/dairymgmt/dairymgmt2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/dairymgmt/dairymgmt3.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/dairymgmt/dairymgmt4.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/dairymgmt/dairymgmt5.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/dairymgmt/dairymgmt6.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/dairymgmt/dairymgmt7.png",
  ],
  aboutApp:
      "The Dairy Management App is a desktop application built in Java using NetBeans, designed to streamline daily operations in a dairy business. From tracking sales and purchases to managing staff and printing bills, the app offers a centralized dashboard for complete oversight. Its clean design and focused functionality make it a practical solution for small business owners.",
  features: [
    "Interactive Dashboard\n- View and manage key business data like sales, purchases, and staff in one place",
    "Bill Printing:\n- Generate and print invoices for transactions directly from the app",
    "View Reports by Date:\n- Filter and analyze transaction history based on selected date ranges",
  ],
  futurePlan: [
    "The project has reached end-of-life (EOL) with no new development planned.",
  ],
  appInfo: AppInfo(
    version: "1.0.0",
    updatedOn: "17th June 2024",
    productType: "Business Tools",
    size: "2.76MB",
    languages: "English",
    link: "https://github.com/aswin-asokan/DairyManagement-App",
  ),
  aboutProject:
      "This project was developed during my second-year internship as part of my Diploma in Computer Science. It was my first real exposure to Java, MySQL, and the NetBeans IDE. As a solo project, I was responsible for everything—from database design to UI and business logic.\nBuilding this app was not just a technical exercise but a defining moment in my journey. It gave me confidence and laid the foundation for my future projects in app development.",
  challeges: [
    "Dashboard logic was complex to structure and update dynamically:\n- Broke down the logic into modular functions and used MySQL queries to drive real-time data flow",
  ],
  outcomes: [
    "Learned the basics of Java, MySQL, and NetBeans",
    "Understood how to structure a full-scale CRUD application",
    "Created my first complete functional project",
    "Gained practical experience in building, debugging, and maintaining a desktop app",
  ],
  projectInfo: ProjectInfo(
    techStack: "Java, MySQL",
    tools: "Netbeans, Git, Github",
    skills: "Independent Problem Solving, Persistence, Tool Familiarity",
  ),
);
