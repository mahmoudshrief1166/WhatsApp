import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/presentation/controllers/bottom_nav_bar_cubit/bottom_nav_bar_cubitt.dart';
import 'package:whats_app/presentation/widgets/floating_action_button_weidget.dart';

class BottomNavBarScreenWidget extends StatelessWidget {
  const BottomNavBarScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubitt, BottomNavBarState>(
      builder: (context, state) {
        final cubit = context.read<BottomNavBarCubitt>();
        return Scaffold(
          body: cubit.screens[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) => cubit.onChangeState(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.update),
                label: 'Status',
              ),
            ],
          ),
          floatingActionButton: const FloatingActionButtonWidget(),
        );
      },
    );
  }
}
