import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/add_note/providers.dart';
import 'package:notes/src/utils/time.dart';

class AddNoteToolBarWidget extends ConsumerStatefulWidget {
  const AddNoteToolBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddNoteToolBarWidgetState();
}

class _AddNoteToolBarWidgetState extends ConsumerState<AddNoteToolBarWidget>
    with TickerProviderStateMixin {
  bool ex = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: AnimatedOpacity(
        opacity: ex ? 1.0 : .2,
        duration: const Duration(milliseconds: 300),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(24)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // same effort if use AnimatedSize
              SizeTransition(
                sizeFactor: _animation,
                axis: Axis.horizontal,
                axisAlignment: -1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ItemToolBar(
                      child: Icon(Icons.add_alert_outlined),
                      onTap: () async{
                        setState(() => ex = !ex);
                        if (ex) {
                          _controller.forward();
                        } else {
                          _controller.reverse();
                        }
                        final date = await showDateTimePicker(context);
                        print('date:$date');
                        ref.read(addNoteProvider.notifier).alarmPicked(date);
                      },
                    ),
                    _ItemToolBar(
                      child: Icon(Icons.today_outlined),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              _ItemToolBar(
                onTap: () {
                  setState(() => ex = !ex);
                  if (ex) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    ex ? Icons.arrow_forward_ios : Icons.more_vert,
                    key: ValueKey<bool>(ex),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemToolBar extends StatelessWidget {
  const _ItemToolBar({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(width: 48, height: 48, child: child),
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
