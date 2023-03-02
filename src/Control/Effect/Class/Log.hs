module Control.Effect.Class.Log
    ( Log(..)
    )
where


import Prelude hiding (log)


class Log l m where
    logInfo  :: l -> m ()
    logWarn  :: l -> m ()
    logError :: l -> m ()
