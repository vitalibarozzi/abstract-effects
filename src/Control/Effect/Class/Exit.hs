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
exit = fmap absurd (exitWith 0)


exitFailure :: (Exit m, Functor m) => Word8 -> m a
exitFailure n = 
    if n > 0 && n < 255
        then fmap absurd (exitWith n)
        else fmap absurd (exitWith 1)

