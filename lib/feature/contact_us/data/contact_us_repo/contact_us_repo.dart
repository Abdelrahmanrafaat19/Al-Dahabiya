// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';

abstract class ContactUsRepo {
  Future<Either<Failure, dynamic>> contactUsMethod(dynamic data);
}
