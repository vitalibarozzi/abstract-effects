module Control.Effect.Class.Output (Output, produce) where

class Output o m where
    produce :: o -> m ()
