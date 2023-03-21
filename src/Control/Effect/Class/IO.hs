{-# LANGUAGE TypeOperators #-}
module Control.Effect.Class.IO
    ( -- *
      ToIO(..)
    , FromIO(..)
    , throughIO
    -- * Reexport 
    , MonadIO(..)
    )
where

import Control.Monad
import Control.Monad.IO.Class
import Control.Monad.Effects.Helper
import Prelude ((.), IO)


-- | MonadIO alias.
class 
    (Monad f)
    => ToIO f 
  where
    toIO :: f ~> IO


-- | UnliftIO alias.
class 
    (Monad f)
    => FromIO f 
  where
    fromIO :: IO ~> f


throughIO :: (ToIO f, FromIO g) => f ~> g
throughIO = fromIO . toIO
