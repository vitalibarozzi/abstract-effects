{-# LANGUAGE AllowAmbiguousTypes #-}
module Control.Effect.Class.UI 
where

import Data.Text
import Prelude


-----------------------------------------------------------
-- | Represents an user interface in an hierarchical way by
-- combining "zones".
class UI z m where
    zoneNewParent :: z -> m Int
    zoneNewChild  :: Int -> z -> m Int
    zoneClose     :: Int -> m ()
    zoneModify    :: Int -> (z -> z) -> m ()
    zoneParent    :: Int -> m Int
    zoneChildren  :: Int -> m [Int]


-----------------------------------------------------------
class TUI m where
    screenClear :: m ()
    screenSize  :: m (Int, Int)
    cursorLoc   :: m (Int, Int)
    cursorJump  :: (Int, Int) -> m ()
    cursorWrite :: Text -> m ()


-----------------------------------------------------------
class GUI m where
    windowSize   :: m ()
    windowRender :: m ()
    windowClose  :: m ()
    -- TODO
