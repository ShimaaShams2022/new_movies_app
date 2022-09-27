import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_movies_app/api/api_manager.dart';
import 'package:new_movies_app/api/model/RatedMoviesResponse.dart';
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
          const SizedBox(height: 30),
          // FutureBuilder<LatestMoviesResponse>(
          //     future:ApiManager.getMoviesLatest(),
          //     builder:(buildContext,snapShot){
          //       if(snapShot.hasError){return Center(child: Text(snapShot.error.toString()));
          //       }else if(snapShot.connectionState==ConnectionState.waiting){
          //         return const Center(child: CircularProgressIndicator());}
          //       var data=snapShot.data;
          //       if (data?.success ==false){
          //         return Center(child: Text('${data?.message}'));}
          //       var movies=data?.posterPath;
          //       return
          //         Expanded(
          //           child: Container(
          //             width: double.infinity,
          //             child: Image.network('https://image.tmdb.org/t/p/w500${movies}',fit: BoxFit.fill,)),
          //         );
          //     }),
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

                return Expanded(child: Container(
                    width: double.infinity,
                    child: Image.network('https://image.tmdb.org/t/p/w500${movies![0].posterPath}',fit: BoxFit.fill,)));

              }),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(12.0),
            child: Text('New Releases',style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),),
          ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network('https://image.tmdb.org/t/p/w500${movies![index].posterPath}'
                      ),
                    );
                  },itemCount: movies?.length ?? 0,scrollDirection: Axis.horizontal,),
                );
              }),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(12.0),
            child: Text('Recomended',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
            ),),
          ),
          FutureBuilder<RatedMoviesResponse>(
              future:ApiManager.getRatedMovies(),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network('https://image.tmdb.org/t/p/w500${movies![index].posterPath}'
                      ),
                    );
                  },itemCount: movies?.length ?? 0,scrollDirection: Axis.horizontal,),
                );
              }),



        ],
      ) ,
    );
  }
}
