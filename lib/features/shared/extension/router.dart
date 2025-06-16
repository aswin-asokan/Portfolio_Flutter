import 'package:go_router/go_router.dart';
import 'package:portfolio/features/app_page/screens/app_page.dart';
import 'package:portfolio/features/home/home.dart';
import 'package:portfolio/features/shared/models/project_list.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => Home()),
    GoRoute(
      name: "app",
      path: '/app/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final app = projects.firstWhere((app) => app.id == id);
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
);
