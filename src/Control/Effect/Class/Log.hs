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


class 
    Log l m 
  where
    logger 
        :: ((Text -> m ()) -> (l -> m ()))
        -> (l -> m ())


-- | Log info.
logI :: (Show i, Log i m) => i -> m ()
logI = logger (\logIt i -> logIt ("info: "<>pack (show i))) -- TODO needs more info, also maybe use the callstack


-- | Log warning.
logW :: (Show w, Log w m) => w -> m ()
logW = logger (\logFn w -> logFn ("warning: "<>pack (show w))) -- TODO needs more inf, also maybe use the callstack


-- | Log error.
logE :: (Show e, Log e m) => e -> m ()
logE = logger (\logFn e -> logFn ("error: "<>pack (show e))) -- TODO needs more inf, also maybe use the callstack
