local cvar = csgo.interface_handler:get_cvar( );
local config = fatality.config
local menu = fatality.menu
local input = fatality.input;

cl_sidespeed = cvar:find_var( "cl_sidespeed" );
cl_forwardspeed = cvar:find_var( "cl_forwardspeed" );
cl_backspeed = cvar:find_var( "cl_backspeed" );

function set_speed( new_speed )
    if ( cl_sidespeed:get_int( ) == 450 and new_speed == 450 ) then
        return;
    end
     cl_sidespeed:set_float( new_speed );
     cl_forwardspeed:set_float( new_speed );
     cl_backspeed:set_float( new_speed );
end

local slowwalk_item = config:add_item( "slowwalk_rage", 0.0 )
local slowwalk_slider = menu:add_slider( "Slow walk", "rage", "aimbot", "aimbot", slowwalk_item, 1, 100, 1 )

function on_paint( )
local is_down = input:is_key_down( 16 );
if not ( is_down ) then
set_speed( 450 )
else
local final_val = 250 * slowwalk_item:get_float( ) / 100
set_speed( final_val )
end
end

local callbacks = fatality.callbacks;
callbacks:add( "paint", on_paint );
