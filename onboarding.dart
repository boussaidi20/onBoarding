import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  List<PageModel> pages;

  void _addPages(){
    pages = List<PageModel>();
    pages.add(PageModel("assets/large1.jpg", "0-Text messaging, or texting, is the act of composing and sending electronic messages,", "Welcome", Icons.ac_unit));
    pages.add(PageModel("assets/large2.jpg", "1-Text messaging, the act of composing and sending electronic messages,", "Alarm",  Icons.access_alarm ));
    pages.add(PageModel("assets/large3.jpg", "2-Text messaging, or texting, is the act of composing and sending electronic messages,", "Map", Icons.map));
    pages.add(PageModel("assets/large4.jpg", "3-or texting, is the act of composing and sending electronic messages,", "circle", Icons.account_circle ));

  }

  @override
  Widget build(BuildContext context) {

    _addPages();
    return Stack(
      children: <Widget>[
        Scaffold(

          body: PageView.builder(
              itemBuilder: (context, index){
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(
                            pages[index]._images,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            pages[index]._icon,
                            size: 100,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            pages[index]._name,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            pages[index]._description,
                            style: TextStyle(fontSize: 18, color: Colors.white,
                            ),
                            textAlign: TextAlign.center,

                          ),
                        ],

                      ),



                  ],

                );

              },
            itemCount: pages.length,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 19,),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.red.shade800,
                child: Text("Get Started",
                  style: TextStyle(fontSize: 20, color: Colors.white,),
                ),
                onPressed: () {},

              ),
            ),
          ),
        ),

      ],


    );


  }

}

class PageModel {
  String _images;
  String _name;
  String _description;
  IconData _icon;

  PageModel(this._images, this._description, this._name, this._icon );

  IconData get icon => _icon;

  String get description => _description;

  String get name => _name;

  String get images => _images;
}