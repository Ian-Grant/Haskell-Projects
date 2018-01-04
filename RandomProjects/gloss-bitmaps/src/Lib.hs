module Lib
    ( someFunc
    ) where
import Graphics.Gloss
import Data.Word
import Data.ByteString (ByteString, pack)
--GUI EXAMPLE
purple :: [Word8]
purple = [128, 0, 128, 64]

bitmapData :: ByteString
bitmapData = pack $ take 40000 (cycle purple)

ourPicture :: Picture
ourPicture = bitmapOfByteString 100 100 (BitmapFormat TopToBottom PxRGBA) bitmapData True

someFunc :: IO ()
someFunc = display (InWindow "Nice Window" (200, 200) (10, 10)) white ourPicture
