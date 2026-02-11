import 'package:alkhadam/features/companies/booking_screens/cubit/booking_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../drawer/cubit/drawer_cubit.dart';
import '../../../drawer/presentation/drawer_screen.dart';
import '../../booking_screens/cubit/booking_state.dart';
import '../../location_selection/data/address_model.dart';
import '../cubit/payment_cubit.dart';
import 'cancellation_policy_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    super.key,
    required this.bookingState,
    this.address,
  });

  final BookingLoadedState bookingState;
  final AddressModel? address;

  String? _servicesSummary() {
    if (BookingCubit().selectedServices.isEmpty??true) return "sampleServices".tr();

    return BookingCubit().selectedServices.map((e) => e.name??"").join(', ');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
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
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, payment) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "bookingInfo".tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF424242),
                  ),
                ),
                const SizedBox(height: 16),
                // _InfoRow(label: "dayAndTime".tr(), value: bookingState.formattedDateTime),
                _Divider(),
                _InfoRow(label: "services".tr(), value: _servicesSummary()??""),
                _Divider(),
                // _InfoRow(label: "yourNotes".tr(), value: bookingState.notes.isEmpty ? '-' : bookingState.notes),
                const SizedBox(height: 24),
                Text(
                  "address".tr(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address != null &&
                       address!.displayAddress.isNotEmpty
                      ? address!.displayAddress
                      : "sampleAddress".tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF424242),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      "paymentMethod".tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF424242),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.help_outline, size: 20, color: Color(0xFF757575)),
                  ],
                ),
                const SizedBox(height: 12),
                _PaymentOption(
                  label: "onlinePayment".tr(),
                  selected: payment.method == PaymentMethod.online,
                  isRadio: true,
                  onTap: () => context.read<PaymentCubit>().setMethod(PaymentMethod.online),
                ),
                const SizedBox(height: 8),
                _PaymentOption(
                  label: "cashPayment".tr(),
                  selected: payment.method == PaymentMethod.cash,
                  isRadio: true,
                  onTap: () => context.read<PaymentCubit>().setMethod(PaymentMethod.cash),
                ),
                const SizedBox(height: 8),
                _PaymentOption(
                  label: '${"wallet".tr()}${payment.walletBalance}${"balance".tr()}',
                  selected: payment.method == PaymentMethod.wallet,
                  isRadio: false,
                  onTap: () => context.read<PaymentCubit>().setMethod(PaymentMethod.wallet),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: "enterPromoCode".tr(),
                    hintStyle: const TextStyle(color: Color(0xFF757575)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color:  Color(0xFF8E2393))
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  onChanged: (v) => context.read<PaymentCubit>().setPromoCode(v),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.card_giftcard, color: Color(0xFF8E2393), size: 22),
                      const SizedBox(width: 8),
                      Text(
                        "addInvitationCode".tr(),
                        style: const TextStyle(
                          color: Color(0xFF8E2393),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "paymentSummary".tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF424242),
                  ),
                ),
                const SizedBox(height: 12),
                // _SummaryRow(label: "serviceFees".tr(), value: '${bookingState.totalPrice} ${"currencyQAR".tr()}'),
                const SizedBox(height: 8),
                // _SummaryRow(label: "totalAmount".tr(), value: '${bookingState.totalPrice} ${"currencyQAR".tr()}'),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: payment.policyAgreed,
                      onChanged: (v) => context.read<PaymentCubit>().setPolicyAgreed(v ?? false),
                      activeColor: Color(0xFF8E2393),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => CancellationPolicyScreen(
                              onAgree: () => context.read<PaymentCubit>().setPolicyAgreed(true),
                            ),
                          ),
                        ),
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(color: Color(0xFF424242), fontSize: 14),
                            children: [
                              TextSpan(text: "cancellationPolicyAgree".tr().split('100%')[0]),
                              TextSpan(
                                text: '100% ${"cancellationPolicyLink".tr()}',
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF8E2393),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E2393),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("requestService".tr(),style: const TextStyle(color: Colors.white),),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(value, style: const TextStyle(color: Color(0xFF424242), fontSize: 15))),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(color: Color(0xFF757575), fontSize: 15)),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Divider(height: 1, color: Color(0xFFE0E0E0)),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.label,
    required this.selected,
    required this.isRadio,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool isRadio;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF5F5F5),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? Color(0xFF8E2393) : Color(0xFFE0E0E0),
              width: selected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              if (isRadio)
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF8E2393), width: 2),
                    color: selected ? Color(0xFF8E2393) : Colors.transparent,
                  ),
                )
              else
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color(0xFF8E2393)),
                    color: selected ? Color(0xFF8E2393) : Colors.transparent,
                  ),
                  child: selected
                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                      : null,
                ),
              const SizedBox(width: 14),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF424242),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(value, style: const TextStyle(color: Color(0xFF424242), fontWeight: FontWeight.w600)),
        Text(label, style: const TextStyle(color: Color(0xFF757575))),
      ],
    );
  }
}
