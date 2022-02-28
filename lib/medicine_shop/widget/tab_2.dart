import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/medicine_shop/controller/medicine_controller.dart';
import 'package:practice/medicine_shop/widget/tab_4.dart';
import 'package:provider/src/provider.dart';

import '../controller/medicine.dart';

class Tab2 extends StatelessWidget {
  Tab2({Key? key}) : super(key: key);

  //controllers used in update operation UI
  TextEditingController queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Medicine> medicines = context.read<MedicineController>().medicines;
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
                    context.read<MedicineController>().queryAll();
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
                        Map<String, dynamic> data = {
                          'id': index,
                          'name': medicines[index].name,
                          'location': medicines[index].location,
                          'price': medicines[index].price,
                          'storage': medicines[index].storage,
                        };
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text('Editing window'),
                          ),
                          body: Tab4(medicines[index], data: data),
                          floatingActionButton: FloatingActionButton(
                            child: Icon(Icons.update),
                            onPressed: () {
                              // loss project
                              data['update'] = true;
                              data.forEach((key, value) {
                                print("$key and $value");
                              });

                              int dataId = data['id'];
                              String dataname = data['name'];
                              print(dataname);
                              String dataLocation = data['location'];
                              double dataPrice = data['price'];
                              int dataStorage = data['storage'];

                              context.read<MedicineController>().update(
                                  // dataId,
                                  // dataname,
                                  // dataLocation,
                                  // dataPrice,
                                  // dataStorage,
                                  2,
                                  'xxx',
                                  'xnx',
                                  1.1,
                                  1);
                              context.read<MedicineController>().queryAll();
                              print(medicines[2].name);
                              Navigator.pop(context);
                            },
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
              context.read<MedicineController>().query(text);
            } else {
              // _refresh();
              medicines.clear();
            }
          },
        ),
        TextButton(
          onPressed: () {
            context.read<MedicineController>().queryAll();
          },
          child: Text('${context.read<MedicineController>().demo}'),
        ),
      ],
    );
  }
}
