import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:portfolio/core/constants/app_colors.dart';

enum TechStack {
  arduino(label: "Arduino"),
  bert(label: "BERT"),
  cCppForArduino(label: "C/C++ for Arduino"),
  dart(label: "Dart"),
  deepTranslator(
    label: "Deep Translator",
    icon: SimpleIcons.googletranslate,
    color: SimpleIconColors.googletranslate,
  ),
  esp32(label: "ESP32"),
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
  flask(
    label: "Flask",
    icon: SimpleIcons.flask,
    color: SimpleIconColors.flask,
  ),
  flutter(
    label: "Flutter",
    icon: SimpleIcons.flutter,
    color: SimpleIconColors.flutter,
  ),
  flutterQuill(label: "Flutter Quill"),
  gcp(
    label: "GCP",
    icon: SimpleIcons.googlecloud,
    color: SimpleIconColors.googlecloud,
  ),
  geminiApi(label: "Gemini Api"),
  googleVisionApi(
    label: "Google Vision API",
    icon: Symbols.camera,
    color: SimpleIconColors.googlecardboard,
  ),
  hive(label: "Hive"),
  json(label: "JSON"),
  java(
    label: "Java",
    icon: Symbols.coffee,
    color: AppColors.brandJava,
  ),
  lora(label: "LoRA"),
  mysql(
    label: "MySQL",
    icon: SimpleIcons.mysql,
    color: SimpleIconColors.mysql,
  ),
  osm(
    label: "OSM",
    icon: SimpleIcons.openstreetmap,
    color: SimpleIconColors.openstreetmap,
  ),
  pubDevApi(label: "Pub.dev API"),
  pytorch(label: "PyTorch"),
  python(label: "Python"),
  react(label: "React"),
  sam(label: "SAM"),
  sqlite(label: "SQLite"),
  t5(label: "T5");

  final String label;
  final IconData? icon;
  final Color? color;

  const TechStack({
    required this.label,
    this.icon,
    this.color,
  });
}

enum Tools {
  anaconda(label: "Anaconda"),
  arduinoIde(label: "Arduino IDE"),
  bitbucket(label: "Bitbucket"),
  confluence(label: "Confluence"),
  fritzing(label: "Fritzing"),
  geminiAiApi(label: "Gemini AI API"),
  genymotion(label: "Genymotion"),
  git(
    label: "Git",
    icon: SimpleIcons.git,
    color: SimpleIconColors.git,
  ),
  github(
    label: "Github",
    icon: SimpleIcons.github,
    color: AppColors.brandGithubAlt,
  ),
  huggingFace(label: "Hugging Face"),
  jira(label: "Jira"),
  mitAppInventor(label: "MIT App Inventor"),
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
  overleaf(label: "Overleaf"),
  vsCode(label: "VS Code");

  final String label;
  final IconData? icon;
  final Color? color;

  const Tools({
    required this.label,
    this.icon,
    this.color,
  });
}

enum Skills {
  aiModelIntegration(label: "AI Model Integration in Mobile Apps"),
  cleanCode(label: "Clean code"),
  codeReviewMindset(label: "Code Review Mindset"),
  collaborationCommunication(label: "Collaboration & Communication"),
  communication(label: "Communication"),
  computerVision(label: "Computer Vision"),
  continuousLearning(label: "Continuous Learning"),
  deadlineFocused(label: "Deadline Focused"),
  deepLearningFineTuningPeft(label: "Deep Learning Fine-Tuning (PEFT)"),
  documentationPresentation(label: "Documentation & Presentation"),
  fullStackDevelopment(label: "Full-Stack Development"),
  goalOrientedExecution(label: "Goal-Oriented Execution"),
  growthMindset(label: "Growth Mindset"),
  ideaStructuring(
    label: "Idea Structuring",
    icon: Symbols.lightbulb,
  ),
  independenceOwnership(
    label: "Independence & Ownership",
    icon: Symbols.shield,
  ),
  industrialAutomationConcept(label: "Industrial Automation Concept"),
  iterationRefactoring(label: "Iteration & Refactoring"),
  learningAgility(label: "Learning Agility"),
  learningByDoing(
    label: "Learning by Doing",
    icon: Symbols.book_2,
  ),
  machineLearningDatasetPreparation(label: "Machine Learning Dataset Preparation"),
  persistence(
    label: "Persistence",
    icon: Symbols.mountain_flag,
  ),
  presentation(
    label: "Presentation",
    icon: Symbols.co_present,
  ),
  presentationPitching(
    label: "Presentation & Pitching",
    icon: Symbols.co_present,
  ),
  problemIdentificationIdeation(label: "Problem Identification & Ideation"),
  problemSolving(
    label: "Problem Solving",
    icon: Symbols.lightbulb,
  ),
  projectManagement(label: "Project Management"),
  projectPlanning(label: "Project Planning"),
  quickLearning(label: "Quick Learning"),
  researchInnovation(
    label: "Research & Innovation",
    icon: Symbols.lightbulb,
  ),
  resilience(label: "Resilience"),
  selfConfidence(label: "Self-Confidence"),
  selfGuidedRefactoring(label: "Self-Guided Refactoring"),
  structuredLearningExecution(label: "Structured Learning & Execution"),
  teamCollaboration(
    label: "Team Collaboration",
    icon: Symbols.people,
  ),
  teamLeadership(
    label: "Team Leadership",
    icon: Symbols.social_leaderboard,
  ),
  technicalProficiency(label: "Technical Proficiency"),
  timeManagement(
    label: "Time Management",
    icon: Symbols.access_time,
  ),
  toolFamiliarity(
    label: "Tool Familiarity",
    icon: Symbols.tools_pliers_wire_stripper,
  ),
  uiUxAwareness(label: "UI/UX Awareness"),
  userCentricThinking(label: "User-Centric Thinking");

  final String label;
  final IconData? icon;
  Color? get color => null;

  const Skills({
    required this.label,
    this.icon,
  });
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

  const AppInfoLink({
    required this.label,
    this.icon,
    this.color,
  });
}
