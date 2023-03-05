module Control.Effect.Class.Continuation
    ( Continuation(..)
    ) 
where

import Control.Concurrent (ThreadId)
import Control.Exception


class Continuation m where
   callCC :: ((a -> m b) -> m a) -> m a
