import 'package:alkhadam/core/utils/api_constant.dart';
import 'package:alkhadam/features/auth/data/auth_model.dart';

import '../../features/auth/data/data_model.dart';
import '../../features/profile_screen/data/profile_model.dart';
import '../data/datasources/api_service.dart';

class AuthServices {
  final ApiService api;
  AuthServices(this.api);

  Future<AuthModel?> loggingIn(String? email, String? password) async {
    final resp = await api.post(ApiConstant.loginLink,data: {
      "email": email,
      "password": password,
    });
    final data = resp.data;
    if (data == null) return null;
    return AuthModel.fromJson(data);
  }

  Future<AuthModel?> signingUp(String? email, String? password, String? name) async {
    final resp = await api.post(ApiConstant.regesteirLink,data: {
      "name": name,
      "email": email,
      "password": password,
    });
    final data = resp.data;
    if (data == null) return null;
    return AuthModel.fromJson(data);
  }
  Future<DataModel?> deletingAnAccount() async {
    final resp = await api.get(ApiConstant.deletingLink,);
    final data = resp.data;
    if (data == null) return null;
    return DataModel.fromJson(data);
  }  Future<DataModel?> loggingOut() async {
    final resp = await api.get(ApiConstant.loggingOutLink,);
    final data = resp.data;
    if (data == null) return null;
    return DataModel.fromJson(data);
  }
  Future<ProfileModel?> getProfileData() async {
    final resp = await api.get(ApiConstant.profileLink,);
    final data = resp.data;
    if (data == null) return null;
    return ProfileModel.fromJson(data);
  }
}