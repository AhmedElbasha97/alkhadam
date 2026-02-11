// ignore_for_file: use_build_context_synchronously

import 'package:alkhadam/features/auth/sign_up/cubit/regestier_state.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/datasources/api_service.dart';
import '../../../../core/data/datasources/storage_local_data_source.dart';
import '../../../../core/services/auth_services.dart';
import '../../../home/presentation/home_screen.dart';
import '../../../webview/web_view.dart';
import '../../data/auth_model.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  int val = 0;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool showPassword = true;
  void resetState() {
    emit( RegisterInitial()); // or reload data as needed
  }
   showingPassword(){
     showPassword = !showPassword;
     emit(RegisterInitial());
   }
  Future<void> showPrivacyTermsDialog(BuildContext context) async {

    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      padding: const EdgeInsets.all(20),

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "accept_terms_title".tr(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 15),

          Text(
            "accept_terms_message".tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),

          const SizedBox(height: 20),

          // Privacy Policy Link
          InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>  const WebViewContainer( "https://alkhadam.net/qa/ar/page/3/mobile"),
                  settings: const RouteSettings(name: "webView"),
                ),
              );
            },
            child: Text(
              "privacy_policy".tr(),
              style: const TextStyle(
                color: Color(0xFF7E2670),
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Terms Conditions Link
          InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>  const WebViewContainer( "https://alkhadam.net/qa/ar/page/10/mobile"),
                  settings: const RouteSettings(name: "webView"),
                ),
              );
            },
            child: Text(
              "terms_conditions".tr(),
              style: const TextStyle(
                color: Color(0xFF7E2670),
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),

      // Buttons
      btnOkText: "accept".tr(),
      btnCancelText:"decline".tr(),

      btnOkOnPress: () {
        val = 1;
        // TODO: Save acceptance logic
      },

      btnCancelOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }
  changeValueOfRadioBTN(value, context) {
    if (val == 0) {
      val = 1;
    } else {
      val = 0;
    }
    emit(RegisterInitial());
  }
  Future<void> register(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    if(val == 0){
      showPrivacyTermsDialog(context);
      return;
    }
    emit(RegisterLoading());

    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final name = nameController.text.trim();

      AuthModel? authData = await AuthServices(ApiService()).signingUp(email, password, name);
      if (authData == null|| authData.success == false) {
        emit(RegisterError(authData?.message ?? "Login failed. Try again"));
        return;
      }else  {
        // Save token to storage
        await StorageLocalDataSource.instance.setUserToken(authData.data!.token!);
        emit(RegisterSuccess(authData.data!.token!));

        // Navigate to the home screen

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen(),    settings: const RouteSettings(name: "HomeScreen"),
        ),
              (route) => false,
        );

        return;
      }



    } catch (e) {
      emit(RegisterError("Login failed. Try again"));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
