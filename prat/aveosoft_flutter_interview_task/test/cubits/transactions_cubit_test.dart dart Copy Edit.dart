import 'package:aveosoft_test/api.dart';
import 'package:aveosoft_test/di/ab_injector.dart';
import 'package:aveosoft_test/modules/transactionsPage/cubit/transactions_cubit.dart';
import 'package:aveosoft_test/modules/transactionsPage/cubit/transactions_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionsCubit', () {
    test('initial state is not loading and no error', () {
      final cubit = TransactionsCubit(api: ABInjector.I<Api>());
      expect(cubit.state.isLoading, false);
      expect(cubit.state.errorLoading, false);
    });

    test('loadInitialTransactions emits loading then not loading', () async {
      final cubit = TransactionsCubit(api: ABInjector.I<Api>());

      await cubit.loadInitialTransactions();

      expect(cubit.state.isLoading, false);
    });
  });
}
