import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_sample/bloc/second_bloc.dart';
import 'package:ui_sample/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SecondScreenBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body: Column(
        children: [
          Container(
            width: 300,
            //height: 400,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400
              )
            ),
            child: Container(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.shade400
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )

                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3kFN9SvdUUE9C94oHZ2vYl5tPuOUe1ZpExg&s',
                              width: double.maxFinite,fit: BoxFit.fitWidth,),
                            Positioned(
                              right: 0,
                                bottom: 0,
                                child: Image.network('https://banner2.cleanpng.com/20180601/at/avogyupun.webp',width: 20,height: 20)),

                          ],
                        ),

                        const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Delmonte Tomato \n Ketchup Pouch',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),),

                              const Row(
                                children: [
                                  Text('₹ 47',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,)),
                                  SizedBox(width: 10),
                                  Text('₹95',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough
                                    ),),
                                ],
                              ),

                              Text('500g',style: TextStyle(),),
                            ],
                          ),
                        ),


                        Center(
                          child: ElevatedButton(
                              onPressed: (){},
                              child: const Text('Add'),
                              style:const ButtonStyle(
                              fixedSize:WidgetStatePropertyAll(Size(200, 30)) ,
                              backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                             ),

                          ),
                        )

                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        child: Text('Save ₹48',style: TextStyle(color: Colors.purple.shade900,fontSize: 20),),
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        child: Text('51% \n OFF',style: TextStyle(color: Colors.white,fontSize: 20),),
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ) );
  }
}

