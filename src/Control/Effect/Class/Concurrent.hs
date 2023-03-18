module Control.Effect.Class.Concurrent
    ( -- Concurrent(..)
    ) 
where

import Control.Concurrent (ThreadId)
import Control.Exception


class Concurrent m where
    self :: m ThreadId
    fork :: m a -> m ThreadId
    done :: (Exception e => e) -> ThreadId -> m ()


--imDone = self >>= done (let x = x in x)
