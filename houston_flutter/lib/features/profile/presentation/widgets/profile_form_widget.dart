import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/profile_form_provider.dart';

class ProfileFormWidget extends ConsumerWidget {
  final int? profileId;
  const ProfileFormWidget({super.key, this.profileId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(profileFormProvider.notifier);
    final state = ref.watch(profileFormProvider);
    final isEditing = state.profile.id != null;

    return Form(
      key: provider.formKey,
      child: Column(
        children: [
          if (state.error != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(state.error!),
            ),
          TextFormField(
            controller: provider.usernameController,
            validator: provider.usernameValidator,
            decoration: const InputDecoration(label: Text("Username")),
          ),
          TextFormField(
            controller: provider.firstNameController,
            decoration: const InputDecoration(label: Text("First Name")),
          ),
          TextFormField(
            controller: provider.lastNameController,
            decoration: const InputDecoration(label: Text("Last Name")),
          ),
          TextFormField(
            controller: provider.avatarController,
            decoration: const InputDecoration(label: Text("Avatar")),
          ),
          TextFormField(
            controller: provider.bioController,
            decoration: const InputDecoration(label: Text("Bio")),
            minLines: 3,
            maxLines: 3,
          ),
          if (isEditing)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final success = await provider.delete();
                  if (success) {
                    if (context.mounted) {
                      context.pop();
                      context.pop();
                    }
                  }
                },
                child: const Text("Delete Profile"),
              ),
            ),
        ],
      ),
    );
  }
}
