import 'package:alkhadam/features/bookings/widget/booking_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../drawer/cubit/drawer_cubit.dart';
import '../../drawer/presentation/drawer_screen.dart';
import '../cubit/booking_list_cubit.dart';
import '../cubit/booking_list_state.dart';
import '../data/booking_list_model.dart';

class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingListCubit()..getBookingList(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFdcdbdb),
          elevation: 3,
          title: Image.asset(
            "assets/logo with out background.png",
            scale: 4.5,
          ),
          centerTitle: true,
          leading:IconButton(
              icon: const Icon(Icons.menu, color:  Color(0xFF6A1B9A)),
              onPressed: (){
                // inside any widget with context:
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: 'drawer',
                  pageBuilder: (ctx, anim1, anim2) {
                    return BlocProvider(
                      create: (_) => DrawerCubit()..load(),
                      child: const CustomDrawer(

                      ),
                    );
                  },
                  transitionBuilder: (ctx, anim, secAnim, child) {
                    return FadeTransition(
                      opacity: anim,
                      child: child,
                    );
                  },
                );

              }        ),
          actions:[IconButton(onPressed: (){
            Navigator.maybePop(context);
          }, icon: const Icon(Icons.arrow_forward_ios, color:  Color(0xFF6A1B9A))) ],
        ),
        body: Container(
          color: const Color(0xFFE9EDF2),
          child: BlocBuilder<BookingListCubit, BookingListState>(
            builder: (context, state) {
              if (state is BookingListLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is BookingListError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              if (state is BookingListLoaded) {
                if (state.bookingListResponse.data.isEmpty) {
                  return Center(child: Text('no_data_title'.tr()));
                }

                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: state.bookingListResponse.data.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 14),
                        itemBuilder: (_, index) =>
                            _BookingCard(item: state.bookingListResponse.data[index]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                      child: SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6F4AD7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () => Navigator.maybePop(context),
                          child: Text(
                            'booking_list_button'.tr(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  const _BookingCard({required this.item});

  final BookingListItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 98,
            height: 98,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EBF0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.location_on, color: Color(0xFF6F4AD7), size: 32),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.work, color: Color(0xFF6F4AD7), size: 21),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${'booking_id'.tr()} #${item.id}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const Icon(Icons.more_horiz, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${'status'.tr()}: ${item.status} • ${item.date}',
                  style: const TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
