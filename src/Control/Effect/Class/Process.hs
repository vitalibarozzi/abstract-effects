{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Process where

import Data.Either
import Data.Maybe
import Data.Functor
import Prelude ((.), pure)
import Control.Monad
import Data.Void (absurd, Void)
import System.Process
import System.IO


class (Monad m) => Process m where
    process :: CreateProcess -> m Pid
    handles :: Pid -> m Handles


type Handles = (Maybe Handle, Maybe Handle, Maybe Handle, ProcessHandle)


createProcess :: (Process m) => CreateProcess -> m Handles
createProcess = 
    process >=> handles

