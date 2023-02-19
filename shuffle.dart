import 'dart:math';

// —————————————————————————————————————————————————————————————————————————————
// Durstenfeld Shuffle

/**
 * Returns permuted copy with Durstenfelt improvement on the Fischer-Yates 
 * shuffle algorithm.
 */
List<T> shuffle<T>(List<T> list) {
  final copy = List<T>.from(list);
  final random = Random();
  for (var i = copy.length - 1; i > 0; i--) {
    final j = random.nextInt(i + 1);
    final temp = copy[i];
    copy[i] = copy[j];
    copy[j] = temp;
  }
  return copy;
}

// —————————————————————————————————————————————————————————————————————————————
// Test

void main(List<String> args) {
  final data = List<num>.generate(10, (i) => i);
  var shuffled = shuffle(data);
  print(shuffled);
}