import 'package:data_source/dto/dto.dart';

abstract base class GeneralResponseBody<T> implements DTO {
  T? data;

  GeneralResponseBody({
    this.data,
  });
}
