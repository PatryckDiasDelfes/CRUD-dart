import 'nota.dart';

class NotaProva extends Nota {

  NotaProva(double valor) : super(valor);

  @override
  double get peso => 2.0;

  @override
  String get tipo => 'Prova';

}