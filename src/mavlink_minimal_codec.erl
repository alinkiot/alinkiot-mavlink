-module(mavlink_minimal_codec).
-include("mavlink_minimal.hrl").

%% API
-export([
    encode_heartbeat/1,
    decode_heartbeat/1
]).

%% @doc Encode HEARTBEAT message to binary
-spec encode_heartbeat(#heartbeat{}) -> binary().
encode_heartbeat(#heartbeat{
    type = Type,
    autopilot = Autopilot,
    base_mode = BaseMode,
    custom_mode = CustomMode,
    system_status = SystemStatus,
    mavlink_version = MavlinkVersion
}) ->
    <<?HEARTBEAT_ID:8,
      Type:8/little-unsigned-integer,
      Autopilot:8/little-unsigned-integer,
      BaseMode:8/little-unsigned-integer,
      CustomMode:32/little-unsigned-integer,
      SystemStatus:8/little-unsigned-integer,
      MavlinkVersion:8/little-unsigned-integer>>.

%% @doc Decode HEARTBEAT message from binary
-spec decode_heartbeat(binary()) -> #heartbeat{}.
decode_heartbeat(<<?HEARTBEAT_ID:8,
                   Type:8/little-unsigned-integer,
                   Autopilot:8/little-unsigned-integer,
                   BaseMode:8/little-unsigned-integer,
                   CustomMode:32/little-unsigned-integer,
                   SystemStatus:8/little-unsigned-integer,
                   MavlinkVersion:8/little-unsigned-integer>>) ->
    #heartbeat{
        type = Type,
        autopilot = Autopilot,
        base_mode = BaseMode,
        custom_mode = CustomMode,
        system_status = SystemStatus,
        mavlink_version = MavlinkVersion
    }.
