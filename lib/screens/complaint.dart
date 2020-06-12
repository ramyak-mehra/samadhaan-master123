import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:samadhan/data/constants.dart';
import 'package:samadhan/widgets/bottomsheet.dart';
import 'dart:io';

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint>
    with SingleTickerProviderStateMixin {
  final databaseReference = Firestore.instance;
  AnimationController _animationController;
  Animation<double> _animation;
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _houseController = new TextEditingController();
  TextEditingController _colonyController = new TextEditingController();
  TextEditingController _detailsController = new TextEditingController();
  TextEditingController _consumerController = new TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  PersistentBottomSheetController _controller;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedDepartment;
  String _wardNumber;
  String _village;
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _houseController.dispose();
    _colonyController.dispose();
    _detailsController.dispose();
    _animationController.dispose();
    _consumerController.dispose();

    super.dispose();
  }

  bool loading = false;
  callback(bool value) {
    setState(() {
      loading = value;
    });
  }

  @override
  void initState() {
    super.initState();
    checkInternet();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 600));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInCirc);
    _animation.addListener(() => this.setState(() {}));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    "assets/edit.jpg",
                    width: _animation.value * 350,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formkey,
                    child: Container(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          complaintText,
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              controller: _nameController,
                              maxLines: 1,
                              validator: (value) {
                                if (value.isEmpty || value.length < 1) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'Name',
                                  hintText: "Enter your name",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              autocorrect: false,
                              controller: _phoneController,
                              maxLines: 1,
                              validator: (value) {
                                if (value.isEmpty ||
                                    value.length < 1 && value.length > 10 ||
                                    int.parse(value) < 5555555555) {
                                  return 'Please enter a valid phone number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.phone,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'Phone',
                                  hintText: "Enter your phone number",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              controller: _houseController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.home,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'House No.',
                                  hintText: "Enter your House Number",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              controller: _colonyController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.location_city,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'Colony',
                                  hintText: "Enter your Colony",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.confirmation_number,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                DropdownButton(
                                  iconEnabledColor: Colors.white,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  focusColor: Colors.black,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600]),
                                  elevation: 2,
                                  hint: Text('Ward Number                  ',
                                      style: TextStyle(
                                          color: Colors
                                              .grey)), // Not necessary for Option 1
                                  value: _wardNumber,
                                  onChanged: (newValue) {
                                    setState(() {
                                      if (newValue == "None") {
                                        _wardNumber = null;
                                      } else {
                                        _wardNumber = newValue;
                                        _village = null;
                                      }
                                    });
                                  },
                                  items: getWardsList().map((value) {
                                    return DropdownMenuItem(
                                      child: new Text(value.toString()),
                                      value: value,
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.assignment,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                DropdownButton(
                                  iconEnabledColor: Colors.white,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  focusColor: Colors.black,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600]),
                                  elevation: 2,
                                  hint: Text(
                                    'Village     ',
                                    style: TextStyle(color: Colors.grey),
                                  ), // Not necessary for Option 1
                                  value: _village,
                                  onChanged: (newValue) {
                                    setState(() {
                                      if (newValue == "None") {
                                        _village = null;
                                      } else {
                                        _village = newValue;
                                        _wardNumber = null;
                                      }
                                    });
                                  },
                                  items: villages.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.assignment,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                DropdownButton(
                                  iconEnabledColor: Colors.white,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  focusColor: Colors.black,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600]),
                                  elevation: 2,
                                  hint: Text(
                                    'Department ',
                                    style: TextStyle(color: Colors.grey),
                                  ), // Not necessary for Option 1
                                  value: _selectedDepartment,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedDepartment = newValue;
                                    });
                                  },
                                  items: depts.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              controller: _consumerController,
                              maxLines: 1,
                              //validator: (value) {},
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person_outline,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'Consumer Id',
                                  hintText: "Enter a Consumer Id",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              controller: _detailsController,
                              maxLines: null,
                              validator: (value) {
                                if (value.isEmpty || value.length < 1) {
                                  return 'Please enter details about your issue';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.edit,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'Details of the Issue',
                                  hintText:
                                      "Enter all the details about the issue",
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          MaterialButton(
                            padding: EdgeInsets.all(16),
                            onPressed: () async {
                              if (_selectedDepartment == null &&
                                  (_wardNumber == null || _village == null)) {
                                showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      title: Text(
                                        "TRY AGAIN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Text(
                                          "Department and either Ward Number or Village is mandatory"),
                                      actions: <Widget>[
                                        MaterialButton(
                                          child: Text(
                                            "RETRY",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ));
                              } else if (!(_formkey.currentState.validate())) {
                                showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      title: Text(
                                        "TRY AGAIN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content:
                                          Text("Please Check Your Detials"),
                                      actions: <Widget>[
                                        MaterialButton(
                                          child: Text(
                                            "RETRY",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ));
                              } else {
                                String now =
                                    (DateTime.now().millisecondsSinceEpoch %
                                            1000)
                                        .toString();

                                String refNum =
                                    "PWL${_nameController.text.substring(0, 3).toUpperCase()}${_phoneController.text}$now";
                                print(refNum);
                                setState(() {
                                  loading = true;
                                });
                                responeTimer();
                                bool result = await checkInternet();
                                if (!result) {
                                  print('result checked $result');
                                  setState(() {
                                    loading = false;
                                  });

                                  showDialog(
                                      context: context,
                                      child: AlertDialog(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        title: Text(
                                          "TRY AGAIN",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: Text(
                                            "Please Check Your Internet Connection"),
                                        actions: <Widget>[
                                          MaterialButton(
                                            child: Text(
                                              "RETRY",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      ));
                                } else {
                                  await sendData(refNum);
                                  _controller = scaffoldKey.currentState
                                      .showBottomSheet((context) {
                                    return CustomBottomSheet(
                                      title: 'SUCCESS',
                                      refNum: refNum,
                                      controller: _controller,
                                    );
                                  });
                                }
                                setState(() {
                                  loading = false;
                                });

                                //bottomSheet("SUCCESS!", refNum, context);
                              }
                            },
                            color: Colors.black,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          loading ? CircularProgressIndicator() : Container(),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void responeTimer() async {
    print('timer fired');
    await Future.delayed(Duration(seconds: 10))
        .then((value) => callback(false));
  }

  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }

  Future<bool> sendData(String refNum) async {
    try {
      await databaseReference
          .collection("complaints")
          .document(refNum)
          .setData({
        'consumerId': _consumerController.text,
        'name': _nameController.text,
        'phone': _phoneController.text,
        'house no': _houseController.text,
        'colony': _colonyController.text,
        'department': _selectedDepartment,
        'ward no': _wardNumber,
        'village': _village,
        'details': _detailsController.text,
        'current department': _selectedDepartment,
        'date': DateFormat.yMd().format(DateTime.now()),
        'status': "Processing",
        'trackingId': refNum,
        'AdminRemark': null,
        'DepartmentRemark': null,
        'Ignored': null
      }).then((value) {
        print("Success");
        return true;
      });
    } catch (e) {
      print(e);
      print('please try again');
      return false;
    }
    return false;
  }
}
