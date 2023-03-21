module Control.Effect.Class.Store 
    ( Store(..)
    )
where

import Control.Monad


-- | Similar to state, but parametized/indexed by a key.
class 
    (Monad f)
    => Store key val f 
  where
    fetch :: key -> f val
    store :: key -> (val -> f ())
