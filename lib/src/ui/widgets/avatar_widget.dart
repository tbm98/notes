import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/global_constant.dart';
import 'package:notes/src/models/user.dart';
import 'package:notes/src/ui/dialogs/profile.dart';
import 'package:notes/src/ui/screens/home/providers/profile_providers.dart';

class AvatarWidget extends ConsumerWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileProvider);

    return user.map(
      signedIn: (value) => _SignedInAvatar(user: value),
      guest: (_) => const _GuestAvatar(),
    );
  }
}

class _SignedInAvatar extends ConsumerWidget {
  const _SignedInAvatar({
    Key? key,
    required this.user,
  }) : super(key: key);
  final SignedInUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: InkWell(
        onTap: () {
          showProfileDialog(context);
        },
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: user.avatarUrl ?? '',
            width: avatarSize,
            height: avatarSize,
          ),
        ),
      ),
    );
  }
}

class _GuestAvatar extends ConsumerWidget {
  const _GuestAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Center(
        child: InkWell(
          onTap: () {
            ref.read(profileProvider.notifier).signIn();
          },
          child: const CircleAvatar(
              backgroundColor: Colors.yellow, radius: 20, child: Text('M')),
        ),
      ),
    );
  }
}
