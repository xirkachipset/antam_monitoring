import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';

MqttClient setup(String serverAddress, String uniqueID) {
  return MqttBrowserClient(serverAddress, uniqueID);
}
