{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Random 
    ( Random(..)
    )
where

import Control.Monad


-- | Name chose for been more casual than Non-Det.
class (Monad m) => Random a m where
    random :: m a
