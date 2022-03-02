import 'package:flutter/material.dart';
import 'package:practice/medicine_shop/controller/account_controller.dart';
import 'package:practice/medicine_shop/controller/medicine_controller.dart';
import 'package:practice/medicine_shop/controller/medicine.dart';
import 'package:provider/src/provider.dart';

class Tab4 extends StatefulWidget {
  Tab4(this.medicine, {Key? key, this.data = const {'id': '1'}})
      : super(key: key);

  Medicine medicine;
  Map<String, dynamic> data;

  @override
  State<Tab4> createState() => _Tab4State();
}

class _Tab4State extends State<Tab4> {
  int storage = 0;
  late int count;
  // state for storage ++ --
  @override
  void initState() {
    super.initState();
    setState(() {
      storage = widget.medicine.storage;
      count = 0;
    });
  }

  Widget build(BuildContext context) {
    TextEditingController idUpdateController = TextEditingController();

    TextEditingController nameUpdateController = TextEditingController();

    TextEditingController locationUpdateController = TextEditingController();

    TextEditingController priceUpdateController = TextEditingController();

    TextEditingController storageUpdateController = TextEditingController();

    idUpdateController.text = widget.medicine.id.toString();
    nameUpdateController.text = widget.medicine.name;
    locationUpdateController.text = widget.medicine.location;
    priceUpdateController.text = widget.medicine.price.toString();
    storageUpdateController.text = storage.toString();

    // context.read<Controller>().
    return Center(
      child: ListView(
        children: <Widget>[
          Container(
            child: TextButton(
              child: Text(storage.toString()),
              onPressed: () {
                print('clicked');
                setState(() {
                  storage++;
                  count++;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: idUpdateController,
              onChanged: (value) {
                widget.data['id'] = int.parse(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Medicine id',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: nameUpdateController,
              onChanged: (value) {
                widget.data['name'] = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Medicine Name',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: locationUpdateController,
              onChanged: (value) {
                widget.data['location'] = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'location',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: priceUpdateController,
              onChanged: (value) {
                widget.data['price'] = double.parse(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'price',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: storageUpdateController,
              onChanged: (value) {
                widget.data['storage'] = int.parse(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Storage',
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Update Medicine Details'),
            onPressed: () {
              int id = int.parse(idUpdateController.text);
              String name = nameUpdateController.text;
              String location = locationUpdateController.text;
              double price = double.parse(priceUpdateController.text);
              int storage = int.parse(storageUpdateController.text);
              // update(id, name, location, price, storage);
              context
                  .read<MedicineController>()
                  .update(id, name, location, price, storage);
              context
                  .read<AccountController>()
                  .insert(name, DateTime.now(), price, count);
              context.read<MedicineController>().queryAll();

              //Debug
              context.read<AccountController>().queryAll();
              context.read<AccountController>().accounts.forEach((element) {
                print("q");
                print(element.toString());
              });
              print('iam goind');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
