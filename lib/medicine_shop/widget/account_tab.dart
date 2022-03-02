import 'package:flutter/material.dart';
import 'package:practice/medicine_shop/controller/account.dart';
import 'package:practice/medicine_shop/controller/account_controller.dart';
import 'package:provider/provider.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Account> accounts = context.read<AccountController>().accounts;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(5),
          color: Colors.blue,
          child: Text(
            "Your Total Selling",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (BuildContext context, int index) {
              if (index > accounts.length) {
                return IconButton(
                    onPressed: () {}, icon: const Icon(Icons.ac_unit));
                print("nothign here");
                // context.read<AccountController>().queryDate();
              }
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Table(
                      border: const TableBorder(
                        horizontalInside: BorderSide(
                          width: 2,
                          color: Colors.blue,
                          style: BorderStyle.solid,
                        ),
                      ),
                      children: [
                        TableRow(
                          children: [
                            Text(accounts[index].id.toString()),
                            Text(accounts[index].name),
                            Text(accounts[index].quantity.toString()),
                            Text(accounts[index].price.toString())
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
