local callbacks = fatality.callbacks
local menu = fatality.menu
local config = fatality.config

local engine_client = csgo.interface_handler:get_engine_client()
local entity_list = csgo.interface_handler:get_entity_list()
local events = csgo.interface_handler:get_events()

local function on_round_prestart()
		engine_client:client_cmd('buy deagle')
		engine_client:client_cmd('buy hegrenade')
		engine_client:client_cmd('buy smokegrenade')
		engine_client:client_cmd('buy molotov')
		engine_client:client_cmd('buy defuser')
end

local function on_event(e)
	local event_name = e:get_name()

	if event_name == "round_prestart" then
		on_round_prestart(e)
	end	
end

events:add_event( "round_prestart" )
callbacks:add( "events", on_event )
