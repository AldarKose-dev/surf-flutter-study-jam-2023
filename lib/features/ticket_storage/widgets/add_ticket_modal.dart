import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/cubit/ticket_storage_cubit.dart';

class AddTicketModal extends StatefulWidget {
  const AddTicketModal({
    super.key,
  });

  @override
  State<AddTicketModal> createState() => _AddTicketModalState();
}

class _AddTicketModalState extends State<AddTicketModal> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final textController =
      TextEditingController(); // Controller for the URL input field
  void checkClipboard() async {
    ClipboardData? data =
        await Clipboard.getData('text/plain'); // Get the clipboard data
    if (data != null && data.text != null && data.text!.endsWith('.pdf')) {
      setState(() {
        textController.text =
            data.text!; // Set the URL input field to the PDF link
      });
    }
  }

  @override
  void initState() {
    checkClipboard();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Form(
          key: form,
          child: Column(
            children: [
              Text("Добавление билета",
                  style: Theme.of(context).textTheme.displaySmall),
              SizedBox(
                height: 36.h,
              ),
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  label: Text("Введите URL"),
                ),
                validator: (value) {
                  // Regular expression pattern for URL validation
                  String pattern =
                      r'(^(?:http|https):\/\/)?([A-Za-z0-9\-]+\.){1,}[A-Za-z]{2,}(\/\S*)?(\/[A-Za-z0-9\-]+\.pdf)$';
                  RegExp regExp = RegExp(pattern);
                  if (value == null) {
                    return 'URL не может быть пустым';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Введите корректный URL';
                  }
                  return null;
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (form.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    context
                        .read<TicketStorageCubit>()
                        .saveTicketToLocalDb(textController.text);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Добавить"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
