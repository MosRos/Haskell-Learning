module Ch03_Types
  ( 
      typesIntroductionFunc,
  )
  where

typesIntroductionFunc :: IO ()


y :: Bool
y = False

z :: Integer
z = 5

w :: Int
w = 3

-- u = y + z

list0 = [1, 2, 5, 6, 8]

list1 = [7, 3, 2, 10]

list2 = list0 ++ list1

list3 = ["java", "kotlin", "c++", "haskell"]

list4 = [1 .. 20]

list5 = ['a' .. 'z']

list6 = [1, 3 .. 20]

list7 = take 10 (cycle [1, 2, 3])

list8 = take 12 (cycle "LOL ")

tuple0 = (1, "Ludwig Van Beethoven", True)

myIntToStr :: Int -> String
myIntToStr x = show x
--   | x < 3 = show x ++ " is less than three"
--   | otherwise = "normal"

doubleMe :: Int -> Int
doubleMe x = x + x

doubleUs x y = x * 2 + y * 2

doubleUs2 x y = doubleMe x + doubleMe y

doubleSmallNumbers :: Int -> Int
doubleSmallNumbers x = if x > 100 then x else x * 2

listComprehension1 = [x * 2 | x <- [1 .. 10], x * 2 <= 10]

listComprehension2 = [x | x <- [50 .. 100], x `mod` 7 == 3]

boomBangs xs = [if x < 10 then "Boom!" else "Bang!" | x <- xs, odd x]

-- We can include several predicates. If we wanted all numbers from 10 to 20 that are not 13, 15 or 19, we'd do:
multiConditionListComprehension = [x | x <- [10 .. 20], x /= 13, x /= 15, x /= 19]

-- multi-variable list comprehension
multiVariableListComprehension = [x * y | x <- [10 .. 20], y <- [3 .. 8], x * y > 50]

-- list comprehension with words!
nouns = ["hobo", "frog", "pop"]

adjectives = ["lazy", "grouchy", "scheming"]

listComprehensionWithWords = [noun ++ " " ++ adjective | noun <- nouns, adjective <- adjectives]

-- The _ for non-using variable
listLength xs = sum [1 | _ <- xs]

-- list comprehension with strings
removeNoneUpperCases st = [c | c <- st, c `elem` ['A' .. 'Z']]

-- Tuples
tuples1 = (13, "Wow!", False)

-- example func for tupple input
fist :: (a, b) -> a
fist (x, y) = x

secnd :: (a, b) -> b
secnd (x, y) = y

-- more functions example

-- an example of curried function
addFunc :: Int -> Int -> Int
addFunc x y = x + y

-- it's equals to this
-- addFunc :: Int -> (Int, Int)
-- addFunc x y = x + y

-- so calling add only on its first argument
-- HINT : in usecase add5 does not have input parameter and usd first params of add function
-- add5 :: Int -> Int
-- add5 = add 5

-- Important : by using Tupples as input type parameters we prevent curried function
add :: (Int, Int) -> Int
add (x, y) = x + y

-- Polymorphic functions: in type definition of this functions we use placeholders for input and output types
-- examples
-- 1
firstTuppleElement :: (a, b) -> a
firstTuppleElement (x, y) = x

-- firstTuppleElement (1, 4)
-- firstTuppleElement (3, False)
-- firstTuppleElement (1, 2)

-- 2
lengthFun :: [a] -> Int
lengthFun xs = sum [1 | _ <- xs]

-- lengthFun "Hello"
-- lengthFun [1, 2]

-- 3
-- map :: (a -> b) -> [a] -> [b]
-- map (x -> y) [x] = [y]
-- map myIntToStr [1, 2, 3, 4]

typesIntroductionFunc = do
  putStrLn "z value is"
  putStrLn (show (snd ("Haskle", 3)))
