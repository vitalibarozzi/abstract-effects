{-# LANGUAGE OverloadedStrings #-}
module Control.Effect.Class.Log
    ( Log(..)
    , logI
    , logW
    , logE
    )
where


import Prelude hiding (log)
import Data.Text


class Log l m where
    logger 
        :: ((Text -> m ()) -> (l -> m ())) -- ^ Given a logger function of type `Text -> m ()`, we return `l -> m ()` implying that `l` will be turned into `Text` by the client.
        -> (l -> m ())


logI :: (Show i, Log i m) => i -> m ()
logI = logger (\logIt i -> logIt ("info: "<>pack (show i)))


logW :: (Show w, Log w m) => w -> m ()
logW = logger (\logFn w -> logFn ("warning: "<>pack (show w)))


logE :: (Show e, Log e m) => e -> m ()
logE = logger (\logFn e -> logFn ("error: "<>pack (show e)))
