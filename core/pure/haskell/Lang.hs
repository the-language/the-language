import qualified Foreign.Lua as Lua
import Data.ByteString ()
import Foreign.Ptr (Ptr)
import Data.String (fromString)
import System.IO.Unsafe (unsafePerformIO)
newtype Value = NewValue { unNewValue :: (Ptr ()) }
exports_magicnumber = "THELANGEXPORTS"
{-# NOINLINE luastate #-}
luastate :: Lua.State
luastate = unsafePerformIO $ Lua.run $ do
    Lua.openlibs
    Lua.OK <- Lua.loadstring (fromString "-- test\nlocal exports={}\nexports.complex_print=function(x)return \"a\" end\nexports.complex_parse=function(x)return \"b\" end\nreturn exports\n")
    Lua.OK <- Lua.pcall 0 1 Nothing
    Lua.setglobal exports_magicnumber
    Lua.liftIO (putStrLn "INITED")
    Lua.state
complex_parse :: String -> Value
complex_parse str = seq luastate $ seq str $ unsafePerformIO $ Lua.runWith luastate $ do 
    Lua.liftIO (putStrLn "complex_parseENT0")
    Lua.getglobal' $ exports_magicnumber++".complex_parse"
    Lua.liftIO (putStrLn "complex_parseENTB")
    Lua.push str
    Lua.call 1 1
    fmap NewValue $ Lua.peek (-1)
complex_print :: Value -> String
complex_print val = seq luastate $ seq val $ unsafePerformIO $ Lua.runWith luastate $ do 
    Lua.getglobal' $ exports_magicnumber++".complex_print"
    Lua.push (unNewValue val)
    Lua.call 1 1
    Lua.peek (-1)
