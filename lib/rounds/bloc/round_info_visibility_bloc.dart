import "../../libs.dart";

class RoundInfoVisibility extends Cubit<bool> {
  RoundInfoVisibility() : super(false);
  

  changeState() async {
    emit(!this.state);
  }
}