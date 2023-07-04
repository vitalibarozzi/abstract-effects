{-# LANGUAGE OverloadedStrings #-}
module Control.Effect.Class.Loop where
import Prelude hiding (log)
import Data.Text
import Data.Void
import Control.Monad (void)


class (Monad m) => Loop m where
    forever :: m a -> m Void

loop :: (Loop m) => m a -> m ()
loop = 
    void . forever
    
