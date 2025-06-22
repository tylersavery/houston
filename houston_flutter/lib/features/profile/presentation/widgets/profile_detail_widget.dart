import 'package:flutter/material.dart';
import '../../domain/models/profile_model.dart';

class ProfileDetailWidget extends StatelessWidget {
  final Profile profile;
  const ProfileDetailWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Text(profile.label);
  }
}
