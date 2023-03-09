module Control.Effect.Class.IO
    ( -- *
      ToIO(..)
    , FromIO(..)
    -- * Reexport 
    , MonadIO(..)
    )
where

import Control.Monad.IO.Class


-- | MonadIO alias.
class ToIO m where
    toIO :: m a -> IO a


-- | UnliftIO alias.
class FromIO m where
    fromIO :: IO a -> m a
