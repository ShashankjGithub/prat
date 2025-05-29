import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aveosoft_test/api.dart';
import 'pending_payments_state.dart';

class PendingPaymentsCubit extends Cubit<PendingPaymentsState> {
  final Api api;
  static const int _pageSize = 20;

  PendingPaymentsCubit({required this.api}) : super(const PendingPaymentsState());

  Future<void> loadInitial() async {
    emit(state.copyWith(isLoading: true, errorLoading: false));
    try {
      final result = await api.pendingPayments(pageNumber: 1, pageSize: _pageSize);
      final payments = (result['payments'] as List).cast<Map<String, dynamic>>();
      emit(state.copyWith(
        isLoading: false,
        payments: payments,
        hasMore: payments.length == _pageSize,
      ));
    } catch (_) {
      emit(state.copyWith(isLoading: false, errorLoading: true));
    }
  }


  Future<void> loadNextPage(int page) async {
    if (state.isLoading || !state.hasMore) return;

    emit(state.copyWith(isLoading: true));
    try {
      final result = await api.pendingPayments(pageNumber: page, pageSize: _pageSize);
      final newPayments = (result['pendingPayments'] as List).cast<Map<String, dynamic>>();
      final allPayments = [...state.payments, ...newPayments];
      emit(state.copyWith(
        isLoading: false,
        payments: allPayments,
        hasMore: newPayments.length == _pageSize,
      ));
    } catch (_) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> refresh() async {
    try {
      final result = await api.pendingPayments(pageNumber: 1, pageSize: _pageSize);
      final payments = (result['pendingPayments'] as List).cast<Map<String, dynamic>>();
      emit(state.copyWith(
        payments: payments,
        hasMore: payments.length == _pageSize,
      ));
    } catch (_) {}
  }
}

