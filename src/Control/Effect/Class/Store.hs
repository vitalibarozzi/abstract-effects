module Control.Effect.Class.Store 
    ( Store(..)
    )
where

import Prelude
import Control.Monad
import Data.Maybe


-- | Similar to `State`, but parametized/indexed by a key.
-- Storing also returns an item case there are already an 
-- item under that key when inserting.
class (Monad m) => Store key val m where
    fetch :: key -> m val
    store :: key -> val -> m (Maybe val)


replace :: (Store key val m) => key -> val -> m ()
replace = undefined
