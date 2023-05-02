import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/auth_service.dart';

part 'reset_pass_controller.g.dart';

@riverpod
class ResetPassController extends _$ResetPassController {
  ResetPassController();

  @override
  bool build() {
    return false;
  }

  Future<void> resetPass(String email) async {
    state = true;

    await ref.read(authServiceProvider).resetPass(email);

    state = false;
  }

  void endProcess() {
    state = false;
  }
}
