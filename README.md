# alinkiot-mavlink

MAVLink protocol library for Erlang/OTP 24+.

This library provides Erlang record definitions and encode/decode functions for MAVLink messages, generated from official MAVLink XML definitions.

## Features

- ✅ **Full MAVLink 2.0 Support**: Compatible with Erlang/OTP 24+
- ✅ **Complete Protocol**: 308 messages, 959 enum constants, 616 codec functions
- ✅ **MAVLink 2.0 Extended IDs**: Supports 16-bit message IDs for extended messages
- ✅ **Type-Safe**: Erlang records provide compile-time type checking
- ✅ **Zero Dependencies**: Pure Erlang implementation, no external libraries needed
- ✅ **Multi-Dialect**: Minimal, Standard, Common, and ArduPilot dialects included
- ✅ **Generated Code**: Automatically generated from official MAVLink XML definitions

## Architecture

This library follows the MAVLink architecture pattern:

1. **Message Definitions**: Protocol definitions from official MAVLink XML files
2. **Code Generator**: Python script generates Erlang headers and codec modules
3. **Header Files**: Record definitions and enum constants (`.hrl` files)
4. **Codec Modules**: Encode/decode functions for all messages (`.erl` files)

```
MAVLink XML → Generator → Erlang Code
   (protocol)  (scripts)   (runtime)
```

### Design Principles

- **Separation of Concerns**: Headers define data structures, codecs handle serialization
- **Dialect Isolation**: Each dialect has its own header and codec module
- **Binary Efficiency**: Direct binary pattern matching for fast encode/decode
- **No Runtime Overhead**: All code generated at compile time

## MAVLink Protocol Compatibility

| Dialect | Messages | Constants | Use Case |
|---------|----------|-----------|----------|
| Minimal | 1 | 237 | Essential heartbeat only |
| Standard | 2 | 23 | Core positioning + version |
| Common | 232 | 656 | Full MAVLink common set |
| ArduPilot | 73 | 43 | ArduPilot-specific extensions |

### MAVLink 2.0 Features

- ✅ **16-bit Message IDs**: Supports extended message IDs (ID > 255)
- ✅ **Backward Compatible**: Works with MAVLink 1.0 systems
- ⚠️ **Signing**: Not yet implemented (planned for future release)
- ⚠️ **Framing**: Not included - use with your own transport layer

## Installation

Add to your `rebar.config`:

```erlang
{deps, [
    {mavlink, {git, "https://github.com/alinkiot/alinkiot-mavlink.git", {tag, "1.0.0"}}}
]}.
```

## Quick Start

### 1. Add to your project

Add to your `rebar.config`:

```erlang
{deps, [
    {mavlink, {git, "https://github.com/alinkiot/alinkiot-mavlink.git", {tag, "1.0.0"}}}
]}.
```

### 2. Include the header file

```erlang
-include_lib("mavlink/include/mavlink_common.hrl").
-include_lib("mavlink/include/mavlink_standard.hrl").
```

### 3. Create a HEARTBEAT message

```erlang
%% Create a HEARTBEAT message for a quadrotor drone
Heartbeat = #heartbeat{
    type = ?MAV_TYPE_QUADROTOR,
    autopilot = ?MAV_AUTOPILOT_ARDUPILOTMEGA,
    base_mode = ?MAV_MODE_FLAG_SAFETY_ARMED,
    custom_mode = 0,
    system_status = ?MAV_STATE_ACTIVE,
    mavlink_version = 3
}.
```

### 4. Encode to binary

```erlang
%% Encode message to MAVLink binary format
Binary = mavlink_minimal_codec:encode_heartbeat(Heartbeat).
%% => <<0,0,0,0,0,2,3,132,0,3>>
```

### 5. Decode from binary

```erlang
%% Decode binary back to message record
DecodedMsg = mavlink_minimal_codec:decode_heartbeat(Binary).
%% => #heartbeat{type = 2, autopilot = 3, base_mode = 132, ...}
```

## Usage Examples

### Example 1: Send GPS Position

```erlang
%% Create a GLOBAL_POSITION_INT message
GpsPos = #global_position_int{
    time_boot_ms = 12345,
    lat = 473977000,      %% 47.3977° (degE7 format)
    lon = 85452200,       %% 8.54522° (degE7 format)  
    alt = 488000,         %% 488m MSL (mm)
    relative_alt = 10000, %% 10m above home (mm)
    vx = 0,               %% Ground X speed (cm/s)
    vy = 0,               %% Ground Y speed (cm/s)
    vz = 0,               %% Ground Z speed (cm/s)
    hdg = 65535           %% Heading (cdeg), UINT16_MAX = unknown
},

%% Encode to binary
Binary = mavlink_standard_codec:encode_global_position_int(GpsPos).
```

### Example 2: Send Command

