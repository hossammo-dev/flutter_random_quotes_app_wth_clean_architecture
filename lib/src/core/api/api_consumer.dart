abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? params});
  Future<dynamic> post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? params});
  Future<dynamic> put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? params});
  Future<dynamic> delete(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? params});
}
