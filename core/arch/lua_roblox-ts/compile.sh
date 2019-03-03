#!/bin/sh
npx rbxtsc --noInclude || exit
src="$(tail -n +7 out/lang.lua)"
actually_head_sum="$(head -n 6 out/lang.lua | sha512sum | awk '{print $1}')"
head_sum="bd3ecc81a79bc30f23bff0ed24224621f33f4df0a53db00634947f0478f2ef92925fce5278256d84fae2a986a41ce22aff528d5398615e852809937d8166a005"
if [ ! "$head_sum" = "$actually_head_sum" ] ;then
  echo '[ERROR] rbxtsc輸出格式更新！必須更新compile.sh' >&2
  exit
fi
cat > out/lang.lua << EOF
/*
--    The Language
--    Copyright (C) 2018, 2019  Zaoqi <zaomir@outlook.com>

--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU Affero General Public License as published
--    by the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.

--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU Affero General Public License for more details.

--    You should have received a copy of the GNU Affero General Public License
--    along with this program.  If not, see <https://www.gnu.org/licenses/>.
local TS = {}
function TS.throw(value)
  error("Uncaught " .. tostring(value), 2)
end
function TS.string_split(input, sep)
	local result = {}
	local count = 0
	for str in input:gmatch(sep == "" and "." or "[^" .. sep .. "]+") do
		count = count + 1
		result[count] = str
	end
	return result
end
$src
EOF
