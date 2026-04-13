import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../data/booking_category_model.dart';


class TimePickerSheet extends StatelessWidget {
  const TimePickerSheet({
    super.key,
    required this.timeSlots,
    required this.onTimeSelected,
    required this.onClose,
  });

  final List<Datum>? timeSlots;
  final ValueChanged<Datum?> onTimeSelected;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color:  Color(0xFF8E2393),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "setTime".tr(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:Color(0xFF424242),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.2,
                ),
                itemCount: timeSlots?.length??0,
                itemBuilder: (context, i) {
                  final slot = timeSlots?[i];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onTimeSelected(slot),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color:  Color(0xFF8E2393)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          slot?.name??"",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color:  Color(0xFF8E2393),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
