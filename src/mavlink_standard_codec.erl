-module(mavlink_standard_codec).
-include("mavlink_standard.hrl").

%% API
-export([
    encode_global_position_int/1,
    decode_global_position_int/1,
    encode_autopilot_version/1,
    decode_autopilot_version/1
]).

%% @doc Encode GLOBAL_POSITION_INT message to binary
-spec encode_global_position_int(#global_position_int{}) -> binary().
encode_global_position_int(#global_position_int{
    time_boot_ms = TimeBootMs,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    relative_alt = RelativeAlt,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    hdg = Hdg
}) ->
    <<?GLOBAL_POSITION_INT_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-signed-integer,
      RelativeAlt:32/little-signed-integer,
      Vx:16/little-signed-integer,
      Vy:16/little-signed-integer,
      Vz:16/little-signed-integer,
      Hdg:16/little-unsigned-integer>>.

%% @doc Decode GLOBAL_POSITION_INT message from binary
-spec decode_global_position_int(binary()) -> #global_position_int{}.
decode_global_position_int(<<?GLOBAL_POSITION_INT_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-signed-integer,
                   RelativeAlt:32/little-signed-integer,
                   Vx:16/little-signed-integer,
                   Vy:16/little-signed-integer,
                   Vz:16/little-signed-integer,
                   Hdg:16/little-unsigned-integer>>) ->
    #global_position_int{
        time_boot_ms = TimeBootMs,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        relative_alt = RelativeAlt,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        hdg = Hdg
    }.

%% @doc Encode AUTOPILOT_VERSION message to binary
-spec encode_autopilot_version(#autopilot_version{}) -> binary().
encode_autopilot_version(#autopilot_version{
    capabilities = Capabilities,
    flight_sw_version = FlightSwVersion,
    middleware_sw_version = MiddlewareSwVersion,
    os_sw_version = OsSwVersion,
    board_version = BoardVersion,
    flight_custom_version = FlightCustomVersion,
    middleware_custom_version = MiddlewareCustomVersion,
    os_custom_version = OsCustomVersion,
    vendor_id = VendorId,
    product_id = ProductId,
    uid = Uid,
    uid2 = Uid2
}) ->
    <<?AUTOPILOT_VERSION_ID:8,
      Capabilities:64/little-unsigned-integer,
      FlightSwVersion:32/little-unsigned-integer,
      MiddlewareSwVersion:32/little-unsigned-integer,
      OsSwVersion:32/little-unsigned-integer,
      BoardVersion:32/little-unsigned-integer,
      FlightCustomVersion:8/little-unsigned-integer,
      MiddlewareCustomVersion:8/little-unsigned-integer,
      OsCustomVersion:8/little-unsigned-integer,
      VendorId:16/little-unsigned-integer,
      ProductId:16/little-unsigned-integer,
      Uid:64/little-unsigned-integer,
      Uid2:8/little-unsigned-integer>>.

%% @doc Decode AUTOPILOT_VERSION message from binary
-spec decode_autopilot_version(binary()) -> #autopilot_version{}.
decode_autopilot_version(<<?AUTOPILOT_VERSION_ID:8,
                   Capabilities:64/little-unsigned-integer,
                   FlightSwVersion:32/little-unsigned-integer,
                   MiddlewareSwVersion:32/little-unsigned-integer,
                   OsSwVersion:32/little-unsigned-integer,
                   BoardVersion:32/little-unsigned-integer,
                   FlightCustomVersion:8/little-unsigned-integer,
                   MiddlewareCustomVersion:8/little-unsigned-integer,
                   OsCustomVersion:8/little-unsigned-integer,
                   VendorId:16/little-unsigned-integer,
                   ProductId:16/little-unsigned-integer,
                   Uid:64/little-unsigned-integer,
                   Uid2:8/little-unsigned-integer>>) ->
    #autopilot_version{
        capabilities = Capabilities,
        flight_sw_version = FlightSwVersion,
        middleware_sw_version = MiddlewareSwVersion,
        os_sw_version = OsSwVersion,
        board_version = BoardVersion,
        flight_custom_version = FlightCustomVersion,
        middleware_custom_version = MiddlewareCustomVersion,
        os_custom_version = OsCustomVersion,
        vendor_id = VendorId,
        product_id = ProductId,
        uid = Uid,
        uid2 = Uid2
    }.
