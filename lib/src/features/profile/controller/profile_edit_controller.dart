import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/user_service.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/data_model/edit_profile_state.dart';

part 'profile_edit_controller.g.dart';

@riverpod
class ProfileEditController extends _$ProfileEditController {
  Uint8List? uint8List;

  @override
  Future<EditProfileState> build() async {
    return EditProfileState(
      uint8List: uint8List,
      user: await getUser(),
    );
  }

  Future<User?> getUser() async {
    final userId = ref.read(firebaseAuthProvider).currentUser!.uid;
    return await ref.read(userServiceProvider.notifier).getUser(userId: userId);
  }

  Future<void> updateUser({
    required String userId,
    required String userName,
    required Uint8List? uint8list,
  }) async {
    String? userIcon;
    User? user =
        await ref.read(userServiceProvider.notifier).getUser(userId: userId);
    if (user == null) return;

    user = user.copyWith(userName: userName);

    if (uint8List != null) {
      userIcon = await ref.read(userServiceProvider.notifier).updateUserIcon(
            userId: userId,
            uint8List: uint8List!,
          );
      user = user.copyWith(userIcon: userIcon);
    }

    await ref.read(userServiceProvider.notifier).updateUser(user: user);
  }

  Future<void> pickImage() async {
    uint8List = await ref.read(userServiceProvider.notifier).pickImage();
    if (uint8List != null) {
      state = AsyncValue.data(state.value!.copyWith(uint8List: uint8List!));
    }
  }
}
