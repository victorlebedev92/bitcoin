import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:bitcoin_wallet/features/widgets/custom_button.dart';
import 'package:bitcoin_wallet/features/widgets/loading_widget.dart';

import '../../../app_data/app_data.dart';
import 'home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeBloc {
  SvgPicture buttonsImage(int index) {
    switch (index) {
      case 0:
        return AppData.assets.svg.transactions;
      case 1:
        return AppData.assets.svg.send;
      case 2:
        return AppData.assets.svg.receive();
      case 3:
        return AppData.assets.svg.address;
      case 4:
        return AppData.assets.svg.settings;
      default:
        return AppData.assets.svg.transactions;
    }
  }

  String buttonsTitle(int index) {
    switch (index) {
      case 0:
        return "Transactions";
      case 1:
        return "Send";
      case 2:
        return "Receive";
      case 3:
        return "Addresses";
      case 4:
        return "Settings";
      default:
        return "Transactions";
    }
  }

  Widget button(int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentScreen = index;
          });
        },
        child: Container(
          width: 172,
          color: currentScreen == index ? Colors.blue.shade700 : Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonsImage(index),
              Text(
                buttonsTitle(index),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get buttons {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          button(0),
          button(1),
          button(2),
          button(3),
          button(4),
        ],
      ),
    );
  }

  Widget get txBody {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Balance:"),
                    balance == null ? Container() : Text("$balance stat"),
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Mempool:"),
                    mem == null ? Container() : Text("$mem stat"),
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Transactions:"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        txCount == null ? Container() : Text(txCount!),
                        const SizedBox(width: 18),
                        const Icon(
                          Icons.info,
                          size: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppData.colors.backgroundColor),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomIcon(
                        onPressed: () {},
                        child: const Text("Date"),
                      ),
                    ),
                    Expanded(
                      child: CustomIcon(
                        onPressed: () {},
                        child: const Text("Label"),
                      ),
                    ),
                    Expanded(
                      child: CustomIcon(
                        onPressed: () {},
                        child: const Text("Value"),
                      ),
                    ),
                    Expanded(
                      child: CustomIcon(
                        onPressed: () {},
                        child: const Text("Balance"),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                    child: Center(
                  child: Text("No transactions"),
                )
                    // : ListView.builder(
                    //     itemBuilder: (context, index) => Text(
                    //       authService.getTransactions()![index].sentFrom,
                    //     ),
                    //     itemCount: authService.getTransactions()!.length,
                    //   ),
                    ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppData.colors.backgroundColor),
          ),
          child: const Text("Wallet loading history for wallet 1"),
        ),
      ],
    );
  }

  Widget get sendBody {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Send",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text("Pay to:"),
                  ),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 35,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            payToCtrl.text = value;
                          });
                        },
                        style: const TextStyle(fontSize: 14),
                        controller: payToCtrl,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppData.colors.backgroundColor,
                                width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text("Label:"),
                  ),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 35,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            labelToCtrl.text = value;
                          });
                        },
                        style: const TextStyle(fontSize: 14),
                        controller: labelToCtrl,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppData.colors.backgroundColor,
                                width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 10,
                    child: Text("Amount:"),
                  ),
                  Expanded(
                    flex: 16,
                    child: SizedBox(
                      height: 35,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            amountToCtrl.text = value;
                          });
                        },
                        style: const TextStyle(fontSize: 14),
                        keyboardType: TextInputType.number,
                        controller: amountToCtrl,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,8}$')),
                        ],
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppData.colors.backgroundColor,
                                width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            AppData.colors.gray200,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        border: Border.all(
                          color: AppData.colors.gray200,
                        )),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      iconSize: 24,
                      elevation: 16,
                      underline: const SizedBox(),
                      dropdownColor: AppData.colors.backgroundColor,
                      value: amountType,
                      onChanged: (String? newValue) {
                        setState(() {
                          amountType = newValue!;
                        });
                      },
                      items: amountTypeItems.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Fee",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                      CustomIcon(
                        gradient: isFee
                            ? const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(238, 238, 238, 1),
                                  Color.fromRGBO(189, 189, 189, 1),
                                ],
                              )
                            : const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Color.fromARGB(255, 238, 238, 238),
                                ],
                              ),
                        onPressed: () => setState(() {
                          isFee = true;
                        }),
                        child: const Text("Target Blocks"),
                      ),
                      CustomIcon(
                        gradient: !isFee
                            ? const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(238, 238, 238, 1),
                                  Color.fromRGBO(189, 189, 189, 1),
                                ],
                              )
                            : const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Color.fromARGB(255, 238, 238, 238),
                                ],
                              ),
                        onPressed: () => setState(() {
                          isFee = false;
                        }),
                        child: const Text("Mempool Size"),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text("Range:"),
                  ),
                  Expanded(
                    flex: 5,
                    child: SliderTheme(
                      data: SliderThemeData(
                        inactiveTrackColor: sliderColor,
                        thumbColor: sliderColor,
                        valueIndicatorColor: sliderColor,
                        activeTrackColor: sliderColor,
                        inactiveTickMarkColor: sliderColor,
                      ),
                      child: Slider(
                        value: sliderValue,
                        min: minValue,
                        max: maxValue,
                        divisions: 1024,
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                            print("sliderValue $sliderValue");
                          });
                        },
                        label: sliderValue.toString(), // Отображаемое значение
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text("Rate:"),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("$sliderValue sats/vB"),
                        Text(sliderText),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 10,
                    child: Text("Fee:"),
                  ),
                  Expanded(
                    flex: 16,
                    child: SizedBox(
                      height: 35,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            feeToCtrl.text = value;
                          });
                        },
                        style: const TextStyle(fontSize: 14),
                        keyboardType: TextInputType.number,
                        controller: feeToCtrl,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,8}$')),
                        ],
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppData.colors.backgroundColor,
                                width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            AppData.colors.gray200,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        border: Border.all(
                          color: AppData.colors.gray200,
                        )),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      iconSize: 24,
                      elevation: 16,
                      underline: const SizedBox(),
                      dropdownColor: AppData.colors.backgroundColor,
                      value: feeType,
                      onChanged: (String? newValue) {
                        setState(() {
                          feeType = newValue!;
                        });
                      },
                      items: feeTypeItems.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text("Optimize:"),
                  const SizedBox(width: 20),
                  CustomIcon(
                    gradient: isOptimize
                        ? const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(238, 238, 238, 1),
                              Color.fromRGBO(189, 189, 189, 1),
                            ],
                          )
                        : const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Color.fromARGB(255, 238, 238, 238),
                            ],
                          ),
                    onPressed: () => setState(() {
                      isOptimize = true;
                    }),
                    child: const Text("Effeciency"),
                  ),
                  CustomIcon(
                    gradient: !isOptimize
                        ? const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(238, 238, 238, 1),
                              Color.fromRGBO(189, 189, 189, 1),
                            ],
                          )
                        : const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Color.fromARGB(255, 238, 238, 238),
                            ],
                          ),
                    onPressed: () => setState(() {
                      isOptimize = false;
                    }),
                    child: const Text("Privacy"),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomIcon(
                    onPressed: () => onClear(),
                    child: const Text("Clear"),
                  ),
                  const SizedBox(width: 20),
                  CustomIcon(
                    onPressed: () async {
                      if (payToCtrl.text.isNotEmpty &&
                          amountToCtrl.text.isNotEmpty &&
                          feeToCtrl.text.isNotEmpty) {
                        setState(() {
                          isCreateTx = true;
                        });
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          isCreateTx = false;
                          currentScreen = 0;
                        });
                      } else {
                        Clipboard.setData(
                          const ClipboardData(text: "Hi"),
                        ).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("One of required fields is empty"),
                            ),
                          );
                        });
                      }
                    },
                    child: isCreateTx
                        ? const SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Create Transaction"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get receiveBody {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Receive",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text("Address:"),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppData.colors.backgroundColor),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      address ?? "Null",
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        String message = address ?? "Empty";
                                        Clipboard.setData(
                                          ClipboardData(text: message),
                                        ).then((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(message == "Empty"
                                                  ? "Address is empty"
                                                  : "Address was copied"),
                                            ),
                                          );
                                        });
                                      },
                                      child: const Icon(
                                        Icons.copy,
                                        size: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text("Label:"),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 26,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppData.colors.backgroundColor),
                                ),
                                child: const SizedBox(),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text("Derivation:"),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text("m/84’/0’/0’/0/$currentAddress"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text("Last Used:"),
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  AppData.assets.svg.access,
                                  const Text("Never"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => showQrDialog(),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        // spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: QrImageView(
                    backgroundColor: Colors.white,
                    data: authService.getAddress(currentAddress).toString(),
                    size: 180,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: double.infinity,
                  color: AppData.colors.backgroundColor,
                  height: 1,
                ),
                const Text(
                  "Required ScriptPubKey",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text("Address:"),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppData.colors.backgroundColor),
                          ),
                          child: Text("OP_0 <$sqrText>"),
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  "Output Descriptor",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text("Address:"),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppData.colors.backgroundColor),
                          ),
                          child: Text(addressText),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50),
        CustomIcon(
          width: 150,
          onPressed: isLoadingAddress ? null : () => addAddress(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppData.assets.svg.receive(color: Colors.black, size: 14),
              const Text("Get Next Address"),
            ],
          ),
        ),
      ],
    );
  }

  Widget get addressBody {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Receive Addresses",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppData.colors.backgroundColor),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: CustomIcon(
                        onPressed: () {},
                        child: const Text("Address / Outpoinnts"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomIcon(
                        onPressed: () {},
                        child: const Text("Label"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomIcon(
                        onPressed: () {},
                        child: const Text("Value"),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  // child: Center(
                  //   child: Text("No transactions"),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Text(
                            authService.getAddress(index)!,
                          ),
                          const SizedBox(width: 10),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentAddress = index;
                                  address =
                                      authService.getAddress(currentAddress)!;
                                });
                                currentScreen = 2;
                              },
                              child: AppData.assets.svg.receive(
                                color: Colors.black,
                                size: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                      itemCount: authService.getAddresses()!.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Change Addresses",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppData.colors.backgroundColor),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: CustomIcon(
                        onPressed: () {},
                        child: const Text("Address / Outpoinnts"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomIcon(
                        onPressed: () {},
                        child: const Text("Label"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomIcon(
                        onPressed: () {},
                        child: const Text("Value"),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  // child: Center(
                  //   child: Text("No transactions"),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Text(
                        authService.getAddress(index)!,
                      ),
                      itemCount: authService.getAddresses()!.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get settingsBody {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            width: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text("Policy Type:"),
                              ),
                              Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.white,
                                              AppData.colors.gray200,
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          border: Border.all(
                                            color: AppData.colors.gray200,
                                          )),
                                      child: DropdownButton<String>(
                                        underline: const SizedBox(),
                                        dropdownColor:
                                            AppData.colors.backgroundColor,
                                        value: policyType,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            policyType = newValue!;
                                          });
                                        },
                                        items:
                                            policyTypeItems.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    const SizedBox()
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text("Script Type:"),
                              ),
                              Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.white,
                                              AppData.colors.gray200,
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          border: Border.all(
                                            color: AppData.colors.gray200,
                                          )),
                                      child: DropdownButton<String>(
                                        underline: const SizedBox(),
                                        dropdownColor:
                                            AppData.colors.backgroundColor,
                                        value: scriptType,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            scriptType = newValue!;
                                          });
                                        },
                                        items:
                                            scriptTypeItems.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    const SizedBox()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    policyType == 'Single Signature'
                        ? Container()
                        : Expanded(
                            flex: 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text("Cosigners:"),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: SliderTheme(
                                    data: SliderThemeData(
                                      inactiveTrackColor: sliderValue < 600
                                          ? Colors.blue
                                          : Colors.red,
                                      thumbColor: sliderValue < 600
                                          ? Colors.white
                                          : Colors.red,
                                      valueIndicatorColor: sliderValue < 600
                                          ? Colors.blue
                                          : Colors.red,
                                      activeTrackColor: sliderValue < 600
                                          ? Colors.blue
                                          : Colors.red,
                                      inactiveTickMarkColor: sliderValue < 600
                                          ? Colors.blue
                                          : Colors.red,
                                    ),
                                    child: Slider(
                                      value: countKeyStores.toDouble(),
                                      min: 1,
                                      max: 10,
                                      divisions: 9,
                                      onChanged: (value) {
                                        setState(() {
                                          countKeyStores = value.toInt();
                                          print("sliderValue $countKeyStores");
                                        });
                                      },
                                      label: countKeyStores
                                          .toString(), // Отображаемое значение
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Script Policy",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text("Descriptor:"),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppData.colors.backgroundColor),
                        ),
                        child: Text(descriptorText),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Keystores",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppData.colors.backgroundColor),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 6, left: 6, right: 6),
                        child: Container(
                          width: 100,
                          color: Colors.white,
                          child: const Text("Keystore1"),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomIcon(
                            onPressed: () {
                              showBottomDialog();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppData.assets.svg.import(),
                                const Text("New or Imported Software Wallet"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomIcon(
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppData.assets.svg.eye,
                                const Text("xPub / Watch Only Wallet"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomIcon(
              onPressed: () {},
              child: const Text("Apply"),
            ),
            const SizedBox(width: 20),
            CustomIcon(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 233, 211, 211),
                ],
              ),
              onPressed: () => showDeleteWallet(),
              child: const Text("Reset Wallet"),
            ),
          ],
        )
      ],
    );
  }

  Widget get body {
    switch (currentScreen) {
      case 0:
        return txBody;
      case 1:
        return sendBody;
      case 2:
        return receiveBody;
      case 3:
        return addressBody;
      case 4:
        return settingsBody;
      default:
        return Container();
    }
  }

  Widget get phrases {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) async {
        if (event is RawKeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.keyV &&
            event.isControlPressed) {
          await Future.delayed(const Duration(milliseconds: 10));
          ClipboardData? clipboardData =
              await Clipboard.getData(Clipboard.kTextPlain);

          if (clipboardData?.text != null) {
            String clipboardText = clipboardData!.text!;
            List<String> words = clipboardText.split(' ');

            for (int i = 0; i < words.length; i++) {
              controllers[i].text = words[i];
            }

            if (mounted) {
              context.pop();
            }
            showBottomDialog();
            print('Слова из буфера обмена: $words');
          }
          print('Ctrl+V нажато');
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 2, right: 5),
        child: Column(
          children: [
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 25,
                mainAxisSpacing: 10,
                childAspectRatio: 5 / 1,
              ),
              itemBuilder: (BuildContext context, index) => Row(
                children: [
                  Text(
                    index < 9 ? "   ${index + 1}." : "${index + 1}.",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            controllers[index].text = value;
                          });
                        },
                        onSubmitted: (value) {
                          setState(() {
                            mnemonicList[index] = value;
                            controllers[index].text = '';
                          });
                        },
                        controller: controllers[index],
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          label: Text(
                            " ${mnemonicList.length <= index ? "" : mnemonicList[index]}",
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppData.colors.backgroundColor,
                                width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          errorText: isError[index] ? "is empty" : null,
                          errorStyle: const TextStyle(
                            fontSize: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              itemCount: mnemonicCount,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Passphrase:"),
                const SizedBox(width: 5),
                SizedBox(
                  width: 300,
                  height: 30,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        phraseCtrl.text = value;
                      });
                    },
                    controller: phraseCtrl,
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppData.colors.backgroundColor, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isCorrectMnemonic
                    ? CustomIcon(
                        onPressed: () => generateNew(),
                        child: const Text("General New"),
                      )
                    : const Row(
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 15,
                          ),
                          SizedBox(width: 10),
                          Text("Invalid Mnemonic")
                        ],
                      ),
                CustomIcon(
                  onPressed: () async {
                    final res = await import();
                    if (res) {
                      setState(() {
                        isCorrectMnemonic = false;
                      });
                      context.pop();
                      showBottomDialog();
                    }
                  },
                  child: const Text("Import Wallet"),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 1,
              color: AppData.colors.backgroundColor,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showBottomDialog() {
    return showDialog(
      context: context,
      barrierColor: Colors.white.withOpacity(0.5),
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          content: Container(
            height: 600,
            decoration: BoxDecoration(
              border: Border.all(color: AppData.colors.backgroundColor),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 172,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppData.assets.svg.import(color: Colors.white),
                      const Text(
                        "Software Wallet",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: 600,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => setState(() {
                                isViewMnemonic = !isViewMnemonic;
                                context.pop();
                                showBottomDialog();
                              }),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppData.assets.svg.key,
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Mnemonic Words (BIP39)"),
                                        Row(
                                          children: [
                                            Text(
                                              "Create or enter seed",
                                              style: TextStyle(
                                                color: AppData
                                                    .colors.backgroundColor,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () => setState(() {
                                                isViewMnemonic =
                                                    !isViewMnemonic;
                                                context.pop();
                                                showBottomDialog();
                                              }),
                                              child: const Text("Details"),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.white,
                                            AppData.colors.gray200,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        border: Border.all(
                                          color: AppData.colors.gray200,
                                        )),
                                    child: DropdownButton<int>(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      iconSize: 24,
                                      elevation: 16,
                                      underline: const SizedBox(),
                                      dropdownColor:
                                          AppData.colors.backgroundColor,
                                      value: mnemonicCount,
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          isViewMnemonic = true;
                                          mnemonicCount = newValue!;
                                          mnemonicList =
                                              List.filled(mnemonicCount, "");
                                          controllers = List.generate(
                                            mnemonicCount,
                                            (index) => TextEditingController(),
                                          );
                                          isError = List.generate(
                                            mnemonicCount,
                                            (index) => false,
                                          );
                                          context.pop();
                                          showBottomDialog();
                                        });
                                      },
                                      items: possibleCount.map((int value) {
                                        return DropdownMenuItem<int>(
                                          value: value,
                                          child: Text("Use $value words"),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: AppData.colors.backgroundColor,
                          ),
                          isViewMnemonic ? phrases : Container(),
                          const SizedBox(height: 20),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isViewPrivateKey = !isViewPrivateKey;
                                });
                                if (mounted) {
                                  context.pop();
                                  showBottomDialog();
                                }
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppData.assets.svg.key,
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            "Master Private Key (BIP32)"),
                                        Row(
                                          children: [
                                            Text(
                                              "Extended key import",
                                              style: TextStyle(
                                                color: AppData
                                                    .colors.backgroundColor,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () => setState(() {
                                                isViewPrivateKey =
                                                    !isViewPrivateKey;

                                                context.pop();
                                                showBottomDialog();
                                              }),
                                              child: const Text("Details"),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  CustomIcon(
                                    onPressed: () => setState(() {
                                      isViewPrivateKey = !isViewPrivateKey;

                                      context.pop();
                                      showBottomDialog();
                                    }),
                                    child: const Text("Enter Private Key"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: AppData.colors.backgroundColor,
                          ),
                          const SizedBox(height: 20),
                          isViewPrivateKey
                              ? Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            maxLines: 5,
                                            style:
                                                const TextStyle(fontSize: 12),
                                            onChanged: (value) {
                                              setState(() {
                                                privateKeyCtrl.text = value;
                                              });
                                            },
                                            controller: privateKeyCtrl,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(10),
                                              border: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1),
                                              ),
                                              disabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppData
                                                        .colors.backgroundColor,
                                                    width: 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        CustomIcon(
                                          onPressed: () => import(),
                                          child: const Text("Import Keystore"),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: AppData.colors.backgroundColor,
                                    ),
                                  ],
                                )
                              : Container(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CustomIcon(
              onPressed: () {
                onClear();
                context.pop();
              },
              child: const Text("Cancel"),
            )
          ],
        );
      },
    );
  }

  Future<dynamic> showQrDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          content: Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  // spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: QrImageView(
              backgroundColor: Colors.white,
              data: authService.getAddress(currentAddress).toString(),
              size: 50,
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showDeleteWallet() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          "You really want reset your wallet?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          CustomIcon(
            onPressed: () {
              authService.boxClear();
              settingsService.boxClear();
              context.go(AppData.routes.welcomeScreen);
            },
            child: const Text("Apply"),
          ),
          CustomIcon(
            onPressed: () => context.pop(),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(6),
        ),
        child: isLoading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoadingWidget(),
                    Text("Loading wallet"),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.wallet,
                          size: 12,
                        ),
                        const SizedBox(width: 5),
                        const Text("Wallet"),
                        const SizedBox(width: 5),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => showDeleteWallet(),
                            child: const Icon(
                              Icons.close,
                              size: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppData.colors.backgroundColor),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Expanded(flex: 1, child: buttons),
                            ],
                          ),
                          Expanded(
                            flex: 4,
                            child: SizedBox(
                              width: 500,
                              child: Container(
                                padding: const EdgeInsets.all(25),
                                margin: const EdgeInsets.only(right: 30),
                                child: body,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        connectivityResult == ConnectivityResult.none
                            ? const Row(
                                children: [
                                  Text(
                                      "Connection failed: Null Pointer Error (null)"),
                                  SizedBox(width: 4),
                                  Text(
                                    "Server Preferences",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              )
                            : Text(titleConnect),
                        Row(
                          children: [
                            const Icon(Icons.cast_connected_rounded),
                            const SizedBox(width: 4),
                            Switch(
                              value: isSwitch,
                              onChanged: (bool change) async {
                                setState(() {
                                  isSwitch = change;
                                });
                                if (isSwitch) {
                                  setState(() {
                                    titleConnect = "Connected...";
                                  });
                                  await Future.delayed(
                                      const Duration(seconds: 5));
                                  setState(() {
                                    titleConnect = "";
                                  });
                                } else {
                                  setState(() {
                                    titleConnect = "Disconnected...";
                                  });
                                  await Future.delayed(
                                      const Duration(seconds: 5));
                                  setState(() {
                                    titleConnect = "";
                                  });
                                }
                              },
                              activeTrackColor: Colors.yellow,
                              inactiveThumbColor: AppData.colors.gray300,
                              trackOutlineColor:
                                  MaterialStateProperty.resolveWith(
                                (final Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return null;
                                  }

                                  return AppData.colors.gray300;
                                },
                              ),
                              thumbColor: MaterialStateProperty.resolveWith(
                                (final Set<MaterialState> states) {
                                  return Colors.white;
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
