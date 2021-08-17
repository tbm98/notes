import 'package:flutter/material.dart';
import 'package:notes/src/ui/widgets/add_note_botton.dart';
import 'package:notes/src/ui/widgets/avatar_widget.dart';
import 'package:notes/src/ui/widgets/bottom_navi_bar_widget.dart';
import 'package:notes/src/ui/widgets/my_page_view.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(actions: const [AvatarWidget()]),
      body: MyPageView(),
      floatingActionButton: const AddNoteButton(),
      bottomNavigationBar: const BottomNaviBarWidget(),
    );
  }
}
