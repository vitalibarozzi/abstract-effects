module Control.Effect.Class.Teletype 
    ( Teletype(..)
    , TeletypeLower(..)
    ) 
where


import Data.Text


class Teletype m where
    printLine :: Text -> m ()
    readLine  :: m Text


class TeletypeLower m where
    printChar :: Char -> m ()
    readChar  :: m Char
