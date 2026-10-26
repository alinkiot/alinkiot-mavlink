-module(mavlink).
-include("mavlink_minimal.hrl").
-include("mavlink_standard.hrl").
-include("mavlink_common.hrl").

%% API
-export([version/0]).

%% @doc Get MAVLink version
-spec version() -> {Major::integer(), Minor::integer(), Patch::integer()}.
version() -> {2, 0, 0}.
