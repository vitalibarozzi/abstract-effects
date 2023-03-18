{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Input 
    ( Input(..)
    , inputs
    ) 
where

import Control.Monad

class 
    (Monad m)
    => Input i m 
  where
    input :: m i


-- maybe..
inputs :: (Input i m) => m [i]
inputs = do
    i <- input
    fmap (i :) inputs

