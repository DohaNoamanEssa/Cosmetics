import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GrowfetVediosView extends StatefulWidget {
  const GrowfetVediosView({super.key});

  @override
  State<GrowfetVediosView> createState() => _GrowfetVediosViewState();
}

class _GrowfetVediosViewState extends State<GrowfetVediosView> {
  List <VedioModel>? list;

  Future getData() async {
    final resp = await Dio().get("https://www.googleapis.com/drive/v3/files?q=%271m-LEUh_kP-ykn1vHNsGGjkcPOH-aPmae%27+in+parents+and+mimeType+contains+%27video%27&key=AIzaSyCK64Ze7awjzb22n7CJDIbsS6nYpLR_R0s");
   list=VediosData.fromJson(resp.data).list;
   setState(() {

   });

  }



  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Growfet Vedios")),
      body:list==null?Center(child: CircularProgressIndicator(),): ListView.separated(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) => ListTile(title: Text(list![index].name)),
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: list!.length,
      ),
    );
  }
}


class VediosData {

  late final List<VedioModel> list;
  late final String kind;
  late final bool incompleteSearch;

  VediosData.fromJson(Map<String, dynamic> json){
    list = List.from(json['files']?? []).map((e)=>VedioModel.fromJson(e)).toList();
    kind = json['kind']??"";
    incompleteSearch = json['incompleteSearch']??false;
  }


}

class VedioModel {

  late final String kind;
  late final String id;
  late String name;
  late final String mimeType;

  VedioModel.fromJson(Map<String, dynamic> json){
    kind = json['kind']??"";
    id = json['id']??"";
    name = json['name']??"";


    final splits=name.split(".");
       splits.removeLast();
     name=splits.join("");
name=name.replaceAll("_", " ");
name=name.split(" ").map((e) => e.replaceAll(e[0], e[0].toUpperCase())).toList().join(" ");


    mimeType = json['mimeType']??"";
  }


}