import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteConfirmationAlert extends StatelessWidget {
  const DeleteConfirmationAlert(
      {Key? key,
      required this.title,
      required this.text,
      required this.optionText,
      required this.onTap,
      this.colorForButton,
      this.customFormat})
      : super(key: key);
  final String title;
  final String text;
  final String optionText;
  final void Function() onTap;
  final Color? colorForButton;
  final bool? customFormat;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.outline,
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      title: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
        ),
      ),
      content: Padding(
        padding: EdgeInsets.only(left: 26.w, right: 26.w, top: 6),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface, height: 1.6.h),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Column(
          children: [
            Divider(
                thickness: 1,
                color: Theme.of(context).colorScheme.tertiaryContainer),
            CupertinoDialogAction(
              onPressed: () async {
                onTap();
                Navigator.of(context).pop();
              },
              child: Text(
                optionText,
                style: TextStyle(
                    color: colorForButton ?? const Color(0xFFEE6868),
                    fontWeight: FontWeight.w500,
                    height: 1.5.h),
              ),
            ),
            Divider(
                thickness: 1,
                color: Theme.of(context).colorScheme.tertiaryContainer),
          ],
        ),
        CupertinoDialogAction(
          child: Text(
            'Отменить',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
