import 'package:aveosoft_test/api.dart';
import 'package:aveosoft_test/di/ab_injector.dart';
import 'package:aveosoft_test/modules/transactionsPage/cubit/transactions_state.dart';
import 'package:aveosoft_test/modules/transactionsPage/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aveosoft_test/modules/transactionsPage/cubit/transactions_cubit.dart';

void main() {
  testWidgets('TransactionsPage shows loading indicator',
          (WidgetTester tester) async {
        final cubit = TransactionsCubit(api: ABInjector.I<Api>());
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: cubit..loadInitialTransactions(),
              child: const TransactionsPage(),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

  testWidgets('TransactionsPage shows retry on error',
          (WidgetTester tester) async {
        final cubit = TransactionsCubit(api: ABInjector.I<Api>());
        cubit.emit(const TransactionsState(errorLoading: true,));

        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: cubit,
              child: const TransactionsPage(),
            ),
          ),
        );

        expect(find.text('Retry'), findsOneWidget);
      });
}
