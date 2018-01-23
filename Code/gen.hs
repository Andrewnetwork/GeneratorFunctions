{--
    gen.hs
    Andrew Ribeiro 
    MIT Licence

    Def. A successor function (suc) is one such that given an argument
    it returns the succession of that elment. We can build any integer n by
    applying the successor (+1) function to 0.  

    Def. A sequence of numbers is a list of numbers. 
    Ex: [1,5,-1,3,6]

    Def. A series of numbers is a list of numbers that are built by an accumulation of
    values. A series can be defined by some successor function.  
    Ex: [1,2,3,4], [2,4,6]
--}
colin a b = a:b
-- [1,2,3,4,5,6] is constructed via 1:2:3:4:5:6:[]
-- colin 1 (colin 2 (colin 3 ( colin 4 (colin 5 ( colin 6 [] ) ) ) ) )
-- tail (genNatNum 0 6)

genNatNum s n
    | s > n = []
    | otherwise = s:(genNatNum (succ s) n) 

windows _ [] = []
windows n (x:xs)
    | (length xs) > (n-2) = [x:(take (n-1) xs)]++(windows n xs)
    | otherwise = []

-- Derivitive of a Sequence. 

-- Def. The derivitve of a sequence A is a sequence of the differences 
-- between the pairs in A.

-- In the taylor series, the derivitives of a function can be used to approximate it. 
-- We wish to produce an approximation method for sequences. 
-- In order to do this, we will work with the derivitive of a sequence as defined here. 

seqDeriv ls = map (\ls -> (last ls) - (head ls) ) ( windows 2 ls )
-- seqDeriv [1,2,3,4]
-- seqDeriv [2,4,6,8]
-- seqDeriv [5,1,3,9]
-- seqDeriv [1,5,1,5,1,5]

genSeq s n succFn
    | s > n = []
    | otherwise = s:(genSeq (succFn s) n succFn) 

-- genSeq 0 10 (\x -> x+ (head (seqDeriv [1,2,3,4]) ) )

-- The problem: from a seqence of numbers, we want to generate the successor function 
-- that generates the sequence. 
fib n
    | n == 0 = 0
    | n == 1 = 1
    | n == 2 = 2
    | otherwise = (fib (n-1)) + (fib (n-2) )

-- map fib [0,1..10]

succFib n
    | n == 0 = n + 1
    | n == 1 = n + 1
    | n == 2 = n + 1
    | n == 3 = n + 2
    | n == 5 = n + 3
    | n == 8 = n + 5
    | n == 13 = n + 8
    | n == 21 = n + 13
    | n == 34 = n + 21

-- genSeq 0 5 succFib
-- genFunc s n heuristic ls= foldl (+) s (take n (cycle (seqDeriv ls) ) )
mirrorHeuristic n ls = ( seqDeriv (take n (cycle ls) ) )
bruteCycle n ls = take n (cycle (seqDeriv ls) )

genFunc s n heuristic ls= foldl (+) s (heuristic n ls)

modelSeq start heuristic range ls = map (\x -> genFunc start x heuristic ls) range 

--modelSeq start range ls = map (\x -> genFunc start x ls) range 

--modelSeq 0  bruteCycle [0,1..10] [1,2,3,4]
--modelSeq 0  bruteCycle [0,1..10] [2,4,6,8]

--modelSeq 0 [0,1..10] [3,2,3,2]
--modelSeq 1 [0,1..10] [1,5,-1,3,6]
--modelSeq 1 [0,1..10] [3,2,4]
--modelSeq 1 [0,1..10] [,2,4]
--modelSeq 1 [0,1..10] [1,2,3,5,8,13,21,34,55,89]

-- modelSeq 0 bruteCycle [0,1..10] [3,2,3,2]
-- modelSeq 0 mirrorHeuristic [0,1..10] [3,2,3,2]modelSeq 1 mirrorHeuristic [1,2..10] [1,2,3,5,8,13,21,34,55,89]
-- seqDeriv [1,2,3,5,8,13,21,34,55,89,144,233,377,610,987]
-- First Deriv - [1,1,2,3,5,8,13,21,34,55,89,144,233,377]
-- Second Deriv- [0,1,1,2,3,5,8,13,21,34,55,89,144]
-- Third Deriv - [1,0,1,1,2,3,5,8,13,21,34,55]
-- Fourth Deriv- [-1,1,0,1,1,2,3,5,8,13,21]
-- Sixth Deriv - [2,-1,1,0,1,1,2,3,5,8]
-- Sev   Deriv - [-3,2,-1,1,0,1,1,2,3]
-- 8     Deriv - [5,-3,2,-1,1,0,1,1]
-- 9     Deriv - [-8,5,-3,2,-1,1,0]
-- 10    Deriv - ---- - 