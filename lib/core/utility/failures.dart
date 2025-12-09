 abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String msg) : super(msg);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String msg) : super(msg);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String msg) : super(msg);
}
