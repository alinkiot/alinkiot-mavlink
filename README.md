# alinkiot-mavlink

MAVLink protocol library for Erlang/OTP 24+.

This library provides Erlang record definitions and encode/decode functions for MAVLink messages, generated from official MAVLink XML definitions.

## Features

- ✅ Compatible with Erlang/OTP 24+
- ✅ Generated from official MAVLink XML definitions
- ✅ Supports MAVLink 2.0 protocol
- ✅ Includes Common and ArduPilot dialects
- ✅ Type-safe record definitions
- ✅ Encode/decode functions for common messages

## Installation

Add to your `rebar.config`:

```erlang
{deps, [
    {mavlink, {git, "https://github.com/your-org/alinkiot-mavlink.git", {tag, "1.0.0"}}}
]}.
```

## Usage

### Include the header file

```erlang
-include_lib("mavlink/include/mavlink_common.hrl").
```

### Create a message

```erlang
%% Create a HEARTBEAT message
Heartbeat = #heartbeat{
    type = ?MAV_TYPE_QUADROTOR,
    autopilot = ?MAV_AUTOPILOT_PX4,
    base_mode = ?MAV_MODE_FLAG_SAFETY_ARMED,
    custom_mode = 0,
    system_status = ?MAV_STATE_ACTIVE,
    mavlink_version = 3
}.
```

### Encode to binary

```erlang
%% Encode message to binary
Binary = mavlink_encoder:encode_heartbeat(Heartbeat).
```

### Decode from binary

```erlang
%% Decode binary to message record
{ok, heartbeat, Msg} = mavlink_decoder:decode(Binary).
```

## Supported Messages

### Common Dialect (232 messages)

- HEARTBEAT - System heartbeat
- SYS_STATUS - System status
- ATTITUDE - Vehicle attitude
- GPS_RAW_INT - GPS data
- GLOBAL_POSITION_INT - Global position
- COMMAND_LONG - Send command
- ... and 226 more

### ArduPilot Dialect (73 messages)

- SENSOR_OFFSETS
- MEMINFO
- AP_ADC
- ... and 70 more

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
│   ├── mavlink_common.hrl        # Common dialect records
│   └── mavlink_ardupilotmega.hrl # ArduPilot dialect records
├── src/
│   ├── mavlink.erl               # API and utilities
│   ├── mavlink_encoder.erl       # Encode messages to binary
│   ├── mavlink_decoder.erl       # Decode binary to messages
│   ├── mavlink_app.erl           # Application module
│   └── mavlink_sup.erl           # Supervisor
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
