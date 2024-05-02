import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/add_page.dart';
import 'package:provider_example/edit_page.dart';

import 'state.dart';

class Homepage extends StatelessWidget {
const Homepage({ super.key });

  @override
  Widget build(BuildContext context){
    var tasks = context.watch<NoteBook>().words;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(index)));
            }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}