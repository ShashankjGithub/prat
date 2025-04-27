import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modal/dataModal.dart';
import 'loginEvent.dart';
import 'loginResponse.dart';
import 'loginState.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final result = await repository.login(event.email, event.password);
        emit(LoginSuccess(dataModalFromJson(result.toString()).data!));
      } catch (e) {
        emit(LoginFailure(e.toString().replaceFirst("Exception: ", "")));
      }
    });
  }
}
