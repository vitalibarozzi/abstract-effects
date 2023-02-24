module Control.Effect.Class.Teletype 
    ( Teletype
    , printLine
    , readLine
    , TeletypeLower
    , printChar
    , readChar
    ) 
where


import Data.Text


class Teletype m where
    printLine :: Text -> m ()
    readLine  :: m Text


class TeletypeLower m where
    printChar :: Char -> m ()
    readChar  :: m Char
