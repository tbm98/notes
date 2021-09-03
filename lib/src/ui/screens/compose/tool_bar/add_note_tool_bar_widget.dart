import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/compose/tool_bar/providers.dart';
import 'package:notes/src/ui/widgets/my_animated_size.dart';
import 'package:notes/src/utils/time.dart';

import '../providers.dart';
import 'item_toolbar_widget.dart';

class AddNoteToolBarWidget extends ConsumerWidget {
  const AddNoteToolBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expanded = ref.watch(toolbarExpandedProvider);

    return Container(
      alignment: Alignment.centerRight,
      child: AnimatedOpacity(
        opacity: expanded ? 1.0 : .2,
        duration: const Duration(milliseconds: 300),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(255 ~/ 2),
              borderRadius: BorderRadius.circular(24)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _BuildAnimatedItems(),
              _BuildToggleIcon(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildAnimatedItems extends ConsumerWidget {
  const _BuildAnimatedItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expanded = ref.watch(toolbarExpandedProvider);
    return MyAnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      child: expanded ? const _BuildItems() : const SizedBox(),
    );
  }
}

class _BuildToggleIcon extends ConsumerWidget {
  const _BuildToggleIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expanded = ref.watch(toolbarExpandedProvider);

    return ItemToolBar(
      onTap: ref.read(toolbarExpandedProvider.notifier).toggle,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          expanded ? Icons.arrow_forward_ios : Icons.more_vert,
          key: ValueKey<bool>(expanded),
        ),
      ),
    );
  }
}

class _BuildItems extends ConsumerWidget {
  const _BuildItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ItemToolBar(
          child: const Icon(Icons.add_alert_outlined),
          onTap: () async {
            final date = await showDateTimePicker(context);
            ref.read(composeProvider.notifier).alarmPicked(date);
          },
        ),
        ItemToolBar(
          child: const Icon(Icons.today_outlined),
          onTap: () async {
            final date = await showDateTimePicker(context);
            ref.read(composeProvider.notifier).datePicked(date);
          },
        ),
      ],
    );
  }
}
