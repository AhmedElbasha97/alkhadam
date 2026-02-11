import 'package:flutter_bloc/flutter_bloc.dart';

enum PaymentMethod { online, cash, wallet }

class PaymentState {
  const PaymentState({
    this.method = PaymentMethod.cash,
    this.promoCode = '',
    this.policyAgreed = false,
    this.walletBalance = 0,
  });

  final PaymentMethod method;
  final String promoCode;
  final bool policyAgreed;
  final int walletBalance;

  PaymentState copyWith({
    PaymentMethod? method,
    String? promoCode,
    bool? policyAgreed,
    int? walletBalance,
  }) {
    return PaymentState(
      method: method ?? this.method,
      promoCode: promoCode ?? this.promoCode,
      policyAgreed: policyAgreed ?? this.policyAgreed,
      walletBalance: walletBalance ?? this.walletBalance,
    );
  }
}

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState());

  void setMethod(PaymentMethod m) => emit(state.copyWith(method: m));
  void setPromoCode(String s) => emit(state.copyWith(promoCode: s));
  void setPolicyAgreed(bool v) => emit(state.copyWith(policyAgreed: v));
}
