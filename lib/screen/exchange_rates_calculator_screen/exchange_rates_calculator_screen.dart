import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/exchange_rates_calculator_screen/bloc/exchange_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:http/http.dart' as http;

int screenId = 23;

class exchangeScreen extends StatefulWidget {
  exchangeScreen({Key? key}) : super(key: key);

  @override
  _exchangeScreenState createState() => _exchangeScreenState();
}

class _exchangeScreenState extends State<exchangeScreen> {
  final fromTextController = TextEditingController();
  late List currencie;
  String fromCurrencyValue = '0';
  double toCurrencyValue = 0;
  String fromCurrency = "USD";
  late String result;
  late ExchangeBloc exchangeBloc;
  List listItem = ["GBP", "EURO", "JPY", "USD", "YEN"];

  @override
  void initState() {
    super.initState();
    exchangeBloc = ExchangeBloc()..add(ExchangeInitialEvent());
    //_loadCurrencies();
  }

  // Future<String> _loadCurrencies() async {
  //   String uri = "https://api.exchangeratesapi.io/latest";
  //   var response =
  //       await http.get(Uri.parse(uri), headers: {"Accept": "application/json"});
  //   var responseBody = json.decode(response.body);
  //   Map curMap = responseBody['rates'];
  //   currencies = curMap.keys.toList();
  //   setState(() {});
  //   print(currencies);
  //   return "Success";
  // }

  // Future<String> _doConversion() async {
  //   String uri =
  //       "https://api.exchangeratesapi.io/latest?base=$fromCurrency&symbols=$toCurrency";
  //   var response =
  //       await http.get(Uri.parse(uri), headers: {"Accept": "application/json"});
  //   var responseBody = json.decode(response.body);
  //   setState(() {
  //     result = (double.parse(fromTextController.text) *
  //             (responseBody["rates"][toCurrency]))
  //         .toString();
  //   });
  //   print(result);
  //   return "Success";
  // }

  // _onFromChanged(String value) {
  //   setState(() {
  //     fromCurrency = value;
  //   });
  // }

  // _onToChanged(String value) {
  //   setState(() {
  //     toCurrency = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExchangeBloc, ExchangeState>(
      bloc: exchangeBloc,
      listener: (context, state) {},
      child: BlocBuilder<ExchangeBloc, ExchangeState>(
        bloc: exchangeBloc,
        builder: (context, state) {
          if (state is ExchangeLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is ExchangeLoadedState) {
            return Scaffold(
              backgroundColor: ColorResource.color1c1d22,
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.ExchangeRatesCalculator,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorResource.colorwhite,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text_Widget(
                                text: StringResource.exchange_money,
                                font_size: 16,
                                colour: ColorResource.color1c1d22,
                                font_family: FontFamilyResource.PoppinsSemiBold,
                              ),
                              SizedBox(height: 5),
                              Text_Widget(
                                text:
                                    "Find out real-timeExchange rates &\nExchange between your balances.",
                                font_size: 10,
                                colour: ColorResource.color9d9da9,
                                font_family: FontFamilyResource.PoppinsMedium,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorResource.colorb9b9bf,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: double.infinity,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: ColorResource.colorwhite,
                                  border: Border.all(
                                    color: ColorResource.colorb9b9bf,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: TextFormField(
                                      controller: fromTextController,
                                      onChanged: (value) {
                                        setState(() {
                                          fromCurrencyValue = value;
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      cursorColor: ColorResource.colorblack,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: ColorResource.color616267,
                                          fontSize: 13,
                                          fontFamily:
                                              FontFamilyResource.PoppinsMedium,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: ColorResource.color616267,
                                        fontFamily:
                                            FontFamilyResource.PoppinsMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 43,
                                      padding: EdgeInsets.all(15),
                                      child: DropdownButton<String>(
                                        value: fromCurrency,
                                        dropdownColor: ColorResource.colorwhite,
                                        isExpanded: true,
                                        icon: Container(
                                          width: 14,
                                          height: 8,
                                          child: Icon(Icons.arrow_downward),
                                        ),
                                        iconSize: 14,
                                        elevation: 16,
                                        style: TextStyle(
                                          color: ColorResource.color000000,
                                          fontFamily:
                                              FontFamilyResource.PoppinsLight,
                                        ),
                                        underline: SizedBox(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            fromCurrency = newValue!;
                                          });
                                        },
                                        items: listItem.map((valueItem) {
                                          return DropdownMenuItem<String>(
                                            value: valueItem,
                                            child: Text(valueItem),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Text_Widget(
                                    text: fromTextController.text,
                                    font_size: 30,
                                    colour: ColorResource.color1c1d22,
                                    font_family:
                                        FontFamilyResource.PoppinsLight,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    indent: 20,
                                    color: ColorResource.colorb9b9bf,
                                    thickness: 1,
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    endIndent: 20,
                                    color: ColorResource.colorb9b9bf,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text_Widget(
                                        text: "INR",
                                        font_size: SizeResource.size20,
                                        colour: ColorResource.color1c1d22,
                                        font_family:
                                            FontFamilyResource.PoppinsMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Text_Widget(
                                    text: toCurrencyValue.toString(),
                                    font_size: 30,
                                    colour: ColorResource.color1c1d22,
                                    font_family:
                                        FontFamilyResource.PoppinsLight,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorResource.colorb9b9bf,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                toCurrencyValue =
                                    getInrValue(fromCurrencyValue);
                              });
                            },
                            child: Container(
                              width: 130,
                              height: 36,
                              decoration: BoxDecoration(
                                color: ColorResource.color0066cc,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text_Widget(
                                  text: StringResource.exchange_now,
                                  font_size: 12,
                                  colour: ColorResource.colorwhite,
                                  font_family:
                                      FontFamilyResource.PoppinsSemiBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  double getInrValue(value) {
    double enteredValue = double.parse(value);
    if (fromCurrency == "USD") {
      enteredValue = enteredValue * 74.13;
    } else if (fromCurrency == "EURO") {
      enteredValue = enteredValue * 87.05;
    } else if (fromCurrency == "YEN") {
      enteredValue = enteredValue * 0.66;
    } else if (fromCurrency == "JPY") {
      enteredValue = enteredValue * 87.05;
    } else if (fromCurrency == "GBP") {
      enteredValue = enteredValue * 101.83;
    }
    return enteredValue;
  }
}
