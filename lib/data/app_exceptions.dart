

class AppExceptions implements Exception{

  final _message;
  final _prefix;

  //constructor
  AppExceptions([this._message, this._prefix]);

  //return string method
  String toString(){
    return "$_prefix$_message";

  }
}

class InternetException extends AppExceptions{
  InternetException([String? message]) : super(message, "No internet");
}

class RequestTimeOut extends AppExceptions{
  RequestTimeOut([String? message]) : super(message, "Request time out");
}

class ServerException extends AppExceptions{
  ServerException([String? message]) : super(message, "Internal server error");
}

class InvalidUrlException extends AppExceptions{
  InvalidUrlException([String? message]) : super(message, "Invalid URL");
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message]) : super(message, "Data not found");
}