import 'package:alkhadam/features/companies/booking_screens/cubit/booking_cubit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/responsive.dart';
import '../../../webview/web_view.dart';
import '../../booking_screens/data/booking_category_model.dart';
import '../../../drawer/cubit/drawer_cubit.dart';
import '../../../drawer/presentation/drawer_screen.dart';
import '../../location_selection/data/address_model.dart';
import '../cubit/payment_cubit.dart';
import '../cubit/payment_state.dart';
import 'cancellation_policy_screen.dart';
import 'package:alkhadam/core/config/app_theme.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    this.address, this.totalPrice, required this.selectedServices, this.selectedHours, this.selectedWorkers, this.selectedDate, this.arrivalTime, this.note, required this.servicesId,
  });

  final String? totalPrice ;
  final List<Datum>? selectedServices ;
  final Datum? selectedHours;
  final Datum? selectedWorkers;
  final DateTime? selectedDate;
  final Datum? arrivalTime;
  final String? note;
  final  String servicesId;

  final AddressModel? address;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
    @override
  void initState() {
    super.initState();
    context.read<PaymentCubit>().startingScreen();
  }
  String? _servicesSummary() {
    if (widget.selectedServices?.isEmpty??true) return "sampleServices".tr();

    return widget.selectedServices?.map((e) => e.name??"").join(', ');
  }

  String get formattedDate {
    if (widget.selectedDate == null) return '';
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final d = widget.selectedDate!;
    return '${days[d.weekday - 1]}, ${d.day} ${months[d.month - 1]} ${d.year.toString().substring(2)}';
  }

  String get formattedDateTime => widget.selectedDate != null && widget.arrivalTime != null
      ? '$formattedDate - ${widget.arrivalTime?.name}'
      : '';

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
            icon: const Icon(Icons.menu, color:  AppTheme.brandColor),
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
        }, icon: const Icon(Icons.arrow_forward_ios, color:  AppTheme.brandColor)) ],
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, payment) {

            if(payment is PaymentLoadedState) {
              return SafeArea(
                child: SingleChildScrollView(
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
                      _InfoRow(
                          label: "dayAndTime".tr(), value: formattedDateTime),
                      _Divider(),
                      _InfoRow(label: "services".tr(),
                          value: _servicesSummary() ?? ""),
                      _Divider(),
                      _InfoRow(label: "yourNotes".tr(),
                          value: widget.note?.isEmpty ?? true ? '-' : widget.note ?? ""),
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
                        widget.address != null &&
                            widget.address!.displayAddress.isNotEmpty
                            ? widget.address!.displayAddress
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
                        ],
                      ),
                      const SizedBox(height: 12),
                      Material(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.bottomSlide,
                              dismissOnTouchOutside: false,
                              dismissOnBackKeyPress: false,
                              padding: const EdgeInsets.all(20),
                              showCloseIcon: true,

                              body: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "errorKey".tr(),
                                    style: const TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),

                                  const SizedBox(height: 15),

                                  Text(
                                    "payment_alert".tr(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 15),
                                  ),


                                ],
                              ),

                              // Buttons
                              btnOkText: "accept".tr(),

                              btnOkOnPress: () {},

                            ).show();
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color(0xFFE0E0E0),
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [

                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.blueGrey),
                                    color: Colors.transparent,
                                  ),

                                ),
                                const SizedBox(width: 14),
                                Text(
                                  "onlinePayment".tr(),
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
                      ),
                      const SizedBox(height: 8),
                      _PaymentOption(
                        label: "cashPayment".tr(),
                        selected: payment.method == PaymentMethod.cash,
                        isRadio: true,
                        onTap: () =>
                            context.read<PaymentCubit>().setMethod(
                                PaymentMethod.cash),
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
                      _SummaryRow(label: "serviceFees".tr(),
                          value: '${widget.totalPrice} ${"currencyQAR".tr()}'),
                      const SizedBox(height: 8),
                      _SummaryRow(label: "totalAmount".tr(),
                          value: '${widget.totalPrice} ${"currencyQAR".tr()}'),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: payment.policyAgreed,
                            onChanged: (v) =>
                                context
                                    .read<PaymentCubit>()
                                    .setPolicyAgreed(v ?? false),
                            activeColor: Color(0xFF8E2393),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (_) =>
                                            WebViewContainer(
                                                'https://dohamaid.com/qa/ar/page/13/mobile'),
                                        settings: const RouteSettings(
                                            name: "WebViewContainer")
                                    ),
                                  ),
                              child: Text.rich(
                                TextSpan(
                                  style: const TextStyle(
                                      color: Color(0xFF424242), fontSize: 14),
                                  children: [
                                    TextSpan(text: "cancellationPolicyAgree"
                                        .tr()
                                        .split('100%')[0]),
                                    TextSpan(
                                      text: ' ${"cancellationPolicyLink".tr()}',
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
                      context
                          .read<PaymentCubit>()
                          .isSendingReservation ?
                      Container(
                          width: screenWidth(context) * 0.24,
                          height: screenHeight(context) * 0.07,
                          decoration: const BoxDecoration(
                              color: Color(0xFF7E2670), shape: BoxShape.circle),
                          child: const Padding(padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(color: Colors
                                  .white,),),)
                      )
                          : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8E2393),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            context.read<PaymentCubit>().startSendingReservation(
                              context,
                              widget.totalPrice,
                              widget.selectedServices,
                              widget.selectedHours,
                              widget.selectedWorkers,
                              widget.selectedDate,
                              widget.arrivalTime,
                              widget.note,
                              widget.address,
                              payment.policyAgreed,
                              widget.servicesId,
                            );
                          },
                          child: Text("requestService".tr(),
                            style: const TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
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
