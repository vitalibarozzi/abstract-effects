{-# LANGUAGE AllowAmbiguousTypes #-}
module Control.Effect.Class.TUI 
    ( TUI(..)
    )
where

import Data.Text
import Prelude (Int, Maybe)


class TUI m where
    screenClear :: m ()
    screenSize  :: m (Int, Int)
    screenLoad  :: m (Maybe ())
    screenSave  :: m ()
    cursorLoc   :: m (Int, Int)
    cursorJump  :: (Int, Int) -> m ()
    cursorWrite :: Text -> m ()
