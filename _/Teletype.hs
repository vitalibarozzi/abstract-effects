module Control.Effect.Class.Teletype where

class Teletype i m where
    ask :: m i

asks :: Input i m => (i -> a) -> m a
asks = undefined
