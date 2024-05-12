import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/home/data/section/section_model/section_model.dart';

abstract class SectionRepo {
  Future<Either<Failure, SectionModel>> getSections();
}
