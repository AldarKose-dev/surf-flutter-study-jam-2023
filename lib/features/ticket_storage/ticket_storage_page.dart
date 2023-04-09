import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ordering.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/cubit/ticket_storage_cubit.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/cubit/ticket_storage_state.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/add_ticket_modal.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/ticket_info_widget.dart';
import 'package:surf_flutter_study_jam_2023/injector.dart';

class TicketStoragePage extends StatefulWidget {
  const TicketStoragePage({Key? key}) : super(key: key);

  @override
  _TicketStoragePageState createState() => _TicketStoragePageState();
}

class _TicketStoragePageState extends State<TicketStoragePage> {
  final _scrollController = ScrollController();

  bool _showFab = true;
  List<DropdownMenuItem<Ordering>> menuItems = [
    DropdownMenuItem(
        child: Text("По дате скачивания возрст"),
        value: Ordering.dateDownloadedAsc()),
    DropdownMenuItem(
        child: Text("По дате скачивания возрст"),
        value: Ordering.dateDownloadedDsc()),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels == 0) {
        // We're at the top.
        setState(() => _showFab = true);
      } else {
        // We're at the bottom.
        setState(() => _showFab = false);
      }
    } else {
      setState(() => _showFab = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TicketStorageCubit>(),
      child: BlocBuilder<TicketStorageCubit, TicketStorageState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: _showFab
                ? ElevatedButton(
                    onPressed: () => showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      context: context,
                      builder: (ctx) => BlocProvider.value(
                        value: context.read<TicketStorageCubit>(),
                        child: const AddTicketModal(),
                      ),
                    ),
                    child: const Text("Добавить"),
                  )
                : null,
            body: state.listOfTickets == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.listOfTickets!.isEmpty
                    ? Center(
                        child: Text(
                          'Билетов нет - не проблема, если у вас есть Flutter-приложение для их добавления!',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : SafeArea(
                        child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 24.h),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Хранение билетов",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: context
                                        .read<TicketStorageCubit>()
                                        .downloadAll,
                                    child: Text("Скачать все")),
                              ),
                              Flexible(
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.listOfTickets!.length,
                                    itemBuilder: (context, index) {
                                      return TicketInfoWidget(
                                          ticket: state.listOfTickets![index]);
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 16.h,
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )),
          );
        },
      ),
    );
  }
}
