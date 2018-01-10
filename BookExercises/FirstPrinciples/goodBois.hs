module GoodBois where
  --aka  CH11 Algebraic Data Types

data PugType = PugData
data HuskyType a = HuskyData
data DogueDeBordeaux doge = DogueDeBordeaux doge
data Doggies a = Husky a | Mastiff a deriving (Eq,Show)

myPug = PugData::PugType

myHusky :: HuskyType a
myHusky = HuskyData

myOtherHusky :: Num a => HuskyType a
myOtherHusky = HuskyData

myOtherOtherHusky :: HuskyType [[[Int]]]
myOtherOtherHusky = HuskyData

myDoge :: DogueDeBordeaux Int
myDoge = DogueDeBordeaux 10

data Price = Price Integer deriving (Eq, Show)

data Manufac = Mini | Mazda | Tata deriving (Eq, Show)
data Airline = PapuAir | CatapultsRUs | TakeUrChancesUnited deriving (Eq,Show)

data Vehicle = Car Manufac Price | Plane Airline Price deriving (Eq, Show)

myCar = Car Mazda (Price 14000)
urCar = Car Mini (Price 20000)
clownCar = Car Mini (Price 5)
doge = Plane PapuAir (Price 4000000)

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

getManu :: Vehicle -> Manufac
getManu (Car x _) = x


--nullary
data Example0 = Example0 deriving (Eq,Show)
--unary
data Example1 = Example1 Int deriving (Eq,Show)
--product of Int and String
data Example2 = Example2 Int String deriving (Eq,Show)

data MyType = MyVal Int deriving (Eq,Show)
