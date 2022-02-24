module Ch04_Functions
  ( functionsIntro,
  )
where

functionsIntro :: IO ()

identityFun :: a -> a
identityFun x = x


addFun :: Int -> Int -> Int
addFun x y = x +y

inc :: Int -> Int
inc = addFun 1

applyTwiceFun :: (a -> a) -> a -> a
applyTwiceFun f x = f (f x)

uncurryAdd :: (Int, Int) -> Int
uncurryAdd (x, y) = x + y

functionsIntro = do
    putStrLn "Ch4_Functions Output:"
    putStrLn (lucky 5)
    putStrLn (sayMe 4)
    putStrLn (show (factorial 7))


-- Note that if we put the **Catch-All Pattern**(general definition form with x) at the top, other forms of function will not execute
lucky :: (Integral a) => a -> String
lucky 7 = "You Are Luuuuuckkkky!"
lucky x = "Sorry! Not Lucky!"

sayMe :: (Integral a) => a -> String  
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5"  

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVector :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVector (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

length :: [a] -> Int
length xs = sum [1 | _ <- xs]

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs
