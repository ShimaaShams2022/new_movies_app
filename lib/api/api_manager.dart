import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_movies_app/api/model/MoviesPopularResponse.dart';
import '';
class ApiManager{
  //https://api.themoviedb.org/3/movie/popular?api_key=6ca5871b987ab5c050fd3329606a605b&language=en-US&page=1
  static const String BASE_URL='api.themoviedb.org';
  static const String API_KEY='6ca5871b987ab5c050fd3329606a605b';

static Future<MoviesPopularResponse>getMoviesPopular()async{
  var uri=Uri.https(BASE_URL, '/3/movie/popular',
      {'api_key':API_KEY,'language':'en-US','page':'1'});
  var response=await http.get(uri);
  var json=jsonDecode(response.body);
  MoviesPopularResponse popularMoviesResponse=MoviesPopularResponse.fromJson(json);
  return popularMoviesResponse;

}


}