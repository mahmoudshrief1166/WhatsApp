import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/presentation/controllers/theme_cubit/theme_cubit.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final cubit = context.read<ThemeCubit>();
        return FloatingActionButton(
          onPressed: () {
            cubit.toggleTheme();
          },
          child: const Icon(Icons.dark_mode),
        );
      },
    );
  }
}
