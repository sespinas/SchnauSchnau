import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'slider_settings.dart';

class ParsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //   title: const Text('Cat Facts!!'),
      // ),
      body: ParsingWidget(),
    );
  }
}

class ParsingWidget extends StatefulWidget {
  int? passedTime = 5;
  ParsingWidget({Key? key, this.passedTime}) : super(key: key);

  @override
  _ParsingWidgetState createState() => _ParsingWidgetState();
}

class _ParsingWidgetState extends State<ParsingWidget> {
  List<String?> imageList = ['static/0.jpeg'];

  void _getData() async {
    final response = await http.Client().get(
        Uri.parse('https://schnau-schnau-images.herokuapp.com/get-images'));
    // Uri.parse(
    //     'https://web.engr.oregonstate.edu/~espinass/schnauschnau.html'));
    dom.Document document = parser.parse(response.body);
    final elements = document.getElementsByTagName('img');

    setState(() {
      imageList = elements.map((element) => element.attributes['src']).toList();
      // imageList = elements;
    });
    print(imageList);
    print(elements);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Refresh Slideshow!'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getData();
            },
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: imageList.length,
      //   itemBuilder: (context, index) {
      //     return Image.network(
      //       'https://web.engr.oregonstate.edu/~espinass/' + imageList[index]!,
      //       height: 200.0,
      //     );
      //   },
      // ),
      body: Container(
        // margin: EdgeInsets.all(15),
        child: CarouselSlider.builder(
          itemCount: imageList.length,
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: 1000,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: widget.passedTime ?? 5),
            reverse: false,
            viewportFraction: 1,
            // aspectRatio: 5.0,
          ),
          itemBuilder: (context, i, id) {
            //for onTap to redirect to another screen
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://schnau-schnau-images.herokuapp.com/' +
                                imageList[i]!),
                        fit: BoxFit.cover)
                    // borderRadius: BorderRadius.circular(15),
                    //     border: Border.all(
                    //   color: Colors.white,
                    // )),
                    //ClipRRect for image border radius
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(15),
                    //   child: Image.network(
                    //     'https://web.engr.oregonstate.edu/~espinass/' +
                    //         imageList[i]!,
                    //     // width: 500,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    ),
              ),
              onTap: () {
                var url = imageList[i];
                print(url.toString());
              },
            );
          },
        ),
      ),
    );
  }
}
