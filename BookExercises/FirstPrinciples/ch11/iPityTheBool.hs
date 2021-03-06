module PityTheBool where

--Sum Type Cardinality of 2
data BigSmall = Big Bool | Small Bool deriving (Eq,Show)
--Sum Type Cardinality of 3
data QuantumBool = QuantumTrue | QuantumFalse | QuantumBoth deriving (Eq,Show)
--Product Type Cardinality of 9 because the cardinality of QuantumBool times itself
data TwoQs = MkTwoQs QuantumBool QuantumBool deriving (Eq, Show)
--Normal Syntax
--Product Type
data Person1 = MkPerson String Int deriving (Eq,Show)
--Record Syntax
--Product Type
{-
data Person =
    Person { name :: String
           , age :: Int }
           deriving (Eq, Show)
-}

jm1 = MkPerson "Julie" 108
ca1 = MkPerson "Chris" 42
--jm = Person "Julie" 108
--ca = Person "Chris" 42

getName :: Person1 -> String
getName (MkPerson s _) = s

getAge :: Person1 -> Int
getAge (MkPerson _ i) = i

-- Type Constructor is left of =
-- Data Constructor is right of =
data Fiction = Fiction deriving Show
data NonFiction = NonFiction deriving Show
--BookType's Dataconstructors take TYPEs as arguments
--aka its the type constructors name that is the argument not the data
data BookType = FictionBook Fiction
              | NonFictionBook NonFiction
              deriving Show
type AuthorName = String
--data Author = Author (AuthorName, BookType)
data Author =
      FictionA AuthorName
    | NonFictionA AuthorName
    deriving (Eq, Show)

data Expr =
    Number Int
  | Add Expr Int
  | Min Expr Expr
  | Mul Expr Expr
  | Div Expr Expr

data FlowerType = Gardenia | Daisy | Rose | Lilac deriving Show
--Gardenia + Daisy + Rose + Lilac
type Gardener = String
data Garden = Garden Gardener FlowerType deriving Show
--Normal Form
--(Gardener String) + (FlowerType)

data GuessWhat = ChickenButt deriving (Eq,Show)
data Id a = MkId a deriving (Eq,Show)
data Product a b = Product a b deriving (Eq, Show)
data Sum a b = First a | Second b deriving (Eq, Show)
data RecordProduct a b =
      RecordProduct { pfirst :: a
                    , psecond :: b }
                    deriving (Eq,Show)

newtype NumCow = NumCow Int deriving (Eq, Show)
newtype NumPig = NumPig Int deriving (Eq, Show)
data Farmhouse = Farmhouse NumCow NumPig deriving (Eq, Show)
type Farmhouse' = Product NumCow NumPig
newtype NumSheep = NewSheep Int deriving (Eq, Show)
data BigFarmhouse = BigFarmhouse NumCow NumPig NumSheep deriving (Eq, Show)
type BigFarmhouse' = Product NumCow (Product NumPig NumSheep)
type Name = String
type Awesome = Bool
type Age = Int
type LovesMud = Bool
type PoundsOfWool = Int
data CowInfo =
    CowInfo Name Age
    deriving (Eq, Show)
data PigInfo =
    PigInfo Name Age LovesMud
    deriving (Eq, Show)
data SheepInfo =
    SheepInfo Name Age PoundsOfWool
    deriving (Eq,Show)
data Animal =
    Cow CowInfo
    | Pig PigInfo
    | Sheep SheepInfo
    deriving (Eq, Show)
type Animal' = Sum CowInfo (Sum PigInfo SheepInfo)

trivialValue :: GuessWhat
trivialValue = ChickenButt

idInt :: Id Integer
idInt = MkId 10

data Twitter = Twitter deriving (Eq, Show)
data AskFm = AskFm deriving (Eq, Show)

socialNetwork :: Sum Twitter AskFm
socialNetwork = First Twitter
--Equivalent ^
data SocialNetwork' = Twitter' | AskFm' deriving (Eq, Show)

type Twitter'' = String
type AskFm'' = String

twitter :: Sum Twitter'' AskFm''
twitter = First "Twitter"
--mistake cuz type synonyms used
askFm :: Sum Twitter'' AskFm''
askFm = First "AskFm"

myRecord :: RecordProduct Integer Float
myRecord = RecordProduct 24 0.00001

myRecord' :: RecordProduct Integer Float
myRecord' = RecordProduct { pfirst = 42
                          , psecond = 0.00001 }

data OperatingSystem =
      GnuPlusLinux
    | OpenBSD
    | Mac
    | ShitOnWindows
    deriving (Eq, Show)

data ProgLang =
      Haskell
    | Agda
    | Idris
    | PureScript
    deriving (Eq, Show)

--Record Syntax
data Programmer =
    Programmer { os :: OperatingSystem
                , lang :: ProgLang }
                deriving (Eq, Show)

nineToFive :: Programmer
nineToFive = Programmer { os = Mac
                        , lang = Haskell }

feelingWizardly :: Programmer
feelingWizardly = Programmer { lang = Agda, os = GnuPlusLinux }

allOperatingSystems :: [OperatingSystem]
allOperatingSystems = [GnuPlusLinux, OpenBSD, Mac, ShitOnWindows]

allLang :: [ProgLang]
allLang = [Haskell,Agda,Idris,PureScript]

allProgrammers :: [Programmer]

allProgrammers = [Programmer {os = os, lang = lang} | os <- allOperatingSystems, lang <- allLang]

{- Errors even tho book example
data ThereYet = There Float Int Bool deriving (Eq, Show)

notYet :: Int -> Bool -> ThereYet
notYet = nope 25.5

notQuite :: Bool -> ThereYet
notQuite = notYet 10

yuss :: ThereYet
yuss = notQuite False
-}

