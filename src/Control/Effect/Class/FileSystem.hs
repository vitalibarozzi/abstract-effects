{-# LANGUAGE FlexibleInstances #-}
-- | Read-only state effect definition.
module Control.Effect.Class.FileSystem where

import Control.Monad
import Prelude (FilePath)

class (Monad m) => FileSystem m where
    listDirectory :: FilePath -> m [FilePath]