```erlang
%% Send MAV_CMD_NAV_TAKEOFF command
Cmd = #command_long{
    target_system = 1,
    target_component = 1,
    command = ?MAV_CMD_NAV_TAKEOFF,
    confirmation = 0,
    param1 = 0.0,    %% Pitch angle (ignored)
    param2 = 0.0,    %% Empty
    param3 = 0.0,    %% Empty
    param4 = 0.0,    %% Yaw angle (NaN = unchanged)
    param5 = 0.0,    %% Latitude
    param6 = 0.0,    %% Longitude
    param7 = 50.0    %% Altitude (meters)
},

Binary = mavlink_common_codec:encode_command_long(Cmd).
```

### Example 3: Receive and Route Messages

```erlang
-module(mavlink_router).
-include_lib("mavlink/include/mavlink_common.hrl").
-include_lib("mavlink/include/mavlink_standard.hrl").

-export([handle_message/1]).

%% Route incoming binary to appropriate decoder
handle_message(Binary) when is_binary(Binary) ->
    case Binary of
        <<?HEARTBEAT_ID:8, _/binary>> ->
            Msg = mavlink_minimal_codec:decode_heartbeat(Binary),
            handle_heartbeat(Msg);
        
        <<?GLOBAL_POSITION_INT_ID:8, _/binary>> ->
            Msg = mavlink_standard_codec:decode_global_position_int(Binary),
            handle_gps(Msg);
        
        <<?ATTITUDE_ID:8, _/binary>> ->
            Msg = mavlink_common_codec:decode_attitude(Binary),
            handle_attitude(Msg);
        
        <<MsgId:8, _/binary>> ->
            {error, {unknown_message, MsgId}}
    end.

handle_heartbeat(#heartbeat{type = Type, autopilot = Autopilot}) ->
    io:format("Heartbeat from autopilot ~p, type ~p~n", [Autopilot, Type]),
    ok.

handle_gps(#global_position_int{lat = Lat, lon = Lon, alt = Alt}) ->
    io:format("GPS: lat=~p, lon=~p, alt=~p~n", [Lat/1e7, Lon/1e7, Alt/1000]),
    ok.

handle_attitude(#attitude{roll = Roll, pitch = Pitch, yaw = Yaw}) ->
    io:format("Attitude: roll=~p, pitch=~p, yaw=~p~n", [Roll, Pitch, Yaw]),
    ok.
```

### Example 4: System Status Monitoring

```erlang
%% Create a SYS_STATUS message
SysStatus = #sys_status{
    onboard_control_sensors_present = ?MAV_SYS_STATUS_SENSOR_3D_GYRO bor
                                      ?MAV_SYS_STATUS_SENSOR_3D_ACCEL bor
                                      ?MAV_SYS_STATUS_SENSOR_GPS,
    onboard_control_sensors_enabled = ?MAV_SYS_STATUS_SENSOR_3D_GYRO bor
                                      ?MAV_SYS_STATUS_SENSOR_3D_ACCEL bor
                                      ?MAV_SYS_STATUS_SENSOR_GPS,
    onboard_control_sensors_health = ?MAV_SYS_STATUS_SENSOR_3D_GYRO bor
                                     ?MAV_SYS_STATUS_SENSOR_3D_ACCEL bor
                                     ?MAV_SYS_STATUS_SENSOR_GPS,
    load = 350,               %% 35% CPU load
    voltage_battery = 12000,  %% 12V
    current_battery = 1500,   %% 1.5A (-1 = not available)
    battery_remaining = 80,   %% 80%
    drop_rate_comm = 0,
    errors_comm = 0,
    errors_count1 = 0,
    errors_count2 = 0,
    errors_count3 = 0,
    errors_count4 = 0
},

Binary = mavlink_common_codec:encode_sys_status(SysStatus).
```

## Working with Different Dialects

### Minimal Dialect (HEARTBEAT only)

```erlang
-include_lib("mavlink/include/mavlink_minimal.hrl").

%% Minimal dialect only includes HEARTBEAT message
Heartbeat = #heartbeat{type = ?MAV_TYPE_QUADROTOR, ...}.
Binary = mavlink_minimal_codec:encode_heartbeat(Heartbeat).
```

### Standard Dialect

```erlang
-include_lib("mavlink/include/mavlink_standard.hrl").

%% Standard dialect includes HEARTBEAT, GLOBAL_POSITION_INT, AUTOPILOT_VERSION
GpsPos = #global_position_int{lat = 473977000, ...}.
Binary = mavlink_standard_codec:encode_global_position_int(GpsPos).
```

### Common Dialect (Full MAVLink common)

```erlang
-include_lib("mavlink/include/mavlink_common.hrl").

%% Common dialect includes 232 messages: ATTITUDE, GPS_RAW_INT, COMMAND_LONG, etc.
Attitude = #attitude{roll = 0.1, pitch = -0.05, yaw = 1.57, ...}.
Binary = mavlink_common_codec:encode_attitude(Attitude).
```

