{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Parallel  where

import Data.Either
import Data.Functor
import Prelude ((.), pure)
import Control.Monad
import Control.Concurrent
import Data.Void (absurd, Void)


class (Monad m) => Parallel m where
    fork :: m () -> m ThreadId
