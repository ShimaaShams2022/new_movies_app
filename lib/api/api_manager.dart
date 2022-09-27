import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_movies_app/api/model/MoviesPopularResponse.dart';
import 'package:new_movies_app/api/model/RatedMoviesResponse.dart';

import 'model/LatestMoviesResponse.dart';
class ApiManager{

  static const String BASE_URL='api.themoviedb.org';
  static const String API_KEY='6ca5871b987ab5c050fd3329606a605b';

 static Future<MoviesPopularResponse>getMoviesPopular()async{
  //https://api.themoviedb.org/3/movie/popular?api_key=6ca5871b987ab5c050fd3329606a605b&language=en-US&page=1
  var uri=Uri.https(BASE_URL, '/3/movie/popular',
      {'api_key':API_KEY,'language':'en-US','page':'2'});
  var response=await http.get(uri);
  var json=jsonDecode(response.body);
  MoviesPopularResponse popularMoviesResponse=MoviesPopularResponse.fromJson(json);
  return popularMoviesResponse;
}

static Future<LatestMoviesResponse>getMoviesLatest()async{
  //https://api.themoviedb.org/3/movie/latest?api_key=6ca5871b987ab5c050fd3329606a605b&language=en-US
    var uri=Uri.https(BASE_URL, '/3/movie/latest',
        {'api_key':API_KEY,'language':'en-US'});
    var response=await http.get(uri);
    var json=jsonDecode(response.body);
    LatestMoviesResponse latestMoviesResponse=LatestMoviesResponse.fromJson(json);
    return latestMoviesResponse;
  }
  static Future<RatedMoviesResponse>getRatedMovies()async{
    https://api.themoviedb.org/3/movie/top_rated?api_key=6ca5871b987ab5c050fd3329606a605b&language=en-US&page=1
    var uri=Uri.https(BASE_URL, '/3/movie/top_rated',
        {'api_key':API_KEY,'language':'en-US','page':'1'});
    var response=await http.get(uri);
    var json=jsonDecode(response.body);
    RatedMoviesResponse ratedMoviesResponse=RatedMoviesResponse.fromJson(json);
    return ratedMoviesResponse;
  }


}