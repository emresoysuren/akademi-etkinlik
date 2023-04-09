import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

flushBarShow(BuildContext context, {String? message, String? title}) =>
    Flushbar(
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(16),
      message: message,
      title: title,
      duration: const Duration(seconds: 3),
    ).show(context);
