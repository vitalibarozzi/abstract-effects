module Control.Effect.Class.NonDet where

class NonDet a m where
    roll :: m a
