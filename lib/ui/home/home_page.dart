import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ui/home/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => _body(context, model));
  }

  Widget _body(BuildContext context, HomeViewModel? model) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api call using dio setup'),
          actions: [
            IconButton(onPressed: model?.callApi, icon: Icon(Icons.refresh))
          ],
        ),
        body: model!.isBusy
            ? const Center(child: CircularProgressIndicator())
            : model.responseMessage!.isNotEmpty
                ? Center(
                    child: Text(
                    model.responseMessage.toString(),
                    style: TextStyle(color: Colors.black),
                  ))
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.userData!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(model.userData![index]['name'] as String),
                      );
                    }));
  }
}
