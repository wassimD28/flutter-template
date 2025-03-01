class CategoryResponse {
  final String message;
  final String status;
  final String timestamp;

  CategoryResponse({
    required this.message,
    required this.status,
    required this.timestamp,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'timestamp': timestamp,
    };
  }
}
