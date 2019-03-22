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
    ret <-return$ ret ++ "import Foreign.Lua as Lua\n"
    ret <-return$ ret ++ "import Data.ByteString\n"
    ret <-return$ ret ++ "import Data.String\n"
    ret <-return$ ret ++ "import System.IO.Unsafe\n"
    ret <-return$ ret ++ "state :: Lua.State\n"
    ret <-return$ ret ++ "state = unsafePerformIO $ Lua.run $ do\n"
    ret <-return$ ret ++ "    Lua.openlibs\n"
    f <- readFile "lang.lua"
    ret <-return$ ret ++ "    Lua.OK <- Lua.loadstring (fromString " ++ show f ++ ")\n"
    ret <-return$ ret ++ "    Lua.OK <- Lua.pcall 0 1 Nothing\n"
    ret <-return$ ret ++ "    Lua.setglobal \"TheLanguage\"\n"
    ret <-return$ ret ++ "    Lua.state\n"
    writeFile "Lang.hs" ret
