{-# LANGUAGE TypeOperators #-}
module Control.Effect.Class.IO
    ( -- *
      ToIO(..)
    , FromIO(..)
    -- * Reexport 
    , MonadIO(..)
    , throughIO
    )
where

import Control.Monad.IO.Class
import Control.Monad.Effects.Helper
import Prelude ((.), IO)


-- | MonadIO alias.
class ToIO m where
    toIO :: m ~> IO


-- | UnliftIO alias.
class FromIO m where
    fromIO :: IO ~> m


throughIO :: (FromIO m, ToIO m) => m ~> m
throughIO = fromIO . toIO
