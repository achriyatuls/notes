import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginsaja/home_page.dart';

class AddEditPage extends StatefulWidget {
  final List list;
  final int index;
  AddEditPage({this.list, this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController judul = TextEditingController();
  TextEditingController isi = TextEditingController();

  bool editMode = false;

  addUpdateData() {
    if (editMode) {
      var url = 'http://192.168.54.33/flutter_notes/edit.php';
      http.post(url, body: {
        'id': widget.list[widget.index]['id'],
        'judul': judul.text,
        'isi': isi.text,
      });
    } else {
      var url = 'http://192.168.54.33/flutter_notes/add.php';
      http.post(url, body: {
        'judul': judul.text,
        'isi': isi.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      judul.text = widget.list[widget.index]['judul'];
      isi.text = widget.list[widget.index]['isi'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? 'Update' : 'Add Data'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: judul,
              decoration: InputDecoration(
                labelText: 'Judul ',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: isi,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Isi Notes',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  addUpdateData();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
                debugPrint('Clicked RaisedButton Button');
              },
              color: Colors.orangeAccent,
              child: Text(
                editMode ? 'Update' : 'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
