import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Sulley.png"),
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app),)
        ],
        title: Text('Home'), backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: ()=>Navigator.pushNamed(context, '/cadastro'),
          child: Icon(Icons.add),
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.deepPurple,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.home, size:25, color: Colors.white,)),
              IconButton(onPressed: ()=>Navigator.pushNamed(context, '/listaweb'),
                  icon: Icon(Icons.star, size:25, color: Colors.white)),
              SizedBox(width: 15,),
              IconButton(onPressed: (){}, icon: Icon(Icons.save, size:25, color: Colors.white)),
              IconButton(onPressed: ()=>Navigator.pushNamed(context, '/lista'),
                  icon: Icon(Icons.person, size:25, color: Colors.white)),

            ],
          ),
        ),
      ),
    );
  }
}
