// userDetails_view.dart

import 'package:flutter/material.dart';
import 'package:stacked_2/model/user_model.dart';
import 'package:stacked_2/ui/views/details/details_viewmodel.dart';

class UserDetailsView extends StatelessWidget {
  final User user;

  const UserDetailsView({Key? key, required this.user}) : super(key: key);

  get viewModel => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${user.id}'),
            const SizedBox(height: 10),
            Text('Name: ${user.name}'),
            const SizedBox(height: 10),
            Text('Email: ${user.email}'),
            const SizedBox(height: 10),
            Text('Phone: ${user.phone}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }

  @override
  UserDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserDetailsViewModel(user);
}
