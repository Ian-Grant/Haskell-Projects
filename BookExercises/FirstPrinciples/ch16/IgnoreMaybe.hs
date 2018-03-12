module IgnoreMaybe where

incIfJust :: Num a => Maybe a -> Maybe a
incIfJust (Just n) = Just $ n+1
incIfJust _ = Nothing

showIfJust :: Show a => Maybe a -> Maybe String
showIfJust (Just s) = Just $ show s
showIfJust _ = Nothing

--someFunc (Just x) = Just $ someOtherFunc x
--someFunc Nothing = Nothing

incMaybe :: Num a => Maybe a -> Maybe a
incMaybe m = fmap (+1) m

showMaybe :: Show a => Maybe a -> Maybe String
showMaybe s = fmap show s

--- The above can be rewriten with a more abstract type

liftedInc :: (Functor f, Num b) => f b -> f b
liftedInc = fmap (+1)

liftedShow :: (Functor f, Show a) => f a -> f String
liftedShow = fmap show


