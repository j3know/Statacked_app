import 'package:dio/dio.dart';
import 'package:stacked_2/model/user_model.dart';

class UsersService {
  final _dio = Dio();

  Future<List<User>> fetchUserData() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/users');
    //final response = await http.get(Uri.parse('http://10.0.2.2:3001/api'));
    if (response.statusCode == 200) {
      final List<dynamic> data = (response.data);
      return data.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
