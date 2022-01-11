import 'package:flutter/material.dart';
import 'package:practice/medicine_shop/controller/controller.dart';
import 'package:practice/medicine_shop/controller/medicine.dart';
import 'package:provider/src/provider.dart';

class Tab4 extends StatelessWidget {
  Tab4(this.medicine, {Key? key}) : super(key: key);

  Medicine medicine;
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController locationUpdateController = TextEditingController();
  TextEditingController priceUpdateController = TextEditingController();
  TextEditingController storageUpdateController = TextEditingController();

  Widget build(BuildContext context) {
    idUpdateController.text = medicine.id.toString();
    nameUpdateController.text = medicine.name;
    locationUpdateController.text = medicine.location;
    priceUpdateController.text = medicine.price.toString();
    storageUpdateController.text = medicine.storage.toString();

    // context.read<Controller>().
    return Center(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: idUpdateController,
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
                  .read<Controller>()
                  .update(id, name, location, price, storage);
            },
          ),
        ],
      ),
    );
  }
}
