module Control.Effect.Class.Continuation
    ( Continuation(..)
    ) 
where

class Continuation m where
   callCC :: ((a -> m b) -> m a) -> m a
