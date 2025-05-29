class PayeesState {
  final bool isLoading;
  final bool errorLoading;
  final List<Map<String, dynamic>> payees;

  const PayeesState({
    this.isLoading = false,
    this.errorLoading = false,
    this.payees = const [],
  });

  PayeesState copyWith({
    bool? isLoading,
    bool? errorLoading,
    List<Map<String, dynamic>>? payees,
  }) {
    return PayeesState(
      isLoading: isLoading ?? this.isLoading,
      errorLoading: errorLoading ?? this.errorLoading,
      payees: payees ?? this.payees,
    );
  }
}
