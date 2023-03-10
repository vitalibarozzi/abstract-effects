{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module Control.Effect.Class.Choice
    (
    )
where


import Data.Void


right :: Either Void b -> b
right (Right b) = b


left :: Either a Void -> a
left (Left a) = a


initRight :: b -> Either Void b
initRight = Right


initLeft :: a -> Either a Void
initLeft = Left


class Either' m where


