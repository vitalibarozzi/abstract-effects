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
import Prelude ((.), IO)


-- | MonadIO alias.
class 
    (Monad f)
    => ToIO f 
  where
    toIO :: f a -> IO a


-- | UnliftIO alias.
class 
    (Monad f)
    => FromIO f 
  where
    fromIO :: IO a -> f a


throughIO :: (ToIO f, FromIO g) => f a -> g a
throughIO = fromIO . toIO
