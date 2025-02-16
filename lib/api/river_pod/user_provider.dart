import 'dart:async';
import 'package:automatedcountingapp/api/user_api/user_api.dart';
import 'package:automatedcountingapp/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetUsersProvider extends AutoDisposeAsyncNotifier<List<UserModel>?> {
  @override
  Future<List<UserModel>?> build() async {
    return getAllUsers();
  }

  Future<List<UserModel>?> getAllUsers() async {
    final userApi = ref.read(userApiProvider);
    try {
      state = const AsyncLoading();

      final response = await userApi.getUser();

      if (response.isEmpty) {
        state = AsyncError("No users found", StackTrace.current);
        return null;
      }

      state = AsyncData(response);
      return response;
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      return null;
    }
  }
}

final getUsersProvider =
    AutoDisposeAsyncNotifierProvider<GetUsersProvider, List<UserModel>?>(
        GetUsersProvider.new);
