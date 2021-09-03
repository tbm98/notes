import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/src/ui/screens/trash/trash_page.dart';
import 'package:notes/src/ui/widgets/compose_button.dart';
import 'package:notes/src/ui/widgets/avatar_widget.dart';
import 'package:notes/src/ui/widgets/bottom_navi_bar_widget.dart';
import 'package:notes/src/ui/widgets/my_page_view.dart';
import 'package:notes/src/utils/slide_up_route.dart';

class SignedInPage extends StatelessWidget {
  const SignedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.trash),
            onPressed: () {
              Navigator.push(context, SlideUpRoute(child: const TrashPage()));
            },
          ),
          actions: const [
            Padding(padding: EdgeInsets.only(right: 8), child: AvatarWidget())
          ]),
      body: MyPageView(),
      floatingActionButton: const ComposeButton(),
      bottomNavigationBar: const BottomNaviBarWidget(),
    );
  }
}
