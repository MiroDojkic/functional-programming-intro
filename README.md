# Intro to functional programming
Examples used at DUMP internship lecture, demonstrating basic functional programming concepts.

## Running the examples
In order to run the functions defined in [Main.hs](https://github.com/MiroDojkic/functional-programming-intro/blob/main/Main.hs), install the [cabal-install](https://wiki.haskell.org/Cabal-Install) package.
After install, Cabal's package index might need an update:
```
cabal update
```

Examples can be tested in the Cabal REPL. To start it, run:
```
cabal repl
```

You can then invoke the loaded functions within the REPL.
For example:
```
sum [1..10]
```

To run the tests, call the following function within the Cabal REPL:
```
quickCheck prop_<test_name>
```

## Links
[Google TechTalks: Haskell Amuse-Bouche by Mark Lentczner](https://www.youtube.com/watch?v=b9FagOVqxmI)

[Channel9: Functional Programming Fundamentals by Erik Meijer](https://www.youtube.com/watch?v=UIUlFQH4Cvo&list=PLoJC20gNfC2gpI7Dl6fg8uj1a-wfnWTH8)

[Bret Victor: The Future of Programming](https://www.youtube.com/watch?v=8pTEmbeENF4)

## Books and papers
[Structure and Interpretation of Computer Programs by Harold Abelson, Gerald Jay Sussman, Julie Sussman](https://www.amazon.com/Structure-Interpretation-Computer-Programs-Engineering/dp/0262510871/)

[Why Functional Programming matters by John Hughes](https://www.cs.kent.ac.uk/people/staff/dat/miranda/whyfp90.pdf)

[Purely Functional Data Structures by Chris Okasaki](https://www.amazon.com/Purely-Functional-Data-Structures-Okasaki/dp/0521663504/)
