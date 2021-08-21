import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/core/authentication.dart';

class AvatarWidget extends ConsumerWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Center(
        child: InkWell(
          onTap: (){
            signInWithGoogle().then((value){
              print('username:${value.additionalUserInfo?.username}');
              print('username:${value.additionalUserInfo?.profile}');
              print('username:${value.user?.displayName}');
              print('username:${value.user?.email}');
              print('username:${value.user?.photoURL}');
            });
          },
          child: const CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 20,
              child: Text('M')),
        ),
      ),
    );
  }
}
