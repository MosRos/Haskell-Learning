module Ch01_Intro(
    example1, double, quadruple
) where 

example1 :: IO()
example1 = putStrLn "Hello world functions!"

double x = x + x
quadruple x = double (double x) 

factorial n = product [1..n]

average ns =  div (sum ns) (length ns) -- sum ns `div` length ns

a = 10
b = 20
c = 30

x = y + z
    where 
        y = 2
        z = 3

g = f + h
    where 
        {f = 4;
         h = 8}

-- poly x = (x + 1) * (x + 1)
poly x = let
    y = x + 1
    in y * y

-- order of local variable not matter in let expresion
f = let 
    z = y + x
    x = 6
    y = x + 5
    in z

