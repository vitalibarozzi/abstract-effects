module Control.Effect.Class.Exit
    ( Exit(..)
    , exit
    , exitFailure
    ) 
where

import Data.Void
import Data.Word


class Exit m where
    exitWith :: Word8 -> m Void


exit :: (Exit m, Functor m) => m a
{-# INLINE exit #-}
exit = fmap absurd (exitWith 0)


exitFailure :: (Exit m, Functor m) => Word8 -> m a
{-# INLINE exitFailure #-}
exitFailure n = 
    if n > 0
        then fmap absurd (exitWith n)
        else fmap absurd (exitWith 1)

