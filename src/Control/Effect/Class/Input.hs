{-# LANGUAGE FlexibleInstances #-}
-- | Read-only state effect definition.
module Control.Effect.Class.Input 
    ( Input(..)
    , inputs
    ) 
where

import Control.Monad

class 
    (Monad f)
    => Input i f 
  where
    input :: f i


-- maybe..
inputs :: (Input i f) => f [i]
inputs = do
    i <- input
    fmap (i :) inputs

