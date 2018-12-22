import 'package:flutter/material.dart';
import 'package:flutter_foodonline/data/repo/FirestoreProductRepository.dart';
import 'package:flutter_foodonline/domian/data/entity/ProductEntity.dart';
import 'package:flutter_foodonline/domian/data/input/GetProductsInput.dart';
import 'package:flutter_foodonline/domian/service/ProductServiceImpl.dart';

void main() => runApp(SampleApp());

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List<ProductEntity> widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foodee"),
      ),
      body: getBody(),
    );
  }

  showLoadingDialog() {
    return widgets.length == 0;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getDialogProgress();
    } else {
      return getListView();
    }
  }

  getListView() {
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      },
    );
  }

  getRow(int position) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("${widgets[position].name}"),
        ),
        Divider(
          height: 2.0,
        ),
      ],
    );
  }

  getDialogProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  loadData() async {
    var repo = FirestoreProductRepository();
    var service = ProductServiceImpl(productRepository: repo);
    var input = GetProductsInput(10);
    var products = await service.gets(input);
    setState(() {
      widgets.addAll(products);
    });
  }
}
