module DeconstructingVals where

newtype Name = Name String deriving Show
newtype Acres = Acres Int deriving Show

--Sum Type
data FarmerType = DairyFarmer
                | WheatFarmer
                | SoybeanFarmer
                deriving Show

--Product Type
data Farmer = Farmer Name Acres FarmerType deriving Show

isDairyFarmer :: Farmer -> Bool
isDairyFarmer (Farmer _ _ DairyFarmer) = True
isDairyFarmer _ = False

--Alt Method with Record Type
data FarmerRec =
    FarmerRec { name :: Name
              , acres :: Acres
              , farmerType :: FarmerType }
              deriving Show

isDairyFarmerRec :: FarmerRec -> Bool
isDairyFarmerRec farmer =
    case farmerType farmer of
        DairyFarmer -> True
        _ -> False

data Quad = One | Two | Three | Four deriving (Eq, Show)

--4+4 = 8 diffrent forms
eQuad :: Either Quad Quad
eQuad = undefined

--4*4 = 16 diffrent forms
prodQuad :: (Quad,Quad)
prodQuad = undefined

--4^4 = 64 diffrent forms
funcQuad :: Quad -> Quad
funcQuad = undefined

--3*3*3 = 27 diffrent forms
prodTBool :: (Bool, Bool, Bool)
prodTBool = undefined

--(3^3)^3 diffrent forms
gTwo :: Bool -> Bool -> Bool
gTwo = undefined

--(4^4)^2 diffrent forms
fTwo :: Bool -> Quad -> Quad
fTwo = undefined

data Silly a b c d = MkSilly a b c d deriving Show


