import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/home/providers.dart';

class BottomNaviBarWidget extends ConsumerWidget {
  const BottomNaviBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentTabProvider).state;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => ref.read(currentTabProvider).state = index,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined), label: 'Todo list'),
        BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined), label: 'Memories'),
      ],
    );
  }
}