### ArduPilot Dialect

```erlang
-include_lib("mavlink/include/mavlink_ardupilotmega.hrl").

%% ArduPilot dialect includes ArduPilot-specific messages
Battery2 = #battery2{voltage = 12000, current_battery = 1500, ...}.
Binary = mavlink_ardupilotmega_codec:encode_battery2(Battery2).
```

## MAVLink Constants

All MAVLink enums are defined as constants for easy use:

```erlang
%% MAV_TYPE enum
?MAV_TYPE_GENERIC           %% 0
?MAV_TYPE_FIXED_WING        %% 1
?MAV_TYPE_QUADROTOR         %% 2
?MAV_TYPE_COAXIAL           %% 3
?MAV_TYPE_HELICOPTER        %% 4

%% MAV_AUTOPILOT enum  
?MAV_AUTOPILOT_GENERIC      %% 0
?MAV_AUTOPILOT_ARDUPILOTMEGA %% 3
?MAV_AUTOPILOT_PX4          %% 12

%% MAV_MODE_FLAG enum (bitmask)
?MAV_MODE_FLAG_SAFETY_ARMED         %% 128
?MAV_MODE_FLAG_MANUAL_INPUT_ENABLED %% 64
?MAV_MODE_FLAG_HIL_ENABLED          %% 32

%% MAV_STATE enum
?MAV_STATE_UNINIT      %% 0
?MAV_STATE_BOOT        %% 1
?MAV_STATE_CALIBRATING %% 2
?MAV_STATE_STANDBY     %% 3
?MAV_STATE_ACTIVE      %% 4
```

## Supported Messages

### Full Protocol Implementation

This library provides complete encode/decode support for all 308 MAVLink messages:

- **Minimal Dialect** (1 message): HEARTBEAT
- **Standard Dialect** (2 messages): GLOBAL_POSITION_INT, AUTOPILOT_VERSION  
- **Common Dialect** (232 messages): Full MAVLink common message set
- **ArduPilot Dialect** (73 messages): ArduPilot-specific extensions

All messages are generated with both encoder and decoder functions, totaling **616 codec functions**.

## Message IDs

All message IDs are defined as constants:

```erlang
-define(HEARTBEAT_ID, 0).
-define(SYS_STATUS_ID, 1).
-define(ATTITUDE_ID, 30).
-define(GPS_RAW_INT_ID, 24).
```

## Enums

All MAVLink enums are defined as constants:

```erlang
%% MAV_TYPE enum
-define(MAV_TYPE_GENERIC, 0).
-define(MAV_TYPE_FIXED_WING, 1).
-define(MAV_TYPE_QUADROTOR, 2).
...

%% MAV_MODE_FLAG enum
-define(MAV_MODE_FLAG_SAFETY_ARMED, 128).
-define(MAV_MODE_FLAG_MANUAL_INPUT_ENABLED, 64).
...
```

## Project Structure

```
alinkiot-mavlink/
├── include/
│   ├── mavlink_minimal.hrl         # Minimal dialect records
│   ├── mavlink_standard.hrl        # Standard dialect records
│   ├── mavlink_common.hrl          # Common dialect records
│   └── mavlink_ardupilotmega.hrl   # ArduPilot dialect records
├── src/
│   ├── mavlink.erl                  # API and utilities
│   ├── mavlink_minimal_codec.erl    # Minimal dialect encoder/decoder
│   ├── mavlink_standard_codec.erl   # Standard dialect encoder/decoder
│   ├── mavlink_common_codec.erl     # Common dialect encoder/decoder
│   ├── mavlink_ardupilotmega_codec.erl # ArduPilot dialect encoder/decoder
│   ├── mavlink_encoder.erl          # Legacy encoder (deprecated)
│   ├── mavlink_decoder.erl          # Legacy decoder (deprecated)
│   ├── mavlink_app.erl              # Application module
│   └── mavlink_sup.erl              # Supervisor
├── test/
│   └── mavlink_test.erl             # Test module
└── README.md
```

## Generating from XML

To regenerate the Erlang headers from MAVLink XML definitions:

```bash
# Generate Common dialect
python3 scripts/generate_erlang_simple.py \
    message_definitions/v1.0/common.xml \
    include/mavlink_common.hrl \
    mavlink_common

# Generate ArduPilot dialect
python3 scripts/generate_erlang_simple.py \
    message_definitions/v1.0/ardupilotmega.xml \
    include/mavlink_ardupilotmega.hrl \
    mavlink_ardupilotmega
```

## License

MIT License

## References

- [MAVLink Protocol](https://mavlink.io/)
- [MAVLink XML Definitions](https://github.com/mavlink/mavlink)
- [Erlang/OTP](https://www.erlang.org/)
