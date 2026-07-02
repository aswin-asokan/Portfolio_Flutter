import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:portfolio/core/constants/app_colors.dart';

enum TechStack {
  arduino(
    label: "Arduino",
    icon: SimpleIcons.arduino,
    color: SimpleIconColors.arduino,
  ),
  bert(label: "BERT", icon: SimpleIcons.google, color: SimpleIconColors.google),
  cCppForArduino(
    label: "C/C++ for Arduino",
    icon: SimpleIcons.cplusplus,
    color: SimpleIconColors.cplusplus,
  ),
  dart(label: "Dart", icon: SimpleIcons.dart, color: SimpleIconColors.dart),
  deepTranslator(
    label: "Deep Translator",
    icon: SimpleIcons.googletranslate,
    color: SimpleIconColors.googletranslate,
  ),
  esp32(
    label: "ESP32",
    icon: Symbols.developer_board,
    color: SimpleIconColors.arduino,
  ),
  fineTunedIndicBERT(
    label: "Fine-tuned IndicBERT",
    icon: Symbols.short_text,
    color: SimpleIconColors.acode,
  ),
  firebase(
    label: "Firebase",
    icon: SimpleIcons.firebase,
    color: SimpleIconColors.firebase,
  ),
  flask(label: "Flask", icon: SimpleIcons.flask, color: SimpleIconColors.flask),
  flutter(
    label: "Flutter",
    icon: SimpleIcons.flutter,
    color: SimpleIconColors.flutter,
  ),
  flutterQuill(
    label: "Flutter Quill",
    icon: Symbols.stylus_fountain_pen,
    color: SimpleIconColors.flutter,
  ),
  gcp(
    label: "GCP",
    icon: SimpleIcons.googlecloud,
    color: SimpleIconColors.googlecloud,
  ),
  geminiApi(
    label: "Gemini Api",
    icon: SimpleIcons.googlegemini,
    color: SimpleIconColors.googlegemini,
  ),
  googleVisionApi(
    label: "Google Vision API",
    icon: Symbols.camera,
    color: SimpleIconColors.googlecardboard,
  ),
  hive(label: "Hive", icon: SimpleIcons.hive, color: SimpleIconColors.hive),
  json(
    label: "JSON",
    icon: SimpleIcons.json,
    color: SimpleIconColors.javascript,
  ),
  java(label: "Java", icon: Symbols.coffee, color: AppColors.brandJava),
  lora(label: "LoRA", icon: Symbols.layers, color: SimpleIconColors.phpmyadmin),
  mysql(label: "MySQL", icon: SimpleIcons.mysql, color: SimpleIconColors.mysql),
  osm(
    label: "OSM",
    icon: SimpleIcons.openstreetmap,
    color: SimpleIconColors.openstreetmap,
  ),
  pubDevApi(
    label: "Pub.dev API",
    icon: SimpleIcons.flutter,
    color: SimpleIconColors.flutter,
  ),
  pytorch(
    label: "PyTorch",
    icon: SimpleIcons.python,
    color: SimpleIconColors.python,
  ),
  python(
    label: "Python",
    icon: SimpleIcons.python,
    color: SimpleIconColors.python,
  ),
  react(label: "React", icon: SimpleIcons.react, color: SimpleIconColors.react),
  sam(label: "SAM", icon: SimpleIcons.meta, color: SimpleIconColors.meta),
  sqlite(
    label: "SQLite",
    icon: SimpleIcons.sqlite,
    color: SimpleIconColors.sqlite,
  ),
  t5(label: "T5", icon: SimpleIcons.google, color: SimpleIconColors.google),
  yolo(label: "T5", icon: SimpleIcons.yolo, color: SimpleIconColors.yolo);

  final String label;
  final IconData? icon;
  final Color? color;

  const TechStack({required this.label, this.icon, this.color});
}

