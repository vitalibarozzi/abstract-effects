{-# LANGUAGE OverloadedStrings #-}
module Control.Effect.Class.Teletype 
    ( Terminal(..)
    ) 
where


import Data.Text


-- | The teletype effect.
class Terminal m where
    send :: Text -> m ()
    read :: m Text


writeLine :: (Terminal m) => Text -> m ()
writeLine = send . (<> "\n")
