module Control.Effect.Class.Parser () where

-- TODO find out the type for this effect

{-
class Parser t m where
    try  :: m a -> m (ParserResult a)
    next :: [t] -> m 
    stop :: m a


data ParserResult a
    = Value a
    | Error String



or :: (Parser t m) => m a -> m a -> m a
or ma1 ma2 = do
    try ma1 >>= \case
        Left _ -> ma2 
        Right a -> return a
-}
