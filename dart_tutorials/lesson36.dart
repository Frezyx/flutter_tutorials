mixin Wifi {
  var enabled = false;

  void enableWifi() {
    enabled = true;
    print("Wifi enabled");
  }

  void disableWifi() {
    enabled = false;
    print("Wifi disabled");
  }
}

class Phone with Wifi {}

class TV with Wifi {}

void main() {
  var xiaomi = Phone();
  xiaomi.enabled;
  xiaomi.enableWifi();
  xiaomi.disableWifi();
}
