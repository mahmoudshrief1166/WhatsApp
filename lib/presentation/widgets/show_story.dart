import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/presentation/controllers/stories_cubit/stories_cubit.dart';
import 'package:whats_app/utills/app_constants/app_constants.dart';

class ShowStory extends StatelessWidget {
  const ShowStory({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppConstants.screenWidth(context);
    final height = AppConstants.screenHeight(context);

    return BlocBuilder<StoriesCubit, StoriesState>(
      builder: (context, state) {
        if (state is StoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StoriesError) {
          return Center(child: Text(state.message));
        } else if (state is StoriesLoaded) {
          return ListView(
            children: [
              /// My Status
              ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: (width * 0.065).clamp(22.0, 30.0),
                      backgroundImage: const NetworkImage(
                        'https://www.cairo24.com/Upload/libfiles/83/9/402.jpg',
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: (width * 0.003).clamp(1.0, 2.0),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          size: (width * 0.05).clamp(14.0, 20.0),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  'My Status',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (width * 0.045).clamp(14.0, 18.0),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  'Tap to add status update',
                  style: TextStyle(
                    fontSize: (width * 0.038).clamp(12.0, 16.0),
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {},
              ),

              /// Recent updates title
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.015,
                ),
                child: Text(
                  'Recent updates',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: (width * 0.042).clamp(13.0, 17.0),
                  ),
                ),
              ),

              /// Stories List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.stories.length,
                itemBuilder: (context, index) {
                  final story = state.stories[index];
                  return ListTile(
                    leading: Container(
                      padding: EdgeInsets.all((width * 0.002).clamp(1.0, 2.0)),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green,
                          width: (width * 0.008).clamp(1.5, 3.0),
                        ),
                      ),
                      child: CircleAvatar(
                        radius: (width * 0.065).clamp(22.0, 30.0),
                        backgroundImage: NetworkImage(story.mediaUrl),
                      ),
                    ),
                    title: Text(
                      story.user.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: (width * 0.043).clamp(14.0, 18.0),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      formatStoryTime(story.timestamp),
                      style: TextStyle(
                        fontSize: (width * 0.035).clamp(11.0, 14.0),
                        color: Colors.grey[600],
                      ),
                    ),
                    onTap: () {
                    },
                  );
                },
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

String formatStoryTime(DateTime date) {
  final diff = DateTime.now().difference(date);

  if (diff.inSeconds < 60) {
    return "Just now";
  } else if (diff.inMinutes < 60) {
    return "${diff.inMinutes}m ago";
  } else if (diff.inHours < 24) {
    return "${diff.inHours}h ago";
  } else {
    return "${date.day} ${_monthAbbr(date.month)}";
  }
}

String _monthAbbr(int month) {
  const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  return months[month - 1];
}
