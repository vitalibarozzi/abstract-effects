{-# LANGUAGE OverloadedStrings #-}
module Control.Effect.Class.Terminal 
    ( Terminal(..)
    , echo
    , prompt
    ) 
where


import Data.Text
import Control.Monad (Monad, (>>=), (>>))
import Prelude ((<>), (.))


-- | The teletype/terminal effect. It represents a textual interface to receive
-- and send text messages.
class (Monad m) => Terminal m where
    next :: m Text
    send :: Text -> m ()


-- | Received a message and sends it back.
echo :: (Terminal m) => m ()
echo = 
    next >>= send


-- | Sends a message then awaits for an response.
prompt :: (Terminal m) => Text -> m Text
prompt t =
    send t >> next
