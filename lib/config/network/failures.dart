abstract class Failure {
  final String? header;
  final String? body;

  const Failure(this.header, this.body);
}

class GeneralFailure extends Failure {
  GeneralFailure(String super.header, String super.body);

  @override
  String get header => super.header!;
  @override
  String get body => super.body!;
}
