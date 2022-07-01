import 'package:coba_rest_api/api_service.dart';
import 'package:coba_rest_api/user_model.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  UserModel? _detailUser = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDetailData();
  }

  void _getDetailData() async {
    var _user = (await ApiService().getUser(widget.id));

    setState(() {
      _detailUser = _user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Info'),
      ),
      body: _detailUser == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text('${_detailUser?.id}' ?? "-"),
                Text(_detailUser?.name ?? "-"),
                Text(_detailUser?.username ?? "-"),
                Text(_detailUser?.email ?? "-"),
                Text(_detailUser?.address.city ?? "-"),
                Text(_detailUser?.address.street ?? "-"),
                Text(_detailUser?.address.geo.lat ?? "-"),
                Text(_detailUser?.address.geo.lng ?? "-"),
                Text(_detailUser?.phone ?? "-"),
                Text(_detailUser?.company.name ?? "-"),
                Text(_detailUser?.company.catchPhrase ?? "-"),
                Text(_detailUser?.company.bs ?? "-"),
              ],
            ),
    );
  }
}
