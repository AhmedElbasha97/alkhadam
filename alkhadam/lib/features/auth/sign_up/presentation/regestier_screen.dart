// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/validation.dart';
import '../../../webview/web_view.dart';
import '../../sign_in/presentation/log_in_screen.dart';
import '../cubit/regestier_cubit.dart';
import '../cubit/regestier_state.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, color: Colors.white),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "register_success".tr(),
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.green.shade600, // Success color
                duration: const Duration(milliseconds: 1500),
                behavior: SnackBarBehavior.floating, // For a cleaner look
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );

          }
          if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.white),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.red.shade600, // Error color
                duration: const Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = RegisterCubit.get(context);

          return Scaffold(
            backgroundColor: const Color(0xFFF8F1FA),

            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
              
                      /// LOGO
                      Center(
                        child: Image.asset(
                          "assets/logo with out background.png",
                          height: 130,
                        ),
                      ),
              
                      const SizedBox(height: 20),
              
                      /// TITLE
                       Text(
                        "register_title".tr(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7E2670),
                        ),
                      ),
              
                      const SizedBox(height: 30),
              
                      /// FORM CARD
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: cubit.nameController,
                                validator: Validation.validateName,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  errorMaxLines: 3, // <-- Allow multiple lines for errors

                                  labelText:"full_name_label".tr(),
                                  prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF7E2670)),
                                  border: OutlineInputBorder(

                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF7E2670),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: cubit.emailController,
                                validator: Validation.validateEmail,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  errorMaxLines: 3, // <-- Allow multiple lines for errors

                                  labelText: "email_label".tr(),
                                  prefixIcon: const Icon(Icons.email_outlined ,color: Color(0xFF7E2670)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF7E2670),
                                  ),
                                ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: cubit.passwordController,
                                obscureText: cubit.showPassword,
                                keyboardType: TextInputType.visiblePassword,
                                validator: Validation.validatePassword,
                                decoration: InputDecoration(
                                  errorMaxLines: 3, // <-- Allow multiple lines for errors

                                  labelText: "password_label".tr(),
                                  prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF7E2670)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    cubit.showPassword
                                        ? Icons.visibility_off:Icons.visibility,
                                    color: const Color(0xFF7E2670),
                                  ),
                                  onPressed: () => cubit.showingPassword(),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF7E2670),
                                  ),
                                ),
                                ),
                              ),
                              const SizedBox(height: 20),
              
                              Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    fillColor: MaterialStateProperty.all<Color>(const Color(0xFF7E2670)),
              
                                    groupValue: cubit.val,
                                    onChanged: (value) {
                                      cubit.changeValueOfRadioBTN(value,context);
                                    },
                                    toggleable: true,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "readAppPolicyAndTerms".tr(),  style:  const TextStyle(
              
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>  const WebViewContainer( "https://alkhadam.net/qa/ar/page/3/mobile"),
                                                  settings: const RouteSettings(name: "webView"),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "privacyPolicy".tr(),
                                              style:  const TextStyle(
              
                                                  color: Color(0xFF7E2670),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Text(
                                            "and".tr(),  style:  const TextStyle(
              
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),),
              
                                        ],
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>  const WebViewContainer( "https://alkhadam.net/qa/ar/page/10/mobile"),
                                              settings: const RouteSettings(name: "webView"),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "termsAndCondition".tr(),
                                          style:  const TextStyle(
              
                                              color: Color(0xFF7E2670),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
              
                              const SizedBox(height: 25),
              
                              state is RegisterLoading
                                  ? Container(
                                  decoration: const BoxDecoration( color:  Color(0xFF7E2670), shape: BoxShape.circle ),
                                  child: const Padding( padding: EdgeInsets.all(8.0),
                                    child: Center( child: CircularProgressIndicator(color: Colors.white, ), ),)
                              )
                                  : ElevatedButton(
                                onPressed: () => cubit.register(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF7E2670),
                                  minimumSize: const Size(double.infinity, 55),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child:  Text(
                                  "register_title".tr(),
                                  style: const TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("have_account_prompt".tr(),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                                settings: const RouteSettings(name: "LoginScreen"),),
                            ),
              
                            child:  Text(
                              "login_title".tr(),
                              style: const TextStyle(
                                color: Color(0xFF7E2670),
                                fontSize: 16,
                              ),
                            ),
                          ),

                        ],
                      ),
              
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
