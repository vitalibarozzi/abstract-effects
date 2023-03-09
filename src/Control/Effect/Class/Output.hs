{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Output 
    ( Output(..)
    )
where


class Output o m where
    output :: o -> m ()
