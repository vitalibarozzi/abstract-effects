{-# LANGUAGE OverloadedStrings #-}
module Control.Effect.Class.Terminal 
    ( Terminal(..)
    , echo
    ) 
where


import Data.Text
import Control.Monad (Monad, (>>=))


-- | The teletype effect. It was chosen to be called
-- terminal in here to be less specific and casual.
class 
    (Monad m)
    => Terminal m 
  where
    read :: m Text
    send :: Text -> m ()


echo :: (Terminal m) => m ()
echo = read >>= send
