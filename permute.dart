// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// Permutation

/** Yield permutations through Heap's Method. */
Stream<List<T>> permute<T>(List<T> arr, [int? n]) async * {
   n ??= arr.length;
   if (n <= 1) { yield arr; }
   else for (int i = 0; i < n; i++) {
      yield* permute(arr, n - 1);
      final j = n % 2 == 0 ? i : 0;
      final temp = arr[n - 1];
      arr[n - 1] = arr[j];
      arr[j] = temp;
   }
}

Stream<List<int>> permutations(List<int> list) async* {
   final n = list.length;
   List<int> cursor = List.filled(n, 0);

   yield list;
   for (var i = 0; i < n;) {
      if (cursor[i] < i) {
         if (i % 2 == 0) {
            final temp = list[0];
            list[0] = list[i];
            list[i] = temp;
         } 
         else {
            final temp = list[cursor[i]];
            list[cursor[i]] = list[i];
            list[i] = temp;
         }
         yield list;
         cursor[i] += 1;
         i = 0;
      } 
      else {
         cursor[i] = 0;
         i += 1;
      }
   }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// Test

void main(List<String> args) {
   final nats = List.generate(3, (i) => i);
   final perms = permutations(nats);
   perms.forEach(print);
}