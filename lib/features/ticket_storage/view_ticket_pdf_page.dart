import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/cubit/ticket_storage_cubit.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/cubit/ticket_storage_state.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/progress_indicator.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TicketPdfView extends StatelessWidget {
  const TicketPdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TicketStorageCubit, TicketStorageState>(
        builder: (context, state) {
          return state.selectedTicketFile == null
              ? const Center(
                  child: ProgressIndicatorWithBlur(),
                )
              : SafeArea(
                  child: Column(children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.r, 50.h),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r)),
                            child: SfPdfViewer.file(state.selectedTicketFile!)),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                            onPressed:
                                context.read<TicketStorageCubit>().shareTicket,
                            child: Text("Поделиться")),
                        SizedBox(
                          height: 40.h,
                        )
                      ],
                    ),
                  ]),
                );
        },
      ),
    );
  }
}
