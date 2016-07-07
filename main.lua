
local Flux = require "Flux"
local types = require "common.types"

local test_case = "stuff"

local source = Source "Flux/tests"

if source.hasMainFile then
	source:import "main"
else
	error( "path has no main file", 0 )
end

for i = 1, #source.statements do
	print( serializeRootStatement( source.statements[i] ) )
	print ""

	if not types.check( source.statements[i], "RootStatement" ) then
		local s = types.whynot( source.statements[i], "RootStatement" )
		love.filesystem.write( "log.txt", s )
		error( s )
	end
end
