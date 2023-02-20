module Control.Effect.Class.IOE

    ( MonadIO
    , liftIO

    , FromIO
    , fromIO
    )
where

import Control.Monad.IO.Class


class FromIO m where
    fromIO :: IO a -> m a


instance {-# OVERLAPPABLE #-} FromIO IO where
    {-# INLINE fromIO #-}
    fromIO = id