# alinkiot-mavlink

MAVLink protocol library for Erlang/OTP 24+.

This library provides Erlang record definitions and encode/decode functions for MAVLink messages, generated from official MAVLink XML definitions.

## Features

- ✅ Compatible with Erlang/OTP 24+
- ✅ Generated from official MAVLink XML definitions
- ✅ Supports MAVLink 2.0 protocol (including 16-bit message IDs)
- ✅ Full implementation: 308 messages, 959 enum constants
- ✅ Includes Minimal, Standard, Common, and ArduPilot dialects
- ✅ Type-safe record definitions
- ✅ Complete encode/decode functions for ALL messages

## Installation

Add to your `rebar.config`:

```erlang
{deps, [
    {mavlink, {git, "https://github.com/alinkiot/alinkiot-mavlink.git", {tag, "1.0.0"}}}
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
