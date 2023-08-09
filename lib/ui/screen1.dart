import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/bloc/instagram_bloc.dart';
import 'package:instagram/repositry/modelclass/Instagrammodel.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

late Instagrammodel insta;
TextEditingController a = TextEditingController();

class _screen1State extends State<screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Instagram",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.purpleAccent),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Container(
                height: 50,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        child: Container(
                          height: 50,
                          width: 290,
                          child: TextFormField(
                            controller: a,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hintText: "url",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF65656B),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                      ),
                    ])),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 120),
            child: GestureDetector(
                onTap: () {
                  BlocProvider.of<InstagramBloc>(context)
                      .add(Fetchinsta(message: a.text));
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      "click here",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "caros",
                          color: Colors.pink),
                    ),
                  ),
                )),
          ),
          BlocBuilder<InstagramBloc, InstagramState>(builder: (context, state) {
            if (state is InstagramLoading) {
              return const Center(
                child: Text("loding"),
              );
            }
            if (state is InstagramError) {
              return RefreshIndicator(
                onRefresh: () async {
                  // return BlocProvider.of<ChatblocBloc>(context).add(FetchChat());
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .9,
                      // color: Colors.red,
                      child: const Center(
                          child: Text('Oops something went wrong'))),
                ),
              );
            }
            if (state is InstagramLoaded) {
              insta = BlocProvider.of<InstagramBloc>(context).instagrammodel;
              return Padding(
                padding: EdgeInsets.only(top: 35, left: 15),
                child: Container(
                  height: 450,
                  width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color:Colors.white),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.white,
                        child: Image.network("${insta.thumbnail.toString()}",fit: BoxFit.fill,)
                      ),
                      Container(
                        height: 100,
                        width: 330,
                        child: Text("${insta.media.toString()}"),
                      ),
                      Container(
                        height: 100,
                        width: 330,
                        child: Text("title : ${insta.title.toString()}"),
                      ),
                      Container(
                        height: 50,
                        width: 330,
                        child: Text(" ${insta.type.toString()}"),
                      ),
                    ],
                  ),
                ),
              );
            }else{return SizedBox();}
          }
          )
        ],
      ),
    );
  }
}
