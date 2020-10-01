import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/nodes_data.dart';

class DetailsView extends StatefulWidget {
  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  Future<List<NodesData>> _photoGallary;
  String _baseUrl = "https://www.pinkvilla.com";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _photoGallary = fetchVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<NodesData>>(
              future: _photoGallary,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: GridView.builder(
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        print(
                            'URL_IS>>> ${_baseUrl + snapshot.data[index].gallary.field_photo_image_section}');
                        return FadeInImage(
                          height: 50,
                          width: 50,
                          image: NetworkImage(
                              '${_baseUrl + snapshot.data[index].gallary.field_photo_image_section}'),
                          placeholder: AssetImage('images/ic_launcher.png'),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text(
                    "Please Try again later...",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }

  Future<List<NodesData>> fetchVideo() async {
    var url = _baseUrl + "/photo-gallery-feed-page";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print('Response :  ${json.decode(response.body)}');
      var body = json.decode(response.body);
      var data = body['nodes'] as List;

      return data.map((value) => new NodesData.fromJson(value)).toList();
    } else {
      return null;
    }
  }
}
