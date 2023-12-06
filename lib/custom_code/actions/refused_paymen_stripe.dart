// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import "dart:convert";
import 'package:stripe/stripe.dart';
import 'package:http/http.dart' as http;

Future<int> refusedPaymenStripe(String idpayment) async {
  // Add your function code here!

  final stripe = Stripe(
      'sk_test_51OGTjPAnZIwkGSkUDMC7ltsx09qJvI4lNkactvdRXFGVxMnBoyUmm89bhugxC8IoA8SjSnhAIOtxDAbm75GGZGY300dJ0AiOJF');

  final url = Uri.parse('https://api.stripe.com/v1/refunds');
  final response = await http.post(url, headers: {
    'Authorization':
        'Bearer sk_test_51OGTjPAnZIwkGSkUDMC7ltsx09qJvI4lNkactvdRXFGVxMnBoyUmm89bhugxC8IoA8SjSnhAIOtxDAbm75GGZGY300dJ0AiOJF',
    'Content-Type': 'application/x-www-form-urlencoded'
  }, body: {
    'payment_intent': idpayment.toString(),
  });

  return response.statusCode;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
