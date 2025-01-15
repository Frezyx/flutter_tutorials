enum Pet {
  dog('Собака'),
  cat('Кошка'),
  bird('Птичка');

  const Pet(this.localization);
  final String localization;

  void printPetName() {
    print(this.localization);
  }
}

void main() {
  final vasyaPet = Pet.dog;
  final stasPet = Pet.cat;

  vasyaPet.printPetName();
  stasPet.printPetName();
}
