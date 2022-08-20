import 'package:logger/logger.dart';


//==========================DEBUG LOG =====================================================
var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);