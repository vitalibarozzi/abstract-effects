module Control.Effect.Class.Store 
    ( Store(..)
    )
where


-- | Similar to state, but parametized/indexed by a key.
class 
    Store key val m 
  where
    fetch :: key -> m val
    store :: key -> (val -> m ())
