
 import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_sample/bloc/second_event.dart';
import 'package:ui_sample/bloc/second_state.dart';

import '../model.dart';

class SecondScreenBloc extends Bloc<SecondScreenEvent,SecondScreenState>{

  SecondScreenBloc() : super(Loading()) {
    on<LoadData>(loadData);
  }
  loadData(LoadData event , Emitter<SecondScreenState> state)async{
   emit(Loading());
   try{
    final response = await Dio().get('https://www.whats-on-netflix.com/wp-content/plugins/whats-on-netflix/json/alldocs.json?_=1700718031139');
    List<Movies> movieList = [];
     final  res = response.data as List<dynamic>;
     res.forEach((elemet){
       final item =  Movies.fromMap(elemet as Map<String , dynamic>);
       movieList.add(item);
     });
    emit(Data(movieList));
   }catch(error){
     print(error);
   }
  }
}