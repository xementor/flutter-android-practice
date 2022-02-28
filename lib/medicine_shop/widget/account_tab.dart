import 'package:flutter/material.dart';
import 'package:practice/medicine_shop/controller/account.dart';
import 'package:practice/medicine_shop/controller/account_controller.dart';
import 'package:provider/provider.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Account> accounts = context.read<AccountController>().accounts;
    return Container(
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Table(
          children: [
            TableRow(children: [
              Text(accounts[index].name),
              Text(accounts[index].date),
            ]),
          ],
        );
      }),
    );
  }
}
