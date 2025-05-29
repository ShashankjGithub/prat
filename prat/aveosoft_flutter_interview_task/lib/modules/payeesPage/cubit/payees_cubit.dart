import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aveosoft_test/api.dart';
import 'payees_state.dart';

class PayeesCubit extends Cubit<PayeesState> {
  final Api api;

  PayeesCubit({required this.api}) : super(const PayeesState());

  Future<void> loadInitialPayees() async {
    emit(state.copyWith(isLoading: true, errorLoading: false));
    try {
      final result = await api.getPayees();
      final payees = (result['payees'] as List<dynamic>)
          .cast<Map<String, dynamic>>();
      emit(state.copyWith(isLoading: false, payees: payees));
    } catch (_) {
      emit(state.copyWith(isLoading: false, errorLoading: true));
    }
  }

  Future<void> loadNextPage(int page) async {
    try {
      final result = await api.getPayees(pageNumber: page);
      final newPayees = (result['payees'] as List<dynamic>)
          .cast<Map<String, dynamic>>();
      emit(state.copyWith(payees: [...state.payees, ...newPayees]));
    } catch (_) {}
  }

  Future<void> refreshPayees() async {
    try {
      final result = await api.getPayees();
      final payees = (result['payees'] as List<dynamic>)
          .cast<Map<String, dynamic>>();
      emit(state.copyWith(payees: payees));
    } catch (_) {}
  }
}
