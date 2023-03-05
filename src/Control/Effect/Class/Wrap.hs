{-# LANGUAGE ImplicitParams #-}
module Control.Effect.Class.Wrap 
where

-- maybe?

class Wrap m where
    wrap :: a -> m a


class Unwrap m where
    unwrap :: m a -> a
