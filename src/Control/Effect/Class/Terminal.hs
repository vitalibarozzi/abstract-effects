{-# LANGUAGE OverloadedStrings #-}
module Control.Effect.Class.Terminal 
    ( Terminal(..)
    , echo
    , writeLine
    , prompt
    ) 
where


import Data.Text
import Control.Monad (Monad, (>>=), (>>))
import Prelude ((<>), (.))


-- | The teletype effect. It was chosen to be called
-- terminal in here to be less specific and casual.
class 
    (Monad m)
    => Terminal m 
  where
    read :: m Text
    send :: Text -> m ()


writeLine :: (Terminal m) => Text -> m ()
writeLine = 
    send . (<>"\n")


echo :: (Terminal m) => m ()
echo = 
    read >>= send


prompt :: (Terminal m) => Text -> m Text
prompt t =
    send t >> read
