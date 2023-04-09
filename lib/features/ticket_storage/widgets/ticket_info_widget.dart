import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ticket_model.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/cubit/ticket_storage_cubit.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/view_ticket_pdf_page.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/delete_confirmation_alert.dart';

class TicketInfoWidget extends StatelessWidget {
  const TicketInfoWidget({super.key, required this.ticket});
  final Ticket ticket;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.08),
              offset: const Offset(1, -4),
              blurRadius: 20)
        ],
      ),
      child: Slidable(
        
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            InkWell(
              onTap: () async => showDialog<void>(
                context: context,
                builder: (BuildContext ctx) => BlocProvider.value(
                    value: context.read<TicketStorageCubit>(),
                    child: DeleteConfirmationAlert(
                        title: "Вы действительно хотите удалить билет?",
                        text: "",
                        optionText: "Да",
                        onTap: () => context
                            .read<TicketStorageCubit>()
                            .deleteTicket(ticket))),
              ),
              child: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.error),
                child: const Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            if (ticket.path != null) {
              context.read<TicketStorageCubit>().openTicketPdf(ticket);
              Navigator.push(context, MaterialPageRoute(
                builder: (_) {
                  return BlocProvider.value(
                    value: context.read<TicketStorageCubit>(),
                    child: const TicketPdfView(),
                  );
                },
              ));
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.airplane_ticket),
              SizedBox(
                width: 24.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ticket.title ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      height: 4.0,
                      child: LinearProgressIndicator(
                          value: ticket.downloadProgress ?? 0,
                          backgroundColor: ticket.ticketDownloadStatus == 2
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                        ticket.ticketDownloadStatus == 0
                            ? "Ожидает начала загрузки"
                            : ticket.ticketDownloadStatus == 1
                                ? "Загружается"
                                : ticket.ticketDownloadStatus == 2
                                    ? "Файл загружен"
                                    : "",
                        style: Theme.of(context).textTheme.headlineSmall)
                  ],
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              ticket.ticketDownloadStatus == 0
                  ? IconButton(
                      icon: const Icon(
                        Icons.cloud_download,
                      ),
                      onPressed: () => context
                          .read<TicketStorageCubit>()
                          .downloadPdf(ticket),
                    )
                  : ticket.ticketDownloadStatus == 1
                      ? IconButton(
                          icon: const Icon(
                            Icons.pause_circle,
                          ),
                          onPressed: () => context
                              .read<TicketStorageCubit>()
                              .downloadPdf(ticket),
                        )
                      : ticket.ticketDownloadStatus == 2
                          ? const IconButton(
                              icon: Icon(
                                Icons.cloud_done,
                              ),
                              onPressed: null)
                          : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
