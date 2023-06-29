module Control.Effect.Class.Store.ToState where

import Control.Monad
import Control.Effect.Class.State


fetchToState :: forall map key val. (State (map key val) m) => key -> m val
fetchToState = undefined


storeToState :: forall map key val. (State (map key val) m) => key -> val -> m (Maybe val)
storeToState = undefined
