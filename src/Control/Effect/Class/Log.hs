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


-- | Example:
-- instance Log a IO where
--   logger formatter = formatter (putStrLn . unpack)
class (Monad f) => Log l f where
    -- TODO formatter :: l -> Text
    logger 
        :: ((Text -> f ()) -> (l -> f ()))
        -> (l -> f ())

-- TODO need examples

-- | Log info.
logI :: (Show i, Log i f) => i -> f ()
logI = undefined -- logger (\logIt i -> logIt ("[info]: "<>(tshow i))) -- TODO needs more info, also maybe use the callstack


-- | Log warning.
logW :: (Show w, Log w f) => w -> f ()
logW = undefined -- logger (\logFn w -> logFn ("[warning]: "<>(tshow w))) -- TODO needs more inf, also maybe use the callstack


-- | Log error.
logE :: (Show e, Log e f) => e -> f ()
logE = undefined -- logger (\logFn e -> logFn ("[error]: "<>(tshow e))) -- TODO needs more inf, also maybe use the callstack
