import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

AppModel hotelManagement = AppModel(
  id: "hotelmanagement",
  title: "Hotel Management",
  caption: "User-friendly Tool that Centralizes Room and Rental details.",
  techStack: "Java | MySQL",
  bannerPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/banner/hotelmanagement_banner.png",
  iconPath:
      "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/icons/hotel_logo.png",
  gitLink: "https://github.com/aswin-asokan/Hotelmanagement-App",
  subtitle: "Centralized Room & Rental Details.",
  releaseLink:
      "https://github.com/aswin-asokan/Hotelmanagement-App/releases/tag/v1.0.0",
  type: "download",
  devices: AppAvailability.desktop,
  screenshots: [
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/hotelmgmt/hotelmgmt1.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/hotelmgmt/hotelmgmt2.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/hotelmgmt/hotelmgmt3.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/hotelmgmt/hotelmgmt4.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/hotelmgmt/hotelmgmt5.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/hotelmgmt/hotelmgmt6.png",
    "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/files/projects/screenshots/hotelmgmt/hotelmgmt7.png",
  ],
  aboutApp:
      "The Hotel Management App is a streamlined Java desktop application designed to simplify the operations of hotel booking and room management. Built with an intuitive interface, the app allows users to manage room types, reservations, pricing, and generate reports—all in one place. With just a few clicks, users can handle guest check-ins, calculate checkout amounts, and analyze booking data over specific dates for better operational decision-making.",
  features: [
    "Add Room Details\n-1 Record and manage individual room information (number, type, availability)",
    "Manage Room Prices\n-1 Set and update pricing based on room type or category",
    "Room Reservation System\n-1 Reserve rooms in advance and manage availability",
    "Booking Facility\n-1 Handle full check-in and check-out booking workflows",
    "Checkout Calculations\n-1 Automatically calculate total cost based on stay duration and room type",
    "View Date-Specific Reports\n-1 Generate booking and financial reports for selected date ranges",
  ],
  futurePlan: [
    "The project has reached end-of-life (EOL) with no future updates planned.",
  ],
  appInfo: AppInfo(
    version: "1.0.0",
    updatedOn: "24th March 2023",
    productType: "Business & Booking Systems",
    size: "3.32MB",
    languages: "English",
    link: "https://github.com/aswin-asokan/Hotelmanagement-App",
  ),
  aboutProject:
      "After completing the Dairy Management App, I was eager to dive deeper into Java and desktop development, so I started building the Hotel Management App to broaden my understanding of CRUD systems, pricing logic, and real-world data handling.\nI worked on this project with help from my friend Najiya, who assisted in defining the required UI structure and feature set. Her input helped shape a functional, user-focused system. This project became a great opportunity to level up my skillset by handling a more complex use case than before.",
  challeges: [
    "Underestimated feature complexity: Broke down functionalities into smaller parts and implemented step-by-step.",
  ],
  outcomes: [
    "Deepened my understanding of Java UI and backend logic integration",
    "Experienced collaboration for UI planning and requirement scoping",
    "Expanded my knowledge in report generation, reservation logic, and pricing systems",
  ],
  projectInfo: ProjectInfo(
    techStack: "Java, MySQL",
    tools: "Netbeans, Git, Github",
    skills: "Project Planning, Team Collaboration, Continuous Learning",
  ),
);
