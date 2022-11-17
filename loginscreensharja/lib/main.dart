import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:iosstyleswitch/iosstyleswitch.dart';
import 'package:login_screensharja/local_string.dart';
import 'package:login_screensharja/olympicpool.dart';
import 'package:login_screensharja/surveypage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'checkdropmenu.dart';
import 'homepage.dart';
import 'signupscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      home: const SignupScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  FocusNode? focusNode;
  FocusNode? myFocusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    myFocusNode = FocusNode();
    focusNode?.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 260,
                  child: Image.asset(
                    'assests/welcome.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 15, right: 15),
                  child: Text(
                    isSwitched ? "title".tr : "title".tr,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120, left: 15, right: 15),
                  child: Text(
                    isSwitched ? "subtitle".tr : "subtitle".tr,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 210, left: 15, right: 15, bottom: 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'English',
                            style: TextStyle(
                                fontSize: 11.0, color: Colors.lightBlue),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IosSwitch(
                              size: 27,
                              disableBackgroundColor: Colors.grey,
                              activeBackgroundColor: Colors.blue,
                              isActive: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  if (isSwitched == true) {
                                    var locale = const Locale('en', 'US');
                                    Get.updateLocale(locale);
                                  } else {
                                    var locale = const Locale('ar');
                                    Get.updateLocale(locale);
                                  }
                                  isSwitched = value;
                                });
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'عربى',
                            style: TextStyle(fontSize: 11.0),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Image.asset(
                                'assests/logo.png',
                                width: 130,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Container(
                                    decoration: focusNode!.hasFocus
                                        ? const BoxDecoration(boxShadow: [
                                            BoxShadow(blurRadius: 4)
                                          ])
                                        : null,
                                    child: TextFormField(
                                      autofocus: true,
                                      focusNode: focusNode,
                                      // focusNode: myFocusNode,
                                      decoration: InputDecoration(
                                          hoverColor: Colors.white,
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 194, 191, 191))),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                          prefixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () async {
                                                  final code =
                                                      await countryPicker
                                                          .showPicker(
                                                              context: context);
                                                  setState(() {
                                                    countryCode = code;
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                      ),
                                                    ),
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 1.0,
                                                                vertical: 4.0),
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 4.0),
                                                        decoration: const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        2.0))),
                                                        child: Text(
                                                          countryCode
                                                                  ?.dialCode ??
                                                              "+971",
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 290,
                                  child: Form(
                                    key: formkey,
                                    child: Container(
                                      decoration: focusNode!.hasFocus
                                          ? const BoxDecoration(boxShadow: [
                                              BoxShadow(blurRadius: 4)
                                            ])
                                          : null,
                                      child: TextFormField(
                                        autofocus: true,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'(^(?:[+0]9)?[0-9]{10}$)')
                                                  .hasMatch(value)) {
                                            return "Please enter the Mobile Number";
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        // focusNode: focusNode,

                                        focusNode: myFocusNode,

                                        decoration: InputDecoration(
                                          labelText: isSwitched
                                              ? "mobile_number".tr
                                              : "mobile_number".tr,
                                          labelStyle: const TextStyle(
                                              fontSize: 15, height: 3),
                                          fillColor: Colors.grey.shade50,
                                          hoverColor: Colors.white,
                                          filled: true,
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 194, 191, 191))),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 260),
                                  child: Text(
                                    isSwitched
                                        ? "pass_word".tr
                                        : "pass_word".tr,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                PinCodeTextField(
                                  keyboardType: TextInputType.number,
                                  appContext: context,
                                  length: 4,
                                  obscureText: true,
                                  obscuringCharacter: '*',
                                  onChanged: (Value) {
                                    print(Value);
                                  },
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(1),
                                    inactiveColor: Colors.grey.shade100,
                                    activeColor: Colors.grey.shade100,
                                    selectedColor: Colors.grey.shade100,
                                    fieldHeight: 50,
                                    fieldWidth: 65,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 12),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Changepasspage()),
                                    );
                                  },
                                  child: Text(
                                    isSwitched
                                        ? "change_password".tr
                                        : "change_password".tr,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 49, 191, 238)),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 58, 192, 250),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      var snackBar = const SnackBar(
                                          content: Text('Login Sucessfully'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const Homepage();
                                      }));
                                    } else {
                                      var snackBar = const SnackBar(
                                          content: Text('Login UnSucessfully'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  child: SizedBox(
                                    width: 80,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          isSwitched
                                              ? "button".tr
                                              : "button".tr,
                                          style: const TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isSwitched ? "account".tr : "account".tr,
                                  style: const TextStyle(fontSize: 13),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 13),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Registrationpage()),
                                    );
                                  },
                                  child: Text(
                                    isSwitched ? "register".tr : "register".tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 49, 191, 238)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: 630,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assests/footerimg.png',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      // color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Registrationpage extends StatelessWidget {
  const Registrationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Welcome to Sign Up Page"),
    ));
  }
}

class Changepasspage extends StatelessWidget {
  const Changepasspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(" Change Your Password Here"),
    ));
  }
}
