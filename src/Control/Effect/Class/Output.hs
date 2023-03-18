{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Output 
    ( Output(..)
    , outputs
    )
where

import Control.Monad
import Data.Foldable


class 
    (Monad m)
    => Output o m 
  where
    output :: o -> m ()


outputs :: (Output o m, Foldable f) => f o -> m ()
outputs = mapM_ output
