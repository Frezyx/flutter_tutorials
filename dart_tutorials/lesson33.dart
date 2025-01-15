void main() {
  final storage = Storage<String>();
  final str = storage.read();
  if (str == null) {}
}

class Storage<T> {
  Storage({this.value});
  T? value;

  T? read() => value;

  void update(T value) {
    this.value = value;
  }
}
