{--
    commonFn.hs
    January 2018
    Andrew Ribeiro 
    MIT Licence

    Contains common functions used in this codebase.
--}

module CommonFn(tail',windows, seqDeriv,seqDerivs,iVect,isPolynomic,allEq,ebl) where 

-- tail': returns empty list if list argument is empty. 
tail' :: [a] -> [a]
tail' [] = []
tail' ls = tail ls

windows :: Int -> [a] -> [[a]]
windows _ [] = []
windows n (x:xs)
    | (length xs) > (n-2) = [x:(take (n-1) xs)]++(windows n xs)
    | otherwise = []

seqDeriv :: Num b => [b] -> [b]
seqDeriv ls = map (\ls -> (last ls) - (head ls) ) ( windows 2 ls )

seqDerivs :: (Eq a, Num a) => [a] -> [[a]]
seqDerivs [] = []
seqDerivs ls
    | deriv == [] = []
    | otherwise = deriv:(seqDerivs deriv)
    where deriv = seqDeriv ls

ebl :: [a] -> [a]
ebl [] = [] 
ebl ls = reverse (tail (reverse ls) )

iVect :: (Eq a, Num a) => [a] -> (a, [a])
iVect [] = (0,[])
iVect ls = (last res, reverse ((head ls):ebl res))
          where res = (filter (/= 0) (map head (seqDerivs ls) ) )  

allEq :: Eq a => [a] -> Bool
allEq [] = False 
allEq ls = foldl (&&) True (map (==(head ls)) ls)

isPolynomic :: (Eq a, Num a) => [a] -> Bool
isPolynomic ls = foldl (||) False (map allEq (filter (\x -> (length x) > 1) (seqDerivs ls)))