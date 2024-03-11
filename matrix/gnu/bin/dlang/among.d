module matrix.gnu.bin.dlang.among;

/** 
template canFind(alias pred = "a == b")
    Convenience function. Like find, but only returns whether or not the search was successful.
    For more information about pred see find.
    See Also:
    std.algorithm.comparison.among for checking a value against multiple arguments.
    Examples:**/ 
class MyMatrixGNUBindlangAmong
{
   interface MyAmong
   {
      void among(const char String, char values)(ref values) {
        const arr = [0, 1, 2, 3];
        assert(canFind(arr, 2));
        assert(!canFind(arr, 4));

        // find one of several needles
        assert(arr.canFind(3, 2));
        assert(arr.canFind(3, 2) == 2); // second needle found
        writeln(arr.canFind([1, 3], 2)); // 2

        assert(canFind(arr, [1, 2], [2, 3]));
        writeln(canFind(arr, [1, 2], [2, 3])); // 1
        assert(canFind(arr, [1, 7], [2, 3]));
        writeln(canFind(arr, [1, 7], [2, 3])); // 2
        assert(!canFind(arr, [1, 3], [2, 4]));
        writeln(canFind(arr, [1, 3], [2, 4])); // 0
     
        auto words = [
             "apple",
             "beeswax",
             "cardboard"
        ];

       assert(!canFind(words, "bees"));
       assert( canFind!((string elem, string needle) => elem.startsWith(needle))(words, "bees"));

       string s1 = "aaa111aaa";
       string s2 = "aaa222aaa";
       string s3 = "aaa333aaa";
       string s4 = "aaa444aaa";
       const hay = [s1, s2, s3, s4];
       assert(hay.canFind!(e => e.canFind("111", "222")));

      }    
   }    
}    
