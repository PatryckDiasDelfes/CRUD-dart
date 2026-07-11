import 'nota.dart';

class NotaTrabalho extends Nota{

  NotaTrabalho(double valor) : super(valor);

  @override
  double get peso => 1.0;

  @override
  String get tipo => 'Trabalho';

}