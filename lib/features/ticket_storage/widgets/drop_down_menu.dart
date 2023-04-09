import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/cubit/ticket_storage_cubit.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/cubit/ticket_storage_state.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    super.key,
    required this.menuItems,
    required this.onChanged,
  });
  final dynamic menuItems;
  final void Function(Object?) onChanged;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketStorageCubit, TicketStorageState>(
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: DropdownButton(
              borderRadius: BorderRadius.circular(12.r),
              style: Theme.of(context).textTheme.headlineMedium,
              icon: Icon(
                CupertinoIcons.chevron_up_chevron_down,
                size: 16.h,
              ),
              items: menuItems,
              value: state.ordering,
              onChanged: onChanged),
        );
      },
    );
  }
}
