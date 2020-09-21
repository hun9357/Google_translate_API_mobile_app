import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  String word;
  String def;
  bool isExpanded;
  Item(this.word, this.def) {
    this.isExpanded = false;
  }
}

class MyNote extends StatefulWidget {
  @override
  _MyNoteState createState() => _MyNoteState();
}

class _MyNoteState extends State<MyNote> {
  List<Item> words = [Item('hello', '안녕'), Item('bye', '꺼져')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: TextField(
                //controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            _buildPanel()
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          words[index].isExpanded = !isExpanded;
        });
      },
      children: words.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.word),
            );
          },
          body: ListTile(
              title: Text(item.def),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  words.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
