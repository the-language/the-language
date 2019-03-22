import Foreign.Lua as Lua
import Data.ByteString
import Data.String
import System.IO.Unsafe
state :: Lua.State
state = unsafePerformIO $ Lua.run $ do
    Lua.openlibs
    Lua.OK <- Lua.loadstring (fromString "-- test\nlocal exports={}\nreturn exports\n")
    Lua.OK <- Lua.pcall 0 1 Nothing
    Lua.setglobal "TheLanguage"
    Lua.state
