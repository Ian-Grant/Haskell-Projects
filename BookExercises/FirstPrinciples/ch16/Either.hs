module Either where

incIfRight :: Num a => Either e a -> Either e a
incIfRight (Right n) = Right $ n + 1
incIfRight (Left e) = Left e

showIfRight :: Show a => Either e a -> Either e String
showIfRight (Right s) = Right $ show s
showIfRight (Left e) = Left e

incEither :: Num a -> Either e a -> Either e a
incEither m = fmap (+1) m

showEither :: Show a => Either e a -> Either e String
showEither s = fmap show s


--can be abscracted higher.

liftedInc ::(Functor f, Num b) => f b -> f b
liftedInc = fmap (+1)

liftedShow :: (Functor f, Show a) => f a -> f String
liftedShow = fmap show
