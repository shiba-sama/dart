import 'dart:math' show Random;

// —————————————————————————————————————————————————————————————————————————————
// Quick Sort

List<num> qs(List<num> nums) {
  if (nums.length < 2) { return nums; }
  final pivot = nums[0];
  final left = <num>[];
  final right = <num>[];
  for (var i = 1; i < nums.length; i++) {
    if (nums[i] < pivot) { left.add(nums[i]); }
    else { right.add(nums[i]); }
  }
  return qs(left)..add(pivot)..addAll(qs(right));
}

const data = [3, 2, 1, 4, 5];

// —————————————————————————————————————————————————————————————————————————————
// Test

void main(List<String> args) {
  final random = Random();
  final data = List<num>.generate(100, (_) => random.nextInt(1000));
  final sorted = qs(data);
  print(sorted);
}