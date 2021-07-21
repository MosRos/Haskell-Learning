
module Lib
    ( someFunc
    ) where

import System.Log.FastLogger


someFunc :: IO ()
someFunc = logFunc --putStrLn "Fuck Fuck Fuck!!!"

logFunc :: IO ()

logFunc =     do
    timeCache <- newTimeCache simpleTimeFormat
    (logger, cleanUp) <- newTimedFastLogger timeCache (LogStdout defaultBufSize)
    logg logger "Some log message"
    cleanUp

logg :: ToLogStr msg => TimedFastLogger -> msg -> IO ()
logg logger msg = logger $ \ft -> toLogStr ft <> toLogStr ": " <> toLogStr msg
    