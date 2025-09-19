import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils.dart';
import 'package:flutter_application_1/provider/fake_provider.dart';
import 'package:provider/provider.dart';

class FakeDataPage extends StatefulWidget {
  const FakeDataPage({super.key});

  @override
  State<FakeDataPage> createState() => _FakeDataPageState();
}

class _FakeDataPageState extends State<FakeDataPage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    final provider = Provider.of<FakeProvider>(context, listen: false);
    Future.delayed(Duration.zero, () async{
      await provider.fetchItems();
    });
  }

  @override
  Widget build(BuildContext context) {
        final provider = Provider.of<FakeProvider>(context, listen: false);
    return 
    Scaffold(
      appBar: AppBar(title: Text("Fake Data Page")),
      body: 
    Consumer<FakeProvider>(
       builder: (context, value, child) => Stack(
        children: [
          resposeHandler(),
      value.getDataStatus==Utils.success? 
          SingleChildScrollView(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(title: Text('Item $index'));
              },
              itemCount: 20,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ):Center(child: Text("No data found"))
      
        ],
      ),
    )
    );
  }

  resposeHandler() {
    final provider = Provider.of<FakeProvider>(context);
    if (provider.getDataStatus == Utils.loading) {
      return CircularProgressIndicator();
    } else {
      return SizedBox();
    }
  }
}
