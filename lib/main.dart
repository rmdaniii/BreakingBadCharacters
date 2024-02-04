import 'package:breaking_char/app_router/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(  BreakingBadChar(appRouter: AppRouter(),));
}

class BreakingBadChar extends StatelessWidget {

  final AppRouter appRouter;

  const BreakingBadChar({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute ,

    );
  }
}

