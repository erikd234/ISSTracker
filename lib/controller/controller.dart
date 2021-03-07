import 'package:iss_tracker/model/model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

// Has methods for contacting the model to read more data
// Updates the location to the view.
class Controller extends ControllerMVC {
  factory Controller() => _this ??= Controller._();
  Controller._() {
    _model = Model();
  }
  static Controller _this;
  Model _model;

  double get lat {
    var value = double.parse(_model.location.lat);

    return value;
  }

  double get long {
    var value = double.parse(_model.location.long);

    return value;
  }

  Future<void> updateLocation() async => await _model
      .readLocation(); // interacting with model to get the new location.
}
