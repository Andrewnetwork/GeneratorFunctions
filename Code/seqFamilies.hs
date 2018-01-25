{--
    seqFamilies.hs
    Andrew Ribeiro 
    MIT Licence

    The (successor+1) operation forms a group in which [1,2,3,4,5] and [2,4,6,7,8] are members. 
    The term "sequence family" is a colloquialism for a sequence group. 
    
    Example:
    Your biological family is a group under the the reproduction associaton. Your friends 
    are a group under a different type of relationship. 
--}

import CommonFn
import Gen

zipLsTup tup = zip (fst tup) (snd tup)
pairDiff tup = (snd tup) - (fst tup)

pairSeqDiff l1 l2 = (map pairDiff (zip l1 l2))
pairSeqDerivs l1 l2 = seqDerivs (pairSeqDiff l1 l2)
--pairSeqDeriv l1 l2 = map (map pairDiff) (map zipLsTup (zip (seqDerivs l1) (seqDerivs l2)))

{--
-- [1,2,3,4]
-- [2,4,6,8]
-- [3,6,9,12]
-- +1 sequence
--genSeqGroup seedSeqFn seqSucc nTerms nSeq = iVect 

-- (pairSeqDeriv l1 l2)
pairSum tup = (fst tup) + (snd tup)
--map (map pairSum) (map (map zipLsTup)
nextiVect [] _ = (0,[])
nextiVect ls groupItter = (last res, reverse ((head ls):ebl res))
                         where newDeriv = map (map pairSum) (map zipLsTup (zip (seqDerivs ls) groupItter) )
                               res = (filter (/= 0) (map head newDeriv ) )  

nextSeq s1 s2 = nextSeq' s2 (pairSeqDeriv s1 s2)                               
nextSeq' ls groupItter = (\nTerms->genSeq rootVal classVect nTerms)
                         where (rootVal,classVect) = nextiVect ls groupItter
-- (pairSequenceDeriv [1,2,3,4] [2,4,6,8])

-- (nextFunction [0, 1, 4, 9, 16, 25, 36, 49] [0, 1, 16, 81, 256, 625, 1296, 2401]) 20
--}