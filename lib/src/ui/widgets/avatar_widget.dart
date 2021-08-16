import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvatarWidget extends ConsumerWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.yellow,
          radius: 20,
            child: Text('M')),
      ),
    );
  }
}
