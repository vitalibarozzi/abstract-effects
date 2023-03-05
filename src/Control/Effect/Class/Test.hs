module Control.Effect.Class.Test
    ( Test(..)
    ) 
where

import Control.Concurrent (ThreadId)
import Control.Exception


class Test m where
