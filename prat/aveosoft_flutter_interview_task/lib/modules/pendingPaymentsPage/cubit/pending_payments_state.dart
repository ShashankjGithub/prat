class PendingPaymentsState {
  final bool isLoading;
  final bool errorLoading;
  final List<Map<String, dynamic>> payments;
  final bool hasMore;

  const PendingPaymentsState({
    this.isLoading = false,
    this.errorLoading = false,
    this.payments = const [],
    this.hasMore = true,
  });

  PendingPaymentsState copyWith({
    bool? isLoading,
    bool? errorLoading,
    List<Map<String, dynamic>>? payments,
    bool? hasMore,
  }) {
    return PendingPaymentsState(
      isLoading: isLoading ?? this.isLoading,
      errorLoading: errorLoading ?? this.errorLoading,
      payments: payments ?? this.payments,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
