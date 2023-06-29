{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Process where

import Data.Either
import Data.Functor
import Prelude ((.), pure)
import Control.Monad
import Data.Void (absurd, Void)
import System.Process


-- TODO if you use handle and process handle why just dont use CreateProcess and remove this extra argument from the class?
class Process p m where
    spawn :: p -> m Pid
    foooo :: Pid -> m (Maybe Handle, Maybe Handle, Maybe Handle, ProcessHandle)

