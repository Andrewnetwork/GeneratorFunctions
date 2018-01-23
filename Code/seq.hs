fib n
    | n == 0 = 0
    | n == 1 = 1
    | n == 2 = 2
    | otherwise = (fib (n-1)) + (fib (n-2) )

genNatNum s n
    | s > n = []
    | otherwise = s:(genNatNum (succ s) n) 

-- map fib [0,1..10]
-- genNatNum 0 12
-- map (\x -> x^2) [0,1..10]
-- map (\x -> (x^2) + 3) [0,1..10]
-- map (\x -> (x^2) + (x^3)) [0,1..10]
-- map (\x -> (x^2) + (x^3) + (x^4)) [0,1..10]
-- map (\x -> (x^6) ) [0,1..10]