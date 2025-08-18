import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/presentation/controllers/stories_cubit/stories_cubit.dart';
import 'package:whats_app/presentation/widgets/show_story.dart';
import 'package:whats_app/utills/app_constants/app_constants.dart';
import 'package:whats_app/utills/service_locator/service_locators.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<StoriesCubit>()..getStatus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Updates',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: (AppConstants.screenWidth(context) * 0.05).clamp(
                12,
                20,
              ),
            ),
          ),
        ),
        body: ShowStory(),
      ),
    );
  }
}
