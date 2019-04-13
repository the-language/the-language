--    The Language
--    Copyright (C) 2019  Zaoqi

--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU Affero General Public License as published
--    by the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.

--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU Affero General Public License for more details.

--    You should have received a copy of the GNU Affero General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>.

main = do
    ret <-return$ ""
    ret <-return$ ret ++ "import qualified Foreign.Lua as Lua\n"
    ret <-return$ ret ++ "import Data.ByteString ()\n"
    ret <-return$ ret ++ "import Foreign.Ptr (Ptr)\n"
    ret <-return$ ret ++ "import Data.String (fromString)\n"
    ret <-return$ ret ++ "import System.IO.Unsafe (unsafePerformIO)\n"
    ret <-return$ ret ++ "newtype Value = NewValue { unNewValue :: (Ptr ()) }\n"
    ret <-return$ ret ++ "exports_magicnumber = \"THELANGEXPORTS\"\n"
    ret <-return$ ret ++ "{-# NOINLINE luastate #-}\n"
    ret <-return$ ret ++ "luastate :: Lua.State\n"
    ret <-return$ ret ++ "luastate = unsafePerformIO $ Lua.run $ do\n"
    ret <-return$ ret ++ "    Lua.openlibs\n"
    f <- readFile "lang.lua"
    ret <-return$ ret ++ "    Lua.OK <- Lua.loadstring (fromString " ++ show f ++ ")\n"
    ret <-return$ ret ++ "    Lua.OK <- Lua.pcall 0 1 Nothing\n"
    ret <-return$ ret ++ "    Lua.setglobal exports_magicnumber\n"
    ret <-return$ ret ++ "    Lua.liftIO (putStrLn \"INITED\")\n"
    ret <-return$ ret ++ "    Lua.state\n"
    ret <-return$ ret ++ "complex_parse :: String -> Value\n"
    ret <-return$ ret ++ "complex_parse str = seq luastate $ seq str $ unsafePerformIO $ Lua.runWith luastate $ do \n"
    ret <-return$ ret ++ "    Lua.liftIO (putStrLn \"complex_parseENT0\")\n"
    ret <-return$ ret ++ "    Lua.getglobal' $ exports_magicnumber++\".complex_parse\"\n"
    ret <-return$ ret ++ "    Lua.liftIO (putStrLn \"complex_parseENTB\")\n"
    ret <-return$ ret ++ "    Lua.push str\n"
    ret <-return$ ret ++ "    Lua.call 1 1\n"
    ret <-return$ ret ++ "    fmap NewValue $ Lua.peek (-1)\n"
    ret <-return$ ret ++ "complex_print :: Value -> String\n"
    ret <-return$ ret ++ "complex_print val = seq luastate $ seq val $ unsafePerformIO $ Lua.runWith luastate $ do \n"
    ret <-return$ ret ++ "    Lua.getglobal' $ exports_magicnumber++\".complex_print\"\n"
    ret <-return$ ret ++ "    Lua.push (unNewValue val)\n"
    ret <-return$ ret ++ "    Lua.call 1 1\n"
    ret <-return$ ret ++ "    Lua.peek (-1)\n"
    writeFile "Lang.hs" ret
