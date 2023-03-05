{-# LANGUAGE ImplicitParams #-}
module Control.Effect.Class.Program 
where


import Data.Functor.Identity
import Control.Monad.Effects.Helpers


-- maybe?


class Program m n where
    run :: m ~> n


instance Program m m where
    {-# INLINE run #-}
    run = id
