module Ch02_DependencyAndLogMessage
    ( logFunc
    ) where

import System.Log.FastLogger

logFunc :: IO ()

logFunc =     do
    timeCache <- newTimeCache simpleTimeFormat
    (logger, cleanUp) <- newTimedFastLogger timeCache (LogStdout defaultBufSize)
    logg logger "Date log message test: "
    cleanUp

logg :: ToLogStr msg => TimedFastLogger -> msg -> IO ()
logg logger msg = logger $ \ft -> toLogStr ft <> toLogStr ": " <> toLogStr msg
    