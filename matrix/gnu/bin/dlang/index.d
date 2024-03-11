module matrix.gnu.bin.dlang.index;

/** 
Computes the index of the first occurrence of range's minimum element.
Parameters:
pred 	The ordering predicate to use to determine the minimum element.
Range range 	The input range to search.

Complexity Ο(range.length) Exactly range.length - 1 comparisons are needed.
Returns:
The index of the first encounter of the minimum element in range. If the range is empty, -1 is returned.

Limitations If at least one of the arguments is NaN, the result is an unspecified value. See std.algorithm.searching.maxElement for examples on how to cope with NaNs.
See Also:
maxIndex, std.algorithm.comparison.min, minCount, minElement, minPos
Examples:**/ 

class MyMatrixGNUBindlangIndex
{
   interface MyIndex
   {
      void opIndex(size_t index)(ref index)
      {
        ptrdiff_t minIndex(alias pred = "a < b", Range)(Range range)
        if (isInputRange!Range && !isInfinite!Range && is(typeof(binaryFun!pred(range.front, range.front))));

        int[] a = [2, 3, 4, 1, 2, 4, 1, 1, 2];

        // Minimum is 1 and first occurs in position 3
        writeln(a.minIndex); // 3
        // Get maximum index with minIndex
        writeln(a.minIndex!"a > b"); // 2

        // Range is empty, so return value is -1
        int[] b;
        writeln(b.minIndex); // -1

        // Works with more custom types
        struct Dog { int age; }
        Dog[] dogs = [Dog(10), Dog(5), Dog(15)];
        writeln(dogs.minIndex!"a.age < b.age"); // 1

        ptrdiff_t maxIndex(alias pred = "a < b", Range)(Range range)
        if (isInputRange!Range && !isInfinite!Range && is(typeof(binaryFun!pred(range.front, range.front))));

        // Maximum is 4 and first occurs in position 2
        writeln(a.maxIndex); // 2

        // Empty range
        writeln(b.maxIndex); // -1

        // Works with more custom types
        writeln(dogs.maxIndex!"a.age < b.age"); // 1

      }
   }    
}