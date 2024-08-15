import 'package:blogexplorer/service/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:blogexplorer/service/bloc/navigation_bloc/navigation_event.dart';
import 'package:blogexplorer/service/bloc/navigation_bloc/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Drawer customDrawer(BuildContext context) {
  return Drawer(
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close_rounded, size: 40),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: BlocBuilder<NavigationBloc, NavigationState>(
                  builder: (context, state) {
                if (state is NavigationStateChanged) {
                  return state.index == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Home',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<NavigationBloc>()
                                    .add(NavigationChangeTo(1));
                              },
                              child: Text(
                                'Bookmarks',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 25,
                                    ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<NavigationBloc>()
                                    .add(NavigationChangeTo(0));
                              },
                              child: Text(
                                'Home',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 25),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Bookmarks',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                  ),
                            ),
                          ],
                        );
                }
                return Container();
              }),
            ),
          ],
        ),
      ),
    ),
  );
}
