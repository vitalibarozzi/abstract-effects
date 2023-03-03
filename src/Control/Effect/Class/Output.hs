module Control.Effect.Class.Output (Output(..)) where

class Output o m where
    produce :: o -> m ()
