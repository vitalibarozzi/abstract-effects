{-# LANGUAGE ImplicitParams #-}
module Control.Effect.Class.Program 
where


import Data.Functor.Identity
import Control.Monad.Effects.Helpers


-- maybe?


class Constrainer k m where
    internalize :: (k => m a) -> m a
    externalize :: m a -> (k => m a)


instance Constrainer () m where
    internalize = id
    externalize = id




class Program m n where
    run :: m ~> n


instance Program m m where
    {-# INLINE run #-}
    run = id
