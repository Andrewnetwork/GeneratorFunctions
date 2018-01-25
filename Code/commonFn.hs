{--
    commonFn.hs
    January 2018
    Andrew Ribeiro 
    MIT Licence

    Contains common functions used in this codebase.
--}

module CommonFn(tail',windows, seqDeriv,seqDerivs,iVect) where 

-- tail': returns empty list if list argument is empty. 
tail' [] = []
tail' ls = tail ls

windows _ [] = []
windows n (x:xs)
    | (length xs) > (n-2) = [x:(take (n-1) xs)]++(windows n xs)
    | otherwise = []

seqDeriv ls = map (\ls -> (last ls) - (head ls) ) ( windows 2 ls )

seqDerivs [] = []
seqDerivs ls
    | deriv == [] = []
    | otherwise = deriv:(seqDerivs deriv)
    where deriv = seqDeriv ls

ebl [] = [] 
ebl ls = reverse (tail (reverse ls) )

iVect [] = (0,[])
iVect ls = (last res, reverse ((head ls):ebl res))
          where res = (filter (/= 0) (map head (seqDerivs ls) ) )  