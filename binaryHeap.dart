import 'dart:math' show Random;

// —————————————————————————————————————————————————————————————————————————————
// Binary Heap

class BinaryHeap<T extends Comparable<T>> {
   List heap = [0 as T];
   Comparator<T> fn = (T a, T b) => a.compareTo(b);

   int get size => heap.length - 1;
   T get top => heap[1];
   List get serialize => heap.sublist(1);
   void set top(T a) { heap[1] = a; }

   BinaryHeap(Comparator<T>? comparison) {
      if (comparison != null) { this.fn = comparison; }
   }

   void swap(int a, int b) {
      var temp = heap[a];
      heap[a] = heap[b];
      heap[b] = temp;
   }

   void up() {
      var i = size;
      while (i > 1 && fn(heap[i], heap[i >> 1]) == 1) { swap(i, i >>= 1); }
   }

   void down([ int i = 1 ]) {
      final L = i << 1;
      final R = L + 1;
      var max = i;

      if (L <= size && fn(heap[L], heap[i]) > 0) { max = L; }
      if (R <= size && fn(heap[R], heap[max]) > 0) { max = R; }
      if (max != i) { swap(i, max); down(max); }
   }

   int push(T value) {
      heap.add(value);
      up();
      return size;
   }

   T? pop() {
      if (size == 0) { return null; }
      if (size == 1) { return heap.removeLast(); }
      final max = top;
      top = heap.removeLast();
      down();
      return max;
   }
}

// —————————————————————————————————————————————————————————————————————————————
// Test

void main(List<String> args) {
   final heap = BinaryHeap<num>((num a, num b) => a.compareTo(b));
   final random = Random();
   for (var i = 0; i < 10; i++) { heap.push(random.nextInt(100)); }
   print(heap.serialize);
   for (var i = 0; i < 10; i++) { print(heap.pop()); }
}