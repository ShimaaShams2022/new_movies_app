import 'package:flutter/material.dart';
import 'package:new_movies_app/api/api_manager.dart';
import '../../api/model/MoviesPopularResponse.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  static const String routeName='home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies App'),),
      body:Column(
        children: [
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
                  child: ListView.builder(itemBuilder: (_,index){return Text(movies![index].title?? '');
                  },itemCount: movies?.length ?? 0,),
                );
              }),],) ,);
  }
}