enum Tools {
  anaconda(
    label: "Anaconda",
    icon: SimpleIcons.anaconda,
    color: SimpleIconColors.anaconda,
  ),
  arduinoIde(
    label: "Arduino IDE",
    icon: SimpleIcons.arduino,
    color: SimpleIconColors.arduino,
  ),
  bitbucket(
    label: "Bitbucket",
    icon: SimpleIcons.bitbucket,
    color: SimpleIconColors.bitbucket,
  ),
  confluence(
    label: "Confluence",
    icon: SimpleIcons.confluence,
    color: SimpleIconColors.confluence,
  ),
  fritzing(
    label: "Fritzing",
    icon: Symbols.developer_board,
    color: AppColors.brandpinterest,
  ),
  geminiAiApi(
    label: "Gemini AI API",
    icon: SimpleIcons.googlegemini,
    color: SimpleIconColors.googlegemini,
  ),
  genymotion(
    label: "Genymotion",
    icon: SimpleIcons.android,
    color: SimpleIconColors.android,
  ),
  git(label: "Git", icon: SimpleIcons.git, color: SimpleIconColors.git),
  github(
    label: "Github",
    icon: SimpleIcons.github,
    color: AppColors.brandGithubAlt,
  ),
  huggingFace(
    label: "Hugging Face",
    icon: SimpleIcons.huggingface,
    color: SimpleIconColors.huggingface,
  ),
  jira(label: "Jira", icon: SimpleIcons.jira, color: SimpleIconColors.jira),
  mitAppInventor(
    label: "MIT App Inventor",
    icon: Symbols.empty_dashboard,
    color: AppColors.themeSwitchYellow,
  ),
  netbeans(
    label: "Netbeans",
    icon: SimpleIcons.apachenetbeanside,
    color: SimpleIconColors.apachenetbeanside,
  ),
  notion(
    label: "Notion",
    icon: SimpleIcons.notion,
    color: SimpleIconColors.claude,
  ),
  overleaf(
    label: "Overleaf",
    icon: SimpleIcons.overleaf,
    color: SimpleIconColors.overleaf,
  ),
  vsCode(
    label: "VS Code",
    icon: SimpleIcons.vscodium,
    color: SimpleIconColors.vscodium,
  );

  final String label;
  final IconData? icon;
  final Color? color;

  const Tools({required this.label, this.icon, this.color});
}

enum Skills {
  aiModelIntegration(label: "AIML", icon: Symbols.robot),
  cleanCodeAndRefactoring(
    label: "Clean Code & Refactoring",
    icon: Symbols.code_xml,
  ),
  teamCollaboration(label: "Team Collaboration", icon: Symbols.people),
  computerVision(label: "Computer Vision", icon: Symbols.camera),
  continuousLearning(label: "Continuous Learning", icon: Symbols.book_2),
  deepLearningFineTuningPeft(
    label: "Deep Learning Fine-Tuning",
    icon: Symbols.robot_2,
  ),
  presentationAndPitching(
    label: "Presentation & Pitching",
    icon: Symbols.co_present,
  ),
  problemSolving(label: "Problem Solving", icon: Symbols.lightbulb),
  projectManagement(label: "Project Management", icon: Symbols.potted_plant),
  persistenceAndResilience(
    label: "Persistence & Resilience",
    icon: Symbols.mountain_flag,
  ),
  stewardship(label: "Stewardship", icon: Symbols.shield),
  teamLeadership(label: "Team Leadership", icon: Symbols.social_leaderboard),
  technicalProficiency(
    label: "Technical Proficiency",
    icon: Symbols.engineering,
  ),
  uiUxDesign(label: "UI/UX Design", icon: Symbols.palette),
  fullStackDevelopment(label: "Full-Stack Development", icon: Symbols.devices),
  automationConcept(label: "Automation", icon: Symbols.autorenew),
  machineLearningDatasetPreparation(
    label: "ML Dataset Preparation",
    icon: Symbols.database,
  ),
  restApiDevelopment(label: "ML Dataset Preparation", icon: Symbols.api),
  realTimeSystems(label: "ML Dataset Preparation", icon: Symbols.auto_timer);

  final String label;
  final IconData? icon;
  Color? get color => null;

  const Skills({required this.label, this.icon});
}

enum AppInfoLink {
  github(
    label: "Link",
    icon: SimpleIcons.github,
    color: AppColors.brandGithubAlt,
  );

  final String label;
  final IconData? icon;
  final Color? color;

  const AppInfoLink({required this.label, this.icon, this.color});
}
