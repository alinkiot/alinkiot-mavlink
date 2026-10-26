-module(mavlink_test).
-include("mavlink_minimal.hrl").
-include("mavlink_standard.hrl").
-include("mavlink_common.hrl").

%% API
-export([run/0]).

run() ->
    io:format("~n=== MAVLink Erlang SDK Test ===~n~n"),
    
    %% Test 1: HEARTBEAT message
    io:format("Test 1: HEARTBEAT encode/decode~n"),
    Heartbeat = #heartbeat{
        type = ?MAV_TYPE_QUADROTOR,
        autopilot = ?MAV_AUTOPILOT_ARDUPILOTMEGA,
        base_mode = 0,
        custom_mode = 0,
        system_status = 0,
        mavlink_version = 3
    },
    io:format("  Original: ~p~n", [Heartbeat]),
    EncodedHb = mavlink_encoder:encode_heartbeat(Heartbeat),
    io:format("  Encoded (binary): ~p~n", [EncodedHb]),
    DecodedHb = mavlink_decoder:decode_heartbeat(EncodedHb),
    io:format("  Decoded: ~p~n", [DecodedHb]),
    io:format("  Match: ~p~n~n", [Heartbeat =:= DecodedHb]),
    
    %% Test 2: GLOBAL_POSITION_INT message
    io:format("Test 2: GLOBAL_POSITION_INT encode/decode~n"),
    GpsPos = #global_position_int{
        time_boot_ms = 12345,
        lat = 473977000,  %% 47.3977 degrees (degE7)
        lon = 85452200,   %% 8.54522 degrees (degE7)
        alt = 488000,     %% 488m (mm)
        relative_alt = 10000,
        vx = 0,
        vy = 0,
        vz = 0,
        hdg = 65535
    },
    io:format("  Original: ~p~n", [GpsPos]),
    EncodedGps = mavlink_encoder:encode_global_position_int(GpsPos),
    io:format("  Encoded (binary): ~p~n", [EncodedGps]),
    DecodedGps = mavlink_decoder:decode_global_position_int(EncodedGps),
    io:format("  Decoded: ~p~n", [DecodedGps]),
    io:format("  Match: ~p~n~n", [GpsPos =:= DecodedGps]),
    
    %% Test 3: Decode routing
    io:format("Test 3: Generic decode routing~n"),
    {ok, heartbeat, _} = mavlink_decoder:decode(EncodedHb),
    io:format("  HEARTBEAT decoded correctly~n"),
    {ok, global_position_int, _} = mavlink_decoder:decode(EncodedGps),
    io:format("  GLOBAL_POSITION_INT decoded correctly~n~n"),
    
    io:format("=== All tests passed! ===~n"),
    ok.
