
 import 'package:ui_sample/model.dart';

abstract class SecondScreenState{}

 class Loading extends SecondScreenState{}

 class Data extends SecondScreenState{
  List<Movies> movieList;
  Data(this.movieList);
 }