import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_2/ui/common/app_colors.dart';
import 'package:stacked_2/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
                    const Text(
                      'Hello, STACKED!',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    verticalSpaceMedium,
                    Text(
                      viewModel.counterLabel,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 36, 9, 9), fontSize: 100),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            color: Colors.black,
                            onPressed: viewModel.incrementCounter,
                            child: const Text(
                              '+1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          MaterialButton(
                            color: Color.fromARGB(255, 0, 0, 0),
                            onPressed: viewModel.decrementCounter,
                            child: const Text(
                              '-1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          MaterialButton(
                            color: Colors.black,
                            onPressed: viewModel.resetCounter,
                            child: const Text(
                              '0',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      color: Colors.black,
                      onPressed: () => viewModel.navigateToUsersView(),
                      child: const Text(
                        'Go to user?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: kcDarkGreyColor,
                      onPressed: viewModel.showDialog,
                      child: const Text(
                        'Show Dialog',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: kcDarkGreyColor,
                      onPressed: viewModel.showBottomSheet,
                      child: const Text(
                        'Show Bottom Sheet',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
