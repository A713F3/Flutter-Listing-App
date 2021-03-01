import 'package:flutter/material.dart';

class Note{
  String text;
  String amount;

  Note({this.text, this.amount});
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final ingredientController = TextEditingController();
  final amountController = TextEditingController();

  addNoteDialog(BuildContext context){
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Add Note"),
        //insetPadding: EdgeInsets.all(50.0),
        content:  Column(
          children: [
            TextFormField(
              controller: ingredientController,
              style: TextStyle(
                fontSize: 25.0,
              ),
              decoration: InputDecoration(
                labelText: "Ingredient",
              ),
            ),

            TextFormField(
              controller: amountController,
              style: TextStyle(
                fontSize: 25.0,
              ),
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),

            SizedBox(height: 20.0,),

            RaisedButton(
                color: Colors.blue,

                onPressed: () {
                  print("Pressed");
                  print(ingredientController.text);
                  print(amountController.text);

                  setState(() {
                    notes.add(Note(
                      text: ingredientController.text,
                      amount: amountController.text,
                    ));
                    Navigator.pop(context);
                    ingredientController.clear();
                    amountController.clear();
                  });

                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)
                )
            ),
          ],
        ),

        actions: [
        ],

      );
    });

  }

  List<Note> notes = [
    Note(text:"Ürün1", amount: "Miktar1"),
    Note(text:"Ürün2", amount: "Miktar2"),

  ];


  Widget NoteTemplate(note){
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),

        color: Colors.blue,

        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.all(15.0),

                  child: Column(
                    children: [
                      Text(
                        "${note.text}",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          color: Colors.grey[100],
                        ),
                      ),

                      Divider(height: 15.0, color: Colors.black,),

                      Text(
                        "${note.amount}",
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 1.0,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      notes.remove(note);
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.blue[900],
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: notes.map((note) => NoteTemplate(note)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          //Navigator.pushNamed(context, '/addnote');
          addNoteDialog(context);
        },
        child: Icon(Icons.add, size: 40.0,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
