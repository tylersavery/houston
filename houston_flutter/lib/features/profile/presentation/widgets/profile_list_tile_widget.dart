import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/profile_model.dart';
import '../screens/profile_detail_screen.dart';

class ProfileListTileWidget extends StatelessWidget {
  final Profile profile;
  final Function(Profile)? onPressed;

  const ProfileListTileWidget({
    super.key,
    required this.profile,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(profile.label),
        onTap: () {
          if (onPressed != null) {
            onPressed!(profile);
            return;
          }

          context.push(ProfileDetailScreen.route(profile.id));
        },
      ),
    );
  }
}
