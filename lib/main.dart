import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel6_assignment/core/dependency_injection_container/dependency_injection_container.dart';
import 'package:pixel6_assignment/core/routes/app_routes.dart';
import 'package:pixel6_assignment/features/form_screen/presentation/bloc/form_bloc.dart';

void main() {
  setUp();
  runApp(MultiBlocProvider(
      providers: [BlocProvider<FormBloc>(create: (context) => FormBloc())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
