module Control.Effect.Class.Exit
    ( Exit(..)
    , exit
    , exitFailure
    ) 
where

import Data.Void
import Data.Word
import Data.Functor
import Prelude ((>))
import Control.Monad


class 
    (Monad f)
    => Exit f 
  where
    exitWith :: Word8 -> f Void


exit :: (Exit f) => f a
{-# INLINE exit #-}
exit = fmap absurd (exitWith 0)


exitFailure :: (Exit f) => Word8 -> f a
{-# INLINE exitFailure #-}
exitFailure n = 
    if n > 0
        then fmap absurd (exitWith n)
        else fmap absurd (exitWith 1)

