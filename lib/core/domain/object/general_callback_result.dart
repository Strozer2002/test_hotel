import 'package:data_source/callback_result/callback_result.dart';
import 'package:data_source/data_source/data_source.dart';
import 'package:test_hotel/core/domain/object/pagination_data.dart';

sealed class BaseCallbackResult<Result, Errors>
    extends CallbackResult<Result, Errors> {
  const BaseCallbackResult({
    required super.callbackStatus,
    super.data,
    super.errors,
  });
}

base class RemoteCbResult<T>
    extends BaseCallbackResult<T, Map<String, List<String>>> {
  final String? message;
  final int? statusCode;
  final PaginationData? pagination;

  const RemoteCbResult({
    required super.callbackStatus,
    this.statusCode,
    super.data,
    super.errors,
    this.message,
    this.pagination,
  });
}

base class LocalCbResult<T>
    extends BaseCallbackResult<T, LocalDataSourceException> {
  const LocalCbResult({
    required super.callbackStatus,
    super.data,
    super.errors,
  });
}
