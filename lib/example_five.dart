import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/models/product_model.dart';

class ExampleFive extends StatefulWidget {
  const ExampleFive({Key? key}) : super(key: key);

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  var data;
  Future<ProductModel> getProductApi() async {
    final response = await http.get(Uri.parse(
        'https://api.github.com/repos/tidyverse/ggplot2/git/trees/cd4aa0ba19dbbc26d5fcd03899f28afbc1cc6eda'));

    data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(children: [
        Expanded(
            child: FutureBuilder<ProductModel>(
                future: getProductApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.tree!.length,
                        itemBuilder: (context, index) {
                          
                          return Column(
                            children: [
                              ListTile(
                                  title: Text('Title: ' +
                                      snapshot.data!.sha.toString()),
                                  subtitle: Text('Subtitle: ' +
                                      snapshot.data!.tree![index].path
                                          .toString())),
                            ],
                          );
                        });
                  } else {
                    return Text('Loading');
                  }
                }))
      ]),
    );
  }
}
