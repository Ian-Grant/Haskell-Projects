module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
    deriving Eq

ageOn :: Planet -> Float -> Float
ageOn planet seconds = (fromInteger $ round $ age * (10^2)) / (10.0^^2)
    where age
            | planet == Earth = secToYears seconds
            | planet == Mercury = secToYears seconds / 0.2408467
            | planet == Venus = secToYears seconds / 0.61519726
            | planet == Mars = secToYears seconds / 1.8808158
            | planet == Jupiter = secToYears seconds / 11.862615
            | planet == Saturn = secToYears seconds / 29.447498
            | planet == Uranus = secToYears seconds / 84.016846
            | planet == Neptune = secToYears seconds / 164.79132

secToYears :: Float -> Float
secToYears x = x / 31557600.0

round2 :: Float -> Float
round2 x = (fromInteger $ round $ x * (10^2)) / (10.0^^2)
