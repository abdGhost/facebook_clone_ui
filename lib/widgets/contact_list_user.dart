import 'package:facebook_clone_ui/widgets/user_card_Widget.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ContactListUser extends StatelessWidget {
  final List<User> user;
  const ContactListUser({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 8.0),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) {
                  final users = user[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: UserCardWidget(user: users),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
