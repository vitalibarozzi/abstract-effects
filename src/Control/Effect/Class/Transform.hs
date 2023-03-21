{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE UndecidableSuperClasses #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE RankNTypes #-}
module Control.Effect.Class.Transform where

import Control.Monad.Effects.Helper 
import Control.Monad


-- | Natural transformation as a constraint.
class 
    ( Monad f
    , Monad g
    )
    => f ~~> g 
  where
    transform :: f ~> g
