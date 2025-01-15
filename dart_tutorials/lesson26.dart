void main() {
  final storage = Storage(1);
  storage.update(4);
  final value = storage.read();
  print(value);
}

class Storage<T> {
  Storage(this.value);
  T value;

  T read() => value;

  void update(T value) {
    this.value = value;
  }
}
