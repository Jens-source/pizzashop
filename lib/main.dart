import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        fontFamily: "Quicksand",
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {


    List<Pizza> pizzaList = [
      Pizza("Pepperoni Pizza", "assets/pepperoni.jpg", 4.5 , "8.50", false),
      Pizza("Polo Pizza", "assets/polo.jpg", 4.5 , "9.50", false),
      Pizza("Gourmet Pizza", "assets/gourmet.jpg", 4.5 , "8.00", false),
    ];

    List<PizzaDetail> pizzaDetailList = [
      PizzaDetail("Pepperoni Pizza", "assets/pepperoni.jpg", 4.5 , "8.50", "Salami, chilli peppers, tomatoes, oregano, basil", "750", "450", "45"),
      PizzaDetail("Polo Pizza", "assets/polo.jpg", 4.5 , "9.50", "Salami, chilli peppers, tomatoes, oregano, basil", "600", "350", "45"),
      PizzaDetail("Gourmet Pizza", "assets/gourmet.jpg", 4.5 , "8.00", "Salami, chilli peppers, tomatoes, oregano, basil", "700", "400", "30"),

    ];


    return new Scaffold(
      backgroundColor: Color.fromRGBO(248, 252, 255, 1),

      body: new Container(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [

            Container(

              child: Text("Choose what you", style: TextStyle(
                fontSize: 25,
                color: Colors.black54
              ),),
            ),

            Container(

              child: Text("want to eat today", style: TextStyle(
                fontSize: 25,
                color: Colors.black
              ),),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(offset: Offset(0, 25),  blurRadius: 40, color: Color.fromRGBO(228, 232, 235, 0.6),)
                ]
              ),
              margin: EdgeInsets.only(top: 20),
              child: ListTile(
                title: Text("Dominos Pizza", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
                leading: Image.asset("assets/dominos.png"),
              ),
            ),


            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: pizzaList.length,
                itemBuilder: (BuildContext context, i){
              return new GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return new Container(
                          child: pizzaDetailList[i],
                        );
                      }
                    )
                  );
                },
                child: pizzaList[i],
              );

            })

          ],
        ),
      ),

    );
  }
}


class Pizza extends StatefulWidget {
  Pizza(this.name, this.image, this.rating, this.cost, this.liked);

  final name;
  final image;
  final rating;
  final cost;
  final liked;



  @override
  _PizzaState createState() => _PizzaState(this.name, this.image, this.rating, this.cost, this.liked);
}

class _PizzaState extends State<Pizza> {
  _PizzaState(this.name, this.image, this.rating, this.cost, this.liked);

  final name;
  final image;
  final rating;
  final cost;
   bool liked;


    @override
    Widget build(BuildContext context) {


      return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(offset: Offset(0, 25),
                  blurRadius: 40,
                  color: Color.fromRGBO(228, 232, 235, 0.6),)
              ]
          ),
          margin: EdgeInsets.only(top: 20),
          child: Stack(
            children: [

              Positioned(
                  right: 10,
                  top: 5,

                  child: IconButton(
                    icon: Icon(Icons.favorite, size: 18,
                        color: liked == true ? Colors.redAccent : Colors.grey),
                    onPressed: () {
                      setState(() {
                        liked = !liked;
                      });

                    },
                  )
              ),

              Positioned(
                right: 10,
                bottom: 5,

                child: Container(
                  height: 30,
                  width: 30,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Colors.redAccent
                  ),

                  child: Center(
                    child: Icon(Icons.add, color: Colors.white70,),
                  ),
                ),
              ),


              Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    child: Image.asset(image.toString()),
                  ),


                  SizedBox(
                    width: 15,
                  ),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text(rating.toString(), style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16
                            ),),
                          ),

                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.star, size: 15, color: Colors.orangeAccent)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        child: Text(name.toString(), style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text("Mixed Pizza", style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text("\$ ${cost.toString()}", style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ),


                    ],
                  ),

                ],
              ),
            ],
          )


      );
    }
  }

  class PizzaDetail extends StatelessWidget {

    PizzaDetail(this.name, this.image, this.rating, this.cost, this.detail, this.calories, this.weight, this.time);

    final name;
    final image;
    final rating;
    final cost;
    final detail;
    final calories;
    final weight;
    final time;



    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(name, style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Colors.black, size: 30,),
            onPressed: (){
              Navigator.of(context).pop();

            },
          ),

          actions: [
            IconButton(
              icon: Icon(Icons.add_shopping_cart, color: Colors.black,),
            )
          ],
        ),

        body: Stack(
          children: [


            
            Positioned(
              top: 100,
              left: 150,
              child: Container(
                height: 400,
              width: 400,
              child: Image.asset(image, scale: 0.3,),
              ),
            ),

        Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("${detail.toString().split(",")[0]},${detail.toString().split(",")[1]},${detail.toString().split(",")[2]}", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 18
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("${detail.toString().split(",")[3]},${detail.toString().split(",")[4]}", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 18
                    ),),
                  ),
                ],
              ),

              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Container(
                    child: Text("\$${cost}", style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    child: Text("Calories", style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    child: Text("${calories} Calories", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    child: Text("Weight", style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    child: Text("${weight} gr", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    child: Text("Delivery", style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    child: Text("${time} min", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
              
              SizedBox(
                height: 30,
              ),
              
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      
                    },
                    
                    child: Container(
                      margin: EdgeInsets.all(3),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.redAccent
                      ),
                      child: Center(
                        child: Text("S", style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),),
                      ),
                    ),
                    
                  ),
                  GestureDetector(
                    onTap: (){

                    },

                    child: Container(
                      margin: EdgeInsets.all(3),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white
                      ),
                      child: Center(
                        child: Text("M", style: TextStyle(
                            color: Colors.black,
                            fontSize: 18
                        ),),
                      ),
                    ),

                  ),
                  GestureDetector(
                    onTap: (){

                    },

                    child: Container(
                      margin: EdgeInsets.all(3),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white
                      ),
                      child: Center(
                        child: Text("L", style: TextStyle(
                            color: Colors.black,
                            fontSize: 18
                        ),),
                      ),
                    ),

                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){

                    },

                    child: Container(
                      margin: EdgeInsets.all(3),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white
                      ),
                      child: Center(
                        child: Text("-", style: TextStyle(
                            color: Colors.black,
                            fontSize: 30
                        ),),
                      ),
                    ),

                  ),
                  GestureDetector(
                    onTap: (){

                    },

                    child: Container(
                      margin: EdgeInsets.all(3),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white
                      ),
                      child: Center(
                        child: Text("2", style: TextStyle(
                            color: Colors.black,
                            fontSize: 18
                        ),),
                      ),
                    ),

                  ),
                  GestureDetector(
                    onTap: (){

                    },

                    child: Container(
                      margin: EdgeInsets.all(3),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.redAccent
                      ),
                      child: Center(
                        child: Text("+", style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),),
                      ),
                    ),

                  ),
                ],
              )
            ],
          ),
        ),
      ])
      );
    }
  }


