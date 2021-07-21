module Main where

import Lib 
import System.Log.FastLogger

main :: IO ()
main = someFunc    

somFunc :: IO ()
somFunc = putStrLn "not implemented"

logFunc :: IO ()

logFunc =     do
    timeCache <- newTimeCache simpleTimeFormat
    (logger, cleanUp) <- newTimedFastLogger timeCache (LogStdout defaultBufSize)
    logg logger "Hellow World:"
    cleanUp

logg :: ToLogStr msg => TimedFastLogger -> msg -> IO ()
logg logger msg = logger $ \ft -> toLogStr ft <> toLogStr ": " <> toLogStr msg
