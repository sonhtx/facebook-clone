import 'package:anti_fb/repository/setting/buy_coin_repo.dart';
import 'package:anti_fb/widgets/IconWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';
import '../../../storage.dart';

class CoinManage extends StatefulWidget {
  const CoinManage({super.key});

  @override
  State<CoinManage> createState() => _CoinManageState();
}

class _CoinManageState extends State<CoinManage> {
  bool flag = false;
  late String coin;
  TextEditingController inputCoin = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchCoin();
  }

  @override
  void dispose() {
    inputCoin.dispose();
    super.dispose();
  }

  final BuyCoinRepo _buyCoinRepo = BuyCoinRepo();

  Future<void> _fetchCoin() async {
    try {
      coin = (await getCoin())!;
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        backgroundColor: WHITE,
        title: const Text("Coin Manage"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context, flag);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: WHITE,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder(
                future: _fetchCoin(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(
                      "Your Coin: $coin",
                      style: const TextStyle(fontSize: 20.0),
                    );
                  }
                },
              ),
              IconWidget(
                icon: Icons.add_circle_outline,
                onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          insetPadding: const EdgeInsets.all(16.0),
                          surfaceTintColor: WHITE,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                0.0), // Set the radius here
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Buy more coin",
                                    style: TextStyle(
                                        fontWeight: FONTBOLD, fontSize: 25.0),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Enter the number of coins you want to buy",
                                    style: TextStyle(
                                        fontWeight: FONTNORMAL,
                                        fontSize: 15.0,
                                        color: BLACK),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                TextField(
                                  controller: inputCoin,
                                  decoration: const InputDecoration(
                                      labelText: "Number of coin"),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ], // Only numbers can be entered
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          inputCoin.text = "";
                                        },
                                        child: const Text(
                                          "CANCEL",
                                          style: TextStyle(
                                              fontSize: 15.0, color: BLACK),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          shape: const BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {
                                          _buyCoinRepo
                                              .buyCoin(
                                                  inputCoin.text.toString())
                                              .then((value) {
                                            if (value != null) {
                                              setState(() {
                                                coin = value;
                                              });
                                            }
                                          });
                                          Navigator.pop(context);
                                          inputCoin.text = "";
                                        },
                                        child: const Text(
                                          "Purchase",
                                          style: TextStyle(
                                              fontSize: 15.0, color: FBBLUE),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                color: BLACK,
              )
            ],
          ),
        ),
      ),
    );
  }
}
