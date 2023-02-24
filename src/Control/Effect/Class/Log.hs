module Control.Effect.Class.Log
    ( logM
    , Log
    )
where


import Prelude hiding (log)


class Log l m where
    logM :: l -> m ()
