module Ch05_Functions2 (
    runfunctions2,
) where

import Text.Read


runfunctions2 :: IO ()
runfunctions2 = do
    putStrLn "Please enter your lucky number:"
    n <- getLine
    let m = luckyNumber n in
            putStrLn (amILucky m)


luckyNumber :: String -> Maybe Int
luckyNumber x = readMaybe x
-- luckyNumber n = if n > 0 then Just n else Nothing

amILucky :: Maybe Int -> String
amILucky n = case n of
          Nothing -> "You lose! Not a number!"
          Just n  -> extractLuckMessage n 
      

extractLuckMessage :: Int -> String
extractLuckMessage n = if n < 0 then "Bad Luck!" else
            let m = n `mod` 5 in
              case m of
                0 -> "Horrayyyy! You win :)"
                1 -> "*"
                2 -> "**"
                3 -> "***"
                4 -> "****" 

-- Guards: guards apply on boolean statements
absolute :: Int -> Int
absolute n
   | n < 0  = (-n)
   | otherwise = n


absoluteJust :: Maybe Int -> Maybe Int
absoluteJust n = case n of
    Nothing -> Nothing
    Just n
       | n < 0 -> Just (-n)
       | otherwise -> Just n

printMaybeNum :: Maybe Int -> String
printMaybeNum n = case n of
    Nothing -> "Nothing"
    Just n -> "has value " ++ (show n)


-- LET clause
f = let x = 1; y = 3 in (x+y)

-- with where
f2 = x+y 
    where 
         x = 1 
         y = 3


    -- WHERE clause
bodyBmiTell :: (RealFloat a) => a -> a -> String
bodyBmiTell height weight
    |bmi <= 18.5 = "UnderWeight"
    |bmi <= 25.0 = "Fit"
    |bmi <= 30.0 = "Fat"
    |otherwise   = "You are a whale!"
    where bmi = weight/height^2

-- IF clause
cylinderArea :: (RealFloat a) => a -> a -> a
cylinderArea r h =
            let sideArea = 2*pi*r*h
                topArea  = pi*r^2
            in sideArea + 2*topArea

-- CASE clause
describeList :: [a] -> String
describeList xs = case xs of 
                  []  -> "Empty"
                  [x] -> "Single"
                  xs  -> "A longer list"
                  
            
-- WHAT
-- we can express above function with WHAT clause
describeList2 :: [a] -> String
describeList2 xs = "The list is " ++ what xs
                  where what []  = "Empty"
                        what [x] = "Single element"
                        what xs  = "A long list"



-- IF conditional
isPositive :: Int -> Bool
isPositive n = if (n > 0) then True else False

        