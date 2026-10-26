-module(mavlink_encoder).
-include("mavlink_minimal.hrl").
-include("mavlink_standard.hrl").
-include("mavlink_common.hrl").

%% API
-export([
    encode_heartbeat/1,
    encode_sys_status/1,
    encode_attitude/1,
    encode_gps_raw_int/1,
    encode_global_position_int/1,
    encode_command_long/1,
    crc/1
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
      CustomMode:32/little-unsigned-integer,
      Type:8, Autopilot:8, BaseMode:8, SystemStatus:8, MavlinkVersion:8>>.

%% @doc Encode SYS_STATUS message to binary
-spec encode_sys_status(#sys_status{}) -> binary().
encode_sys_status(#sys_status{
    onboard_control_sensors_present = SensorsPresent,
    onboard_control_sensors_enabled = SensorsEnabled,
    onboard_control_sensors_health = SensorsHealth,
    load = Load,
    voltage_battery = VoltageBattery,
    current_battery = CurrentBattery,
    battery_remaining = BatteryRemaining,
    drop_rate_comm = DropRateComm,
    errors_comm = ErrorsComm,
    errors_count1 = ErrorsCount1,
    errors_count2 = ErrorsCount2,
    errors_count3 = ErrorsCount3,
    errors_count4 = ErrorsCount4
}) ->
    <<?SYS_STATUS_ID:8,
      SensorsPresent:32/little-unsigned-integer,
      SensorsEnabled:32/little-unsigned-integer,
      SensorsHealth:32/little-unsigned-integer,
      Load:16/little-unsigned-integer,
      VoltageBattery:16/little-unsigned-integer,
      CurrentBattery:16/little-signed-integer,
      BatteryRemaining:8/signed-integer,
      DropRateComm:16/little-unsigned-integer,
      ErrorsComm:16/little-unsigned-integer,
      ErrorsCount1:16/little-unsigned-integer,
      ErrorsCount2:16/little-unsigned-integer,
      ErrorsCount3:16/little-unsigned-integer,
      ErrorsCount4:16/little-unsigned-integer>>.

%% @doc Encode ATTITUDE message to binary
-spec encode_attitude(#attitude{}) -> binary().
encode_attitude(#attitude{
    time_boot_ms = TimeBootMs,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    rollspeed = Rollspeed,
    pitchspeed = Pitchspeed,
    yawspeed = Yawspeed
}) ->
    <<?ATTITUDE_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Rollspeed:32/little-float,
      Pitchspeed:32/little-float,
      Yawspeed:32/little-float>>.

%% @doc Encode GPS_RAW_INT message to binary
-spec encode_gps_raw_int(#gps_raw_int{}) -> binary().
encode_gps_raw_int(#gps_raw_int{
    time_usec = TimeUsec,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    eph = Eph,
    epv = Epv,
    vel = Vel,
    cog = Cog,
    fix_type = FixType,
    satellites_visible = SatellitesVisible
}) ->
    <<?GPS_RAW_INT_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-signed-integer,
      Eph:16/little-unsigned-integer,
      Epv:16/little-unsigned-integer,
      Vel:16/little-unsigned-integer,
      Cog:16/little-unsigned-integer,
      FixType:8,
      SatellitesVisible:8>>.

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

%% @doc Encode COMMAND_LONG message to binary
-spec encode_command_long(#command_long{}) -> binary().
encode_command_long(#command_long{
    target_system = TargetSystem,
    target_component = TargetComponent,
    command = Command,
    confirmation = Confirmation,
    param1 = Param1,
    param2 = Param2,
    param3 = Param3,
    param4 = Param4,
    param5 = Param5,
    param6 = Param6,
    param7 = Param7
}) ->
    <<?COMMAND_LONG_ID:8,
      TargetSystem:8, TargetComponent:8,
      Command:16/little-unsigned-integer,
      Confirmation:8,
      Param1:32/little-float,
      Param2:32/little-float,
      Param3:32/little-float,
      Param4:32/little-float,
      Param5:32/little-float,
      Param6:32/little-float,
      Param7:32/little-float>>.

%% @doc Calculate CRC16 (MAVLink uses CRC16-CCITT-FALSE)
-spec crc(binary()) -> non_neg_integer().
crc(Data) when is_binary(Data) ->
    crc_binary(Data, 16#FFFF).

crc_binary(<<>>, Crc) ->
    Crc;
crc_binary(<<Byte:8, Rest/binary>>, Crc) ->
    NewCrc = crc_update(Byte, Crc),
    crc_binary(Rest, NewCrc).

crc_update(Byte, Crc) ->
    Xor = Byte bxor (Crc bsr 8),
    lists:foldl(fun(_, Acc) ->
        case Acc band 16#8000 of
            0 -> Acc bsl 1;
            _ -> (Acc bsl 1) bxor 16#1021
        end
    end, Xor, lists:seq(1, 8)) band 16#FFFF.
