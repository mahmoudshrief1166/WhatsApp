
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whats_app/presentation/screens/chat_screen.dart';
import 'package:whats_app/presentation/screens/story_screen.dart';

part 'bottom_nav_bar_state.dart';
class BottomNavBarCubitt extends Cubit<BottomNavBarState> {
    BottomNavBarCubitt() : super(const InitialState());
    static BottomNavBarCubitt get(context) => BlocProvider.of(context);
    List<Widget> screens = const [
      ChatScreen(),
      StoryScreen(),
    ];
    void onChangeState(int index){
      emit( ChangeState(index));
    }
}