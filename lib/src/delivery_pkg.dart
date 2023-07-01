import 'package:flutter/material.dart';

import '../utils/CommonMethod.dart';

class delivery_pkg extends StatefulWidget {
  const delivery_pkg({super.key});

  @override
  State<delivery_pkg> createState() => _delivery_pkgState();
}

class _delivery_pkgState extends State<delivery_pkg> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController consigneeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController packageController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController receiversController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController packageCountController = TextEditingController();
  TextEditingController collectedAmountController = TextEditingController();
  TextEditingController orderNoController = TextEditingController();
  TextEditingController orderQtyController = TextEditingController();
  TextEditingController sheduleDateController = TextEditingController();
  TextEditingController closeKmCntlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => delivery_pkg()));
          },
          child: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[120],
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: ListView(
              shrinkWrap: true,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                    child: Column(
                      children: [
                        Text(
                          "Consignee Details",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                            child: Column(
                              children: [
                                CommonTextfieldRectangle(
                                  controller: consigneeController,
                                  // controller: TextEditingController(text: docketValue[0].consigneeName),
                                  hintText: 'Consignee',
                                  labelText: 'Consignee',
                                  maxLine: 1,
                                  textInput: TextInputType.text,
                                  onClick: () => FocusScope.of(context)
                                      .requestFocus(FocusNode()),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                CommonTextfieldRectangle(
                                  controller: addressController,
                                  hintText: 'Address',
                                  labelText: 'Address',
                                  maxLine: 3,
                                  textInput: TextInputType.text,
                                  onClick: () => FocusScope.of(context)
                                      .requestFocus(FocusNode()),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                CommonTextfieldRectangle(
                                  controller: packageController,
                                  hintText: 'Package',
                                  labelText: 'Package',
                                  maxLine: 1,
                                  textInput: TextInputType.text,
                                  onClick: () => FocusScope.of(context)
                                      .requestFocus(FocusNode()),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Delivery Date Time",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CommonTextfieldRectangle(
                                    controller: dateController,
                                    hintText: 'Date',
                                    labelText: 'Date',
                                    maxLine: 1,
                                    textInput: TextInputType.text,
                                    onClick: () => FocusScope.of(context)
                                        .requestFocus(FocusNode()),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CommonTextfieldRectangle(
                                    controller: timeController,
                                    hintText: 'Time',
                                    labelText: 'Time',
                                    maxLine: 1,
                                    textInput: TextInputType.text,
                                    onClick: () => FocusScope.of(context)
                                        .requestFocus(FocusNode()),
                                  ),
                                )
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
      ),
    );
  }
}
