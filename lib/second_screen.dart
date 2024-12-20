import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_sample/bloc/second_bloc.dart';
import 'package:ui_sample/bloc/second_event.dart';
import 'package:ui_sample/bloc/second_state.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  @override
  void initState() {
    super.initState();
    context.read<SecondScreenBloc>().add(LoadData());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondScreenBloc,SecondScreenState>(
      builder: (context, state) {
        if(state is Loading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is Data){
        return Scaffold(
        appBar: AppBar(),
        body: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,),
            children: List.generate(state.movieList.length,(index) {
                     final movie = state.movieList[index];

              return GestureDetector(
                child: Container(
                 child: Image.network(movie.imageLandscape)),
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MovieDetailsScreen(name: movie.title,),)
                  );
                },
              );
           }, ),
                
        )
        
        // ListView.builder(
        //     itemCount: state.movieList.length,
        //     itemBuilder: (context, index) {
        //       final movie = state.movieList[index];
        //      return ListTile(title: Text(movie.title));
        //     },
        // ),
      );
        }
        return SizedBox();
      },
    );
  }
}

 class MovieDetailsScreen extends StatelessWidget {
   const MovieDetailsScreen({super.key,required this.name});
   final String name;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title:Text(name) ),
       body: Center(
         child: Text(name),
       ),
     );
   }
 }

