import 'package:aveosoft_test/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getPaymentTransactions returns a map with payments key', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://127.0.0.1:8085'));
    final api = Api(dio);

    final data = await api.getPaymentTransactions();

    expect(data.containsKey('payments'), true);
    expect(data['payments'], isA<List>());
  });
}
