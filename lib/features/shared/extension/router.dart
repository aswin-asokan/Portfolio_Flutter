import 'package:go_router/go_router.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/app_page/screens/app_page.dart';
import 'package:portfolio/features/home/home.dart';
import 'package:portfolio/features/loading/initial_loading_screen.dart';
import 'package:portfolio/features/shared/project_list/project_list.dart';
import 'package:portfolio/features/projects/screens/project_list_screen.dart';
import 'package:flutter/material.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/home',
  redirect: (context, state) {
    final path = state.uri.path;
    if (path != '/home' && path != '/') {
      InitialLoadingScreen.avoidLoadingScreen = true;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/home',
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const InitialLoadingScreen(child: Home()),
      routes: [
        GoRoute(
          name: "projects",
          path: 'projects',
          builder: (context, state) => const ProjectListScreen(),
          routes: [
            GoRoute(
              name: "app",
              path: ':id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                
                AppModel? app;
                for (var p in projects) {
                  if (p.id == id) {
                    app = p;
                    break;
                  }
                }
                
                if (app == null) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Project not found'),
                    ),
                  );
                }
                
                return AppPage(
                  title: app.title,
                  iconPath: app.iconPath,
                  gitLink: app.gitLink,
                  releaseLink: app.releaseLink,
                  subtitle: app.subtitle,
                  type: app.type,
                  devices: app.devices,
                  screenshots: app.screenshots,
                  aboutApp: app.aboutApp,
                  features: app.features,
                  futurePlan: app.futurePlan,
                  appInfo: app.appInfo,
                  aboutProject: app.aboutProject,
                  challeges: app.challeges,
                  outcomes: app.outcomes,
                  projectInfo: app.projectInfo,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
