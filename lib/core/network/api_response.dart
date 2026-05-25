class ApiResponse<T> {
  final bool success;
  final String? message;
  final T data;

  const ApiResponse({
    required this.success,
    this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ApiResponse(
      success: json['success'] as bool? ?? true,
      message: json['message'] as String?,
      data: fromJsonT(json['data']),
    );
  }
}
