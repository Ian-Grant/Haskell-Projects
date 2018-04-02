module FixerUpper where

import Control.Applicative

x = const <$> Just "Hello" <*> Just "World"
y = (,,,) <$> Just 90 <*> Just 10 <*> Just "Tip" <*> Just [1,2,3]
