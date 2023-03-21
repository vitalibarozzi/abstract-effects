{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Random 
    ( Random(..)
    )
where

import Control.Monad


-- | Name chose for been more casual than Non-Det.
class 
    (Monad f)
    => Random a f 
  where
    random :: f a
