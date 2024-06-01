class HomeState {
  final String secretMessage;
  HomeState({
    this.secretMessage = '',
  });
  HomeState copyWith({
    final String? secretMessage,
  }) =>
      HomeState(secretMessage: secretMessage ?? this.secretMessage);
}
