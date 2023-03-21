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
    (Monad f)
    => Log l f 
  where
    logger 
        :: ((Text -> f ()) -> (l -> f ()))
        -> (l -> f ())


-- | Log info.
logI :: (Show i, Log i f) => i -> f ()
logI = logger (\logIt i -> logIt ("info: "<>pack (show i))) -- TODO needs more info, also maybe use the callstack


-- | Log warning.
logW :: (Show w, Log w f) => w -> f ()
logW = logger (\logFn w -> logFn ("warning: "<>pack (show w))) -- TODO needs more inf, also maybe use the callstack


-- | Log error.
logE :: (Show e, Log e f) => e -> f ()
logE = logger (\logFn e -> logFn ("error: "<>pack (show e))) -- TODO needs more inf, also maybe use the callstack
