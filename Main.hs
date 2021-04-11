{-# LANGUAGE NoImplicitPrelude #-}

module Main where
import Test.QuickCheck
import Test.QuickCheck.Function
import Prelude (
  (+), (.), (==), (<=), (>=), (&&), all, putStrLn,
  Num, Bool, Enum,
  Bool(True), otherwise)

-- iteration through the list of values
-- is possible with the recursion
sum :: Num a => [a] -> a
sum [] = 0
sum (x:xs) = x + sum xs

prop_sum_zeros = sum [0, 0] == 0
prop_sum_range_1_10 = sum [1..10] == 55
prop_sum_symmetric_range = sum [-10..10] == 0
prop_sum xs@[] = sum xs == 0
prop_sum xs@[x] = sum xs == x
prop_sum xs = True

(∑) :: (Num a, Enum a) => a -> a -> a
(∑) x y = sum [x..y]

prop_range_sum x y = x ∑ y == sum [x..y]


-- apply f to each value of the list
map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs

prop_map_length f xs = length (map (apply f) xs) == length xs
prop_map_applied f xs = map (apply f) xs == [apply f x | x <- xs]


-- filter values of the list that satisfy predicate p
-- *otherwise is alias for True
filter :: (a -> Bool) -> [a] -> [a]
filter p [] = []
filter p (x:xs)
  | p x = x : filter p xs
  | otherwise = filter p xs

prop_filter_length_greater_than_0 p xs = length (filter (apply p) xs) >= 0
prop_filter_length_less_than_length p xs = length (filter (apply p) xs) <= length xs
prop_filtered_satisfy_predicate p xs = all (apply p) (filter (apply p) xs)


-- compute the list length with composition:
-- sum(map((x -> 1) xs)) == (sum • map) ((x -> 1) xs)
length :: Num b => [a] -> b
length = sum . map (\_ -> 1)

prop_length_greater_than_0 xs = length xs >= 0


-- by using a single recursion
-- we can reduce the number of iterations
length' :: Num b => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

-- fold is an abstraction of recursion
fold :: (a -> b -> b) -> b -> [a] -> b
fold f i [] = i
fold f i (x:xs) = f x (fold f i xs)

-- reduce is same as fold
-- but uses the first element of the array
-- as an initial state
reduce :: (a -> a -> a) -> [a] -> a
reduce f (x:xs) = fold f x xs

-- since fold is an abstraction of recursion
-- we can redefine these functions as following
length'' :: Num b => [a] -> b
length'' = fold (\_ result -> result + 1) 0

sum' :: Num a => [a] -> a
sum' = fold (+) 0


message = "\n\n**********************************************\n\
  \Load this module with: \"cabal repl\"\n\
  \to enable invoking functions and running tests.\n\
  \To perform test run \"quickCheck prop_<test_name>\".\n"

main = putStrLn message
