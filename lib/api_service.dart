import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  // Base URL for your API
  // TODO: Replace with your actual NextJS project URL (e.g., http://localhost:3000 for local development)
  final String baseUrl =
      'http://10.0.2.2:3000'; // Change this to your actual server URL

  ApiService() {
    // Set up Dio options
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // Add interceptors for logging (optional)
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  // Method to make a GET request
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      // Handle Dio specific errors
      _handleError(e);
      rethrow;
    } catch (e) {
      // Handle other errors
      throw Exception('An unexpected error occurred: $e');
    }
  }

  // Method to fetch categories from your NextJS endpoint
  Future<Map<String, dynamic>> fetchCategories() async {
    try {
      final data = await get('/api/mobile-app/categories');
      return data as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  // Example method to fetch data from a specific endpoint
  Future<List<dynamic>> fetchPosts() async {
    try {
      final data = await get('/posts');
      return data as List<dynamic>;
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
  }

  // Error handling method
  void _handleError(DioException e) {
    String errorMessage = 'Unknown error occurred';

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timeout';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout';
        break;
      case DioExceptionType.badResponse:
        errorMessage = 'Bad response: ${e.response?.statusCode}';
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request was cancelled';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Connection error';
        break;
      default:
        errorMessage = 'Error: ${e.message}';
    }

    print('API Error: $errorMessage');
  }
}
