import 'package:flutter/material.dart';
import 'package:new_movies_app/api/api_manager.dart';
import '../../api/model/LatestMoviesResponse.dart';
import '../../api/model/MoviesPopularResponse.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  static const String routeName='home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121312),
     // appBar: AppBar(title: const Text('Movies App'),),
      body:Column(
        children: [
          SizedBox(height: 30),
          FutureBuilder<MoviesPopularResponse>(
              future:ApiManager.getMoviesPopular(),
              builder:(buildContext,snapShot){
                if(snapShot.hasError){return Center(child: Text(snapShot.error.toString()));
                }else if(snapShot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());}
                var data=snapShot.data;
                if (data?.success ==false){
                  return Center(child: Text('${data?.message}'));}
                var movies=data?.results;
                return Expanded(
                  child: ListView.builder(itemBuilder: (_,index){return
                    Image.network('https://image.tmdb.org/t/p/w500${movies![index].posterPath}'
                    );
                  },itemCount: movies?.length ?? 0,scrollDirection: Axis.horizontal,),
                );
              }),
          FutureBuilder<LatestMoviesResponse>(
              future:ApiManager.getMoviesLatest(),
              builder:(buildContext,snapShot){
                if(snapShot.hasError){return Center(child: Text(snapShot.error.toString()));
                }else if(snapShot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());}
                var data=snapShot.data;
                if (data?.success ==false){
                  return Center(child: Text('${data?.message}'));}
                var movies=data?.posterPath;
                return Expanded(
                  child: ListView.builder(itemBuilder: (_,index){return
                    Image.network('https://image.tmdb.org/t/p/w500${movies![index]}'
                    );
                  },itemCount: movies?.length ?? 0,scrollDirection: Axis.horizontal,),
                );
              }),

          SizedBox(height: 200),
        ],
      ) ,
    );
  }
}
