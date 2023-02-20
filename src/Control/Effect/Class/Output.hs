module Control.Effect.Class.Output (Output, produce) where

class Output o m where
    produce :: o -> m ()

instance {-# OVERLAPPABLE #-} (Monad m, Output o m) => Output [o] m where
    produce = mapM_ produce
