module Control.Effect.Class.Exception where

import Control.Monad.Exception

class SomeException e => Exception e m where
    throw :: e -> m a


