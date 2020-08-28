

class SearchModel {
  String name;
  String address;

  SearchModel(this.name, this.address);

  @override
  String toString() {
    return '{ ${this.name}, ${this.address} }';
  }
}