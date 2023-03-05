module Control.Effect.Class.IO
    ( -- *
      FromIO(..)
    -- * Reexport 
    , MonadIO(..)
    , ToIO
    )
where

import Control.Monad.IO.Class
import Control.Monad.Effects.Helpers


type ToIO = MonadIO


class FromIO m where
    fromIO :: IO ~> m


instance {-# OVERLAPPABLE #-} FromIO IO where
    {-# INLINE fromIO #-}
    fromIO = id
