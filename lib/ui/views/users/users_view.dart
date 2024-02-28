import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_2/model/user_model.dart';
import 'package:stacked_2/ui/views/details/details_view.dart';

import 'users_viewmodel.dart';

class UsersView extends StackedView<UsersViewModel> {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UsersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<User>>(
          future: viewModel.users,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the details page and pass the user object
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetailsView(user: user),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(user.id.toString()),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(user.name),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    viewModel.getAddressAll(user),
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    user.email,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    user.phone,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  @override
  UsersViewModel viewModelBuilder(BuildContext context) => UsersViewModel();
}
