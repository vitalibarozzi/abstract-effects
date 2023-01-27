module Control.Effect.Class.IOE
    ( ToIO (..)
    , FromIO (..)
    )
where

class ToIO m where
    toIO :: m a -> IO a 


instance ToIO IO where
    toIO = id


class FromIO m where
    fromIO :: IO a -> m a


instance FromIO IO where
    fromIO = id
