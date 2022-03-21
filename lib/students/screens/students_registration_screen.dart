import 'package:flutter/services.dart';

import "../../libs.dart";

class StudentRegistrationScreen extends StatefulWidget {
  final int roundID;
  static const String RouteName = "/students_registration";

  const StudentRegistrationScreen({required this.roundID, Key? key})
      : super(key: key);

  @override
  State<StudentRegistrationScreen> createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {
  String messageText = "Please Provide Student Information Correctly";
  Color messageColor = Colors.black87;
  FontStyle messageStyle = FontStyle.italic;
  final List<String> sexs = ['Male', 'Female'];
  String selectedValue = "Male";

  String mainInfo = "This is samuael";
  Color infosColor = Colors.green;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController grandnameController = TextEditingController();
  TextEditingController academicStatusController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController birthMonthController = TextEditingController();
  TextEditingController birthYearController =
      TextEditingController(text: "${DateTime.now().year - 8 - 18}");
  TextEditingController regionController = TextEditingController();
  TextEditingController zoneController = TextEditingController();
  TextEditingController woredaController = TextEditingController();
  TextEditingController kebeleController = TextEditingController();
  TextEditingController uniqueAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  bool firstnameError = false;
  bool lastnameError = false;
  bool grandnameError = false;
  bool academicStatusError = false;
  bool phoneError = false;
  bool dayError = false;
  bool monthError = false;
  bool yearError = false;
  bool regionError = false;
  bool zoneError = false;
  bool woredaError = false;
  bool kebeleError = false;
  bool addressError = false;
  bool cityError = false;

  int? day;
  int? month;
  int? year;

  Map<String, dynamic> errorMessages = {};

  void handleInputProcessing(BuildContext context) async {
    errorMessages.clear();
    if (firstnameController.text.length < 3) {
      errorMessages["First name"] =
          ("first name must have a length of 3 or more characters");
      firstnameError = true;
    }
    if (lastnameController.text.length < 3) {
      errorMessages["Last name"] =
          ("last name must have a length of 3 or more characters");
      lastnameError = true;
    }
    if (grandnameController.text != "" && grandnameController.text.length < 3) {
      errorMessages["Grand name"] =
          ("grand father name must have a length of 3 or more characters");
      grandnameError = true;
    }
    if (academicStatusController.text == "") {
      errorMessages["Academic Status"] = ("academic status must be specified.");
      academicStatusError = true;
    }
    if (!validatePhoneNumber(phoneNumberController.text)) {
      errorMessages["Phone"] = ("invalid Phone Number");
      phoneError = true;
    }
    try {
      day = int.parse(birthDayController.text);
      if (day == null || day! <= 0 || day! > 30) {
        throw Exception("x");
      }
    } catch (e) {
      if (e.toString() == "x") {
        errorMessages["Birth Day"] = "day value must between 1- to- 30";
      } else {
        errorMessages["Birth Day"] = "invalid day value";
      }
      dayError = true;
    }

    try {
      month = int.parse(birthMonthController.text);
      if (month == null ||
          month! <= 0 ||
          month! > 13 ||
          (month! == 13 && month! > 6)) {
        throw Exception("x");
      }
    } catch (e) {
      if (e.toString() == "x") {
        errorMessages["Birth Month"] = "month value must between 1- to- 13";
      } else {
        errorMessages["Birth Month"] = "invalid month value";
      }
      monthError = true;
    }
    try {
      year = int.parse(birthYearController.text);
      if (year == null ||
          year! <= 1900 ||
          year! > (DateTime.now().year - 7 - 17)) {
        throw Exception("x");
      }
    } catch (e) {
      if (e.toString() == "x") {
        errorMessages["Birth Year"] =
            "year value must between 1900 to- ${DateTime.now().year - 8 - 17}";
      } else {
        errorMessages["Birth Year"] =
            "invalid year value, only integer values are allowed";
      }
      yearError = true;
    }

    if (regionController.text.length < 3) {
      errorMessages["Region"] = "invalid region value";
      regionError = true;
    }
    if (zoneController.text.length < 3) {
      errorMessages["Zone"] = "invalid zone value";
      zoneError = true;
    }
    if (woredaController.text.length < 3) {
      errorMessages["Woreda"] = "invalid woreda value";
      woredaError = true;
    }
    if (cityController.text.length < 3) {
      errorMessages["City"] = "invalid city name or value";
      cityError = true;
    }

    if (errorMessages.length > 0) {
      setState(() {
        this.errorMessages = this.errorMessages;
      });
    } else {
      errorMessages.clear();
      setState(() {
        this.errorMessages = this.errorMessages;
      });
      print("The Input has Passed succesfuly.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final extraFields = [
      Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(
              top: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 200,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).cursorColor,
                        autofocus: true,
                        controller: regionController,
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color:
                                      regionError ? Colors.red : Colors.teal)),
                          labelText: ' Region',
                          labelStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF006699),
                          ),
                        ),
                      ),
                    ),
                    getDeviceType() == DeviceType.Desktop
                        ? Text("/")
                        : SizedBox(),
                    Container(
                      width: 200,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).cursorColor,
                        autofocus: true,
                        controller: zoneController,
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: zoneError ? Colors.red : Colors.teal)),
                          enabled: true,
                          labelText: ' Zone ',
                          labelStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF006699),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).cursorColor,
                        autofocus: true,
                        controller: woredaController,
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color:
                                      woredaError ? Colors.red : Colors.teal)),
                          labelText: ' Woreda ',
                          labelStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF006699),
                          ),
                        ),
                      ),
                    ),
                    getDeviceType() == DeviceType.Desktop
                        ? Text("/")
                        : SizedBox(),
                    Container(
                      width: 200,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).cursorColor,
                        autofocus: true,
                        controller: cityController,
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: cityError ? Colors.red : Colors.teal)),
                          labelText: ' city',
                          labelStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF006699),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // getDeviceType()==DeviceType.Desktop ? Text("/") : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).cursorColor,
                        autofocus: true,
                        controller: kebeleController,
                        decoration: InputDecoration(
                            labelText: ' Kebele: ',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF006699),
                            ),
                            helperText: "( Optional )"),
                      ),
                    ),
                    Text("/"),
                    Container(
                      width: 200,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).cursorColor,
                        autofocus: true,
                        controller: uniqueAddressController,
                        decoration: InputDecoration(
                            labelText: ' Address Unique Name : ',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF006699),
                            ),
                            helperText: "( Optional )"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 25,
            // right: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                // height: 50,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    "Student Address Information",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      // ClipRRect(
      //   borderRadius: BorderRadius.circular(10),
      //   child: Opacity(
      //     opacity: 0.9,
      //     child: Container(
      //       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      //       color: Colors.green,
      //       child: Text(
      //         "NOTICE: Any Operation on this Student Information will be associated with your action!\n If additional operation is needed to perform  On this use instance Admin can be In charge of.",
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      SizedBox(
        height: 20,
      ),
      // errorMessages.length > 0
      //     ?
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Opacity(
          opacity: 0.9,
          child: AnimatedContainer(
            duration: Duration(
              seconds: 1,
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // children : errorMessages
              children: errorMessages.keys.map<Widget>((k) {
                return Text(
                  "* $k \t:\t ${errorMessages[k] ?? '-'}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.justify,
                );
              }).toList(),
            ),
          ),
        ),
      ),
      // : SizedBox(),
      SizedBox(
        height: 20,
      ),
      ElevatedButton.icon(
          onPressed: () => handleInputProcessing(context),
          icon: Icon(Icons.app_registration_outlined),
          label: Text(
            "Register",
          ),
          style: ButtonStyle(
              animationDuration: Duration(
                seconds: 1,
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
              )))
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.app_registration,
              color: Colors.white,
            ),
            Text(
              "Students Registration",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        // width : MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: AnimatedContainer(
                padding: EdgeInsets.all(5),
                duration: Duration(
                  milliseconds: 500,
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                // color: Colors.lightBlue[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Student Registration for ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Category :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "   Bajaj",
                      style: TextStyle(
                        // color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Round Number :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "   5",
                      style: TextStyle(
                        // color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  messageText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: messageColor,
                    fontStyle: messageStyle,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Row(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Opacity(
                      opacity: 0.7,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 10,
                        ),
                        child: Text(
                          mainInfo,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: infosColor),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(5),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "First Name: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 200,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                // cursorColor: Theme.of(context).cursorColor,
                                autofocus: true,
                                controller: firstnameController,
                                decoration: InputDecoration(
                                  border: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          width: 1,
                                          color: firstnameError
                                              ? Colors.red
                                              : Colors.teal)),
                                  labelText: ' Name',
                                  labelStyle: TextStyle(
                                    color: Color(0xFF006699),
                                    fontSize: 12,
                                  ),
                                  // helperText: "First Name",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Last Name: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 200,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Theme.of(context).cursorColor,
                                autofocus: true,
                                controller: lastnameController,
                                decoration: InputDecoration(
                                  border: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: lastnameError
                                              ? Colors.red
                                              : Colors.teal)),

                                  labelText: ' Father Name',
                                  labelStyle: TextStyle(
                                    color: Color(0xFF006699),
                                    fontSize: 12,
                                  ),
                                  // helperText: "First Name",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sure Name: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 200,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: grandnameError
                                    ? Colors.red
                                    : Theme.of(context).cursorColor,
                                autofocus: true,
                                controller: grandnameController,
                                decoration: InputDecoration(
                                  border: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: grandnameError
                                              ? Colors.red
                                              : Colors.teal)),
                                  labelText: ' Grand Father Name',
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF006699),
                                  ),
                                  helperText: "( Optional )",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sex:   ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            DropdownButton<String>(
                              value: selectedValue,
                              items: <String>['Male', 'Female']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    this.selectedValue = value;
                                  });
                                }
                              },
                              selectedItemBuilder: (BuildContext context) {
                                return <String>['Male', 'Female']
                                    .map<Widget>((String item) {
                                  return Text(item);
                                }).toList();
                              },
                              autofocus: true,
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 12,
                                // fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Acadamic \nStatus    :   ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 200,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Theme.of(context).cursorColor,
                                autofocus: true,
                                controller: academicStatusController,
                                decoration: InputDecoration(
                                  border: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: academicStatusError
                                              ? Colors.red
                                              : Colors.teal)),
                                  labelText: ' Acadamic Status',
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF006699),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Phone \nNumber   :   ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 200,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Theme.of(context).cursorColor,
                                autofocus: true,
                                controller: phoneNumberController,
                                decoration: InputDecoration(
                                  border: new UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                      color:
                                          phoneError ? Colors.red : Colors.teal,
                                    ),
                                  ),
                                  labelText: ' Phone number',
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF006699),
                                  ),
                                  helperText: "eg. +251912345678",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Stack(children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 40,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 30),
                                Text(
                                  "Date of Birth In \nEthiopian Calendar",
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    cursorColor: Theme.of(context).cursorColor,
                                    autofocus: true,
                                    controller: birthDayController,
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                          color: dayError
                                              ? Colors.red
                                              : Colors.teal,
                                        ),
                                      ),
                                      labelText: 'Day:',
                                      labelStyle: TextStyle(
                                        color: Color(0xFF006699),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Text("/"),
                                Container(
                                  width: 70,
                                  child: TextField(
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    cursorColor: Theme.of(context).cursorColor,
                                    controller: birthMonthController,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                          color: monthError
                                              ? Colors.red
                                              : Colors.teal,
                                        ),
                                      ),
                                      labelText: ' month',
                                      labelStyle: TextStyle(
                                        color: Color(0xFF006699),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Text("/"),
                                Container(
                                  width: 60,
                                  child: TextField(
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    cursorColor: Theme.of(context).cursorColor,
                                    controller: birthYearController,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: yearError
                                                  ? Colors.red
                                                  : Colors.teal)),
                                      labelText: ' Year',
                                      labelStyle: TextStyle(
                                        color: Color(0xFF006699),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 25,
                        right: 25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            // height: 50,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "Birth Date Information",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  ...(getDeviceType() != DeviceType.Desktop ? extraFields : [])
                ],
              ),
              getDeviceType() == DeviceType.Desktop
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: extraFields,
                    )
                  : SizedBox()
            ]),
          ],
        ),
      ),
    );
  }
}
