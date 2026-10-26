-module(mavlink_decoder).
-include("mavlink_minimal.hrl").
-include("mavlink_standard.hrl").
-include("mavlink_common.hrl").

%% API
-export([
    decode/1,
    decode_heartbeat/1,
    decode_sys_status/1,
    decode_attitude/1,
    decode_gps_raw_int/1,
    decode_global_position_int/1,
    decode_command_long/1
]).

%% @doc Decode a MAVLink message binary
-spec decode(binary()) -> {ok, atom(), tuple()} | {error, term()}.
decode(<<?HEARTBEAT_ID:8, _/binary>> = Binary) ->
    {ok, heartbeat, decode_heartbeat(Binary)};
decode(<<?SYS_STATUS_ID:8, _/binary>> = Binary) ->
    {ok, sys_status, decode_sys_status(Binary)};
decode(<<?ATTITUDE_ID:8, _/binary>> = Binary) ->
    {ok, attitude, decode_attitude(Binary)};
decode(<<?GPS_RAW_INT_ID:8, _/binary>> = Binary) ->
    {ok, gps_raw_int, decode_gps_raw_int(Binary)};
decode(<<?GLOBAL_POSITION_INT_ID:8, _/binary>> = Binary) ->
    {ok, global_position_int, decode_global_position_int(Binary)};
decode(<<?COMMAND_LONG_ID:8, _/binary>> = Binary) ->
    {ok, command_long, decode_command_long(Binary)};
decode(<<MsgId:8, _/binary>>) ->
    {error, {unknown_message, MsgId}};
decode(_) ->
    {error, invalid_binary}.

%% @doc decode HEARTBEAT message from binary
-spec decode_heartbeat(binary()) -> #heartbeat{}.
decode_heartbeat(<<?HEARTBEAT_ID:8,
                   CustomMode:32/little-unsigned-integer,
                   Type:8, Autopilot:8, BaseMode:8, SystemStatus:8,
                   MavlinkVersion:8>>) ->
    #heartbeat{
        type = Type,
        autopilot = Autopilot,
        base_mode = BaseMode,
        custom_mode = CustomMode,
        system_status = SystemStatus,
        mavlink_version = MavlinkVersion
    }.

%% @doc decode SYS_STATUS message from binary
-spec decode_sys_status(binary()) -> #sys_status{}.
decode_sys_status(<<?SYS_STATUS_ID:8,
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
                    ErrorsCount4:16/little-unsigned-integer>>) ->
    #sys_status{
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
    }.

%% @doc decode ATTITUDE message from binary
-spec decode_attitude(binary()) -> #attitude{}.
decode_attitude(<<?ATTITUDE_ID:8,
                  TimeBootMs:32/little-unsigned-integer,
                  Roll:32/little-float,
                  Pitch:32/little-float,
                  Yaw:32/little-float,
                  Rollspeed:32/little-float,
                  Pitchspeed:32/little-float,
                  Yawspeed:32/little-float>>) ->
    #attitude{
        time_boot_ms = TimeBootMs,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        rollspeed = Rollspeed,
        pitchspeed = Pitchspeed,
        yawspeed = Yawspeed
    }.

%% @doc decode GPS_RAW_INT message from binary
-spec decode_gps_raw_int(binary()) -> #gps_raw_int{}.
decode_gps_raw_int(<<?GPS_RAW_INT_ID:8,
                     TimeUsec:64/little-unsigned-integer,
                     Lat:32/little-signed-integer,
                     Lon:32/little-signed-integer,
                     Alt:32/little-signed-integer,
                     Eph:16/little-unsigned-integer,
                     Epv:16/little-unsigned-integer,
                     Vel:16/little-unsigned-integer,
                     Cog:16/little-unsigned-integer,
                     FixType:8,
                     SatellitesVisible:8>>) ->
    #gps_raw_int{
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
    }.

%% @doc decode GLOBAL_POSITION_INT message from binary
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

%% @doc decode COMMAND_LONG message from binary
-spec decode_command_long(binary()) -> #command_long{}.
decode_command_long(<<?COMMAND_LONG_ID:8,
                      TargetSystem:8, TargetComponent:8,
                      Command:16/little-unsigned-integer,
                      Confirmation:8,
                      Param1:32/little-float,
                      Param2:32/little-float,
                      Param3:32/little-float,
                      Param4:32/little-float,
                      Param5:32/little-float,
                      Param6:32/little-float,
                      Param7:32/little-float>>) ->
    #command_long{
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
    }.
