import 'package:blogexplorer/service/bloc/navigation_bloc/navigation_event.dart';
import 'package:blogexplorer/service/bloc/navigation_bloc/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc(): super(NavigationStateChanged(0)) {
    on<NavigationChangeTo> ((event, emit){
      emit(NavigationStateChanged(event.index));
    });
  }
}