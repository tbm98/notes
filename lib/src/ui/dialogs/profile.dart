import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/global_constant.dart';
import 'package:notes/src/ui/screens/home/providers/profile_providers.dart';
import 'package:notes/src/ui/screens/memories/providers.dart';
import 'package:notes/src/ui/screens/todo/providers.dart';
import 'package:notes/src/ui/widgets/avatar_widget.dart';
import 'package:notes/src/utils/truncated_email.dart';

Future<void> showProfileDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)), //this right here
        child: const IntrinsicHeight(child: ProfileDialog()),
      );
    },
  );
}

class ProfileDialog extends ConsumerWidget {
  const ProfileDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _UserInfoWidget(),
          Divider(),
          _DataInfo(),
          Divider(),
          _SwitchAccount()
        ],
      ),
    );
  }
}

class _UserInfoWidget extends ConsumerWidget {
  const _UserInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileProvider);
    return user.map(signedIn: (value) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const IgnorePointer(child: AvatarWidget()),
          const SizedBox(width: 8),
          Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(value.displayName ?? ''),
              subtitle: Text(truncatedEmail(value.email ?? '')),
            ),
          ),
        ],
      );
    }, guest: (value) {
      return const SizedBox();
    });
  }
}

class _DataInfo extends ConsumerWidget {
  const _DataInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider)?.length ?? 0;
    final finishedTodos = ref.watch(finishedTodoProvider)?.length ?? 0;
    final unfinishedTodos = ref.watch(unfinishedTodoProvider)?.length ?? 0;
    final memories = ref.watch(memoriesNoteProvider)?.length ?? 0;
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: avatarSize + 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Todo count: $todos ($unfinishedTodos unfinished, $finishedTodos done)'),
          Text('Memory count: $memories'),
          Text('join date'), // TODO: implement join date
        ],
      ),
    );
  }
}

class _SwitchAccount extends ConsumerWidget {
  const _SwitchAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: () {
        ref.read(profileProvider.notifier).signOut();
        Navigator.pop(context);
      },
      child: const Text('Switch account'),
    );
  }
}
