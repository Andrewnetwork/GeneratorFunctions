{--
    gen.hs
    Andrew Ribeiro 
    MIT Licence

    Given the root of a converging sequence, generate a sequence. 

    Examples and Background: 

    The root of the sequence of natural numbers [0,1,2,..,+∞] is +1. 
    In this case the root of the sequence is simply the successor function.
    We say that this root is 1 deep, in that one only needs to apply the sequence
    derivitive once before we converge to a constant. 

    In the case of more complex sequences like the sequence of the natural numbers squared,
    [0,1,4,9,16,+∞], the root is 2 deep and requires 2+1 examples of the sequence to converge.
--}
import CommonFn

m1 x = x - 1

deriveSeqLayer root rv =  reverse (deriveSeqLayer' (reverse root) rv )

deriveSeqLayer' [] rv = [rv]
deriveSeqLayer' root rv  = ((head previous)+(head root)):previous
                           where previous = (deriveSeqLayer' (tail' root) rv)

genSeq rootVal classVect nTerms = last (genSeq' (take (nTerms-1) (cycle [rootVal]) ) classVect)

genSeq' root [] = []
genSeq' root classVect = [layer] ++ ( genSeq' layer (tail' classVect) )
                         where layer = (deriveSeqLayer root (head classVect))

funcModel ls = (\x -> genSeq root classVect x )
               where (root,classVect) = iVect ls