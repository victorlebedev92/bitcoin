import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bitcoin_wallet/app_data/app_data.dart';
import 'package:bitcoin_wallet/core/services.dart';
import 'package:bitcoin_wallet/features/txApp/settings/domain/models/enums/screen_name_enum.dart';
import 'package:bitcoin_wallet/features/txApp/settings/domain/models/enums/week_day_enum.dart';
import 'package:bitcoin_wallet/features/txApp/widgets/drawer/custom_drawer_bloc.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends CustomDrawerBloc {
  Widget get getMainCurrencyWidget {
    return Obs(
      rvList: [currencies, mainCurrency],
      builder: (BuildContext context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: AppData.theme.button.whiteElevatedButton,
          onPressed: () {
            (() async {
              currencies.value = await getCurrencyList();
            })();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    "Choose main currency",
                    style: AppData.theme.text.s18w700,
                  ),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: currencies.value!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElevatedButton(
                          style: AppData.theme.button.whiteElevatedButton,
                          onPressed: () {
                            setState(() {
                              updateMainCurrency(
                                currencies.value![index],
                              );
                              (() async {
                                mainCurrency.value = await getMainCurrency();
                              })();
                              context.pop();
                            });
                          },
                          child: Text(
                            currencies.value![index].name,
                            style: AppData.theme.text.s14w500,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                  ),
                );
              },
            );
          },
          child: Column(
            children: [
              Text(
                "Main currency",
                style: AppData.theme.text.s14w500,
              ),
              Text(
                mainCurrency.value ?? "",
                style: AppData.theme.text.s18w700
                    .copyWith(color: AppData.colors.sky700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get getMainScreenWidget {
    return Obs(
      rvList: [mainScreenName],
      builder: (BuildContext context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: AppData.theme.button.whiteElevatedButton,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    "Choose main screen",
                    style: AppData.theme.text.s18w700,
                  ),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: ScreensName.values.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElevatedButton(
                          style: AppData.theme.button.whiteElevatedButton,
                          onPressed: () {
                            setState(() {
                              updateMainScreen(
                                ScreensName.values[index],
                              );
                              (() async {
                                mainScreenName.value = await getMainScreen();
                              })();
                              context.pop();
                            });
                          },
                          child: Text(
                            ScreensName.values[index].name,
                            style: AppData.theme.text.s14w500,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                  ),
                );
              },
            );
          },
          child: Column(
            children: [
              Text(
                "Main screen",
                style: AppData.theme.text.s14w500,
              ),
              Text(
                mainScreenName.value != null ? mainScreenName.value!.name : "",
                style: AppData.theme.text.s18w700
                    .copyWith(color: AppData.colors.sky700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get getPassword {
    return Obs(
      rvList: [isPassword],
      builder: (BuildContext context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: AppData.theme.button.whiteElevatedButton,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    "Enter password",
                    style: AppData.theme.text.s18w700,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: passwordController,
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: AppData.theme.button.deleteElevatedButton,
                            onPressed: () {
                              setState(() {
                                deletePassword();
                                (() async {
                                  isPassword.value = await isActivatePassword();
                                })();
                                context.pop();
                              });
                            },
                            child: const Text(
                              "Delete",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ElevatedButton(
                            style: AppData.theme.button.acceptElevatedButton,
                            onPressed: () {
                              if (passwordController.text.isNotEmpty) {
                                setState(() {
                                  addPassword(passwordController.text);
                                  (() async {
                                    isPassword.value =
                                        await isActivatePassword();
                                  })();
                                  context.pop();
                                });
                              }
                            },
                            child: const Text("Create"),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Column(
            children: [
              Text(
                "Password",
                style: AppData.theme.text.s14w500,
              ),
              Text(
                isPassword.value ? "Yes" : "No",
                style: AppData.theme.text.s18w700
                    .copyWith(color: AppData.colors.sky700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get mainDay {
    return Obs(
      rvList: [mainWeekDay],
      builder: (BuildContext context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: AppData.theme.button.whiteElevatedButton,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    "Choose first day of week",
                    style: AppData.theme.text.s18w700,
                  ),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: WeekDay.values.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElevatedButton(
                          style: AppData.theme.button.whiteElevatedButton,
                          onPressed: () {
                            setState(() {
                              updateMainDay(
                                WeekDay.values[index],
                              );
                              (() async {
                                mainWeekDay.value = await getMainDay();
                              })();
                              context.pop();
                            });
                          },
                          child: Text(
                            WeekDay.values[index].name,
                            style: AppData.theme.text.s14w500,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                  ),
                );
              },
            );
          },
          child: Column(
            children: [
              Text(
                "First day of week",
                style: AppData.theme.text.s14w500,
              ),
              Text(
                mainWeekDay.value ?? "",
                style: AppData.theme.text.s18w700
                    .copyWith(color: AppData.colors.sky700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get import {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: AppData.theme.button.whiteElevatedButton,
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    "Import data?",
                    style: AppData.theme.text.s18w700,
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "You local data will be delete",
                        style: AppData.theme.text.s16w500,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: AppData.theme.button.acceptElevatedButton,
                            onPressed: () async {
                              final Services services = Services();
                              await services.importFromDb();

                              context.pop();
                              if (mounted) {
                                context.go(AppData.routes.bankAccountScreen);
                              }
                            },
                            child: const Text("Yes"),
                          ),
                          ElevatedButton(
                            style: AppData.theme.button.deleteElevatedButton,
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text("No"),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        },
        child: Text(
          "Import data",
          style:
              AppData.theme.text.s18w700.copyWith(color: AppData.colors.sky700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "bitcoin_wallet Wallet",
                style: AppData.theme.text.s28w700,
              ),
              const SizedBox(height: 50),
              Text(
                "Settings",
                style: AppData.theme.text.s18w700,
              ),
              const SizedBox(height: 25),
              getMainCurrencyWidget,
              const SizedBox(height: 25),
              getMainScreenWidget,
              const SizedBox(height: 25),
              getPassword,
              const SizedBox(height: 25),
              mainDay,
              const SizedBox(height: 25),
              Container(height: 1, color: AppData.colors.gray300),
              const SizedBox(height: 25),
              Text(
                "Data",
                style: AppData.theme.text.s18w700,
              ),
              const SizedBox(height: 25),
              import,
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
