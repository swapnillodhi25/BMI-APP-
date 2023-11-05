import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your BMI',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController =TextEditingController();
  var ftController =TextEditingController();
  var inController =TextEditingController();


  var result="";
  var bgcolor =  Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME TO BODY MASS INDEX !!'),
      ),




      body: Container(
        color:bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/bmi1.png',height: 210,width: 210,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text(' Enter  Your Weight(Kgs)', style: TextStyle(
                      fontSize: 21,fontWeight: FontWeight.w500),),
                    prefixIcon: Image.asset('assets/image/w2.png',height: 0, width: 10,)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height:21),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text(' Enter  Your Height( in ft)',style: TextStyle(
                          fontSize: 21,fontWeight: FontWeight.w500),),
                      prefixIcon: Image.asset('assets/image/hi3.png',height: 0, width: 10,)
                  ),
                  keyboardType: TextInputType.number,
                ),


                SizedBox(height:11),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text(' Enter  Your Height( in inch)',style: TextStyle(
                          fontSize: 19,fontWeight: FontWeight.w500),),
                      prefixIcon: Image.asset('assets/image/hi3.png',height: 0, width: 10,)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height:16),
               ElevatedButton(onPressed: (){

                 var wt= wtController.text.toString();
                 var ft= ftController.text.toString();
                 var inch = inController.text.toString();



                 if(wt!="" && ft!="" && inch!="") {
                   var iwt =int.parse(wt);
                   var iFt =int.parse(ft);
                   var iInch =int.parse(inch);
                   var tInch = (iFt*12) + iInch;

                   var tcm = tInch*2.54;
                   var tmeter = tcm/100;

                   var bmi = iwt/(tmeter*tmeter);

                   var msg ='';
                   if(bmi>25){
                     msg = " You have a higher than normal body weight. Try to exercise more.";
                     bgcolor = Colors.red.shade200;
                   }else if(bmi>18){
                     msg = "You have a normal body weight. Good job!";
                     bgcolor = Colors.green.shade200;
                   }else{
                     msg = "   You have a lower than normal body weight. You can eat a bit more.";
                     bgcolor = Colors.orange.shade200;
                   }

                   setState(() {
                     result = "$msg\n Your BMI is: ${bmi.toStringAsFixed(4)}";
                   });
                 }else{
                   setState(() {
                     result = 'Please fill all the required blanks!!';
                   });
                 }
               }, child: Text('Calculate'),
                 style: ElevatedButton.styleFrom(
                   primary: Colors.white70,
                   elevation: 0,

                 ),
                 ),


                SizedBox(
                  height: 15,
                ),
     Text(result,style:TextStyle(fontSize: 19),)



              ],
            ),
          ),
        ),
      )

    );
  }
}
