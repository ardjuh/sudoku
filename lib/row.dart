class Row {
  // List of tiles, tiles have all possible values
  List<List<bool>> _row = List.filled(
      9,
      List.filled(
        9,
        true,
      ));

  final List<int> _solved = List.filled(9, 0);

  Row(List<List<bool>> row) {
    if (row.length != 9) {
      throw Exception('Row must have 9 elements');
    }
    _row = row;
  }

  List<List<bool>> get row => _row;

  void solve() {
    for (int i = 0; i < 9; i++) {
      if (_solved[i] != 0) {
        // remove the value from the other tiles
        for (int j = 0; j < 9; j++) {
          if (j != i) {
            _row[j][_solved[i] - 1] = false;
          }
        }
      }
      // if there is only one possible value, set it
      if (_row[i].where((element) => element).length == 1) {
        _solved[i] = _row[i].indexOf(true) + 1;
      }
    }
  }

  @override
  String toString() {
    return _row.toString();
  }
}
