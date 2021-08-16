import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/home/providers.dart';
import 'package:notes/src/ui/screens/memories/memories_page.dart';
import 'package:notes/src/ui/screens/todo/todo_page.dart';

class MyPageView extends ConsumerWidget {
  MyPageView({
    Key? key,
  }) : super(key: key);

  final PageController controller = PageController();

  void _currentTabChanged(StateController<int> value) {
    controller.animateToPage(
      value.state,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(currentTabProvider, _currentTabChanged);
    return PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      children: const [TodoPage(), MemoriesPage()],
    );
  }
}
