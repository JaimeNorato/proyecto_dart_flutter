import 'package:flutter/material.dart';
import 'package:proycto_dart_flutter/src/api/api.dart';
import 'package:proycto_dart_flutter/src/models/photos.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final API api=API();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: api.getPhotos(),
        builder: (BuildContext context,AsyncSnapshot<List<Photos>> snapshot){
          if(snapshot.hasData && snapshot.connectionState==ConnectionState.done){
            return ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(snapshot.data[index].thumbnailUrl),
                      ),
                      title: Text(snapshot.data[index].id.toString()),
                      subtitle: Text("Descripcion del albun ${snapshot.data[index].id}"),
                    ),
                  );
                }
            );
          }else{
            return Center(child:CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class CustomGradientButton extends StatelessWidget {
  final Text text;
  final double width;
  final double height;
  final List<Color> gradientColors;
  final Alignment initialPosition;
  final Alignment finalPosition;
  final Function function;
  final Icon leadingIcon;
  final Icon finalIcon;

  const CustomGradientButton(
      {Key key,
      @required this.text,
      @required this.width,
      @required this.height,
      @required this.gradientColors,
      @required this.initialPosition,
      @required this.finalPosition,
      @required this.function,
      this.leadingIcon,
      this.finalIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(height/2),topLeft: Radius.circular(height/2),bottomLeft: Radius.circular(height/2),bottomRight: Radius.circular(height/2)),
            gradient: LinearGradient(
                colors: gradientColors,
                begin: initialPosition,
                end: finalPosition),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(2, -2),
                blurRadius: height * .1,
                spreadRadius: 1,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            leadingIcon ?? Container(),
            text,
            finalIcon ?? Offstage()
          ],
        ),
      ),
    );
  }
}
