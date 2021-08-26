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
        ),
        body: model!.isBusy
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.all(0.0),
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.homeData!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(model.homeData![index]['name'] as String),
                        );
                      }),
                  SizedBox(height: 24),
                  ElevatedButton(
                      onPressed: model.callApi, child: Text('Call api again'))
                ],
              ));
  }
}
