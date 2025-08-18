import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/presentation/controllers/bottom_nav_bar_cubit/bottom_nav_bar_cubitt.dart';
import 'package:whats_app/presentation/controllers/theme_cubit/theme_cubit.dart';
import 'package:whats_app/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:whats_app/utills/service_locator/service_locators.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocators.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBarCubitt()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final themeCubit = context.read<ThemeCubit>();
          return MaterialApp(
            theme: themeCubit.state.themeData,
            debugShowCheckedModeBanner: false,
            home: const BottomNavBarScreen(),
          );
        },
      ),
    );
  }
}
