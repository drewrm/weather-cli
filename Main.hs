import System.Environment
import qualified Data.ByteString.Char8 as S8
import qualified Data.Yaml             as Yaml
import Network.HTTP.Simple
import           Data.Aeson            (Value)

main :: IO ()
main = do
        putStrLn "================================"
        putStrLn "          Weather CLI"
        putStrLn "================================"
        putStrLn "Enter your location: "
        location <- getLine
        putStrLn "Api key: "
        key <- getLine
        url <- parseRequest ("GET http://api.openweathermap.org/data/2.5/weather?q=" ++ location ++ "&appid=" ++ key)
        weather <- httpJSON url
        S8.putStrLn $ Yaml.encode (getResponseBody weather :: Value)
