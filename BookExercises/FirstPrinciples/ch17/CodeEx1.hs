import Control.Applicative

f x = lookup x [ (3, "Hello"), (4, "fuck"), (5,"you")]
g y = lookup y [ (7, "sup"), (8, "nada"), (9, "k")]

h z = lookup z [(2,3),(5,6),(7,8)]
m x = lookup x [(4,10),(8,13),(1,9001)]

