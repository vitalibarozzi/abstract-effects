{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE UndecidableSuperClasses #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE RankNTypes #-}
module Control.Monad.Effects.Transform where

import Control.Monad
import Control.Monad.Effects.Helper 


-- | Natural transformation as a constraint.
class 
    (Monad g) 
    => (~~>) f g 
  where
    transform :: f ~> g
