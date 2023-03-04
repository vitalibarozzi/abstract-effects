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


-- orphans


instance Teletype IO where
    printLine = putStrLn . unpack
    readLine = fmap pack getLine


instance Teletype Maybe where
    printLine = const (Just ())
    readLine = Nothing
