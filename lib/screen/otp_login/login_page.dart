
import 'dart:math';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final String countryCode = "+91"; // Default country code
  String? generatedOtp;
  bool isOtpSent = false;
  String? errorMessage;

  // Simulate OTP generation
  String generateOtp() {
    final random = Random();
    return (1000 + random.nextInt(9000)).toString(); // 4-digit OTP
  }

  void sendOtp() {
    String phoneNumber = _phoneController.text.trim();
    if (phoneNumber.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      setState(() {
        errorMessage = null;
        generatedOtp = generateOtp();
        isOtpSent = true;
      });
      // Simulate sending OTP (in production, use an SMS service like Twilio)
      print('Simulated OTP sent to $countryCode$phoneNumber: $generatedOtp');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP sent: $generatedOtp (Check console for demo)')),
      );
    } else {
      setState(() {
        errorMessage = 'Please enter a valid 10-digit phone number';
      });
    }
  }

  void verifyOtp() {
    String enteredOtp = _otpController.text.trim();
    if (enteredOtp == generatedOtp) {
      // Successful login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful!')),
      );
      // Navigate to home page or next screen
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      setState(() {
        errorMessage = 'Invalid OTP. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isOtpSent ? 'Enter OTP' : 'Enter Phone Number',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              if (!isOtpSent)
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixText: '$countryCode ',
                    border: OutlineInputBorder(),
                    errorText: errorMessage,
                  ),
                  maxLength: 10,
                )
              else
                PinCodeTextField(
                  appContext: context,
                  controller: _otpController,
                  length: 4,
                  onChanged: (value) {},
                  onCompleted: (value) => verifyOtp(),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: Colors.blue,
                    selectedColor: Colors.blue,
                    inactiveColor: Colors.grey,
                  ),
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,
                  errorTextSpace: 20,
                  errorTextDirection: TextDirection.ltr,
                  textStyle: TextStyle(fontSize: 20),
                ),
              if (errorMessage != null && isOtpSent)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: isOtpSent ? verifyOtp : sendOtp,
                child: Text(isOtpSent ? 'Verify OTP' : 'Send OTP'),
              ),
              if (isOtpSent)
                TextButton(
                  onPressed: () {
                    setState(() {
                      isOtpSent = false;
                      _otpController.clear();
                      errorMessage = null;
                    });
                  },
                  child: Text('Change Phone Number'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }
}

