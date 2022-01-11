import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/medicine_shop/controller/controller.dart';
import 'package:practice/medicine_shop/widget/tab_4.dart';
import 'package:provider/src/provider.dart';

import '../controller/medicine.dart';

class Tab2 extends StatelessWidget {
  Tab2({Key? key}) : super(key: key);

  //controllers used in update operation UI
  TextEditingController queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Medicine> medicines = context.watch<Controller>().medicines;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: medicines.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == medicines.length) {
                return ElevatedButton(
                  child: const Text('Refresh'),
                  onPressed: () {
                    context.read<Controller>().queryAll();
                    // _refresh();
                  },
                );
              }
              return ListTile(
                title: Text(
                  medicines[index].name,
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: Text((medicines[index].price).toString()),
                trailing: Text(medicines[index].storage.toString()),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text('Editing window'),
                          ),
                          body: Tab4(medicines[index]),
                          floatingActionButton: FloatingActionButton(
                            child: Icon(Icons.update),
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                  );
                  // _editWindow(medicines[index]);
                },
              );
            },
          ),
        ),
        TextField(
          controller: queryController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Medicine Name',
          ),
          onChanged: (text) {
            if (text.length >= 1) {
              context.read<Controller>().query(text);
            } else {
              // _refresh();
              medicines.clear();
            }
          },
        ),
        TextButton(
          onPressed: () {
            context.read<Controller>().queryAll();
          },
          child: Text('${context.read<Controller>().demo}'),
        ),
      ],
    );
  }
}
