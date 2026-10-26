-module(mavlink_common_codec).
-include("mavlink_common.hrl").

%% API
-export([
    encode_sys_status/1,
    decode_sys_status/1,
    encode_system_time/1,
    decode_system_time/1,
    encode_ping/1,
    decode_ping/1,
    encode_change_operator_control/1,
    decode_change_operator_control/1,
    encode_change_operator_control_ack/1,
    decode_change_operator_control_ack/1,
    encode_auth_key/1,
    decode_auth_key/1,
    encode_link_node_status/1,
    decode_link_node_status/1,
    encode_set_mode/1,
    decode_set_mode/1,
    encode_param_request_read/1,
    decode_param_request_read/1,
    encode_param_request_list/1,
    decode_param_request_list/1,
    encode_param_value/1,
    decode_param_value/1,
    encode_param_set/1,
    decode_param_set/1,
    encode_gps_raw_int/1,
    decode_gps_raw_int/1,
    encode_gps_status/1,
    decode_gps_status/1,
    encode_scaled_imu/1,
    decode_scaled_imu/1,
    encode_raw_imu/1,
    decode_raw_imu/1,
    encode_raw_pressure/1,
    decode_raw_pressure/1,
    encode_scaled_pressure/1,
    decode_scaled_pressure/1,
    encode_attitude/1,
    decode_attitude/1,
    encode_attitude_quaternion/1,
    decode_attitude_quaternion/1,
    encode_local_position_ned/1,
    decode_local_position_ned/1,
    encode_rc_channels_scaled/1,
    decode_rc_channels_scaled/1,
    encode_rc_channels_raw/1,
    decode_rc_channels_raw/1,
    encode_servo_output_raw/1,
    decode_servo_output_raw/1,
    encode_mission_request_partial_list/1,
    decode_mission_request_partial_list/1,
    encode_mission_write_partial_list/1,
    decode_mission_write_partial_list/1,
    encode_mission_item/1,
    decode_mission_item/1,
    encode_mission_request/1,
    decode_mission_request/1,
    encode_mission_set_current/1,
    decode_mission_set_current/1,
    encode_mission_current/1,
    decode_mission_current/1,
    encode_mission_request_list/1,
    decode_mission_request_list/1,
    encode_mission_count/1,
    decode_mission_count/1,
    encode_mission_clear_all/1,
    decode_mission_clear_all/1,
    encode_mission_item_reached/1,
    decode_mission_item_reached/1,
    encode_mission_ack/1,
    decode_mission_ack/1,
    encode_set_gps_global_origin/1,
    decode_set_gps_global_origin/1,
    encode_gps_global_origin/1,
    decode_gps_global_origin/1,
    encode_param_map_rc/1,
    decode_param_map_rc/1,
    encode_mission_request_int/1,
    decode_mission_request_int/1,
    encode_safety_set_allowed_area/1,
    decode_safety_set_allowed_area/1,
    encode_safety_allowed_area/1,
    decode_safety_allowed_area/1,
    encode_attitude_quaternion_cov/1,
    decode_attitude_quaternion_cov/1,
    encode_nav_controller_output/1,
    decode_nav_controller_output/1,
    encode_global_position_int_cov/1,
    decode_global_position_int_cov/1,
    encode_local_position_ned_cov/1,
    decode_local_position_ned_cov/1,
    encode_rc_channels/1,
    decode_rc_channels/1,
    encode_request_data_stream/1,
    decode_request_data_stream/1,
    encode_data_stream/1,
    decode_data_stream/1,
    encode_manual_control/1,
    decode_manual_control/1,
    encode_rc_channels_override/1,
    decode_rc_channels_override/1,
    encode_mission_item_int/1,
    decode_mission_item_int/1,
    encode_vfr_hud/1,
    decode_vfr_hud/1,
    encode_command_int/1,
    decode_command_int/1,
    encode_command_long/1,
    decode_command_long/1,
    encode_command_ack/1,
    decode_command_ack/1,
    encode_command_cancel/1,
    decode_command_cancel/1,
    encode_manual_setpoint/1,
    decode_manual_setpoint/1,
    encode_set_attitude_target/1,
    decode_set_attitude_target/1,
    encode_attitude_target/1,
    decode_attitude_target/1,
    encode_set_position_target_local_ned/1,
    decode_set_position_target_local_ned/1,
    encode_position_target_local_ned/1,
    decode_position_target_local_ned/1,
    encode_set_position_target_global_int/1,
    decode_set_position_target_global_int/1,
    encode_position_target_global_int/1,
    decode_position_target_global_int/1,
    encode_local_position_ned_system_global_offset/1,
    decode_local_position_ned_system_global_offset/1,
    encode_hil_state/1,
    decode_hil_state/1,
    encode_hil_controls/1,
    decode_hil_controls/1,
    encode_hil_rc_inputs_raw/1,
    decode_hil_rc_inputs_raw/1,
    encode_hil_actuator_controls/1,
    decode_hil_actuator_controls/1,
    encode_optical_flow/1,
    decode_optical_flow/1,
    encode_global_vision_position_estimate/1,
    decode_global_vision_position_estimate/1,
    encode_vision_position_estimate/1,
    decode_vision_position_estimate/1,
    encode_vision_speed_estimate/1,
    decode_vision_speed_estimate/1,
    encode_vicon_position_estimate/1,
    decode_vicon_position_estimate/1,
    encode_highres_imu/1,
    decode_highres_imu/1,
    encode_optical_flow_rad/1,
    decode_optical_flow_rad/1,
    encode_hil_sensor/1,
    decode_hil_sensor/1,
    encode_sim_state/1,
    decode_sim_state/1,
    encode_radio_status/1,
    decode_radio_status/1,
    encode_file_transfer_protocol/1,
    decode_file_transfer_protocol/1,
    encode_timesync/1,
    decode_timesync/1,
    encode_camera_trigger/1,
    decode_camera_trigger/1,
    encode_hil_gps/1,
    decode_hil_gps/1,
    encode_hil_optical_flow/1,
    decode_hil_optical_flow/1,
    encode_hil_state_quaternion/1,
    decode_hil_state_quaternion/1,
    encode_scaled_imu2/1,
    decode_scaled_imu2/1,
    encode_log_request_list/1,
    decode_log_request_list/1,
    encode_log_entry/1,
    decode_log_entry/1,
    encode_log_request_data/1,
    decode_log_request_data/1,
    encode_log_data/1,
    decode_log_data/1,
    encode_log_erase/1,
    decode_log_erase/1,
    encode_log_request_end/1,
    decode_log_request_end/1,
    encode_gps_inject_data/1,
    decode_gps_inject_data/1,
    encode_gps2_raw/1,
    decode_gps2_raw/1,
    encode_power_status/1,
    decode_power_status/1,
    encode_serial_control/1,
    decode_serial_control/1,
    encode_gps_rtk/1,
    decode_gps_rtk/1,
    encode_gps2_rtk/1,
    decode_gps2_rtk/1,
    encode_scaled_imu3/1,
    decode_scaled_imu3/1,
    encode_data_transmission_handshake/1,
    decode_data_transmission_handshake/1,
    encode_encapsulated_data/1,
    decode_encapsulated_data/1,
    encode_distance_sensor/1,
    decode_distance_sensor/1,
    encode_terrain_request/1,
    decode_terrain_request/1,
    encode_terrain_data/1,
    decode_terrain_data/1,
    encode_terrain_check/1,
    decode_terrain_check/1,
    encode_terrain_report/1,
    decode_terrain_report/1,
    encode_scaled_pressure2/1,
    decode_scaled_pressure2/1,
    encode_att_pos_mocap/1,
    decode_att_pos_mocap/1,
    encode_set_actuator_control_target/1,
    decode_set_actuator_control_target/1,
    encode_actuator_control_target/1,
    decode_actuator_control_target/1,
    encode_altitude/1,
    decode_altitude/1,
    encode_resource_request/1,
    decode_resource_request/1,
    encode_scaled_pressure3/1,
    decode_scaled_pressure3/1,
    encode_follow_target/1,
    decode_follow_target/1,
    encode_control_system_state/1,
    decode_control_system_state/1,
    encode_battery_status/1,
    decode_battery_status/1,
    encode_landing_target/1,
    decode_landing_target/1,
    encode_fence_status/1,
    decode_fence_status/1,
    encode_mag_cal_report/1,
    decode_mag_cal_report/1,
    encode_efi_status/1,
    decode_efi_status/1,
    encode_estimator_status/1,
    decode_estimator_status/1,
    encode_wind_cov/1,
    decode_wind_cov/1,
    encode_gps_input/1,
    decode_gps_input/1,
    encode_gps_rtcm_data/1,
    decode_gps_rtcm_data/1,
    encode_high_latency/1,
    decode_high_latency/1,
    encode_high_latency2/1,
    decode_high_latency2/1,
    encode_vibration/1,
    decode_vibration/1,
    encode_home_position/1,
    decode_home_position/1,
    encode_set_home_position/1,
    decode_set_home_position/1,
    encode_message_interval/1,
    decode_message_interval/1,
    encode_extended_sys_state/1,
    decode_extended_sys_state/1,
    encode_adsb_vehicle/1,
    decode_adsb_vehicle/1,
    encode_collision/1,
    decode_collision/1,
    encode_v2_extension/1,
    decode_v2_extension/1,
    encode_memory_vect/1,
    decode_memory_vect/1,
    encode_debug_vect/1,
    decode_debug_vect/1,
    encode_named_value_float/1,
    decode_named_value_float/1,
    encode_named_value_int/1,
    decode_named_value_int/1,
    encode_statustext/1,
    decode_statustext/1,
    encode_debug/1,
    decode_debug/1,
    encode_setup_signing/1,
    decode_setup_signing/1,
    encode_button_change/1,
    decode_button_change/1,
    encode_play_tune/1,
    decode_play_tune/1,
    encode_camera_information/1,
    decode_camera_information/1,
    encode_camera_settings/1,
    decode_camera_settings/1,
    encode_storage_information/1,
    decode_storage_information/1,
    encode_camera_capture_status/1,
    decode_camera_capture_status/1,
    encode_camera_image_captured/1,
    decode_camera_image_captured/1,
    encode_flight_information/1,
    decode_flight_information/1,
    encode_mount_orientation/1,
    decode_mount_orientation/1,
    encode_logging_data/1,
    decode_logging_data/1,
    encode_logging_data_acked/1,
    decode_logging_data_acked/1,
    encode_logging_ack/1,
    decode_logging_ack/1,
    encode_video_stream_information/1,
    decode_video_stream_information/1,
    encode_video_stream_status/1,
    decode_video_stream_status/1,
    encode_camera_fov_status/1,
    decode_camera_fov_status/1,
    encode_camera_tracking_image_status/1,
    decode_camera_tracking_image_status/1,
    encode_camera_tracking_geo_status/1,
    decode_camera_tracking_geo_status/1,
    encode_camera_thermal_range/1,
    decode_camera_thermal_range/1,
    encode_gimbal_manager_information/1,
    decode_gimbal_manager_information/1,
    encode_gimbal_manager_status/1,
    decode_gimbal_manager_status/1,
    encode_gimbal_manager_set_attitude/1,
    decode_gimbal_manager_set_attitude/1,
    encode_gimbal_device_information/1,
    decode_gimbal_device_information/1,
    encode_gimbal_device_set_attitude/1,
    decode_gimbal_device_set_attitude/1,
    encode_gimbal_device_attitude_status/1,
    decode_gimbal_device_attitude_status/1,
    encode_autopilot_state_for_gimbal_device/1,
    decode_autopilot_state_for_gimbal_device/1,
    encode_gimbal_manager_set_pitchyaw/1,
    decode_gimbal_manager_set_pitchyaw/1,
    encode_gimbal_manager_set_manual_control/1,
    decode_gimbal_manager_set_manual_control/1,
    encode_esc_info/1,
    decode_esc_info/1,
    encode_esc_status/1,
    decode_esc_status/1,
    encode_airspeed/1,
    decode_airspeed/1,
    encode_global_position_sensor/1,
    decode_global_position_sensor/1,
    encode_wifi_config_ap/1,
    decode_wifi_config_ap/1,
    encode_protocol_version/1,
    decode_protocol_version/1,
    encode_ais_vessel/1,
    decode_ais_vessel/1,
    encode_uavcan_node_status/1,
    decode_uavcan_node_status/1,
    encode_uavcan_node_info/1,
    decode_uavcan_node_info/1,
    encode_param_ext_request_read/1,
    decode_param_ext_request_read/1,
    encode_param_ext_request_list/1,
    decode_param_ext_request_list/1,
    encode_param_ext_value/1,
    decode_param_ext_value/1,
    encode_param_ext_set/1,
    decode_param_ext_set/1,
    encode_param_ext_ack/1,
    decode_param_ext_ack/1,
    encode_obstacle_distance/1,
    decode_obstacle_distance/1,
    encode_odometry/1,
    decode_odometry/1,
    encode_trajectory_representation_waypoints/1,
    decode_trajectory_representation_waypoints/1,
    encode_trajectory_representation_bezier/1,
    decode_trajectory_representation_bezier/1,
    encode_cellular_status/1,
    decode_cellular_status/1,
    encode_isbd_link_status/1,
    decode_isbd_link_status/1,
    encode_cellular_config/1,
    decode_cellular_config/1,
    encode_raw_rpm/1,
    decode_raw_rpm/1,
    encode_utm_global_position/1,
    decode_utm_global_position/1,
    encode_param_error/1,
    decode_param_error/1,
    encode_debug_float_array/1,
    decode_debug_float_array/1,
    encode_orbit_execution_status/1,
    decode_orbit_execution_status/1,
    encode_smart_battery_info/1,
    decode_smart_battery_info/1,
    encode_figure_eight_execution_status/1,
    decode_figure_eight_execution_status/1,
    encode_fuel_status/1,
    decode_fuel_status/1,
    encode_battery_info/1,
    decode_battery_info/1,
    encode_generator_status/1,
    decode_generator_status/1,
    encode_actuator_output_status/1,
    decode_actuator_output_status/1,
    encode_relay_status/1,
    decode_relay_status/1,
    encode_time_estimate_to_target/1,
    decode_time_estimate_to_target/1,
    encode_tunnel/1,
    decode_tunnel/1,
    encode_can_frame/1,
    decode_can_frame/1,
    encode_canfd_frame/1,
    decode_canfd_frame/1,
    encode_can_filter_modify/1,
    decode_can_filter_modify/1,
    encode_onboard_computer_status/1,
    decode_onboard_computer_status/1,
    encode_component_information/1,
    decode_component_information/1,
    encode_component_information_basic/1,
    decode_component_information_basic/1,
    encode_component_metadata/1,
    decode_component_metadata/1,
    encode_play_tune_v2/1,
    decode_play_tune_v2/1,
    encode_supported_tunes/1,
    decode_supported_tunes/1,
    encode_event/1,
    decode_event/1,
    encode_current_event_sequence/1,
    decode_current_event_sequence/1,
    encode_request_event/1,
    decode_request_event/1,
    encode_response_event_error/1,
    decode_response_event_error/1,
    encode_radio_rc_channels/1,
    decode_radio_rc_channels/1,
    encode_available_modes/1,
    decode_available_modes/1,
    encode_current_mode/1,
    decode_current_mode/1,
    encode_available_modes_monitor/1,
    decode_available_modes_monitor/1,
    encode_illuminator_status/1,
    decode_illuminator_status/1,
    encode_wheel_distance/1,
    decode_wheel_distance/1,
    encode_winch_status/1,
    decode_winch_status/1,
    encode_open_drone_id_basic_id/1,
    decode_open_drone_id_basic_id/1,
    encode_open_drone_id_location/1,
    decode_open_drone_id_location/1,
    encode_open_drone_id_authentication/1,
    decode_open_drone_id_authentication/1,
    encode_open_drone_id_self_id/1,
    decode_open_drone_id_self_id/1,
    encode_open_drone_id_system/1,
    decode_open_drone_id_system/1,
    encode_open_drone_id_operator_id/1,
    decode_open_drone_id_operator_id/1,
    encode_open_drone_id_message_pack/1,
    decode_open_drone_id_message_pack/1,
    encode_open_drone_id_arm_status/1,
    decode_open_drone_id_arm_status/1,
    encode_open_drone_id_system_update/1,
    decode_open_drone_id_system_update/1,
    encode_hygrometer_sensor/1,
    decode_hygrometer_sensor/1
]).

%% @doc Encode SYS_STATUS message to binary
-spec encode_sys_status(#sys_status{}) -> binary().
encode_sys_status(#sys_status{
    onboard_control_sensors_present = OnboardControlSensorsPresent,
    onboard_control_sensors_enabled = OnboardControlSensorsEnabled,
    onboard_control_sensors_health = OnboardControlSensorsHealth,
    load = Load,
    voltage_battery = VoltageBattery,
    current_battery = CurrentBattery,
    battery_remaining = BatteryRemaining,
    drop_rate_comm = DropRateComm,
    errors_comm = ErrorsComm,
    errors_count1 = ErrorsCount1,
    errors_count2 = ErrorsCount2,
    errors_count3 = ErrorsCount3,
    errors_count4 = ErrorsCount4,
    onboard_control_sensors_present_extended = OnboardControlSensorsPresentExtended,
    onboard_control_sensors_enabled_extended = OnboardControlSensorsEnabledExtended,
    onboard_control_sensors_health_extended = OnboardControlSensorsHealthExtended
}) ->
    <<?SYS_STATUS_ID:8,
      OnboardControlSensorsPresent:32/little-unsigned-integer,
      OnboardControlSensorsEnabled:32/little-unsigned-integer,
      OnboardControlSensorsHealth:32/little-unsigned-integer,
      Load:16/little-unsigned-integer,
      VoltageBattery:16/little-unsigned-integer,
      CurrentBattery:16/little-signed-integer,
      BatteryRemaining:8/little-signed-integer,
      DropRateComm:16/little-unsigned-integer,
      ErrorsComm:16/little-unsigned-integer,
      ErrorsCount1:16/little-unsigned-integer,
      ErrorsCount2:16/little-unsigned-integer,
      ErrorsCount3:16/little-unsigned-integer,
      ErrorsCount4:16/little-unsigned-integer,
      OnboardControlSensorsPresentExtended:32/little-unsigned-integer,
      OnboardControlSensorsEnabledExtended:32/little-unsigned-integer,
      OnboardControlSensorsHealthExtended:32/little-unsigned-integer>>.

%% @doc Decode SYS_STATUS message from binary
-spec decode_sys_status(binary()) -> #sys_status{}.
decode_sys_status(<<?SYS_STATUS_ID:8,
                   OnboardControlSensorsPresent:32/little-unsigned-integer,
                   OnboardControlSensorsEnabled:32/little-unsigned-integer,
                   OnboardControlSensorsHealth:32/little-unsigned-integer,
                   Load:16/little-unsigned-integer,
                   VoltageBattery:16/little-unsigned-integer,
                   CurrentBattery:16/little-signed-integer,
                   BatteryRemaining:8/little-signed-integer,
                   DropRateComm:16/little-unsigned-integer,
                   ErrorsComm:16/little-unsigned-integer,
                   ErrorsCount1:16/little-unsigned-integer,
                   ErrorsCount2:16/little-unsigned-integer,
                   ErrorsCount3:16/little-unsigned-integer,
                   ErrorsCount4:16/little-unsigned-integer,
                   OnboardControlSensorsPresentExtended:32/little-unsigned-integer,
                   OnboardControlSensorsEnabledExtended:32/little-unsigned-integer,
                   OnboardControlSensorsHealthExtended:32/little-unsigned-integer>>) ->
    #sys_status{
        onboard_control_sensors_present = OnboardControlSensorsPresent,
        onboard_control_sensors_enabled = OnboardControlSensorsEnabled,
        onboard_control_sensors_health = OnboardControlSensorsHealth,
        load = Load,
        voltage_battery = VoltageBattery,
        current_battery = CurrentBattery,
        battery_remaining = BatteryRemaining,
        drop_rate_comm = DropRateComm,
        errors_comm = ErrorsComm,
        errors_count1 = ErrorsCount1,
        errors_count2 = ErrorsCount2,
        errors_count3 = ErrorsCount3,
        errors_count4 = ErrorsCount4,
        onboard_control_sensors_present_extended = OnboardControlSensorsPresentExtended,
        onboard_control_sensors_enabled_extended = OnboardControlSensorsEnabledExtended,
        onboard_control_sensors_health_extended = OnboardControlSensorsHealthExtended
    }.

%% @doc Encode SYSTEM_TIME message to binary
-spec encode_system_time(#system_time{}) -> binary().
encode_system_time(#system_time{
    time_unix_usec = TimeUnixUsec,
    time_boot_ms = TimeBootMs
}) ->
    <<?SYSTEM_TIME_ID:8,
      TimeUnixUsec:64/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer>>.

%% @doc Decode SYSTEM_TIME message from binary
-spec decode_system_time(binary()) -> #system_time{}.
decode_system_time(<<?SYSTEM_TIME_ID:8,
                   TimeUnixUsec:64/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer>>) ->
    #system_time{
        time_unix_usec = TimeUnixUsec,
        time_boot_ms = TimeBootMs
    }.

%% @doc Encode PING message to binary
-spec encode_ping(#ping{}) -> binary().
encode_ping(#ping{
    time_usec = TimeUsec,
    seq = Seq,
    target_system = TargetSystem,
    target_component = TargetComponent
}) ->
    <<?PING_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Seq:32/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer>>.

%% @doc Decode PING message from binary
-spec decode_ping(binary()) -> #ping{}.
decode_ping(<<?PING_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Seq:32/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer>>) ->
    #ping{
        time_usec = TimeUsec,
        seq = Seq,
        target_system = TargetSystem,
        target_component = TargetComponent
    }.

%% @doc Encode CHANGE_OPERATOR_CONTROL message to binary
-spec encode_change_operator_control(#change_operator_control{}) -> binary().
encode_change_operator_control(#change_operator_control{
    target_system = TargetSystem,
    control_request = ControlRequest,
    version = Version,
    passkey = Passkey
}) ->
    <<?CHANGE_OPERATOR_CONTROL_ID:8,
      TargetSystem:8/little-unsigned-integer,
      ControlRequest:8/little-unsigned-integer,
      Version:8/little-unsigned-integer,
      Passkey:8/little-binary>>.

%% @doc Decode CHANGE_OPERATOR_CONTROL message from binary
-spec decode_change_operator_control(binary()) -> #change_operator_control{}.
decode_change_operator_control(<<?CHANGE_OPERATOR_CONTROL_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   ControlRequest:8/little-unsigned-integer,
                   Version:8/little-unsigned-integer,
                   Passkey:8/little-binary>>) ->
    #change_operator_control{
        target_system = TargetSystem,
        control_request = ControlRequest,
        version = Version,
        passkey = Passkey
    }.

%% @doc Encode CHANGE_OPERATOR_CONTROL_ACK message to binary
-spec encode_change_operator_control_ack(#change_operator_control_ack{}) -> binary().
encode_change_operator_control_ack(#change_operator_control_ack{
    gcs_system_id = GcsSystemId,
    control_request = ControlRequest,
    ack = Ack
}) ->
    <<?CHANGE_OPERATOR_CONTROL_ACK_ID:8,
      GcsSystemId:8/little-unsigned-integer,
      ControlRequest:8/little-unsigned-integer,
      Ack:8/little-unsigned-integer>>.

%% @doc Decode CHANGE_OPERATOR_CONTROL_ACK message from binary
-spec decode_change_operator_control_ack(binary()) -> #change_operator_control_ack{}.
decode_change_operator_control_ack(<<?CHANGE_OPERATOR_CONTROL_ACK_ID:8,
                   GcsSystemId:8/little-unsigned-integer,
                   ControlRequest:8/little-unsigned-integer,
                   Ack:8/little-unsigned-integer>>) ->
    #change_operator_control_ack{
        gcs_system_id = GcsSystemId,
        control_request = ControlRequest,
        ack = Ack
    }.

%% @doc Encode AUTH_KEY message to binary
-spec encode_auth_key(#auth_key{}) -> binary().
encode_auth_key(#auth_key{
    key = Key
}) ->
    <<?AUTH_KEY_ID:8,
      Key:8/little-binary>>.

%% @doc Decode AUTH_KEY message from binary
-spec decode_auth_key(binary()) -> #auth_key{}.
decode_auth_key(<<?AUTH_KEY_ID:8,
                   Key:8/little-binary>>) ->
    #auth_key{
        key = Key
    }.

%% @doc Encode LINK_NODE_STATUS message to binary
-spec encode_link_node_status(#link_node_status{}) -> binary().
encode_link_node_status(#link_node_status{
    timestamp = Timestamp,
    tx_buf = TxBuf,
    rx_buf = RxBuf,
    tx_rate = TxRate,
    rx_rate = RxRate,
    rx_parse_err = RxParseErr,
    tx_overflows = TxOverflows,
    rx_overflows = RxOverflows,
    messages_sent = MessagesSent,
    messages_received = MessagesReceived,
    messages_lost = MessagesLost
}) ->
    <<?LINK_NODE_STATUS_ID:8,
      Timestamp:64/little-unsigned-integer,
      TxBuf:8/little-unsigned-integer,
      RxBuf:8/little-unsigned-integer,
      TxRate:32/little-unsigned-integer,
      RxRate:32/little-unsigned-integer,
      RxParseErr:16/little-unsigned-integer,
      TxOverflows:16/little-unsigned-integer,
      RxOverflows:16/little-unsigned-integer,
      MessagesSent:32/little-unsigned-integer,
      MessagesReceived:32/little-unsigned-integer,
      MessagesLost:32/little-unsigned-integer>>.

%% @doc Decode LINK_NODE_STATUS message from binary
-spec decode_link_node_status(binary()) -> #link_node_status{}.
decode_link_node_status(<<?LINK_NODE_STATUS_ID:8,
                   Timestamp:64/little-unsigned-integer,
                   TxBuf:8/little-unsigned-integer,
                   RxBuf:8/little-unsigned-integer,
                   TxRate:32/little-unsigned-integer,
                   RxRate:32/little-unsigned-integer,
                   RxParseErr:16/little-unsigned-integer,
                   TxOverflows:16/little-unsigned-integer,
                   RxOverflows:16/little-unsigned-integer,
                   MessagesSent:32/little-unsigned-integer,
                   MessagesReceived:32/little-unsigned-integer,
                   MessagesLost:32/little-unsigned-integer>>) ->
    #link_node_status{
        timestamp = Timestamp,
        tx_buf = TxBuf,
        rx_buf = RxBuf,
        tx_rate = TxRate,
        rx_rate = RxRate,
        rx_parse_err = RxParseErr,
        tx_overflows = TxOverflows,
        rx_overflows = RxOverflows,
        messages_sent = MessagesSent,
        messages_received = MessagesReceived,
        messages_lost = MessagesLost
    }.

%% @doc Encode SET_MODE message to binary
-spec encode_set_mode(#set_mode{}) -> binary().
encode_set_mode(#set_mode{
    target_system = TargetSystem,
    base_mode = BaseMode,
    custom_mode = CustomMode
}) ->
    <<?SET_MODE_ID:8,
      TargetSystem:8/little-unsigned-integer,
      BaseMode:8/little-unsigned-integer,
      CustomMode:32/little-unsigned-integer>>.

%% @doc Decode SET_MODE message from binary
-spec decode_set_mode(binary()) -> #set_mode{}.
decode_set_mode(<<?SET_MODE_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   BaseMode:8/little-unsigned-integer,
                   CustomMode:32/little-unsigned-integer>>) ->
    #set_mode{
        target_system = TargetSystem,
        base_mode = BaseMode,
        custom_mode = CustomMode
    }.

%% @doc Encode PARAM_REQUEST_READ message to binary
-spec encode_param_request_read(#param_request_read{}) -> binary().
encode_param_request_read(#param_request_read{
    target_system = TargetSystem,
    target_component = TargetComponent,
    param_id = ParamId,
    param_index = ParamIndex
}) ->
    <<?PARAM_REQUEST_READ_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      ParamId:8/little-binary,
      ParamIndex:16/little-signed-integer>>.

%% @doc Decode PARAM_REQUEST_READ message from binary
-spec decode_param_request_read(binary()) -> #param_request_read{}.
decode_param_request_read(<<?PARAM_REQUEST_READ_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   ParamId:8/little-binary,
                   ParamIndex:16/little-signed-integer>>) ->
    #param_request_read{
        target_system = TargetSystem,
        target_component = TargetComponent,
        param_id = ParamId,
        param_index = ParamIndex
    }.

%% @doc Encode PARAM_REQUEST_LIST message to binary
-spec encode_param_request_list(#param_request_list{}) -> binary().
encode_param_request_list(#param_request_list{
    target_system = TargetSystem,
    target_component = TargetComponent
}) ->
    <<?PARAM_REQUEST_LIST_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer>>.

%% @doc Decode PARAM_REQUEST_LIST message from binary
-spec decode_param_request_list(binary()) -> #param_request_list{}.
decode_param_request_list(<<?PARAM_REQUEST_LIST_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer>>) ->
    #param_request_list{
        target_system = TargetSystem,
        target_component = TargetComponent
    }.

%% @doc Encode PARAM_VALUE message to binary
-spec encode_param_value(#param_value{}) -> binary().
encode_param_value(#param_value{
    param_id = ParamId,
    param_value = ParamValue,
    param_type = ParamType,
    param_count = ParamCount,
    param_index = ParamIndex
}) ->
    <<?PARAM_VALUE_ID:8,
      ParamId:8/little-binary,
      ParamValue:32/little-float,
      ParamType:8/little-unsigned-integer,
      ParamCount:16/little-unsigned-integer,
      ParamIndex:16/little-unsigned-integer>>.

%% @doc Decode PARAM_VALUE message from binary
-spec decode_param_value(binary()) -> #param_value{}.
decode_param_value(<<?PARAM_VALUE_ID:8,
                   ParamId:8/little-binary,
                   ParamValue:32/little-float,
                   ParamType:8/little-unsigned-integer,
                   ParamCount:16/little-unsigned-integer,
                   ParamIndex:16/little-unsigned-integer>>) ->
    #param_value{
        param_id = ParamId,
        param_value = ParamValue,
        param_type = ParamType,
        param_count = ParamCount,
        param_index = ParamIndex
    }.

%% @doc Encode PARAM_SET message to binary
-spec encode_param_set(#param_set{}) -> binary().
encode_param_set(#param_set{
    target_system = TargetSystem,
    target_component = TargetComponent,
    param_id = ParamId,
    param_value = ParamValue,
    param_type = ParamType
}) ->
    <<?PARAM_SET_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      ParamId:8/little-binary,
      ParamValue:32/little-float,
      ParamType:8/little-unsigned-integer>>.

%% @doc Decode PARAM_SET message from binary
-spec decode_param_set(binary()) -> #param_set{}.
decode_param_set(<<?PARAM_SET_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   ParamId:8/little-binary,
                   ParamValue:32/little-float,
                   ParamType:8/little-unsigned-integer>>) ->
    #param_set{
        target_system = TargetSystem,
        target_component = TargetComponent,
        param_id = ParamId,
        param_value = ParamValue,
        param_type = ParamType
    }.

%% @doc Encode GPS_RAW_INT message to binary
-spec encode_gps_raw_int(#gps_raw_int{}) -> binary().
encode_gps_raw_int(#gps_raw_int{
    time_usec = TimeUsec,
    fix_type = FixType,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    eph = Eph,
    epv = Epv,
    vel = Vel,
    cog = Cog,
    satellites_visible = SatellitesVisible,
    alt_ellipsoid = AltEllipsoid,
    h_acc = HAcc,
    v_acc = VAcc,
    vel_acc = VelAcc,
    hdg_acc = HdgAcc,
    yaw = Yaw
}) ->
    <<?GPS_RAW_INT_ID:8,
      TimeUsec:64/little-unsigned-integer,
      FixType:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-signed-integer,
      Eph:16/little-unsigned-integer,
      Epv:16/little-unsigned-integer,
      Vel:16/little-unsigned-integer,
      Cog:16/little-unsigned-integer,
      SatellitesVisible:8/little-unsigned-integer,
      AltEllipsoid:32/little-signed-integer,
      HAcc:32/little-unsigned-integer,
      VAcc:32/little-unsigned-integer,
      VelAcc:32/little-unsigned-integer,
      HdgAcc:32/little-unsigned-integer,
      Yaw:16/little-unsigned-integer>>.

%% @doc Decode GPS_RAW_INT message from binary
-spec decode_gps_raw_int(binary()) -> #gps_raw_int{}.
decode_gps_raw_int(<<?GPS_RAW_INT_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   FixType:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-signed-integer,
                   Eph:16/little-unsigned-integer,
                   Epv:16/little-unsigned-integer,
                   Vel:16/little-unsigned-integer,
                   Cog:16/little-unsigned-integer,
                   SatellitesVisible:8/little-unsigned-integer,
                   AltEllipsoid:32/little-signed-integer,
                   HAcc:32/little-unsigned-integer,
                   VAcc:32/little-unsigned-integer,
                   VelAcc:32/little-unsigned-integer,
                   HdgAcc:32/little-unsigned-integer,
                   Yaw:16/little-unsigned-integer>>) ->
    #gps_raw_int{
        time_usec = TimeUsec,
        fix_type = FixType,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        eph = Eph,
        epv = Epv,
        vel = Vel,
        cog = Cog,
        satellites_visible = SatellitesVisible,
        alt_ellipsoid = AltEllipsoid,
        h_acc = HAcc,
        v_acc = VAcc,
        vel_acc = VelAcc,
        hdg_acc = HdgAcc,
        yaw = Yaw
    }.

%% @doc Encode GPS_STATUS message to binary
-spec encode_gps_status(#gps_status{}) -> binary().
encode_gps_status(#gps_status{
    satellites_visible = SatellitesVisible,
    satellite_prn = SatellitePrn,
    satellite_used = SatelliteUsed,
    satellite_elevation = SatelliteElevation,
    satellite_azimuth = SatelliteAzimuth,
    satellite_snr = SatelliteSnr
}) ->
    <<?GPS_STATUS_ID:8,
      SatellitesVisible:8/little-unsigned-integer,
      SatellitePrn:8/little-unsigned-integer,
      SatelliteUsed:8/little-unsigned-integer,
      SatelliteElevation:8/little-unsigned-integer,
      SatelliteAzimuth:8/little-unsigned-integer,
      SatelliteSnr:8/little-unsigned-integer>>.

%% @doc Decode GPS_STATUS message from binary
-spec decode_gps_status(binary()) -> #gps_status{}.
decode_gps_status(<<?GPS_STATUS_ID:8,
                   SatellitesVisible:8/little-unsigned-integer,
                   SatellitePrn:8/little-unsigned-integer,
                   SatelliteUsed:8/little-unsigned-integer,
                   SatelliteElevation:8/little-unsigned-integer,
                   SatelliteAzimuth:8/little-unsigned-integer,
                   SatelliteSnr:8/little-unsigned-integer>>) ->
    #gps_status{
        satellites_visible = SatellitesVisible,
        satellite_prn = SatellitePrn,
        satellite_used = SatelliteUsed,
        satellite_elevation = SatelliteElevation,
        satellite_azimuth = SatelliteAzimuth,
        satellite_snr = SatelliteSnr
    }.

%% @doc Encode SCALED_IMU message to binary
-spec encode_scaled_imu(#scaled_imu{}) -> binary().
encode_scaled_imu(#scaled_imu{
    time_boot_ms = TimeBootMs,
    xacc = Xacc,
    yacc = Yacc,
    zacc = Zacc,
    xgyro = Xgyro,
    ygyro = Ygyro,
    zgyro = Zgyro,
    xmag = Xmag,
    ymag = Ymag,
    zmag = Zmag,
    temperature = Temperature
}) ->
    <<?SCALED_IMU_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Xacc:16/little-signed-integer,
      Yacc:16/little-signed-integer,
      Zacc:16/little-signed-integer,
      Xgyro:16/little-signed-integer,
      Ygyro:16/little-signed-integer,
      Zgyro:16/little-signed-integer,
      Xmag:16/little-signed-integer,
      Ymag:16/little-signed-integer,
      Zmag:16/little-signed-integer,
      Temperature:16/little-signed-integer>>.

%% @doc Decode SCALED_IMU message from binary
-spec decode_scaled_imu(binary()) -> #scaled_imu{}.
decode_scaled_imu(<<?SCALED_IMU_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Xacc:16/little-signed-integer,
                   Yacc:16/little-signed-integer,
                   Zacc:16/little-signed-integer,
                   Xgyro:16/little-signed-integer,
                   Ygyro:16/little-signed-integer,
                   Zgyro:16/little-signed-integer,
                   Xmag:16/little-signed-integer,
                   Ymag:16/little-signed-integer,
                   Zmag:16/little-signed-integer,
                   Temperature:16/little-signed-integer>>) ->
    #scaled_imu{
        time_boot_ms = TimeBootMs,
        xacc = Xacc,
        yacc = Yacc,
        zacc = Zacc,
        xgyro = Xgyro,
        ygyro = Ygyro,
        zgyro = Zgyro,
        xmag = Xmag,
        ymag = Ymag,
        zmag = Zmag,
        temperature = Temperature
    }.

%% @doc Encode RAW_IMU message to binary
-spec encode_raw_imu(#raw_imu{}) -> binary().
encode_raw_imu(#raw_imu{
    time_usec = TimeUsec,
    xacc = Xacc,
    yacc = Yacc,
    zacc = Zacc,
    xgyro = Xgyro,
    ygyro = Ygyro,
    zgyro = Zgyro,
    xmag = Xmag,
    ymag = Ymag,
    zmag = Zmag,
    id = Id,
    temperature = Temperature
}) ->
    <<?RAW_IMU_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Xacc:16/little-signed-integer,
      Yacc:16/little-signed-integer,
      Zacc:16/little-signed-integer,
      Xgyro:16/little-signed-integer,
      Ygyro:16/little-signed-integer,
      Zgyro:16/little-signed-integer,
      Xmag:16/little-signed-integer,
      Ymag:16/little-signed-integer,
      Zmag:16/little-signed-integer,
      Id:8/little-unsigned-integer,
      Temperature:16/little-signed-integer>>.

%% @doc Decode RAW_IMU message from binary
-spec decode_raw_imu(binary()) -> #raw_imu{}.
decode_raw_imu(<<?RAW_IMU_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Xacc:16/little-signed-integer,
                   Yacc:16/little-signed-integer,
                   Zacc:16/little-signed-integer,
                   Xgyro:16/little-signed-integer,
                   Ygyro:16/little-signed-integer,
                   Zgyro:16/little-signed-integer,
                   Xmag:16/little-signed-integer,
                   Ymag:16/little-signed-integer,
                   Zmag:16/little-signed-integer,
                   Id:8/little-unsigned-integer,
                   Temperature:16/little-signed-integer>>) ->
    #raw_imu{
        time_usec = TimeUsec,
        xacc = Xacc,
        yacc = Yacc,
        zacc = Zacc,
        xgyro = Xgyro,
        ygyro = Ygyro,
        zgyro = Zgyro,
        xmag = Xmag,
        ymag = Ymag,
        zmag = Zmag,
        id = Id,
        temperature = Temperature
    }.

%% @doc Encode RAW_PRESSURE message to binary
-spec encode_raw_pressure(#raw_pressure{}) -> binary().
encode_raw_pressure(#raw_pressure{
    time_usec = TimeUsec,
    press_abs = PressAbs,
    press_diff1 = PressDiff1,
    press_diff2 = PressDiff2,
    temperature = Temperature
}) ->
    <<?RAW_PRESSURE_ID:8,
      TimeUsec:64/little-unsigned-integer,
      PressAbs:16/little-signed-integer,
      PressDiff1:16/little-signed-integer,
      PressDiff2:16/little-signed-integer,
      Temperature:16/little-signed-integer>>.

%% @doc Decode RAW_PRESSURE message from binary
-spec decode_raw_pressure(binary()) -> #raw_pressure{}.
decode_raw_pressure(<<?RAW_PRESSURE_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   PressAbs:16/little-signed-integer,
                   PressDiff1:16/little-signed-integer,
                   PressDiff2:16/little-signed-integer,
                   Temperature:16/little-signed-integer>>) ->
    #raw_pressure{
        time_usec = TimeUsec,
        press_abs = PressAbs,
        press_diff1 = PressDiff1,
        press_diff2 = PressDiff2,
        temperature = Temperature
    }.

%% @doc Encode SCALED_PRESSURE message to binary
-spec encode_scaled_pressure(#scaled_pressure{}) -> binary().
encode_scaled_pressure(#scaled_pressure{
    time_boot_ms = TimeBootMs,
    press_abs = PressAbs,
    press_diff = PressDiff,
    temperature = Temperature,
    temperature_press_diff = TemperaturePressDiff
}) ->
    <<?SCALED_PRESSURE_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      PressAbs:32/little-float,
      PressDiff:32/little-float,
      Temperature:16/little-signed-integer,
      TemperaturePressDiff:16/little-signed-integer>>.

%% @doc Decode SCALED_PRESSURE message from binary
-spec decode_scaled_pressure(binary()) -> #scaled_pressure{}.
decode_scaled_pressure(<<?SCALED_PRESSURE_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   PressAbs:32/little-float,
                   PressDiff:32/little-float,
                   Temperature:16/little-signed-integer,
                   TemperaturePressDiff:16/little-signed-integer>>) ->
    #scaled_pressure{
        time_boot_ms = TimeBootMs,
        press_abs = PressAbs,
        press_diff = PressDiff,
        temperature = Temperature,
        temperature_press_diff = TemperaturePressDiff
    }.

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

%% @doc Decode ATTITUDE message from binary
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

%% @doc Encode ATTITUDE_QUATERNION message to binary
-spec encode_attitude_quaternion(#attitude_quaternion{}) -> binary().
encode_attitude_quaternion(#attitude_quaternion{
    time_boot_ms = TimeBootMs,
    q1 = Q1,
    q2 = Q2,
    q3 = Q3,
    q4 = Q4,
    rollspeed = Rollspeed,
    pitchspeed = Pitchspeed,
    yawspeed = Yawspeed,
    repr_offset_q = ReprOffsetQ
}) ->
    <<?ATTITUDE_QUATERNION_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Q1:32/little-float,
      Q2:32/little-float,
      Q3:32/little-float,
      Q4:32/little-float,
      Rollspeed:32/little-float,
      Pitchspeed:32/little-float,
      Yawspeed:32/little-float,
      ReprOffsetQ:32/little-float>>.

%% @doc Decode ATTITUDE_QUATERNION message from binary
-spec decode_attitude_quaternion(binary()) -> #attitude_quaternion{}.
decode_attitude_quaternion(<<?ATTITUDE_QUATERNION_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Q1:32/little-float,
                   Q2:32/little-float,
                   Q3:32/little-float,
                   Q4:32/little-float,
                   Rollspeed:32/little-float,
                   Pitchspeed:32/little-float,
                   Yawspeed:32/little-float,
                   ReprOffsetQ:32/little-float>>) ->
    #attitude_quaternion{
        time_boot_ms = TimeBootMs,
        q1 = Q1,
        q2 = Q2,
        q3 = Q3,
        q4 = Q4,
        rollspeed = Rollspeed,
        pitchspeed = Pitchspeed,
        yawspeed = Yawspeed,
        repr_offset_q = ReprOffsetQ
    }.

%% @doc Encode LOCAL_POSITION_NED message to binary
-spec encode_local_position_ned(#local_position_ned{}) -> binary().
encode_local_position_ned(#local_position_ned{
    time_boot_ms = TimeBootMs,
    x = X,
    y = Y,
    z = Z,
    vx = Vx,
    vy = Vy,
    vz = Vz
}) ->
    <<?LOCAL_POSITION_NED_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Vx:32/little-float,
      Vy:32/little-float,
      Vz:32/little-float>>.

%% @doc Decode LOCAL_POSITION_NED message from binary
-spec decode_local_position_ned(binary()) -> #local_position_ned{}.
decode_local_position_ned(<<?LOCAL_POSITION_NED_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Vx:32/little-float,
                   Vy:32/little-float,
                   Vz:32/little-float>>) ->
    #local_position_ned{
        time_boot_ms = TimeBootMs,
        x = X,
        y = Y,
        z = Z,
        vx = Vx,
        vy = Vy,
        vz = Vz
    }.

%% @doc Encode RC_CHANNELS_SCALED message to binary
-spec encode_rc_channels_scaled(#rc_channels_scaled{}) -> binary().
encode_rc_channels_scaled(#rc_channels_scaled{
    time_boot_ms = TimeBootMs,
    port = Port,
    chan1_scaled = Chan1Scaled,
    chan2_scaled = Chan2Scaled,
    chan3_scaled = Chan3Scaled,
    chan4_scaled = Chan4Scaled,
    chan5_scaled = Chan5Scaled,
    chan6_scaled = Chan6Scaled,
    chan7_scaled = Chan7Scaled,
    chan8_scaled = Chan8Scaled,
    rssi = Rssi
}) ->
    <<?RC_CHANNELS_SCALED_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Port:8/little-unsigned-integer,
      Chan1Scaled:16/little-signed-integer,
      Chan2Scaled:16/little-signed-integer,
      Chan3Scaled:16/little-signed-integer,
      Chan4Scaled:16/little-signed-integer,
      Chan5Scaled:16/little-signed-integer,
      Chan6Scaled:16/little-signed-integer,
      Chan7Scaled:16/little-signed-integer,
      Chan8Scaled:16/little-signed-integer,
      Rssi:8/little-unsigned-integer>>.

%% @doc Decode RC_CHANNELS_SCALED message from binary
-spec decode_rc_channels_scaled(binary()) -> #rc_channels_scaled{}.
decode_rc_channels_scaled(<<?RC_CHANNELS_SCALED_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Port:8/little-unsigned-integer,
                   Chan1Scaled:16/little-signed-integer,
                   Chan2Scaled:16/little-signed-integer,
                   Chan3Scaled:16/little-signed-integer,
                   Chan4Scaled:16/little-signed-integer,
                   Chan5Scaled:16/little-signed-integer,
                   Chan6Scaled:16/little-signed-integer,
                   Chan7Scaled:16/little-signed-integer,
                   Chan8Scaled:16/little-signed-integer,
                   Rssi:8/little-unsigned-integer>>) ->
    #rc_channels_scaled{
        time_boot_ms = TimeBootMs,
        port = Port,
        chan1_scaled = Chan1Scaled,
        chan2_scaled = Chan2Scaled,
        chan3_scaled = Chan3Scaled,
        chan4_scaled = Chan4Scaled,
        chan5_scaled = Chan5Scaled,
        chan6_scaled = Chan6Scaled,
        chan7_scaled = Chan7Scaled,
        chan8_scaled = Chan8Scaled,
        rssi = Rssi
    }.

%% @doc Encode RC_CHANNELS_RAW message to binary
-spec encode_rc_channels_raw(#rc_channels_raw{}) -> binary().
encode_rc_channels_raw(#rc_channels_raw{
    time_boot_ms = TimeBootMs,
    port = Port,
    chan1_raw = Chan1Raw,
    chan2_raw = Chan2Raw,
    chan3_raw = Chan3Raw,
    chan4_raw = Chan4Raw,
    chan5_raw = Chan5Raw,
    chan6_raw = Chan6Raw,
    chan7_raw = Chan7Raw,
    chan8_raw = Chan8Raw,
    rssi = Rssi
}) ->
    <<?RC_CHANNELS_RAW_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Port:8/little-unsigned-integer,
      Chan1Raw:16/little-unsigned-integer,
      Chan2Raw:16/little-unsigned-integer,
      Chan3Raw:16/little-unsigned-integer,
      Chan4Raw:16/little-unsigned-integer,
      Chan5Raw:16/little-unsigned-integer,
      Chan6Raw:16/little-unsigned-integer,
      Chan7Raw:16/little-unsigned-integer,
      Chan8Raw:16/little-unsigned-integer,
      Rssi:8/little-unsigned-integer>>.

%% @doc Decode RC_CHANNELS_RAW message from binary
-spec decode_rc_channels_raw(binary()) -> #rc_channels_raw{}.
decode_rc_channels_raw(<<?RC_CHANNELS_RAW_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Port:8/little-unsigned-integer,
                   Chan1Raw:16/little-unsigned-integer,
                   Chan2Raw:16/little-unsigned-integer,
                   Chan3Raw:16/little-unsigned-integer,
                   Chan4Raw:16/little-unsigned-integer,
                   Chan5Raw:16/little-unsigned-integer,
                   Chan6Raw:16/little-unsigned-integer,
                   Chan7Raw:16/little-unsigned-integer,
                   Chan8Raw:16/little-unsigned-integer,
                   Rssi:8/little-unsigned-integer>>) ->
    #rc_channels_raw{
        time_boot_ms = TimeBootMs,
        port = Port,
        chan1_raw = Chan1Raw,
        chan2_raw = Chan2Raw,
        chan3_raw = Chan3Raw,
        chan4_raw = Chan4Raw,
        chan5_raw = Chan5Raw,
        chan6_raw = Chan6Raw,
        chan7_raw = Chan7Raw,
        chan8_raw = Chan8Raw,
        rssi = Rssi
    }.

%% @doc Encode SERVO_OUTPUT_RAW message to binary
-spec encode_servo_output_raw(#servo_output_raw{}) -> binary().
encode_servo_output_raw(#servo_output_raw{
    time_usec = TimeUsec,
    port = Port,
    servo1_raw = Servo1Raw,
    servo2_raw = Servo2Raw,
    servo3_raw = Servo3Raw,
    servo4_raw = Servo4Raw,
    servo5_raw = Servo5Raw,
    servo6_raw = Servo6Raw,
    servo7_raw = Servo7Raw,
    servo8_raw = Servo8Raw,
    servo9_raw = Servo9Raw,
    servo10_raw = Servo10Raw,
    servo11_raw = Servo11Raw,
    servo12_raw = Servo12Raw,
    servo13_raw = Servo13Raw,
    servo14_raw = Servo14Raw,
    servo15_raw = Servo15Raw,
    servo16_raw = Servo16Raw
}) ->
    <<?SERVO_OUTPUT_RAW_ID:8,
      TimeUsec:32/little-unsigned-integer,
      Port:8/little-unsigned-integer,
      Servo1Raw:16/little-unsigned-integer,
      Servo2Raw:16/little-unsigned-integer,
      Servo3Raw:16/little-unsigned-integer,
      Servo4Raw:16/little-unsigned-integer,
      Servo5Raw:16/little-unsigned-integer,
      Servo6Raw:16/little-unsigned-integer,
      Servo7Raw:16/little-unsigned-integer,
      Servo8Raw:16/little-unsigned-integer,
      Servo9Raw:16/little-unsigned-integer,
      Servo10Raw:16/little-unsigned-integer,
      Servo11Raw:16/little-unsigned-integer,
      Servo12Raw:16/little-unsigned-integer,
      Servo13Raw:16/little-unsigned-integer,
      Servo14Raw:16/little-unsigned-integer,
      Servo15Raw:16/little-unsigned-integer,
      Servo16Raw:16/little-unsigned-integer>>.

%% @doc Decode SERVO_OUTPUT_RAW message from binary
-spec decode_servo_output_raw(binary()) -> #servo_output_raw{}.
decode_servo_output_raw(<<?SERVO_OUTPUT_RAW_ID:8,
                   TimeUsec:32/little-unsigned-integer,
                   Port:8/little-unsigned-integer,
                   Servo1Raw:16/little-unsigned-integer,
                   Servo2Raw:16/little-unsigned-integer,
                   Servo3Raw:16/little-unsigned-integer,
                   Servo4Raw:16/little-unsigned-integer,
                   Servo5Raw:16/little-unsigned-integer,
                   Servo6Raw:16/little-unsigned-integer,
                   Servo7Raw:16/little-unsigned-integer,
                   Servo8Raw:16/little-unsigned-integer,
                   Servo9Raw:16/little-unsigned-integer,
                   Servo10Raw:16/little-unsigned-integer,
                   Servo11Raw:16/little-unsigned-integer,
                   Servo12Raw:16/little-unsigned-integer,
                   Servo13Raw:16/little-unsigned-integer,
                   Servo14Raw:16/little-unsigned-integer,
                   Servo15Raw:16/little-unsigned-integer,
                   Servo16Raw:16/little-unsigned-integer>>) ->
    #servo_output_raw{
        time_usec = TimeUsec,
        port = Port,
        servo1_raw = Servo1Raw,
        servo2_raw = Servo2Raw,
        servo3_raw = Servo3Raw,
        servo4_raw = Servo4Raw,
        servo5_raw = Servo5Raw,
        servo6_raw = Servo6Raw,
        servo7_raw = Servo7Raw,
        servo8_raw = Servo8Raw,
        servo9_raw = Servo9Raw,
        servo10_raw = Servo10Raw,
        servo11_raw = Servo11Raw,
        servo12_raw = Servo12Raw,
        servo13_raw = Servo13Raw,
        servo14_raw = Servo14Raw,
        servo15_raw = Servo15Raw,
        servo16_raw = Servo16Raw
    }.

%% @doc Encode MISSION_REQUEST_PARTIAL_LIST message to binary
-spec encode_mission_request_partial_list(#mission_request_partial_list{}) -> binary().
encode_mission_request_partial_list(#mission_request_partial_list{
    target_system = TargetSystem,
    target_component = TargetComponent,
    start_index = StartIndex,
    end_index = EndIndex,
    mission_type = MissionType
}) ->
    <<?MISSION_REQUEST_PARTIAL_LIST_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      StartIndex:16/little-signed-integer,
      EndIndex:16/little-signed-integer,
      MissionType:8/little-unsigned-integer>>.

%% @doc Decode MISSION_REQUEST_PARTIAL_LIST message from binary
-spec decode_mission_request_partial_list(binary()) -> #mission_request_partial_list{}.
decode_mission_request_partial_list(<<?MISSION_REQUEST_PARTIAL_LIST_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   StartIndex:16/little-signed-integer,
                   EndIndex:16/little-signed-integer,
                   MissionType:8/little-unsigned-integer>>) ->
    #mission_request_partial_list{
        target_system = TargetSystem,
        target_component = TargetComponent,
        start_index = StartIndex,
        end_index = EndIndex,
        mission_type = MissionType
    }.

%% @doc Encode MISSION_WRITE_PARTIAL_LIST message to binary
-spec encode_mission_write_partial_list(#mission_write_partial_list{}) -> binary().
encode_mission_write_partial_list(#mission_write_partial_list{
    target_system = TargetSystem,
    target_component = TargetComponent,
    start_index = StartIndex,
    end_index = EndIndex,
    mission_type = MissionType
}) ->
    <<?MISSION_WRITE_PARTIAL_LIST_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      StartIndex:16/little-signed-integer,
      EndIndex:16/little-signed-integer,
      MissionType:8/little-unsigned-integer>>.

%% @doc Decode MISSION_WRITE_PARTIAL_LIST message from binary
-spec decode_mission_write_partial_list(binary()) -> #mission_write_partial_list{}.
decode_mission_write_partial_list(<<?MISSION_WRITE_PARTIAL_LIST_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   StartIndex:16/little-signed-integer,
                   EndIndex:16/little-signed-integer,
                   MissionType:8/little-unsigned-integer>>) ->
    #mission_write_partial_list{
        target_system = TargetSystem,
        target_component = TargetComponent,
        start_index = StartIndex,
        end_index = EndIndex,
        mission_type = MissionType
    }.

%% @doc Encode MISSION_ITEM message to binary
-spec encode_mission_item(#mission_item{}) -> binary().
encode_mission_item(#mission_item{
    target_system = TargetSystem,
    target_component = TargetComponent,
    seq = Seq,
    frame = Frame,
    command = Command,
    current = Current,
    autocontinue = Autocontinue,
    param1 = Param1,
    param2 = Param2,
    param3 = Param3,
    param4 = Param4,
    x = X,
    y = Y,
    z = Z,
    mission_type = MissionType
}) ->
    <<?MISSION_ITEM_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Seq:16/little-unsigned-integer,
      Frame:8/little-unsigned-integer,
      Command:16/little-unsigned-integer,
      Current:8/little-unsigned-integer,
      Autocontinue:8/little-unsigned-integer,
      Param1:32/little-float,
      Param2:32/little-float,
      Param3:32/little-float,
      Param4:32/little-float,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      MissionType:8/little-unsigned-integer>>.

%% @doc Decode MISSION_ITEM message from binary
-spec decode_mission_item(binary()) -> #mission_item{}.
decode_mission_item(<<?MISSION_ITEM_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Seq:16/little-unsigned-integer,
                   Frame:8/little-unsigned-integer,
                   Command:16/little-unsigned-integer,
                   Current:8/little-unsigned-integer,
                   Autocontinue:8/little-unsigned-integer,
                   Param1:32/little-float,
                   Param2:32/little-float,
                   Param3:32/little-float,
                   Param4:32/little-float,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   MissionType:8/little-unsigned-integer>>) ->
    #mission_item{
        target_system = TargetSystem,
        target_component = TargetComponent,
        seq = Seq,
        frame = Frame,
        command = Command,
        current = Current,
        autocontinue = Autocontinue,
        param1 = Param1,
        param2 = Param2,
        param3 = Param3,
        param4 = Param4,
        x = X,
        y = Y,
        z = Z,
        mission_type = MissionType
    }.

%% @doc Encode MISSION_REQUEST message to binary
-spec encode_mission_request(#mission_request{}) -> binary().
encode_mission_request(#mission_request{
    target_system = TargetSystem,
    target_component = TargetComponent,
    seq = Seq,
    mission_type = MissionType
}) ->
    <<?MISSION_REQUEST_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Seq:16/little-unsigned-integer,
      MissionType:8/little-unsigned-integer>>.

%% @doc Decode MISSION_REQUEST message from binary
-spec decode_mission_request(binary()) -> #mission_request{}.
decode_mission_request(<<?MISSION_REQUEST_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Seq:16/little-unsigned-integer,
                   MissionType:8/little-unsigned-integer>>) ->
    #mission_request{
        target_system = TargetSystem,
        target_component = TargetComponent,
        seq = Seq,
        mission_type = MissionType
    }.

%% @doc Encode MISSION_SET_CURRENT message to binary
-spec encode_mission_set_current(#mission_set_current{}) -> binary().
encode_mission_set_current(#mission_set_current{
    target_system = TargetSystem,
    target_component = TargetComponent,
    seq = Seq
}) ->
    <<?MISSION_SET_CURRENT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Seq:16/little-unsigned-integer>>.

%% @doc Decode MISSION_SET_CURRENT message from binary
-spec decode_mission_set_current(binary()) -> #mission_set_current{}.
decode_mission_set_current(<<?MISSION_SET_CURRENT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Seq:16/little-unsigned-integer>>) ->
    #mission_set_current{
        target_system = TargetSystem,
        target_component = TargetComponent,
        seq = Seq
    }.

%% @doc Encode MISSION_CURRENT message to binary
-spec encode_mission_current(#mission_current{}) -> binary().
encode_mission_current(#mission_current{
    seq = Seq,
    total = Total,
    mission_state = MissionState,
    mission_mode = MissionMode,
    mission_id = MissionId,
    fence_id = FenceId,
    rally_points_id = RallyPointsId
}) ->
    <<?MISSION_CURRENT_ID:8,
      Seq:16/little-unsigned-integer,
      Total:16/little-unsigned-integer,
      MissionState:8/little-unsigned-integer,
      MissionMode:8/little-unsigned-integer,
      MissionId:32/little-unsigned-integer,
      FenceId:32/little-unsigned-integer,
      RallyPointsId:32/little-unsigned-integer>>.

%% @doc Decode MISSION_CURRENT message from binary
-spec decode_mission_current(binary()) -> #mission_current{}.
decode_mission_current(<<?MISSION_CURRENT_ID:8,
                   Seq:16/little-unsigned-integer,
                   Total:16/little-unsigned-integer,
                   MissionState:8/little-unsigned-integer,
                   MissionMode:8/little-unsigned-integer,
                   MissionId:32/little-unsigned-integer,
                   FenceId:32/little-unsigned-integer,
                   RallyPointsId:32/little-unsigned-integer>>) ->
    #mission_current{
        seq = Seq,
        total = Total,
        mission_state = MissionState,
        mission_mode = MissionMode,
        mission_id = MissionId,
        fence_id = FenceId,
        rally_points_id = RallyPointsId
    }.

%% @doc Encode MISSION_REQUEST_LIST message to binary
-spec encode_mission_request_list(#mission_request_list{}) -> binary().
encode_mission_request_list(#mission_request_list{
    target_system = TargetSystem,
    target_component = TargetComponent,
    mission_type = MissionType
}) ->
    <<?MISSION_REQUEST_LIST_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      MissionType:8/little-unsigned-integer>>.

%% @doc Decode MISSION_REQUEST_LIST message from binary
-spec decode_mission_request_list(binary()) -> #mission_request_list{}.
decode_mission_request_list(<<?MISSION_REQUEST_LIST_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   MissionType:8/little-unsigned-integer>>) ->
    #mission_request_list{
        target_system = TargetSystem,
        target_component = TargetComponent,
        mission_type = MissionType
    }.

%% @doc Encode MISSION_COUNT message to binary
-spec encode_mission_count(#mission_count{}) -> binary().
encode_mission_count(#mission_count{
    target_system = TargetSystem,
    target_component = TargetComponent,
    count = Count,
    mission_type = MissionType,
    opaque_id = OpaqueId
}) ->
    <<?MISSION_COUNT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Count:16/little-unsigned-integer,
      MissionType:8/little-unsigned-integer,
      OpaqueId:32/little-unsigned-integer>>.

%% @doc Decode MISSION_COUNT message from binary
-spec decode_mission_count(binary()) -> #mission_count{}.
decode_mission_count(<<?MISSION_COUNT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Count:16/little-unsigned-integer,
                   MissionType:8/little-unsigned-integer,
                   OpaqueId:32/little-unsigned-integer>>) ->
    #mission_count{
        target_system = TargetSystem,
        target_component = TargetComponent,
        count = Count,
        mission_type = MissionType,
        opaque_id = OpaqueId
    }.

%% @doc Encode MISSION_CLEAR_ALL message to binary
-spec encode_mission_clear_all(#mission_clear_all{}) -> binary().
encode_mission_clear_all(#mission_clear_all{
    target_system = TargetSystem,
    target_component = TargetComponent,
    mission_type = MissionType
}) ->
    <<?MISSION_CLEAR_ALL_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      MissionType:8/little-unsigned-integer>>.

%% @doc Decode MISSION_CLEAR_ALL message from binary
-spec decode_mission_clear_all(binary()) -> #mission_clear_all{}.
decode_mission_clear_all(<<?MISSION_CLEAR_ALL_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   MissionType:8/little-unsigned-integer>>) ->
    #mission_clear_all{
        target_system = TargetSystem,
        target_component = TargetComponent,
        mission_type = MissionType
    }.

%% @doc Encode MISSION_ITEM_REACHED message to binary
-spec encode_mission_item_reached(#mission_item_reached{}) -> binary().
encode_mission_item_reached(#mission_item_reached{
    seq = Seq
}) ->
    <<?MISSION_ITEM_REACHED_ID:8,
      Seq:16/little-unsigned-integer>>.

%% @doc Decode MISSION_ITEM_REACHED message from binary
-spec decode_mission_item_reached(binary()) -> #mission_item_reached{}.
decode_mission_item_reached(<<?MISSION_ITEM_REACHED_ID:8,
                   Seq:16/little-unsigned-integer>>) ->
    #mission_item_reached{
        seq = Seq
    }.

%% @doc Encode MISSION_ACK message to binary
-spec encode_mission_ack(#mission_ack{}) -> binary().
encode_mission_ack(#mission_ack{
    target_system = TargetSystem,
    target_component = TargetComponent,
    type = Type,
    mission_type = MissionType,
    opaque_id = OpaqueId
}) ->
    <<?MISSION_ACK_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      MissionType:8/little-unsigned-integer,
      OpaqueId:32/little-unsigned-integer>>.

%% @doc Decode MISSION_ACK message from binary
-spec decode_mission_ack(binary()) -> #mission_ack{}.
decode_mission_ack(<<?MISSION_ACK_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   MissionType:8/little-unsigned-integer,
                   OpaqueId:32/little-unsigned-integer>>) ->
    #mission_ack{
        target_system = TargetSystem,
        target_component = TargetComponent,
        type = Type,
        mission_type = MissionType,
        opaque_id = OpaqueId
    }.

%% @doc Encode SET_GPS_GLOBAL_ORIGIN message to binary
-spec encode_set_gps_global_origin(#set_gps_global_origin{}) -> binary().
encode_set_gps_global_origin(#set_gps_global_origin{
    target_system = TargetSystem,
    latitude = Latitude,
    longitude = Longitude,
    altitude = Altitude,
    time_usec = TimeUsec
}) ->
    <<?SET_GPS_GLOBAL_ORIGIN_ID:8,
      TargetSystem:8/little-unsigned-integer,
      Latitude:32/little-signed-integer,
      Longitude:32/little-signed-integer,
      Altitude:32/little-signed-integer,
      TimeUsec:64/little-unsigned-integer>>.

%% @doc Decode SET_GPS_GLOBAL_ORIGIN message from binary
-spec decode_set_gps_global_origin(binary()) -> #set_gps_global_origin{}.
decode_set_gps_global_origin(<<?SET_GPS_GLOBAL_ORIGIN_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   Latitude:32/little-signed-integer,
                   Longitude:32/little-signed-integer,
                   Altitude:32/little-signed-integer,
                   TimeUsec:64/little-unsigned-integer>>) ->
    #set_gps_global_origin{
        target_system = TargetSystem,
        latitude = Latitude,
        longitude = Longitude,
        altitude = Altitude,
        time_usec = TimeUsec
    }.

%% @doc Encode GPS_GLOBAL_ORIGIN message to binary
-spec encode_gps_global_origin(#gps_global_origin{}) -> binary().
encode_gps_global_origin(#gps_global_origin{
    latitude = Latitude,
    longitude = Longitude,
    altitude = Altitude,
    time_usec = TimeUsec
}) ->
    <<?GPS_GLOBAL_ORIGIN_ID:8,
      Latitude:32/little-signed-integer,
      Longitude:32/little-signed-integer,
      Altitude:32/little-signed-integer,
      TimeUsec:64/little-unsigned-integer>>.

%% @doc Decode GPS_GLOBAL_ORIGIN message from binary
-spec decode_gps_global_origin(binary()) -> #gps_global_origin{}.
decode_gps_global_origin(<<?GPS_GLOBAL_ORIGIN_ID:8,
                   Latitude:32/little-signed-integer,
                   Longitude:32/little-signed-integer,
                   Altitude:32/little-signed-integer,
                   TimeUsec:64/little-unsigned-integer>>) ->
    #gps_global_origin{
        latitude = Latitude,
        longitude = Longitude,
        altitude = Altitude,
        time_usec = TimeUsec
    }.

%% @doc Encode PARAM_MAP_RC message to binary
-spec encode_param_map_rc(#param_map_rc{}) -> binary().
encode_param_map_rc(#param_map_rc{
    target_system = TargetSystem,
    target_component = TargetComponent,
    param_id = ParamId,
    param_index = ParamIndex,
    parameter_rc_channel_index = ParameterRcChannelIndex,
    param_value0 = ParamValue0,
    scale = Scale,
    param_value_min = ParamValueMin,
    param_value_max = ParamValueMax
}) ->
    <<?PARAM_MAP_RC_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      ParamId:8/little-binary,
      ParamIndex:16/little-signed-integer,
      ParameterRcChannelIndex:8/little-unsigned-integer,
      ParamValue0:32/little-float,
      Scale:32/little-float,
      ParamValueMin:32/little-float,
      ParamValueMax:32/little-float>>.

%% @doc Decode PARAM_MAP_RC message from binary
-spec decode_param_map_rc(binary()) -> #param_map_rc{}.
decode_param_map_rc(<<?PARAM_MAP_RC_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   ParamId:8/little-binary,
                   ParamIndex:16/little-signed-integer,
                   ParameterRcChannelIndex:8/little-unsigned-integer,
                   ParamValue0:32/little-float,
                   Scale:32/little-float,
                   ParamValueMin:32/little-float,
                   ParamValueMax:32/little-float>>) ->
    #param_map_rc{
        target_system = TargetSystem,
        target_component = TargetComponent,
        param_id = ParamId,
        param_index = ParamIndex,
        parameter_rc_channel_index = ParameterRcChannelIndex,
        param_value0 = ParamValue0,
        scale = Scale,
        param_value_min = ParamValueMin,
        param_value_max = ParamValueMax
    }.

%% @doc Encode MISSION_REQUEST_INT message to binary
-spec encode_mission_request_int(#mission_request_int{}) -> binary().
encode_mission_request_int(#mission_request_int{
    target_system = TargetSystem,
    target_component = TargetComponent,
    seq = Seq,
    mission_type = MissionType
}) ->
    <<?MISSION_REQUEST_INT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Seq:16/little-unsigned-integer,
      MissionType:8/little-unsigned-integer>>.

%% @doc Decode MISSION_REQUEST_INT message from binary
-spec decode_mission_request_int(binary()) -> #mission_request_int{}.
decode_mission_request_int(<<?MISSION_REQUEST_INT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Seq:16/little-unsigned-integer,
                   MissionType:8/little-unsigned-integer>>) ->
    #mission_request_int{
        target_system = TargetSystem,
        target_component = TargetComponent,
        seq = Seq,
        mission_type = MissionType
    }.

%% @doc Encode SAFETY_SET_ALLOWED_AREA message to binary
-spec encode_safety_set_allowed_area(#safety_set_allowed_area{}) -> binary().
encode_safety_set_allowed_area(#safety_set_allowed_area{
    target_system = TargetSystem,
    target_component = TargetComponent,
    frame = Frame,
    p1x = P1x,
    p1y = P1y,
    p1z = P1z,
    p2x = P2x,
    p2y = P2y,
    p2z = P2z
}) ->
    <<?SAFETY_SET_ALLOWED_AREA_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Frame:8/little-unsigned-integer,
      P1x:32/little-float,
      P1y:32/little-float,
      P1z:32/little-float,
      P2x:32/little-float,
      P2y:32/little-float,
      P2z:32/little-float>>.

%% @doc Decode SAFETY_SET_ALLOWED_AREA message from binary
-spec decode_safety_set_allowed_area(binary()) -> #safety_set_allowed_area{}.
decode_safety_set_allowed_area(<<?SAFETY_SET_ALLOWED_AREA_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Frame:8/little-unsigned-integer,
                   P1x:32/little-float,
                   P1y:32/little-float,
                   P1z:32/little-float,
                   P2x:32/little-float,
                   P2y:32/little-float,
                   P2z:32/little-float>>) ->
    #safety_set_allowed_area{
        target_system = TargetSystem,
        target_component = TargetComponent,
        frame = Frame,
        p1x = P1x,
        p1y = P1y,
        p1z = P1z,
        p2x = P2x,
        p2y = P2y,
        p2z = P2z
    }.

%% @doc Encode SAFETY_ALLOWED_AREA message to binary
-spec encode_safety_allowed_area(#safety_allowed_area{}) -> binary().
encode_safety_allowed_area(#safety_allowed_area{
    frame = Frame,
    p1x = P1x,
    p1y = P1y,
    p1z = P1z,
    p2x = P2x,
    p2y = P2y,
    p2z = P2z
}) ->
    <<?SAFETY_ALLOWED_AREA_ID:8,
      Frame:8/little-unsigned-integer,
      P1x:32/little-float,
      P1y:32/little-float,
      P1z:32/little-float,
      P2x:32/little-float,
      P2y:32/little-float,
      P2z:32/little-float>>.

%% @doc Decode SAFETY_ALLOWED_AREA message from binary
-spec decode_safety_allowed_area(binary()) -> #safety_allowed_area{}.
decode_safety_allowed_area(<<?SAFETY_ALLOWED_AREA_ID:8,
                   Frame:8/little-unsigned-integer,
                   P1x:32/little-float,
                   P1y:32/little-float,
                   P1z:32/little-float,
                   P2x:32/little-float,
                   P2y:32/little-float,
                   P2z:32/little-float>>) ->
    #safety_allowed_area{
        frame = Frame,
        p1x = P1x,
        p1y = P1y,
        p1z = P1z,
        p2x = P2x,
        p2y = P2y,
        p2z = P2z
    }.

%% @doc Encode ATTITUDE_QUATERNION_COV message to binary
-spec encode_attitude_quaternion_cov(#attitude_quaternion_cov{}) -> binary().
encode_attitude_quaternion_cov(#attitude_quaternion_cov{
    time_usec = TimeUsec,
    q = Q,
    rollspeed = Rollspeed,
    pitchspeed = Pitchspeed,
    yawspeed = Yawspeed,
    covariance = Covariance
}) ->
    <<?ATTITUDE_QUATERNION_COV_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Q:32/little-float,
      Rollspeed:32/little-float,
      Pitchspeed:32/little-float,
      Yawspeed:32/little-float,
      Covariance:32/little-float>>.

%% @doc Decode ATTITUDE_QUATERNION_COV message from binary
-spec decode_attitude_quaternion_cov(binary()) -> #attitude_quaternion_cov{}.
decode_attitude_quaternion_cov(<<?ATTITUDE_QUATERNION_COV_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Q:32/little-float,
                   Rollspeed:32/little-float,
                   Pitchspeed:32/little-float,
                   Yawspeed:32/little-float,
                   Covariance:32/little-float>>) ->
    #attitude_quaternion_cov{
        time_usec = TimeUsec,
        q = Q,
        rollspeed = Rollspeed,
        pitchspeed = Pitchspeed,
        yawspeed = Yawspeed,
        covariance = Covariance
    }.

%% @doc Encode NAV_CONTROLLER_OUTPUT message to binary
-spec encode_nav_controller_output(#nav_controller_output{}) -> binary().
encode_nav_controller_output(#nav_controller_output{
    nav_roll = NavRoll,
    nav_pitch = NavPitch,
    nav_bearing = NavBearing,
    target_bearing = TargetBearing,
    wp_dist = WpDist,
    alt_error = AltError,
    aspd_error = AspdError,
    xtrack_error = XtrackError
}) ->
    <<?NAV_CONTROLLER_OUTPUT_ID:8,
      NavRoll:32/little-float,
      NavPitch:32/little-float,
      NavBearing:16/little-signed-integer,
      TargetBearing:16/little-signed-integer,
      WpDist:16/little-unsigned-integer,
      AltError:32/little-float,
      AspdError:32/little-float,
      XtrackError:32/little-float>>.

%% @doc Decode NAV_CONTROLLER_OUTPUT message from binary
-spec decode_nav_controller_output(binary()) -> #nav_controller_output{}.
decode_nav_controller_output(<<?NAV_CONTROLLER_OUTPUT_ID:8,
                   NavRoll:32/little-float,
                   NavPitch:32/little-float,
                   NavBearing:16/little-signed-integer,
                   TargetBearing:16/little-signed-integer,
                   WpDist:16/little-unsigned-integer,
                   AltError:32/little-float,
                   AspdError:32/little-float,
                   XtrackError:32/little-float>>) ->
    #nav_controller_output{
        nav_roll = NavRoll,
        nav_pitch = NavPitch,
        nav_bearing = NavBearing,
        target_bearing = TargetBearing,
        wp_dist = WpDist,
        alt_error = AltError,
        aspd_error = AspdError,
        xtrack_error = XtrackError
    }.

%% @doc Encode GLOBAL_POSITION_INT_COV message to binary
-spec encode_global_position_int_cov(#global_position_int_cov{}) -> binary().
encode_global_position_int_cov(#global_position_int_cov{
    time_usec = TimeUsec,
    estimator_type = EstimatorType,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    relative_alt = RelativeAlt,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    covariance = Covariance
}) ->
    <<?GLOBAL_POSITION_INT_COV_ID:8,
      TimeUsec:64/little-unsigned-integer,
      EstimatorType:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-signed-integer,
      RelativeAlt:32/little-signed-integer,
      Vx:32/little-float,
      Vy:32/little-float,
      Vz:32/little-float,
      Covariance:32/little-float>>.

%% @doc Decode GLOBAL_POSITION_INT_COV message from binary
-spec decode_global_position_int_cov(binary()) -> #global_position_int_cov{}.
decode_global_position_int_cov(<<?GLOBAL_POSITION_INT_COV_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   EstimatorType:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-signed-integer,
                   RelativeAlt:32/little-signed-integer,
                   Vx:32/little-float,
                   Vy:32/little-float,
                   Vz:32/little-float,
                   Covariance:32/little-float>>) ->
    #global_position_int_cov{
        time_usec = TimeUsec,
        estimator_type = EstimatorType,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        relative_alt = RelativeAlt,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        covariance = Covariance
    }.

%% @doc Encode LOCAL_POSITION_NED_COV message to binary
-spec encode_local_position_ned_cov(#local_position_ned_cov{}) -> binary().
encode_local_position_ned_cov(#local_position_ned_cov{
    time_usec = TimeUsec,
    estimator_type = EstimatorType,
    x = X,
    y = Y,
    z = Z,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    ax = Ax,
    ay = Ay,
    az = Az,
    covariance = Covariance
}) ->
    <<?LOCAL_POSITION_NED_COV_ID:8,
      TimeUsec:64/little-unsigned-integer,
      EstimatorType:8/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Vx:32/little-float,
      Vy:32/little-float,
      Vz:32/little-float,
      Ax:32/little-float,
      Ay:32/little-float,
      Az:32/little-float,
      Covariance:32/little-float>>.

%% @doc Decode LOCAL_POSITION_NED_COV message from binary
-spec decode_local_position_ned_cov(binary()) -> #local_position_ned_cov{}.
decode_local_position_ned_cov(<<?LOCAL_POSITION_NED_COV_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   EstimatorType:8/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Vx:32/little-float,
                   Vy:32/little-float,
                   Vz:32/little-float,
                   Ax:32/little-float,
                   Ay:32/little-float,
                   Az:32/little-float,
                   Covariance:32/little-float>>) ->
    #local_position_ned_cov{
        time_usec = TimeUsec,
        estimator_type = EstimatorType,
        x = X,
        y = Y,
        z = Z,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        ax = Ax,
        ay = Ay,
        az = Az,
        covariance = Covariance
    }.

%% @doc Encode RC_CHANNELS message to binary
-spec encode_rc_channels(#rc_channels{}) -> binary().
encode_rc_channels(#rc_channels{
    time_boot_ms = TimeBootMs,
    chancount = Chancount,
    chan1_raw = Chan1Raw,
    chan2_raw = Chan2Raw,
    chan3_raw = Chan3Raw,
    chan4_raw = Chan4Raw,
    chan5_raw = Chan5Raw,
    chan6_raw = Chan6Raw,
    chan7_raw = Chan7Raw,
    chan8_raw = Chan8Raw,
    chan9_raw = Chan9Raw,
    chan10_raw = Chan10Raw,
    chan11_raw = Chan11Raw,
    chan12_raw = Chan12Raw,
    chan13_raw = Chan13Raw,
    chan14_raw = Chan14Raw,
    chan15_raw = Chan15Raw,
    chan16_raw = Chan16Raw,
    chan17_raw = Chan17Raw,
    chan18_raw = Chan18Raw,
    rssi = Rssi
}) ->
    <<?RC_CHANNELS_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Chancount:8/little-unsigned-integer,
      Chan1Raw:16/little-unsigned-integer,
      Chan2Raw:16/little-unsigned-integer,
      Chan3Raw:16/little-unsigned-integer,
      Chan4Raw:16/little-unsigned-integer,
      Chan5Raw:16/little-unsigned-integer,
      Chan6Raw:16/little-unsigned-integer,
      Chan7Raw:16/little-unsigned-integer,
      Chan8Raw:16/little-unsigned-integer,
      Chan9Raw:16/little-unsigned-integer,
      Chan10Raw:16/little-unsigned-integer,
      Chan11Raw:16/little-unsigned-integer,
      Chan12Raw:16/little-unsigned-integer,
      Chan13Raw:16/little-unsigned-integer,
      Chan14Raw:16/little-unsigned-integer,
      Chan15Raw:16/little-unsigned-integer,
      Chan16Raw:16/little-unsigned-integer,
      Chan17Raw:16/little-unsigned-integer,
      Chan18Raw:16/little-unsigned-integer,
      Rssi:8/little-unsigned-integer>>.

%% @doc Decode RC_CHANNELS message from binary
-spec decode_rc_channels(binary()) -> #rc_channels{}.
decode_rc_channels(<<?RC_CHANNELS_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Chancount:8/little-unsigned-integer,
                   Chan1Raw:16/little-unsigned-integer,
                   Chan2Raw:16/little-unsigned-integer,
                   Chan3Raw:16/little-unsigned-integer,
                   Chan4Raw:16/little-unsigned-integer,
                   Chan5Raw:16/little-unsigned-integer,
                   Chan6Raw:16/little-unsigned-integer,
                   Chan7Raw:16/little-unsigned-integer,
                   Chan8Raw:16/little-unsigned-integer,
                   Chan9Raw:16/little-unsigned-integer,
                   Chan10Raw:16/little-unsigned-integer,
                   Chan11Raw:16/little-unsigned-integer,
                   Chan12Raw:16/little-unsigned-integer,
                   Chan13Raw:16/little-unsigned-integer,
                   Chan14Raw:16/little-unsigned-integer,
                   Chan15Raw:16/little-unsigned-integer,
                   Chan16Raw:16/little-unsigned-integer,
                   Chan17Raw:16/little-unsigned-integer,
                   Chan18Raw:16/little-unsigned-integer,
                   Rssi:8/little-unsigned-integer>>) ->
    #rc_channels{
        time_boot_ms = TimeBootMs,
        chancount = Chancount,
        chan1_raw = Chan1Raw,
        chan2_raw = Chan2Raw,
        chan3_raw = Chan3Raw,
        chan4_raw = Chan4Raw,
        chan5_raw = Chan5Raw,
        chan6_raw = Chan6Raw,
        chan7_raw = Chan7Raw,
        chan8_raw = Chan8Raw,
        chan9_raw = Chan9Raw,
        chan10_raw = Chan10Raw,
        chan11_raw = Chan11Raw,
        chan12_raw = Chan12Raw,
        chan13_raw = Chan13Raw,
        chan14_raw = Chan14Raw,
        chan15_raw = Chan15Raw,
        chan16_raw = Chan16Raw,
        chan17_raw = Chan17Raw,
        chan18_raw = Chan18Raw,
        rssi = Rssi
    }.

%% @doc Encode REQUEST_DATA_STREAM message to binary
-spec encode_request_data_stream(#request_data_stream{}) -> binary().
encode_request_data_stream(#request_data_stream{
    target_system = TargetSystem,
    target_component = TargetComponent,
    req_stream_id = ReqStreamId,
    req_message_rate = ReqMessageRate,
    start_stop = StartStop
}) ->
    <<?REQUEST_DATA_STREAM_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      ReqStreamId:8/little-unsigned-integer,
      ReqMessageRate:16/little-unsigned-integer,
      StartStop:8/little-unsigned-integer>>.

%% @doc Decode REQUEST_DATA_STREAM message from binary
-spec decode_request_data_stream(binary()) -> #request_data_stream{}.
decode_request_data_stream(<<?REQUEST_DATA_STREAM_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   ReqStreamId:8/little-unsigned-integer,
                   ReqMessageRate:16/little-unsigned-integer,
                   StartStop:8/little-unsigned-integer>>) ->
    #request_data_stream{
        target_system = TargetSystem,
        target_component = TargetComponent,
        req_stream_id = ReqStreamId,
        req_message_rate = ReqMessageRate,
        start_stop = StartStop
    }.

%% @doc Encode DATA_STREAM message to binary
-spec encode_data_stream(#data_stream{}) -> binary().
encode_data_stream(#data_stream{
    stream_id = StreamId,
    message_rate = MessageRate,
    on_off = OnOff
}) ->
    <<?DATA_STREAM_ID:8,
      StreamId:8/little-unsigned-integer,
      MessageRate:16/little-unsigned-integer,
      OnOff:8/little-unsigned-integer>>.

%% @doc Decode DATA_STREAM message from binary
-spec decode_data_stream(binary()) -> #data_stream{}.
decode_data_stream(<<?DATA_STREAM_ID:8,
                   StreamId:8/little-unsigned-integer,
                   MessageRate:16/little-unsigned-integer,
                   OnOff:8/little-unsigned-integer>>) ->
    #data_stream{
        stream_id = StreamId,
        message_rate = MessageRate,
        on_off = OnOff
    }.

%% @doc Encode MANUAL_CONTROL message to binary
-spec encode_manual_control(#manual_control{}) -> binary().
encode_manual_control(#manual_control{
    target = Target,
    x = X,
    y = Y,
    z = Z,
    r = R,
    buttons = Buttons,
    buttons2 = Buttons2,
    enabled_extensions = EnabledExtensions,
    s = S,
    t = T,
    aux1 = Aux1,
    aux2 = Aux2,
    aux3 = Aux3,
    aux4 = Aux4,
    aux5 = Aux5,
    aux6 = Aux6
}) ->
    <<?MANUAL_CONTROL_ID:8,
      Target:8/little-unsigned-integer,
      X:16/little-signed-integer,
      Y:16/little-signed-integer,
      Z:16/little-signed-integer,
      R:16/little-signed-integer,
      Buttons:16/little-unsigned-integer,
      Buttons2:16/little-unsigned-integer,
      EnabledExtensions:8/little-unsigned-integer,
      S:16/little-signed-integer,
      T:16/little-signed-integer,
      Aux1:16/little-signed-integer,
      Aux2:16/little-signed-integer,
      Aux3:16/little-signed-integer,
      Aux4:16/little-signed-integer,
      Aux5:16/little-signed-integer,
      Aux6:16/little-signed-integer>>.

%% @doc Decode MANUAL_CONTROL message from binary
-spec decode_manual_control(binary()) -> #manual_control{}.
decode_manual_control(<<?MANUAL_CONTROL_ID:8,
                   Target:8/little-unsigned-integer,
                   X:16/little-signed-integer,
                   Y:16/little-signed-integer,
                   Z:16/little-signed-integer,
                   R:16/little-signed-integer,
                   Buttons:16/little-unsigned-integer,
                   Buttons2:16/little-unsigned-integer,
                   EnabledExtensions:8/little-unsigned-integer,
                   S:16/little-signed-integer,
                   T:16/little-signed-integer,
                   Aux1:16/little-signed-integer,
                   Aux2:16/little-signed-integer,
                   Aux3:16/little-signed-integer,
                   Aux4:16/little-signed-integer,
                   Aux5:16/little-signed-integer,
                   Aux6:16/little-signed-integer>>) ->
    #manual_control{
        target = Target,
        x = X,
        y = Y,
        z = Z,
        r = R,
        buttons = Buttons,
        buttons2 = Buttons2,
        enabled_extensions = EnabledExtensions,
        s = S,
        t = T,
        aux1 = Aux1,
        aux2 = Aux2,
        aux3 = Aux3,
        aux4 = Aux4,
        aux5 = Aux5,
        aux6 = Aux6
    }.

%% @doc Encode RC_CHANNELS_OVERRIDE message to binary
-spec encode_rc_channels_override(#rc_channels_override{}) -> binary().
encode_rc_channels_override(#rc_channels_override{
    target_system = TargetSystem,
    target_component = TargetComponent,
    chan1_raw = Chan1Raw,
    chan2_raw = Chan2Raw,
    chan3_raw = Chan3Raw,
    chan4_raw = Chan4Raw,
    chan5_raw = Chan5Raw,
    chan6_raw = Chan6Raw,
    chan7_raw = Chan7Raw,
    chan8_raw = Chan8Raw,
    chan9_raw = Chan9Raw,
    chan10_raw = Chan10Raw,
    chan11_raw = Chan11Raw,
    chan12_raw = Chan12Raw,
    chan13_raw = Chan13Raw,
    chan14_raw = Chan14Raw,
    chan15_raw = Chan15Raw,
    chan16_raw = Chan16Raw,
    chan17_raw = Chan17Raw,
    chan18_raw = Chan18Raw
}) ->
    <<?RC_CHANNELS_OVERRIDE_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Chan1Raw:16/little-unsigned-integer,
      Chan2Raw:16/little-unsigned-integer,
      Chan3Raw:16/little-unsigned-integer,
      Chan4Raw:16/little-unsigned-integer,
      Chan5Raw:16/little-unsigned-integer,
      Chan6Raw:16/little-unsigned-integer,
      Chan7Raw:16/little-unsigned-integer,
      Chan8Raw:16/little-unsigned-integer,
      Chan9Raw:16/little-unsigned-integer,
      Chan10Raw:16/little-unsigned-integer,
      Chan11Raw:16/little-unsigned-integer,
      Chan12Raw:16/little-unsigned-integer,
      Chan13Raw:16/little-unsigned-integer,
      Chan14Raw:16/little-unsigned-integer,
      Chan15Raw:16/little-unsigned-integer,
      Chan16Raw:16/little-unsigned-integer,
      Chan17Raw:16/little-unsigned-integer,
      Chan18Raw:16/little-unsigned-integer>>.

%% @doc Decode RC_CHANNELS_OVERRIDE message from binary
-spec decode_rc_channels_override(binary()) -> #rc_channels_override{}.
decode_rc_channels_override(<<?RC_CHANNELS_OVERRIDE_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Chan1Raw:16/little-unsigned-integer,
                   Chan2Raw:16/little-unsigned-integer,
                   Chan3Raw:16/little-unsigned-integer,
                   Chan4Raw:16/little-unsigned-integer,
                   Chan5Raw:16/little-unsigned-integer,
                   Chan6Raw:16/little-unsigned-integer,
                   Chan7Raw:16/little-unsigned-integer,
                   Chan8Raw:16/little-unsigned-integer,
                   Chan9Raw:16/little-unsigned-integer,
                   Chan10Raw:16/little-unsigned-integer,
                   Chan11Raw:16/little-unsigned-integer,
                   Chan12Raw:16/little-unsigned-integer,
                   Chan13Raw:16/little-unsigned-integer,
                   Chan14Raw:16/little-unsigned-integer,
                   Chan15Raw:16/little-unsigned-integer,
                   Chan16Raw:16/little-unsigned-integer,
                   Chan17Raw:16/little-unsigned-integer,
                   Chan18Raw:16/little-unsigned-integer>>) ->
    #rc_channels_override{
        target_system = TargetSystem,
        target_component = TargetComponent,
        chan1_raw = Chan1Raw,
        chan2_raw = Chan2Raw,
        chan3_raw = Chan3Raw,
        chan4_raw = Chan4Raw,
        chan5_raw = Chan5Raw,
        chan6_raw = Chan6Raw,
        chan7_raw = Chan7Raw,
        chan8_raw = Chan8Raw,
        chan9_raw = Chan9Raw,
        chan10_raw = Chan10Raw,
        chan11_raw = Chan11Raw,
        chan12_raw = Chan12Raw,
        chan13_raw = Chan13Raw,
        chan14_raw = Chan14Raw,
        chan15_raw = Chan15Raw,
        chan16_raw = Chan16Raw,
        chan17_raw = Chan17Raw,
        chan18_raw = Chan18Raw
    }.

%% @doc Encode MISSION_ITEM_INT message to binary
-spec encode_mission_item_int(#mission_item_int{}) -> binary().
encode_mission_item_int(#mission_item_int{
    target_system = TargetSystem,
    target_component = TargetComponent,
    seq = Seq,
    frame = Frame,
    command = Command,
    current = Current,
    autocontinue = Autocontinue,
    param1 = Param1,
    param2 = Param2,
    param3 = Param3,
    param4 = Param4,
    x = X,
    y = Y,
    z = Z,
    mission_type = MissionType
}) ->
    <<?MISSION_ITEM_INT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Seq:16/little-unsigned-integer,
      Frame:8/little-unsigned-integer,
      Command:16/little-unsigned-integer,
      Current:8/little-unsigned-integer,
      Autocontinue:8/little-unsigned-integer,
      Param1:32/little-float,
      Param2:32/little-float,
      Param3:32/little-float,
      Param4:32/little-float,
      X:32/little-signed-integer,
      Y:32/little-signed-integer,
      Z:32/little-float,
      MissionType:8/little-unsigned-integer>>.

%% @doc Decode MISSION_ITEM_INT message from binary
-spec decode_mission_item_int(binary()) -> #mission_item_int{}.
decode_mission_item_int(<<?MISSION_ITEM_INT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Seq:16/little-unsigned-integer,
                   Frame:8/little-unsigned-integer,
                   Command:16/little-unsigned-integer,
                   Current:8/little-unsigned-integer,
                   Autocontinue:8/little-unsigned-integer,
                   Param1:32/little-float,
                   Param2:32/little-float,
                   Param3:32/little-float,
                   Param4:32/little-float,
                   X:32/little-signed-integer,
                   Y:32/little-signed-integer,
                   Z:32/little-float,
                   MissionType:8/little-unsigned-integer>>) ->
    #mission_item_int{
        target_system = TargetSystem,
        target_component = TargetComponent,
        seq = Seq,
        frame = Frame,
        command = Command,
        current = Current,
        autocontinue = Autocontinue,
        param1 = Param1,
        param2 = Param2,
        param3 = Param3,
        param4 = Param4,
        x = X,
        y = Y,
        z = Z,
        mission_type = MissionType
    }.

%% @doc Encode VFR_HUD message to binary
-spec encode_vfr_hud(#vfr_hud{}) -> binary().
encode_vfr_hud(#vfr_hud{
    airspeed = Airspeed,
    groundspeed = Groundspeed,
    heading = Heading,
    throttle = Throttle,
    alt = Alt,
    climb = Climb
}) ->
    <<?VFR_HUD_ID:8,
      Airspeed:32/little-float,
      Groundspeed:32/little-float,
      Heading:16/little-signed-integer,
      Throttle:16/little-unsigned-integer,
      Alt:32/little-float,
      Climb:32/little-float>>.

%% @doc Decode VFR_HUD message from binary
-spec decode_vfr_hud(binary()) -> #vfr_hud{}.
decode_vfr_hud(<<?VFR_HUD_ID:8,
                   Airspeed:32/little-float,
                   Groundspeed:32/little-float,
                   Heading:16/little-signed-integer,
                   Throttle:16/little-unsigned-integer,
                   Alt:32/little-float,
                   Climb:32/little-float>>) ->
    #vfr_hud{
        airspeed = Airspeed,
        groundspeed = Groundspeed,
        heading = Heading,
        throttle = Throttle,
        alt = Alt,
        climb = Climb
    }.

%% @doc Encode COMMAND_INT message to binary
-spec encode_command_int(#command_int{}) -> binary().
encode_command_int(#command_int{
    target_system = TargetSystem,
    target_component = TargetComponent,
    frame = Frame,
    command = Command,
    current = Current,
    autocontinue = Autocontinue,
    param1 = Param1,
    param2 = Param2,
    param3 = Param3,
    param4 = Param4,
    x = X,
    y = Y,
    z = Z
}) ->
    <<?COMMAND_INT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Frame:8/little-unsigned-integer,
      Command:16/little-unsigned-integer,
      Current:8/little-unsigned-integer,
      Autocontinue:8/little-unsigned-integer,
      Param1:32/little-float,
      Param2:32/little-float,
      Param3:32/little-float,
      Param4:32/little-float,
      X:32/little-signed-integer,
      Y:32/little-signed-integer,
      Z:32/little-float>>.

%% @doc Decode COMMAND_INT message from binary
-spec decode_command_int(binary()) -> #command_int{}.
decode_command_int(<<?COMMAND_INT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Frame:8/little-unsigned-integer,
                   Command:16/little-unsigned-integer,
                   Current:8/little-unsigned-integer,
                   Autocontinue:8/little-unsigned-integer,
                   Param1:32/little-float,
                   Param2:32/little-float,
                   Param3:32/little-float,
                   Param4:32/little-float,
                   X:32/little-signed-integer,
                   Y:32/little-signed-integer,
                   Z:32/little-float>>) ->
    #command_int{
        target_system = TargetSystem,
        target_component = TargetComponent,
        frame = Frame,
        command = Command,
        current = Current,
        autocontinue = Autocontinue,
        param1 = Param1,
        param2 = Param2,
        param3 = Param3,
        param4 = Param4,
        x = X,
        y = Y,
        z = Z
    }.

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
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Command:16/little-unsigned-integer,
      Confirmation:8/little-unsigned-integer,
      Param1:32/little-float,
      Param2:32/little-float,
      Param3:32/little-float,
      Param4:32/little-float,
      Param5:32/little-float,
      Param6:32/little-float,
      Param7:32/little-float>>.

%% @doc Decode COMMAND_LONG message from binary
-spec decode_command_long(binary()) -> #command_long{}.
decode_command_long(<<?COMMAND_LONG_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Command:16/little-unsigned-integer,
                   Confirmation:8/little-unsigned-integer,
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

%% @doc Encode COMMAND_ACK message to binary
-spec encode_command_ack(#command_ack{}) -> binary().
encode_command_ack(#command_ack{
    command = Command,
    result = Result,
    progress = Progress,
    result_param2 = ResultParam2,
    target_system = TargetSystem,
    target_component = TargetComponent
}) ->
    <<?COMMAND_ACK_ID:8,
      Command:16/little-unsigned-integer,
      Result:8/little-unsigned-integer,
      Progress:8/little-unsigned-integer,
      ResultParam2:32/little-signed-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer>>.

%% @doc Decode COMMAND_ACK message from binary
-spec decode_command_ack(binary()) -> #command_ack{}.
decode_command_ack(<<?COMMAND_ACK_ID:8,
                   Command:16/little-unsigned-integer,
                   Result:8/little-unsigned-integer,
                   Progress:8/little-unsigned-integer,
                   ResultParam2:32/little-signed-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer>>) ->
    #command_ack{
        command = Command,
        result = Result,
        progress = Progress,
        result_param2 = ResultParam2,
        target_system = TargetSystem,
        target_component = TargetComponent
    }.

%% @doc Encode COMMAND_CANCEL message to binary
-spec encode_command_cancel(#command_cancel{}) -> binary().
encode_command_cancel(#command_cancel{
    target_system = TargetSystem,
    target_component = TargetComponent,
    command = Command
}) ->
    <<?COMMAND_CANCEL_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Command:16/little-unsigned-integer>>.

%% @doc Decode COMMAND_CANCEL message from binary
-spec decode_command_cancel(binary()) -> #command_cancel{}.
decode_command_cancel(<<?COMMAND_CANCEL_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Command:16/little-unsigned-integer>>) ->
    #command_cancel{
        target_system = TargetSystem,
        target_component = TargetComponent,
        command = Command
    }.

%% @doc Encode MANUAL_SETPOINT message to binary
-spec encode_manual_setpoint(#manual_setpoint{}) -> binary().
encode_manual_setpoint(#manual_setpoint{
    time_boot_ms = TimeBootMs,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    thrust = Thrust,
    mode_switch = ModeSwitch,
    manual_override_switch = ManualOverrideSwitch
}) ->
    <<?MANUAL_SETPOINT_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Thrust:32/little-float,
      ModeSwitch:8/little-unsigned-integer,
      ManualOverrideSwitch:8/little-unsigned-integer>>.

%% @doc Decode MANUAL_SETPOINT message from binary
-spec decode_manual_setpoint(binary()) -> #manual_setpoint{}.
decode_manual_setpoint(<<?MANUAL_SETPOINT_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   Thrust:32/little-float,
                   ModeSwitch:8/little-unsigned-integer,
                   ManualOverrideSwitch:8/little-unsigned-integer>>) ->
    #manual_setpoint{
        time_boot_ms = TimeBootMs,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        thrust = Thrust,
        mode_switch = ModeSwitch,
        manual_override_switch = ManualOverrideSwitch
    }.

%% @doc Encode SET_ATTITUDE_TARGET message to binary
-spec encode_set_attitude_target(#set_attitude_target{}) -> binary().
encode_set_attitude_target(#set_attitude_target{
    time_boot_ms = TimeBootMs,
    target_system = TargetSystem,
    target_component = TargetComponent,
    type_mask = TypeMask,
    q = Q,
    body_roll_rate = BodyRollRate,
    body_pitch_rate = BodyPitchRate,
    body_yaw_rate = BodyYawRate,
    thrust = Thrust,
    thrust_body = ThrustBody
}) ->
    <<?SET_ATTITUDE_TARGET_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      TypeMask:8/little-unsigned-integer,
      Q:32/little-float,
      BodyRollRate:32/little-float,
      BodyPitchRate:32/little-float,
      BodyYawRate:32/little-float,
      Thrust:32/little-float,
      ThrustBody:32/little-float>>.

%% @doc Decode SET_ATTITUDE_TARGET message from binary
-spec decode_set_attitude_target(binary()) -> #set_attitude_target{}.
decode_set_attitude_target(<<?SET_ATTITUDE_TARGET_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   TypeMask:8/little-unsigned-integer,
                   Q:32/little-float,
                   BodyRollRate:32/little-float,
                   BodyPitchRate:32/little-float,
                   BodyYawRate:32/little-float,
                   Thrust:32/little-float,
                   ThrustBody:32/little-float>>) ->
    #set_attitude_target{
        time_boot_ms = TimeBootMs,
        target_system = TargetSystem,
        target_component = TargetComponent,
        type_mask = TypeMask,
        q = Q,
        body_roll_rate = BodyRollRate,
        body_pitch_rate = BodyPitchRate,
        body_yaw_rate = BodyYawRate,
        thrust = Thrust,
        thrust_body = ThrustBody
    }.

%% @doc Encode ATTITUDE_TARGET message to binary
-spec encode_attitude_target(#attitude_target{}) -> binary().
encode_attitude_target(#attitude_target{
    time_boot_ms = TimeBootMs,
    type_mask = TypeMask,
    q = Q,
    body_roll_rate = BodyRollRate,
    body_pitch_rate = BodyPitchRate,
    body_yaw_rate = BodyYawRate,
    thrust = Thrust
}) ->
    <<?ATTITUDE_TARGET_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      TypeMask:8/little-unsigned-integer,
      Q:32/little-float,
      BodyRollRate:32/little-float,
      BodyPitchRate:32/little-float,
      BodyYawRate:32/little-float,
      Thrust:32/little-float>>.

%% @doc Decode ATTITUDE_TARGET message from binary
-spec decode_attitude_target(binary()) -> #attitude_target{}.
decode_attitude_target(<<?ATTITUDE_TARGET_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   TypeMask:8/little-unsigned-integer,
                   Q:32/little-float,
                   BodyRollRate:32/little-float,
                   BodyPitchRate:32/little-float,
                   BodyYawRate:32/little-float,
                   Thrust:32/little-float>>) ->
    #attitude_target{
        time_boot_ms = TimeBootMs,
        type_mask = TypeMask,
        q = Q,
        body_roll_rate = BodyRollRate,
        body_pitch_rate = BodyPitchRate,
        body_yaw_rate = BodyYawRate,
        thrust = Thrust
    }.

%% @doc Encode SET_POSITION_TARGET_LOCAL_NED message to binary
-spec encode_set_position_target_local_ned(#set_position_target_local_ned{}) -> binary().
encode_set_position_target_local_ned(#set_position_target_local_ned{
    time_boot_ms = TimeBootMs,
    target_system = TargetSystem,
    target_component = TargetComponent,
    coordinate_frame = CoordinateFrame,
    type_mask = TypeMask,
    x = X,
    y = Y,
    z = Z,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    afx = Afx,
    afy = Afy,
    afz = Afz,
    yaw = Yaw,
    yaw_rate = YawRate
}) ->
    <<?SET_POSITION_TARGET_LOCAL_NED_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      CoordinateFrame:8/little-unsigned-integer,
      TypeMask:16/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Vx:32/little-float,
      Vy:32/little-float,
      Vz:32/little-float,
      Afx:32/little-float,
      Afy:32/little-float,
      Afz:32/little-float,
      Yaw:32/little-float,
      YawRate:32/little-float>>.

%% @doc Decode SET_POSITION_TARGET_LOCAL_NED message from binary
-spec decode_set_position_target_local_ned(binary()) -> #set_position_target_local_ned{}.
decode_set_position_target_local_ned(<<?SET_POSITION_TARGET_LOCAL_NED_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   CoordinateFrame:8/little-unsigned-integer,
                   TypeMask:16/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Vx:32/little-float,
                   Vy:32/little-float,
                   Vz:32/little-float,
                   Afx:32/little-float,
                   Afy:32/little-float,
                   Afz:32/little-float,
                   Yaw:32/little-float,
                   YawRate:32/little-float>>) ->
    #set_position_target_local_ned{
        time_boot_ms = TimeBootMs,
        target_system = TargetSystem,
        target_component = TargetComponent,
        coordinate_frame = CoordinateFrame,
        type_mask = TypeMask,
        x = X,
        y = Y,
        z = Z,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        afx = Afx,
        afy = Afy,
        afz = Afz,
        yaw = Yaw,
        yaw_rate = YawRate
    }.

%% @doc Encode POSITION_TARGET_LOCAL_NED message to binary
-spec encode_position_target_local_ned(#position_target_local_ned{}) -> binary().
encode_position_target_local_ned(#position_target_local_ned{
    time_boot_ms = TimeBootMs,
    coordinate_frame = CoordinateFrame,
    type_mask = TypeMask,
    x = X,
    y = Y,
    z = Z,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    afx = Afx,
    afy = Afy,
    afz = Afz,
    yaw = Yaw,
    yaw_rate = YawRate
}) ->
    <<?POSITION_TARGET_LOCAL_NED_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      CoordinateFrame:8/little-unsigned-integer,
      TypeMask:16/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Vx:32/little-float,
      Vy:32/little-float,
      Vz:32/little-float,
      Afx:32/little-float,
      Afy:32/little-float,
      Afz:32/little-float,
      Yaw:32/little-float,
      YawRate:32/little-float>>.

%% @doc Decode POSITION_TARGET_LOCAL_NED message from binary
-spec decode_position_target_local_ned(binary()) -> #position_target_local_ned{}.
decode_position_target_local_ned(<<?POSITION_TARGET_LOCAL_NED_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   CoordinateFrame:8/little-unsigned-integer,
                   TypeMask:16/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Vx:32/little-float,
                   Vy:32/little-float,
                   Vz:32/little-float,
                   Afx:32/little-float,
                   Afy:32/little-float,
                   Afz:32/little-float,
                   Yaw:32/little-float,
                   YawRate:32/little-float>>) ->
    #position_target_local_ned{
        time_boot_ms = TimeBootMs,
        coordinate_frame = CoordinateFrame,
        type_mask = TypeMask,
        x = X,
        y = Y,
        z = Z,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        afx = Afx,
        afy = Afy,
        afz = Afz,
        yaw = Yaw,
        yaw_rate = YawRate
    }.

%% @doc Encode SET_POSITION_TARGET_GLOBAL_INT message to binary
-spec encode_set_position_target_global_int(#set_position_target_global_int{}) -> binary().
encode_set_position_target_global_int(#set_position_target_global_int{
    time_boot_ms = TimeBootMs,
    target_system = TargetSystem,
    target_component = TargetComponent,
    coordinate_frame = CoordinateFrame,
    type_mask = TypeMask,
    lat_int = LatInt,
    lon_int = LonInt,
    alt = Alt,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    afx = Afx,
    afy = Afy,
    afz = Afz,
    yaw = Yaw,
    yaw_rate = YawRate
}) ->
    <<?SET_POSITION_TARGET_GLOBAL_INT_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      CoordinateFrame:8/little-unsigned-integer,
      TypeMask:16/little-unsigned-integer,
      LatInt:32/little-signed-integer,
      LonInt:32/little-signed-integer,
      Alt:32/little-float,
      Vx:32/little-float,
      Vy:32/little-float,
      Vz:32/little-float,
      Afx:32/little-float,
      Afy:32/little-float,
      Afz:32/little-float,
      Yaw:32/little-float,
      YawRate:32/little-float>>.

%% @doc Decode SET_POSITION_TARGET_GLOBAL_INT message from binary
-spec decode_set_position_target_global_int(binary()) -> #set_position_target_global_int{}.
decode_set_position_target_global_int(<<?SET_POSITION_TARGET_GLOBAL_INT_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   CoordinateFrame:8/little-unsigned-integer,
                   TypeMask:16/little-unsigned-integer,
                   LatInt:32/little-signed-integer,
                   LonInt:32/little-signed-integer,
                   Alt:32/little-float,
                   Vx:32/little-float,
                   Vy:32/little-float,
                   Vz:32/little-float,
                   Afx:32/little-float,
                   Afy:32/little-float,
                   Afz:32/little-float,
                   Yaw:32/little-float,
                   YawRate:32/little-float>>) ->
    #set_position_target_global_int{
        time_boot_ms = TimeBootMs,
        target_system = TargetSystem,
        target_component = TargetComponent,
        coordinate_frame = CoordinateFrame,
        type_mask = TypeMask,
        lat_int = LatInt,
        lon_int = LonInt,
        alt = Alt,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        afx = Afx,
        afy = Afy,
        afz = Afz,
        yaw = Yaw,
        yaw_rate = YawRate
    }.

%% @doc Encode POSITION_TARGET_GLOBAL_INT message to binary
-spec encode_position_target_global_int(#position_target_global_int{}) -> binary().
encode_position_target_global_int(#position_target_global_int{
    time_boot_ms = TimeBootMs,
    coordinate_frame = CoordinateFrame,
    type_mask = TypeMask,
    lat_int = LatInt,
    lon_int = LonInt,
    alt = Alt,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    afx = Afx,
    afy = Afy,
    afz = Afz,
    yaw = Yaw,
    yaw_rate = YawRate
}) ->
    <<?POSITION_TARGET_GLOBAL_INT_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      CoordinateFrame:8/little-unsigned-integer,
      TypeMask:16/little-unsigned-integer,
      LatInt:32/little-signed-integer,
      LonInt:32/little-signed-integer,
      Alt:32/little-float,
      Vx:32/little-float,
      Vy:32/little-float,
      Vz:32/little-float,
      Afx:32/little-float,
      Afy:32/little-float,
      Afz:32/little-float,
      Yaw:32/little-float,
      YawRate:32/little-float>>.

%% @doc Decode POSITION_TARGET_GLOBAL_INT message from binary
-spec decode_position_target_global_int(binary()) -> #position_target_global_int{}.
decode_position_target_global_int(<<?POSITION_TARGET_GLOBAL_INT_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   CoordinateFrame:8/little-unsigned-integer,
                   TypeMask:16/little-unsigned-integer,
                   LatInt:32/little-signed-integer,
                   LonInt:32/little-signed-integer,
                   Alt:32/little-float,
                   Vx:32/little-float,
                   Vy:32/little-float,
                   Vz:32/little-float,
                   Afx:32/little-float,
                   Afy:32/little-float,
                   Afz:32/little-float,
                   Yaw:32/little-float,
                   YawRate:32/little-float>>) ->
    #position_target_global_int{
        time_boot_ms = TimeBootMs,
        coordinate_frame = CoordinateFrame,
        type_mask = TypeMask,
        lat_int = LatInt,
        lon_int = LonInt,
        alt = Alt,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        afx = Afx,
        afy = Afy,
        afz = Afz,
        yaw = Yaw,
        yaw_rate = YawRate
    }.

%% @doc Encode LOCAL_POSITION_NED_SYSTEM_GLOBAL_OFFSET message to binary
-spec encode_local_position_ned_system_global_offset(#local_position_ned_system_global_offset{}) -> binary().
encode_local_position_ned_system_global_offset(#local_position_ned_system_global_offset{
    time_boot_ms = TimeBootMs,
    x = X,
    y = Y,
    z = Z,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw
}) ->
    <<?LOCAL_POSITION_NED_SYSTEM_GLOBAL_OFFSET_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float>>.

%% @doc Decode LOCAL_POSITION_NED_SYSTEM_GLOBAL_OFFSET message from binary
-spec decode_local_position_ned_system_global_offset(binary()) -> #local_position_ned_system_global_offset{}.
decode_local_position_ned_system_global_offset(<<?LOCAL_POSITION_NED_SYSTEM_GLOBAL_OFFSET_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float>>) ->
    #local_position_ned_system_global_offset{
        time_boot_ms = TimeBootMs,
        x = X,
        y = Y,
        z = Z,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw
    }.

%% @doc Encode HIL_STATE message to binary
-spec encode_hil_state(#hil_state{}) -> binary().
encode_hil_state(#hil_state{
    time_usec = TimeUsec,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    rollspeed = Rollspeed,
    pitchspeed = Pitchspeed,
    yawspeed = Yawspeed,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    xacc = Xacc,
    yacc = Yacc,
    zacc = Zacc
}) ->
    <<?HIL_STATE_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Rollspeed:32/little-float,
      Pitchspeed:32/little-float,
      Yawspeed:32/little-float,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-signed-integer,
      Vx:16/little-signed-integer,
      Vy:16/little-signed-integer,
      Vz:16/little-signed-integer,
      Xacc:16/little-signed-integer,
      Yacc:16/little-signed-integer,
      Zacc:16/little-signed-integer>>.

%% @doc Decode HIL_STATE message from binary
-spec decode_hil_state(binary()) -> #hil_state{}.
decode_hil_state(<<?HIL_STATE_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   Rollspeed:32/little-float,
                   Pitchspeed:32/little-float,
                   Yawspeed:32/little-float,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-signed-integer,
                   Vx:16/little-signed-integer,
                   Vy:16/little-signed-integer,
                   Vz:16/little-signed-integer,
                   Xacc:16/little-signed-integer,
                   Yacc:16/little-signed-integer,
                   Zacc:16/little-signed-integer>>) ->
    #hil_state{
        time_usec = TimeUsec,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        rollspeed = Rollspeed,
        pitchspeed = Pitchspeed,
        yawspeed = Yawspeed,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        xacc = Xacc,
        yacc = Yacc,
        zacc = Zacc
    }.

%% @doc Encode HIL_CONTROLS message to binary
-spec encode_hil_controls(#hil_controls{}) -> binary().
encode_hil_controls(#hil_controls{
    time_usec = TimeUsec,
    roll_ailerons = RollAilerons,
    pitch_elevator = PitchElevator,
    yaw_rudder = YawRudder,
    throttle = Throttle,
    aux1 = Aux1,
    aux2 = Aux2,
    aux3 = Aux3,
    aux4 = Aux4,
    mode = Mode,
    nav_mode = NavMode
}) ->
    <<?HIL_CONTROLS_ID:8,
      TimeUsec:64/little-unsigned-integer,
      RollAilerons:32/little-float,
      PitchElevator:32/little-float,
      YawRudder:32/little-float,
      Throttle:32/little-float,
      Aux1:32/little-float,
      Aux2:32/little-float,
      Aux3:32/little-float,
      Aux4:32/little-float,
      Mode:8/little-unsigned-integer,
      NavMode:8/little-unsigned-integer>>.

%% @doc Decode HIL_CONTROLS message from binary
-spec decode_hil_controls(binary()) -> #hil_controls{}.
decode_hil_controls(<<?HIL_CONTROLS_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   RollAilerons:32/little-float,
                   PitchElevator:32/little-float,
                   YawRudder:32/little-float,
                   Throttle:32/little-float,
                   Aux1:32/little-float,
                   Aux2:32/little-float,
                   Aux3:32/little-float,
                   Aux4:32/little-float,
                   Mode:8/little-unsigned-integer,
                   NavMode:8/little-unsigned-integer>>) ->
    #hil_controls{
        time_usec = TimeUsec,
        roll_ailerons = RollAilerons,
        pitch_elevator = PitchElevator,
        yaw_rudder = YawRudder,
        throttle = Throttle,
        aux1 = Aux1,
        aux2 = Aux2,
        aux3 = Aux3,
        aux4 = Aux4,
        mode = Mode,
        nav_mode = NavMode
    }.

%% @doc Encode HIL_RC_INPUTS_RAW message to binary
-spec encode_hil_rc_inputs_raw(#hil_rc_inputs_raw{}) -> binary().
encode_hil_rc_inputs_raw(#hil_rc_inputs_raw{
    time_usec = TimeUsec,
    chan1_raw = Chan1Raw,
    chan2_raw = Chan2Raw,
    chan3_raw = Chan3Raw,
    chan4_raw = Chan4Raw,
    chan5_raw = Chan5Raw,
    chan6_raw = Chan6Raw,
    chan7_raw = Chan7Raw,
    chan8_raw = Chan8Raw,
    chan9_raw = Chan9Raw,
    chan10_raw = Chan10Raw,
    chan11_raw = Chan11Raw,
    chan12_raw = Chan12Raw,
    rssi = Rssi
}) ->
    <<?HIL_RC_INPUTS_RAW_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Chan1Raw:16/little-unsigned-integer,
      Chan2Raw:16/little-unsigned-integer,
      Chan3Raw:16/little-unsigned-integer,
      Chan4Raw:16/little-unsigned-integer,
      Chan5Raw:16/little-unsigned-integer,
      Chan6Raw:16/little-unsigned-integer,
      Chan7Raw:16/little-unsigned-integer,
      Chan8Raw:16/little-unsigned-integer,
      Chan9Raw:16/little-unsigned-integer,
      Chan10Raw:16/little-unsigned-integer,
      Chan11Raw:16/little-unsigned-integer,
      Chan12Raw:16/little-unsigned-integer,
      Rssi:8/little-unsigned-integer>>.

%% @doc Decode HIL_RC_INPUTS_RAW message from binary
-spec decode_hil_rc_inputs_raw(binary()) -> #hil_rc_inputs_raw{}.
decode_hil_rc_inputs_raw(<<?HIL_RC_INPUTS_RAW_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Chan1Raw:16/little-unsigned-integer,
                   Chan2Raw:16/little-unsigned-integer,
                   Chan3Raw:16/little-unsigned-integer,
                   Chan4Raw:16/little-unsigned-integer,
                   Chan5Raw:16/little-unsigned-integer,
                   Chan6Raw:16/little-unsigned-integer,
                   Chan7Raw:16/little-unsigned-integer,
                   Chan8Raw:16/little-unsigned-integer,
                   Chan9Raw:16/little-unsigned-integer,
                   Chan10Raw:16/little-unsigned-integer,
                   Chan11Raw:16/little-unsigned-integer,
                   Chan12Raw:16/little-unsigned-integer,
                   Rssi:8/little-unsigned-integer>>) ->
    #hil_rc_inputs_raw{
        time_usec = TimeUsec,
        chan1_raw = Chan1Raw,
        chan2_raw = Chan2Raw,
        chan3_raw = Chan3Raw,
        chan4_raw = Chan4Raw,
        chan5_raw = Chan5Raw,
        chan6_raw = Chan6Raw,
        chan7_raw = Chan7Raw,
        chan8_raw = Chan8Raw,
        chan9_raw = Chan9Raw,
        chan10_raw = Chan10Raw,
        chan11_raw = Chan11Raw,
        chan12_raw = Chan12Raw,
        rssi = Rssi
    }.

%% @doc Encode HIL_ACTUATOR_CONTROLS message to binary
-spec encode_hil_actuator_controls(#hil_actuator_controls{}) -> binary().
encode_hil_actuator_controls(#hil_actuator_controls{
    time_usec = TimeUsec,
    controls = Controls,
    mode = Mode,
    flags = Flags
}) ->
    <<?HIL_ACTUATOR_CONTROLS_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Controls:32/little-float,
      Mode:8/little-unsigned-integer,
      Flags:64/little-unsigned-integer>>.

%% @doc Decode HIL_ACTUATOR_CONTROLS message from binary
-spec decode_hil_actuator_controls(binary()) -> #hil_actuator_controls{}.
decode_hil_actuator_controls(<<?HIL_ACTUATOR_CONTROLS_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Controls:32/little-float,
                   Mode:8/little-unsigned-integer,
                   Flags:64/little-unsigned-integer>>) ->
    #hil_actuator_controls{
        time_usec = TimeUsec,
        controls = Controls,
        mode = Mode,
        flags = Flags
    }.

%% @doc Encode OPTICAL_FLOW message to binary
-spec encode_optical_flow(#optical_flow{}) -> binary().
encode_optical_flow(#optical_flow{
    time_usec = TimeUsec,
    sensor_id = SensorId,
    flow_x = FlowX,
    flow_y = FlowY,
    flow_comp_m_x = FlowCompMX,
    flow_comp_m_y = FlowCompMY,
    quality = Quality,
    ground_distance = GroundDistance,
    flow_rate_x = FlowRateX,
    flow_rate_y = FlowRateY
}) ->
    <<?OPTICAL_FLOW_ID:8,
      TimeUsec:64/little-unsigned-integer,
      SensorId:8/little-unsigned-integer,
      FlowX:16/little-signed-integer,
      FlowY:16/little-signed-integer,
      FlowCompMX:32/little-float,
      FlowCompMY:32/little-float,
      Quality:8/little-unsigned-integer,
      GroundDistance:32/little-float,
      FlowRateX:32/little-float,
      FlowRateY:32/little-float>>.

%% @doc Decode OPTICAL_FLOW message from binary
-spec decode_optical_flow(binary()) -> #optical_flow{}.
decode_optical_flow(<<?OPTICAL_FLOW_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   SensorId:8/little-unsigned-integer,
                   FlowX:16/little-signed-integer,
                   FlowY:16/little-signed-integer,
                   FlowCompMX:32/little-float,
                   FlowCompMY:32/little-float,
                   Quality:8/little-unsigned-integer,
                   GroundDistance:32/little-float,
                   FlowRateX:32/little-float,
                   FlowRateY:32/little-float>>) ->
    #optical_flow{
        time_usec = TimeUsec,
        sensor_id = SensorId,
        flow_x = FlowX,
        flow_y = FlowY,
        flow_comp_m_x = FlowCompMX,
        flow_comp_m_y = FlowCompMY,
        quality = Quality,
        ground_distance = GroundDistance,
        flow_rate_x = FlowRateX,
        flow_rate_y = FlowRateY
    }.

%% @doc Encode GLOBAL_VISION_POSITION_ESTIMATE message to binary
-spec encode_global_vision_position_estimate(#global_vision_position_estimate{}) -> binary().
encode_global_vision_position_estimate(#global_vision_position_estimate{
    usec = Usec,
    x = X,
    y = Y,
    z = Z,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    covariance = Covariance,
    reset_counter = ResetCounter
}) ->
    <<?GLOBAL_VISION_POSITION_ESTIMATE_ID:8,
      Usec:64/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Covariance:32/little-float,
      ResetCounter:8/little-unsigned-integer>>.

%% @doc Decode GLOBAL_VISION_POSITION_ESTIMATE message from binary
-spec decode_global_vision_position_estimate(binary()) -> #global_vision_position_estimate{}.
decode_global_vision_position_estimate(<<?GLOBAL_VISION_POSITION_ESTIMATE_ID:8,
                   Usec:64/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   Covariance:32/little-float,
                   ResetCounter:8/little-unsigned-integer>>) ->
    #global_vision_position_estimate{
        usec = Usec,
        x = X,
        y = Y,
        z = Z,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        covariance = Covariance,
        reset_counter = ResetCounter
    }.

%% @doc Encode VISION_POSITION_ESTIMATE message to binary
-spec encode_vision_position_estimate(#vision_position_estimate{}) -> binary().
encode_vision_position_estimate(#vision_position_estimate{
    usec = Usec,
    x = X,
    y = Y,
    z = Z,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    covariance = Covariance,
    reset_counter = ResetCounter
}) ->
    <<?VISION_POSITION_ESTIMATE_ID:8,
      Usec:64/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Covariance:32/little-float,
      ResetCounter:8/little-unsigned-integer>>.

%% @doc Decode VISION_POSITION_ESTIMATE message from binary
-spec decode_vision_position_estimate(binary()) -> #vision_position_estimate{}.
decode_vision_position_estimate(<<?VISION_POSITION_ESTIMATE_ID:8,
                   Usec:64/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   Covariance:32/little-float,
                   ResetCounter:8/little-unsigned-integer>>) ->
    #vision_position_estimate{
        usec = Usec,
        x = X,
        y = Y,
        z = Z,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        covariance = Covariance,
        reset_counter = ResetCounter
    }.

%% @doc Encode VISION_SPEED_ESTIMATE message to binary
-spec encode_vision_speed_estimate(#vision_speed_estimate{}) -> binary().
encode_vision_speed_estimate(#vision_speed_estimate{
    usec = Usec,
    x = X,
    y = Y,
    z = Z,
    covariance = Covariance,
    reset_counter = ResetCounter
}) ->
    <<?VISION_SPEED_ESTIMATE_ID:8,
      Usec:64/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Covariance:32/little-float,
      ResetCounter:8/little-unsigned-integer>>.

%% @doc Decode VISION_SPEED_ESTIMATE message from binary
-spec decode_vision_speed_estimate(binary()) -> #vision_speed_estimate{}.
decode_vision_speed_estimate(<<?VISION_SPEED_ESTIMATE_ID:8,
                   Usec:64/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Covariance:32/little-float,
                   ResetCounter:8/little-unsigned-integer>>) ->
    #vision_speed_estimate{
        usec = Usec,
        x = X,
        y = Y,
        z = Z,
        covariance = Covariance,
        reset_counter = ResetCounter
    }.

%% @doc Encode VICON_POSITION_ESTIMATE message to binary
-spec encode_vicon_position_estimate(#vicon_position_estimate{}) -> binary().
encode_vicon_position_estimate(#vicon_position_estimate{
    usec = Usec,
    x = X,
    y = Y,
    z = Z,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    covariance = Covariance
}) ->
    <<?VICON_POSITION_ESTIMATE_ID:8,
      Usec:64/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Covariance:32/little-float>>.

%% @doc Decode VICON_POSITION_ESTIMATE message from binary
-spec decode_vicon_position_estimate(binary()) -> #vicon_position_estimate{}.
decode_vicon_position_estimate(<<?VICON_POSITION_ESTIMATE_ID:8,
                   Usec:64/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   Covariance:32/little-float>>) ->
    #vicon_position_estimate{
        usec = Usec,
        x = X,
        y = Y,
        z = Z,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        covariance = Covariance
    }.

%% @doc Encode HIGHRES_IMU message to binary
-spec encode_highres_imu(#highres_imu{}) -> binary().
encode_highres_imu(#highres_imu{
    time_usec = TimeUsec,
    xacc = Xacc,
    yacc = Yacc,
    zacc = Zacc,
    xgyro = Xgyro,
    ygyro = Ygyro,
    zgyro = Zgyro,
    xmag = Xmag,
    ymag = Ymag,
    zmag = Zmag,
    abs_pressure = AbsPressure,
    diff_pressure = DiffPressure,
    pressure_alt = PressureAlt,
    temperature = Temperature,
    fields_updated = FieldsUpdated,
    id = Id
}) ->
    <<?HIGHRES_IMU_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Xacc:32/little-float,
      Yacc:32/little-float,
      Zacc:32/little-float,
      Xgyro:32/little-float,
      Ygyro:32/little-float,
      Zgyro:32/little-float,
      Xmag:32/little-float,
      Ymag:32/little-float,
      Zmag:32/little-float,
      AbsPressure:32/little-float,
      DiffPressure:32/little-float,
      PressureAlt:32/little-float,
      Temperature:32/little-float,
      FieldsUpdated:16/little-unsigned-integer,
      Id:8/little-unsigned-integer>>.

%% @doc Decode HIGHRES_IMU message from binary
-spec decode_highres_imu(binary()) -> #highres_imu{}.
decode_highres_imu(<<?HIGHRES_IMU_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Xacc:32/little-float,
                   Yacc:32/little-float,
                   Zacc:32/little-float,
                   Xgyro:32/little-float,
                   Ygyro:32/little-float,
                   Zgyro:32/little-float,
                   Xmag:32/little-float,
                   Ymag:32/little-float,
                   Zmag:32/little-float,
                   AbsPressure:32/little-float,
                   DiffPressure:32/little-float,
                   PressureAlt:32/little-float,
                   Temperature:32/little-float,
                   FieldsUpdated:16/little-unsigned-integer,
                   Id:8/little-unsigned-integer>>) ->
    #highres_imu{
        time_usec = TimeUsec,
        xacc = Xacc,
        yacc = Yacc,
        zacc = Zacc,
        xgyro = Xgyro,
        ygyro = Ygyro,
        zgyro = Zgyro,
        xmag = Xmag,
        ymag = Ymag,
        zmag = Zmag,
        abs_pressure = AbsPressure,
        diff_pressure = DiffPressure,
        pressure_alt = PressureAlt,
        temperature = Temperature,
        fields_updated = FieldsUpdated,
        id = Id
    }.

%% @doc Encode OPTICAL_FLOW_RAD message to binary
-spec encode_optical_flow_rad(#optical_flow_rad{}) -> binary().
encode_optical_flow_rad(#optical_flow_rad{
    time_usec = TimeUsec,
    sensor_id = SensorId,
    integration_time_us = IntegrationTimeUs,
    integrated_x = IntegratedX,
    integrated_y = IntegratedY,
    integrated_xgyro = IntegratedXgyro,
    integrated_ygyro = IntegratedYgyro,
    integrated_zgyro = IntegratedZgyro,
    temperature = Temperature,
    quality = Quality,
    time_delta_distance_us = TimeDeltaDistanceUs,
    distance = Distance
}) ->
    <<?OPTICAL_FLOW_RAD_ID:8,
      TimeUsec:64/little-unsigned-integer,
      SensorId:8/little-unsigned-integer,
      IntegrationTimeUs:32/little-unsigned-integer,
      IntegratedX:32/little-float,
      IntegratedY:32/little-float,
      IntegratedXgyro:32/little-float,
      IntegratedYgyro:32/little-float,
      IntegratedZgyro:32/little-float,
      Temperature:16/little-signed-integer,
      Quality:8/little-unsigned-integer,
      TimeDeltaDistanceUs:32/little-unsigned-integer,
      Distance:32/little-float>>.

%% @doc Decode OPTICAL_FLOW_RAD message from binary
-spec decode_optical_flow_rad(binary()) -> #optical_flow_rad{}.
decode_optical_flow_rad(<<?OPTICAL_FLOW_RAD_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   SensorId:8/little-unsigned-integer,
                   IntegrationTimeUs:32/little-unsigned-integer,
                   IntegratedX:32/little-float,
                   IntegratedY:32/little-float,
                   IntegratedXgyro:32/little-float,
                   IntegratedYgyro:32/little-float,
                   IntegratedZgyro:32/little-float,
                   Temperature:16/little-signed-integer,
                   Quality:8/little-unsigned-integer,
                   TimeDeltaDistanceUs:32/little-unsigned-integer,
                   Distance:32/little-float>>) ->
    #optical_flow_rad{
        time_usec = TimeUsec,
        sensor_id = SensorId,
        integration_time_us = IntegrationTimeUs,
        integrated_x = IntegratedX,
        integrated_y = IntegratedY,
        integrated_xgyro = IntegratedXgyro,
        integrated_ygyro = IntegratedYgyro,
        integrated_zgyro = IntegratedZgyro,
        temperature = Temperature,
        quality = Quality,
        time_delta_distance_us = TimeDeltaDistanceUs,
        distance = Distance
    }.

%% @doc Encode HIL_SENSOR message to binary
-spec encode_hil_sensor(#hil_sensor{}) -> binary().
encode_hil_sensor(#hil_sensor{
    time_usec = TimeUsec,
    xacc = Xacc,
    yacc = Yacc,
    zacc = Zacc,
    xgyro = Xgyro,
    ygyro = Ygyro,
    zgyro = Zgyro,
    xmag = Xmag,
    ymag = Ymag,
    zmag = Zmag,
    abs_pressure = AbsPressure,
    diff_pressure = DiffPressure,
    pressure_alt = PressureAlt,
    temperature = Temperature,
    fields_updated = FieldsUpdated,
    id = Id
}) ->
    <<?HIL_SENSOR_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Xacc:32/little-float,
      Yacc:32/little-float,
      Zacc:32/little-float,
      Xgyro:32/little-float,
      Ygyro:32/little-float,
      Zgyro:32/little-float,
      Xmag:32/little-float,
      Ymag:32/little-float,
      Zmag:32/little-float,
      AbsPressure:32/little-float,
      DiffPressure:32/little-float,
      PressureAlt:32/little-float,
      Temperature:32/little-float,
      FieldsUpdated:32/little-unsigned-integer,
      Id:8/little-unsigned-integer>>.

%% @doc Decode HIL_SENSOR message from binary
-spec decode_hil_sensor(binary()) -> #hil_sensor{}.
decode_hil_sensor(<<?HIL_SENSOR_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Xacc:32/little-float,
                   Yacc:32/little-float,
                   Zacc:32/little-float,
                   Xgyro:32/little-float,
                   Ygyro:32/little-float,
                   Zgyro:32/little-float,
                   Xmag:32/little-float,
                   Ymag:32/little-float,
                   Zmag:32/little-float,
                   AbsPressure:32/little-float,
                   DiffPressure:32/little-float,
                   PressureAlt:32/little-float,
                   Temperature:32/little-float,
                   FieldsUpdated:32/little-unsigned-integer,
                   Id:8/little-unsigned-integer>>) ->
    #hil_sensor{
        time_usec = TimeUsec,
        xacc = Xacc,
        yacc = Yacc,
        zacc = Zacc,
        xgyro = Xgyro,
        ygyro = Ygyro,
        zgyro = Zgyro,
        xmag = Xmag,
        ymag = Ymag,
        zmag = Zmag,
        abs_pressure = AbsPressure,
        diff_pressure = DiffPressure,
        pressure_alt = PressureAlt,
        temperature = Temperature,
        fields_updated = FieldsUpdated,
        id = Id
    }.

%% @doc Encode SIM_STATE message to binary
-spec encode_sim_state(#sim_state{}) -> binary().
encode_sim_state(#sim_state{
    q1 = Q1,
    q2 = Q2,
    q3 = Q3,
    q4 = Q4,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    xacc = Xacc,
    yacc = Yacc,
    zacc = Zacc,
    xgyro = Xgyro,
    ygyro = Ygyro,
    zgyro = Zgyro,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    std_dev_horz = StdDevHorz,
    std_dev_vert = StdDevVert,
    vn = Vn,
    ve = Ve,
    vd = Vd,
    lat_int = LatInt,
    lon_int = LonInt
}) ->
    <<?SIM_STATE_ID:8,
      Q1:32/little-float,
      Q2:32/little-float,
      Q3:32/little-float,
      Q4:32/little-float,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Xacc:32/little-float,
      Yacc:32/little-float,
      Zacc:32/little-float,
      Xgyro:32/little-float,
      Ygyro:32/little-float,
      Zgyro:32/little-float,
      Lat:32/little-float,
      Lon:32/little-float,
      Alt:32/little-float,
      StdDevHorz:32/little-float,
      StdDevVert:32/little-float,
      Vn:32/little-float,
      Ve:32/little-float,
      Vd:32/little-float,
      LatInt:32/little-signed-integer,
      LonInt:32/little-signed-integer>>.

%% @doc Decode SIM_STATE message from binary
-spec decode_sim_state(binary()) -> #sim_state{}.
decode_sim_state(<<?SIM_STATE_ID:8,
                   Q1:32/little-float,
                   Q2:32/little-float,
                   Q3:32/little-float,
                   Q4:32/little-float,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   Xacc:32/little-float,
                   Yacc:32/little-float,
                   Zacc:32/little-float,
                   Xgyro:32/little-float,
                   Ygyro:32/little-float,
                   Zgyro:32/little-float,
                   Lat:32/little-float,
                   Lon:32/little-float,
                   Alt:32/little-float,
                   StdDevHorz:32/little-float,
                   StdDevVert:32/little-float,
                   Vn:32/little-float,
                   Ve:32/little-float,
                   Vd:32/little-float,
                   LatInt:32/little-signed-integer,
                   LonInt:32/little-signed-integer>>) ->
    #sim_state{
        q1 = Q1,
        q2 = Q2,
        q3 = Q3,
        q4 = Q4,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        xacc = Xacc,
        yacc = Yacc,
        zacc = Zacc,
        xgyro = Xgyro,
        ygyro = Ygyro,
        zgyro = Zgyro,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        std_dev_horz = StdDevHorz,
        std_dev_vert = StdDevVert,
        vn = Vn,
        ve = Ve,
        vd = Vd,
        lat_int = LatInt,
        lon_int = LonInt
    }.

%% @doc Encode RADIO_STATUS message to binary
-spec encode_radio_status(#radio_status{}) -> binary().
encode_radio_status(#radio_status{
    rssi = Rssi,
    remrssi = Remrssi,
    txbuf = Txbuf,
    noise = Noise,
    remnoise = Remnoise,
    rxerrors = Rxerrors,
    fixed = Fixed
}) ->
    <<?RADIO_STATUS_ID:8,
      Rssi:8/little-unsigned-integer,
      Remrssi:8/little-unsigned-integer,
      Txbuf:8/little-unsigned-integer,
      Noise:8/little-unsigned-integer,
      Remnoise:8/little-unsigned-integer,
      Rxerrors:16/little-unsigned-integer,
      Fixed:16/little-unsigned-integer>>.

%% @doc Decode RADIO_STATUS message from binary
-spec decode_radio_status(binary()) -> #radio_status{}.
decode_radio_status(<<?RADIO_STATUS_ID:8,
                   Rssi:8/little-unsigned-integer,
                   Remrssi:8/little-unsigned-integer,
                   Txbuf:8/little-unsigned-integer,
                   Noise:8/little-unsigned-integer,
                   Remnoise:8/little-unsigned-integer,
                   Rxerrors:16/little-unsigned-integer,
                   Fixed:16/little-unsigned-integer>>) ->
    #radio_status{
        rssi = Rssi,
        remrssi = Remrssi,
        txbuf = Txbuf,
        noise = Noise,
        remnoise = Remnoise,
        rxerrors = Rxerrors,
        fixed = Fixed
    }.

%% @doc Encode FILE_TRANSFER_PROTOCOL message to binary
-spec encode_file_transfer_protocol(#file_transfer_protocol{}) -> binary().
encode_file_transfer_protocol(#file_transfer_protocol{
    target_network = TargetNetwork,
    target_system = TargetSystem,
    target_component = TargetComponent,
    payload = Payload
}) ->
    <<?FILE_TRANSFER_PROTOCOL_ID:8,
      TargetNetwork:8/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Payload:8/little-unsigned-integer>>.

%% @doc Decode FILE_TRANSFER_PROTOCOL message from binary
-spec decode_file_transfer_protocol(binary()) -> #file_transfer_protocol{}.
decode_file_transfer_protocol(<<?FILE_TRANSFER_PROTOCOL_ID:8,
                   TargetNetwork:8/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Payload:8/little-unsigned-integer>>) ->
    #file_transfer_protocol{
        target_network = TargetNetwork,
        target_system = TargetSystem,
        target_component = TargetComponent,
        payload = Payload
    }.

%% @doc Encode TIMESYNC message to binary
-spec encode_timesync(#timesync{}) -> binary().
encode_timesync(#timesync{
    tc1 = Tc1,
    ts1 = Ts1,
    target_system = TargetSystem,
    target_component = TargetComponent
}) ->
    <<?TIMESYNC_ID:8,
      Tc1:64/little-signed-integer,
      Ts1:64/little-signed-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer>>.

%% @doc Decode TIMESYNC message from binary
-spec decode_timesync(binary()) -> #timesync{}.
decode_timesync(<<?TIMESYNC_ID:8,
                   Tc1:64/little-signed-integer,
                   Ts1:64/little-signed-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer>>) ->
    #timesync{
        tc1 = Tc1,
        ts1 = Ts1,
        target_system = TargetSystem,
        target_component = TargetComponent
    }.

%% @doc Encode CAMERA_TRIGGER message to binary
-spec encode_camera_trigger(#camera_trigger{}) -> binary().
encode_camera_trigger(#camera_trigger{
    time_usec = TimeUsec,
    seq = Seq
}) ->
    <<?CAMERA_TRIGGER_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Seq:32/little-unsigned-integer>>.

%% @doc Decode CAMERA_TRIGGER message from binary
-spec decode_camera_trigger(binary()) -> #camera_trigger{}.
decode_camera_trigger(<<?CAMERA_TRIGGER_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Seq:32/little-unsigned-integer>>) ->
    #camera_trigger{
        time_usec = TimeUsec,
        seq = Seq
    }.

%% @doc Encode HIL_GPS message to binary
-spec encode_hil_gps(#hil_gps{}) -> binary().
encode_hil_gps(#hil_gps{
    time_usec = TimeUsec,
    fix_type = FixType,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    eph = Eph,
    epv = Epv,
    vel = Vel,
    vn = Vn,
    ve = Ve,
    vd = Vd,
    cog = Cog,
    satellites_visible = SatellitesVisible,
    id = Id,
    yaw = Yaw
}) ->
    <<?HIL_GPS_ID:8,
      TimeUsec:64/little-unsigned-integer,
      FixType:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-signed-integer,
      Eph:16/little-unsigned-integer,
      Epv:16/little-unsigned-integer,
      Vel:16/little-unsigned-integer,
      Vn:16/little-signed-integer,
      Ve:16/little-signed-integer,
      Vd:16/little-signed-integer,
      Cog:16/little-unsigned-integer,
      SatellitesVisible:8/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      Yaw:16/little-unsigned-integer>>.

%% @doc Decode HIL_GPS message from binary
-spec decode_hil_gps(binary()) -> #hil_gps{}.
decode_hil_gps(<<?HIL_GPS_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   FixType:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-signed-integer,
                   Eph:16/little-unsigned-integer,
                   Epv:16/little-unsigned-integer,
                   Vel:16/little-unsigned-integer,
                   Vn:16/little-signed-integer,
                   Ve:16/little-signed-integer,
                   Vd:16/little-signed-integer,
                   Cog:16/little-unsigned-integer,
                   SatellitesVisible:8/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   Yaw:16/little-unsigned-integer>>) ->
    #hil_gps{
        time_usec = TimeUsec,
        fix_type = FixType,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        eph = Eph,
        epv = Epv,
        vel = Vel,
        vn = Vn,
        ve = Ve,
        vd = Vd,
        cog = Cog,
        satellites_visible = SatellitesVisible,
        id = Id,
        yaw = Yaw
    }.

%% @doc Encode HIL_OPTICAL_FLOW message to binary
-spec encode_hil_optical_flow(#hil_optical_flow{}) -> binary().
encode_hil_optical_flow(#hil_optical_flow{
    time_usec = TimeUsec,
    sensor_id = SensorId,
    integration_time_us = IntegrationTimeUs,
    integrated_x = IntegratedX,
    integrated_y = IntegratedY,
    integrated_xgyro = IntegratedXgyro,
    integrated_ygyro = IntegratedYgyro,
    integrated_zgyro = IntegratedZgyro,
    temperature = Temperature,
    quality = Quality,
    time_delta_distance_us = TimeDeltaDistanceUs,
    distance = Distance
}) ->
    <<?HIL_OPTICAL_FLOW_ID:8,
      TimeUsec:64/little-unsigned-integer,
      SensorId:8/little-unsigned-integer,
      IntegrationTimeUs:32/little-unsigned-integer,
      IntegratedX:32/little-float,
      IntegratedY:32/little-float,
      IntegratedXgyro:32/little-float,
      IntegratedYgyro:32/little-float,
      IntegratedZgyro:32/little-float,
      Temperature:16/little-signed-integer,
      Quality:8/little-unsigned-integer,
      TimeDeltaDistanceUs:32/little-unsigned-integer,
      Distance:32/little-float>>.

%% @doc Decode HIL_OPTICAL_FLOW message from binary
-spec decode_hil_optical_flow(binary()) -> #hil_optical_flow{}.
decode_hil_optical_flow(<<?HIL_OPTICAL_FLOW_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   SensorId:8/little-unsigned-integer,
                   IntegrationTimeUs:32/little-unsigned-integer,
                   IntegratedX:32/little-float,
                   IntegratedY:32/little-float,
                   IntegratedXgyro:32/little-float,
                   IntegratedYgyro:32/little-float,
                   IntegratedZgyro:32/little-float,
                   Temperature:16/little-signed-integer,
                   Quality:8/little-unsigned-integer,
                   TimeDeltaDistanceUs:32/little-unsigned-integer,
                   Distance:32/little-float>>) ->
    #hil_optical_flow{
        time_usec = TimeUsec,
        sensor_id = SensorId,
        integration_time_us = IntegrationTimeUs,
        integrated_x = IntegratedX,
        integrated_y = IntegratedY,
        integrated_xgyro = IntegratedXgyro,
        integrated_ygyro = IntegratedYgyro,
        integrated_zgyro = IntegratedZgyro,
        temperature = Temperature,
        quality = Quality,
        time_delta_distance_us = TimeDeltaDistanceUs,
        distance = Distance
    }.

%% @doc Encode HIL_STATE_QUATERNION message to binary
-spec encode_hil_state_quaternion(#hil_state_quaternion{}) -> binary().
encode_hil_state_quaternion(#hil_state_quaternion{
    time_usec = TimeUsec,
    attitude_quaternion = AttitudeQuaternion,
    rollspeed = Rollspeed,
    pitchspeed = Pitchspeed,
    yawspeed = Yawspeed,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    ind_airspeed = IndAirspeed,
    true_airspeed = TrueAirspeed,
    xacc = Xacc,
    yacc = Yacc,
    zacc = Zacc
}) ->
    <<?HIL_STATE_QUATERNION_ID:8,
      TimeUsec:64/little-unsigned-integer,
      AttitudeQuaternion:32/little-float,
      Rollspeed:32/little-float,
      Pitchspeed:32/little-float,
      Yawspeed:32/little-float,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-signed-integer,
      Vx:16/little-signed-integer,
      Vy:16/little-signed-integer,
      Vz:16/little-signed-integer,
      IndAirspeed:16/little-unsigned-integer,
      TrueAirspeed:16/little-unsigned-integer,
      Xacc:16/little-signed-integer,
      Yacc:16/little-signed-integer,
      Zacc:16/little-signed-integer>>.

%% @doc Decode HIL_STATE_QUATERNION message from binary
-spec decode_hil_state_quaternion(binary()) -> #hil_state_quaternion{}.
decode_hil_state_quaternion(<<?HIL_STATE_QUATERNION_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   AttitudeQuaternion:32/little-float,
                   Rollspeed:32/little-float,
                   Pitchspeed:32/little-float,
                   Yawspeed:32/little-float,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-signed-integer,
                   Vx:16/little-signed-integer,
                   Vy:16/little-signed-integer,
                   Vz:16/little-signed-integer,
                   IndAirspeed:16/little-unsigned-integer,
                   TrueAirspeed:16/little-unsigned-integer,
                   Xacc:16/little-signed-integer,
                   Yacc:16/little-signed-integer,
                   Zacc:16/little-signed-integer>>) ->
    #hil_state_quaternion{
        time_usec = TimeUsec,
        attitude_quaternion = AttitudeQuaternion,
        rollspeed = Rollspeed,
        pitchspeed = Pitchspeed,
        yawspeed = Yawspeed,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        ind_airspeed = IndAirspeed,
        true_airspeed = TrueAirspeed,
        xacc = Xacc,
        yacc = Yacc,
        zacc = Zacc
    }.

%% @doc Encode SCALED_IMU2 message to binary
-spec encode_scaled_imu2(#scaled_imu2{}) -> binary().
encode_scaled_imu2(#scaled_imu2{
    time_boot_ms = TimeBootMs,
    xacc = Xacc,
    yacc = Yacc,
    zacc = Zacc,
    xgyro = Xgyro,
    ygyro = Ygyro,
    zgyro = Zgyro,
    xmag = Xmag,
    ymag = Ymag,
    zmag = Zmag,
    temperature = Temperature
}) ->
    <<?SCALED_IMU2_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Xacc:16/little-signed-integer,
      Yacc:16/little-signed-integer,
      Zacc:16/little-signed-integer,
      Xgyro:16/little-signed-integer,
      Ygyro:16/little-signed-integer,
      Zgyro:16/little-signed-integer,
      Xmag:16/little-signed-integer,
      Ymag:16/little-signed-integer,
      Zmag:16/little-signed-integer,
      Temperature:16/little-signed-integer>>.

%% @doc Decode SCALED_IMU2 message from binary
-spec decode_scaled_imu2(binary()) -> #scaled_imu2{}.
decode_scaled_imu2(<<?SCALED_IMU2_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Xacc:16/little-signed-integer,
                   Yacc:16/little-signed-integer,
                   Zacc:16/little-signed-integer,
                   Xgyro:16/little-signed-integer,
                   Ygyro:16/little-signed-integer,
                   Zgyro:16/little-signed-integer,
                   Xmag:16/little-signed-integer,
                   Ymag:16/little-signed-integer,
                   Zmag:16/little-signed-integer,
                   Temperature:16/little-signed-integer>>) ->
    #scaled_imu2{
        time_boot_ms = TimeBootMs,
        xacc = Xacc,
        yacc = Yacc,
        zacc = Zacc,
        xgyro = Xgyro,
        ygyro = Ygyro,
        zgyro = Zgyro,
        xmag = Xmag,
        ymag = Ymag,
        zmag = Zmag,
        temperature = Temperature
    }.

%% @doc Encode LOG_REQUEST_LIST message to binary
-spec encode_log_request_list(#log_request_list{}) -> binary().
encode_log_request_list(#log_request_list{
    target_system = TargetSystem,
    target_component = TargetComponent,
    start = Start,
    end_ = End
}) ->
    <<?LOG_REQUEST_LIST_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Start:16/little-unsigned-integer,
      End:16/little-unsigned-integer>>.

%% @doc Decode LOG_REQUEST_LIST message from binary
-spec decode_log_request_list(binary()) -> #log_request_list{}.
decode_log_request_list(<<?LOG_REQUEST_LIST_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Start:16/little-unsigned-integer,
                   End:16/little-unsigned-integer>>) ->
    #log_request_list{
        target_system = TargetSystem,
        target_component = TargetComponent,
        start = Start,
        end_ = End
    }.

%% @doc Encode LOG_ENTRY message to binary
-spec encode_log_entry(#log_entry{}) -> binary().
encode_log_entry(#log_entry{
    id = Id,
    num_logs = NumLogs,
    last_log_num = LastLogNum,
    time_utc = TimeUtc,
    size = Size
}) ->
    <<?LOG_ENTRY_ID:8,
      Id:16/little-unsigned-integer,
      NumLogs:16/little-unsigned-integer,
      LastLogNum:16/little-unsigned-integer,
      TimeUtc:32/little-unsigned-integer,
      Size:32/little-unsigned-integer>>.

%% @doc Decode LOG_ENTRY message from binary
-spec decode_log_entry(binary()) -> #log_entry{}.
decode_log_entry(<<?LOG_ENTRY_ID:8,
                   Id:16/little-unsigned-integer,
                   NumLogs:16/little-unsigned-integer,
                   LastLogNum:16/little-unsigned-integer,
                   TimeUtc:32/little-unsigned-integer,
                   Size:32/little-unsigned-integer>>) ->
    #log_entry{
        id = Id,
        num_logs = NumLogs,
        last_log_num = LastLogNum,
        time_utc = TimeUtc,
        size = Size
    }.

%% @doc Encode LOG_REQUEST_DATA message to binary
-spec encode_log_request_data(#log_request_data{}) -> binary().
encode_log_request_data(#log_request_data{
    target_system = TargetSystem,
    target_component = TargetComponent,
    id = Id,
    ofs = Ofs,
    count = Count
}) ->
    <<?LOG_REQUEST_DATA_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Id:16/little-unsigned-integer,
      Ofs:32/little-unsigned-integer,
      Count:32/little-unsigned-integer>>.

%% @doc Decode LOG_REQUEST_DATA message from binary
-spec decode_log_request_data(binary()) -> #log_request_data{}.
decode_log_request_data(<<?LOG_REQUEST_DATA_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Id:16/little-unsigned-integer,
                   Ofs:32/little-unsigned-integer,
                   Count:32/little-unsigned-integer>>) ->
    #log_request_data{
        target_system = TargetSystem,
        target_component = TargetComponent,
        id = Id,
        ofs = Ofs,
        count = Count
    }.

%% @doc Encode LOG_DATA message to binary
-spec encode_log_data(#log_data{}) -> binary().
encode_log_data(#log_data{
    id = Id,
    ofs = Ofs,
    count = Count,
    data = Data
}) ->
    <<?LOG_DATA_ID:8,
      Id:16/little-unsigned-integer,
      Ofs:32/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode LOG_DATA message from binary
-spec decode_log_data(binary()) -> #log_data{}.
decode_log_data(<<?LOG_DATA_ID:8,
                   Id:16/little-unsigned-integer,
                   Ofs:32/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #log_data{
        id = Id,
        ofs = Ofs,
        count = Count,
        data = Data
    }.

%% @doc Encode LOG_ERASE message to binary
-spec encode_log_erase(#log_erase{}) -> binary().
encode_log_erase(#log_erase{
    target_system = TargetSystem,
    target_component = TargetComponent
}) ->
    <<?LOG_ERASE_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer>>.

%% @doc Decode LOG_ERASE message from binary
-spec decode_log_erase(binary()) -> #log_erase{}.
decode_log_erase(<<?LOG_ERASE_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer>>) ->
    #log_erase{
        target_system = TargetSystem,
        target_component = TargetComponent
    }.

%% @doc Encode LOG_REQUEST_END message to binary
-spec encode_log_request_end(#log_request_end{}) -> binary().
encode_log_request_end(#log_request_end{
    target_system = TargetSystem,
    target_component = TargetComponent
}) ->
    <<?LOG_REQUEST_END_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer>>.

%% @doc Decode LOG_REQUEST_END message from binary
-spec decode_log_request_end(binary()) -> #log_request_end{}.
decode_log_request_end(<<?LOG_REQUEST_END_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer>>) ->
    #log_request_end{
        target_system = TargetSystem,
        target_component = TargetComponent
    }.

%% @doc Encode GPS_INJECT_DATA message to binary
-spec encode_gps_inject_data(#gps_inject_data{}) -> binary().
encode_gps_inject_data(#gps_inject_data{
    target_system = TargetSystem,
    target_component = TargetComponent,
    len = Len,
    data = Data
}) ->
    <<?GPS_INJECT_DATA_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Len:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode GPS_INJECT_DATA message from binary
-spec decode_gps_inject_data(binary()) -> #gps_inject_data{}.
decode_gps_inject_data(<<?GPS_INJECT_DATA_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Len:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #gps_inject_data{
        target_system = TargetSystem,
        target_component = TargetComponent,
        len = Len,
        data = Data
    }.

%% @doc Encode GPS2_RAW message to binary
-spec encode_gps2_raw(#gps2_raw{}) -> binary().
encode_gps2_raw(#gps2_raw{
    time_usec = TimeUsec,
    fix_type = FixType,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    eph = Eph,
    epv = Epv,
    vel = Vel,
    cog = Cog,
    satellites_visible = SatellitesVisible,
    dgps_numch = DgpsNumch,
    dgps_age = DgpsAge,
    yaw = Yaw,
    alt_ellipsoid = AltEllipsoid,
    h_acc = HAcc,
    v_acc = VAcc,
    vel_acc = VelAcc,
    hdg_acc = HdgAcc
}) ->
    <<?GPS2_RAW_ID:8,
      TimeUsec:64/little-unsigned-integer,
      FixType:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-signed-integer,
      Eph:16/little-unsigned-integer,
      Epv:16/little-unsigned-integer,
      Vel:16/little-unsigned-integer,
      Cog:16/little-unsigned-integer,
      SatellitesVisible:8/little-unsigned-integer,
      DgpsNumch:8/little-unsigned-integer,
      DgpsAge:32/little-unsigned-integer,
      Yaw:16/little-unsigned-integer,
      AltEllipsoid:32/little-signed-integer,
      HAcc:32/little-unsigned-integer,
      VAcc:32/little-unsigned-integer,
      VelAcc:32/little-unsigned-integer,
      HdgAcc:32/little-unsigned-integer>>.

%% @doc Decode GPS2_RAW message from binary
-spec decode_gps2_raw(binary()) -> #gps2_raw{}.
decode_gps2_raw(<<?GPS2_RAW_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   FixType:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-signed-integer,
                   Eph:16/little-unsigned-integer,
                   Epv:16/little-unsigned-integer,
                   Vel:16/little-unsigned-integer,
                   Cog:16/little-unsigned-integer,
                   SatellitesVisible:8/little-unsigned-integer,
                   DgpsNumch:8/little-unsigned-integer,
                   DgpsAge:32/little-unsigned-integer,
                   Yaw:16/little-unsigned-integer,
                   AltEllipsoid:32/little-signed-integer,
                   HAcc:32/little-unsigned-integer,
                   VAcc:32/little-unsigned-integer,
                   VelAcc:32/little-unsigned-integer,
                   HdgAcc:32/little-unsigned-integer>>) ->
    #gps2_raw{
        time_usec = TimeUsec,
        fix_type = FixType,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        eph = Eph,
        epv = Epv,
        vel = Vel,
        cog = Cog,
        satellites_visible = SatellitesVisible,
        dgps_numch = DgpsNumch,
        dgps_age = DgpsAge,
        yaw = Yaw,
        alt_ellipsoid = AltEllipsoid,
        h_acc = HAcc,
        v_acc = VAcc,
        vel_acc = VelAcc,
        hdg_acc = HdgAcc
    }.

%% @doc Encode POWER_STATUS message to binary
-spec encode_power_status(#power_status{}) -> binary().
encode_power_status(#power_status{
    vcc = Vcc,
    vservo = Vservo,
    flags = Flags
}) ->
    <<?POWER_STATUS_ID:8,
      Vcc:16/little-unsigned-integer,
      Vservo:16/little-unsigned-integer,
      Flags:16/little-unsigned-integer>>.

%% @doc Decode POWER_STATUS message from binary
-spec decode_power_status(binary()) -> #power_status{}.
decode_power_status(<<?POWER_STATUS_ID:8,
                   Vcc:16/little-unsigned-integer,
                   Vservo:16/little-unsigned-integer,
                   Flags:16/little-unsigned-integer>>) ->
    #power_status{
        vcc = Vcc,
        vservo = Vservo,
        flags = Flags
    }.

%% @doc Encode SERIAL_CONTROL message to binary
-spec encode_serial_control(#serial_control{}) -> binary().
encode_serial_control(#serial_control{
    device = Device,
    flags = Flags,
    timeout = Timeout,
    baudrate = Baudrate,
    count = Count,
    data = Data,
    target_system = TargetSystem,
    target_component = TargetComponent
}) ->
    <<?SERIAL_CONTROL_ID:8,
      Device:8/little-unsigned-integer,
      Flags:8/little-unsigned-integer,
      Timeout:16/little-unsigned-integer,
      Baudrate:32/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      Data:8/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer>>.

%% @doc Decode SERIAL_CONTROL message from binary
-spec decode_serial_control(binary()) -> #serial_control{}.
decode_serial_control(<<?SERIAL_CONTROL_ID:8,
                   Device:8/little-unsigned-integer,
                   Flags:8/little-unsigned-integer,
                   Timeout:16/little-unsigned-integer,
                   Baudrate:32/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer>>) ->
    #serial_control{
        device = Device,
        flags = Flags,
        timeout = Timeout,
        baudrate = Baudrate,
        count = Count,
        data = Data,
        target_system = TargetSystem,
        target_component = TargetComponent
    }.

%% @doc Encode GPS_RTK message to binary
-spec encode_gps_rtk(#gps_rtk{}) -> binary().
encode_gps_rtk(#gps_rtk{
    time_last_baseline_ms = TimeLastBaselineMs,
    rtk_receiver_id = RtkReceiverId,
    wn = Wn,
    tow = Tow,
    rtk_health = RtkHealth,
    rtk_rate = RtkRate,
    nsats = Nsats,
    baseline_coords_type = BaselineCoordsType,
    baseline_a_mm = BaselineAMm,
    baseline_b_mm = BaselineBMm,
    baseline_c_mm = BaselineCMm,
    accuracy = Accuracy,
    iar_num_hypotheses = IarNumHypotheses
}) ->
    <<?GPS_RTK_ID:8,
      TimeLastBaselineMs:32/little-unsigned-integer,
      RtkReceiverId:8/little-unsigned-integer,
      Wn:16/little-unsigned-integer,
      Tow:32/little-unsigned-integer,
      RtkHealth:8/little-unsigned-integer,
      RtkRate:8/little-unsigned-integer,
      Nsats:8/little-unsigned-integer,
      BaselineCoordsType:8/little-unsigned-integer,
      BaselineAMm:32/little-signed-integer,
      BaselineBMm:32/little-signed-integer,
      BaselineCMm:32/little-signed-integer,
      Accuracy:32/little-unsigned-integer,
      IarNumHypotheses:32/little-signed-integer>>.

%% @doc Decode GPS_RTK message from binary
-spec decode_gps_rtk(binary()) -> #gps_rtk{}.
decode_gps_rtk(<<?GPS_RTK_ID:8,
                   TimeLastBaselineMs:32/little-unsigned-integer,
                   RtkReceiverId:8/little-unsigned-integer,
                   Wn:16/little-unsigned-integer,
                   Tow:32/little-unsigned-integer,
                   RtkHealth:8/little-unsigned-integer,
                   RtkRate:8/little-unsigned-integer,
                   Nsats:8/little-unsigned-integer,
                   BaselineCoordsType:8/little-unsigned-integer,
                   BaselineAMm:32/little-signed-integer,
                   BaselineBMm:32/little-signed-integer,
                   BaselineCMm:32/little-signed-integer,
                   Accuracy:32/little-unsigned-integer,
                   IarNumHypotheses:32/little-signed-integer>>) ->
    #gps_rtk{
        time_last_baseline_ms = TimeLastBaselineMs,
        rtk_receiver_id = RtkReceiverId,
        wn = Wn,
        tow = Tow,
        rtk_health = RtkHealth,
        rtk_rate = RtkRate,
        nsats = Nsats,
        baseline_coords_type = BaselineCoordsType,
        baseline_a_mm = BaselineAMm,
        baseline_b_mm = BaselineBMm,
        baseline_c_mm = BaselineCMm,
        accuracy = Accuracy,
        iar_num_hypotheses = IarNumHypotheses
    }.

%% @doc Encode GPS2_RTK message to binary
-spec encode_gps2_rtk(#gps2_rtk{}) -> binary().
encode_gps2_rtk(#gps2_rtk{
    time_last_baseline_ms = TimeLastBaselineMs,
    rtk_receiver_id = RtkReceiverId,
    wn = Wn,
    tow = Tow,
    rtk_health = RtkHealth,
    rtk_rate = RtkRate,
    nsats = Nsats,
    baseline_coords_type = BaselineCoordsType,
    baseline_a_mm = BaselineAMm,
    baseline_b_mm = BaselineBMm,
    baseline_c_mm = BaselineCMm,
    accuracy = Accuracy,
    iar_num_hypotheses = IarNumHypotheses
}) ->
    <<?GPS2_RTK_ID:8,
      TimeLastBaselineMs:32/little-unsigned-integer,
      RtkReceiverId:8/little-unsigned-integer,
      Wn:16/little-unsigned-integer,
      Tow:32/little-unsigned-integer,
      RtkHealth:8/little-unsigned-integer,
      RtkRate:8/little-unsigned-integer,
      Nsats:8/little-unsigned-integer,
      BaselineCoordsType:8/little-unsigned-integer,
      BaselineAMm:32/little-signed-integer,
      BaselineBMm:32/little-signed-integer,
      BaselineCMm:32/little-signed-integer,
      Accuracy:32/little-unsigned-integer,
      IarNumHypotheses:32/little-signed-integer>>.

%% @doc Decode GPS2_RTK message from binary
-spec decode_gps2_rtk(binary()) -> #gps2_rtk{}.
decode_gps2_rtk(<<?GPS2_RTK_ID:8,
                   TimeLastBaselineMs:32/little-unsigned-integer,
                   RtkReceiverId:8/little-unsigned-integer,
                   Wn:16/little-unsigned-integer,
                   Tow:32/little-unsigned-integer,
                   RtkHealth:8/little-unsigned-integer,
                   RtkRate:8/little-unsigned-integer,
                   Nsats:8/little-unsigned-integer,
                   BaselineCoordsType:8/little-unsigned-integer,
                   BaselineAMm:32/little-signed-integer,
                   BaselineBMm:32/little-signed-integer,
                   BaselineCMm:32/little-signed-integer,
                   Accuracy:32/little-unsigned-integer,
                   IarNumHypotheses:32/little-signed-integer>>) ->
    #gps2_rtk{
        time_last_baseline_ms = TimeLastBaselineMs,
        rtk_receiver_id = RtkReceiverId,
        wn = Wn,
        tow = Tow,
        rtk_health = RtkHealth,
        rtk_rate = RtkRate,
        nsats = Nsats,
        baseline_coords_type = BaselineCoordsType,
        baseline_a_mm = BaselineAMm,
        baseline_b_mm = BaselineBMm,
        baseline_c_mm = BaselineCMm,
        accuracy = Accuracy,
        iar_num_hypotheses = IarNumHypotheses
    }.

%% @doc Encode SCALED_IMU3 message to binary
-spec encode_scaled_imu3(#scaled_imu3{}) -> binary().
encode_scaled_imu3(#scaled_imu3{
    time_boot_ms = TimeBootMs,
    xacc = Xacc,
    yacc = Yacc,
    zacc = Zacc,
    xgyro = Xgyro,
    ygyro = Ygyro,
    zgyro = Zgyro,
    xmag = Xmag,
    ymag = Ymag,
    zmag = Zmag,
    temperature = Temperature
}) ->
    <<?SCALED_IMU3_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Xacc:16/little-signed-integer,
      Yacc:16/little-signed-integer,
      Zacc:16/little-signed-integer,
      Xgyro:16/little-signed-integer,
      Ygyro:16/little-signed-integer,
      Zgyro:16/little-signed-integer,
      Xmag:16/little-signed-integer,
      Ymag:16/little-signed-integer,
      Zmag:16/little-signed-integer,
      Temperature:16/little-signed-integer>>.

%% @doc Decode SCALED_IMU3 message from binary
-spec decode_scaled_imu3(binary()) -> #scaled_imu3{}.
decode_scaled_imu3(<<?SCALED_IMU3_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Xacc:16/little-signed-integer,
                   Yacc:16/little-signed-integer,
                   Zacc:16/little-signed-integer,
                   Xgyro:16/little-signed-integer,
                   Ygyro:16/little-signed-integer,
                   Zgyro:16/little-signed-integer,
                   Xmag:16/little-signed-integer,
                   Ymag:16/little-signed-integer,
                   Zmag:16/little-signed-integer,
                   Temperature:16/little-signed-integer>>) ->
    #scaled_imu3{
        time_boot_ms = TimeBootMs,
        xacc = Xacc,
        yacc = Yacc,
        zacc = Zacc,
        xgyro = Xgyro,
        ygyro = Ygyro,
        zgyro = Zgyro,
        xmag = Xmag,
        ymag = Ymag,
        zmag = Zmag,
        temperature = Temperature
    }.

%% @doc Encode DATA_TRANSMISSION_HANDSHAKE message to binary
-spec encode_data_transmission_handshake(#data_transmission_handshake{}) -> binary().
encode_data_transmission_handshake(#data_transmission_handshake{
    type = Type,
    size = Size,
    width = Width,
    height = Height,
    packets = Packets,
    payload = Payload,
    jpg_quality = JpgQuality
}) ->
    <<?DATA_TRANSMISSION_HANDSHAKE_ID:8,
      Type:8/little-unsigned-integer,
      Size:32/little-unsigned-integer,
      Width:16/little-unsigned-integer,
      Height:16/little-unsigned-integer,
      Packets:16/little-unsigned-integer,
      Payload:8/little-unsigned-integer,
      JpgQuality:8/little-unsigned-integer>>.

%% @doc Decode DATA_TRANSMISSION_HANDSHAKE message from binary
-spec decode_data_transmission_handshake(binary()) -> #data_transmission_handshake{}.
decode_data_transmission_handshake(<<?DATA_TRANSMISSION_HANDSHAKE_ID:8,
                   Type:8/little-unsigned-integer,
                   Size:32/little-unsigned-integer,
                   Width:16/little-unsigned-integer,
                   Height:16/little-unsigned-integer,
                   Packets:16/little-unsigned-integer,
                   Payload:8/little-unsigned-integer,
                   JpgQuality:8/little-unsigned-integer>>) ->
    #data_transmission_handshake{
        type = Type,
        size = Size,
        width = Width,
        height = Height,
        packets = Packets,
        payload = Payload,
        jpg_quality = JpgQuality
    }.

%% @doc Encode ENCAPSULATED_DATA message to binary
-spec encode_encapsulated_data(#encapsulated_data{}) -> binary().
encode_encapsulated_data(#encapsulated_data{
    seqnr = Seqnr,
    data = Data
}) ->
    <<?ENCAPSULATED_DATA_ID:8,
      Seqnr:16/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode ENCAPSULATED_DATA message from binary
-spec decode_encapsulated_data(binary()) -> #encapsulated_data{}.
decode_encapsulated_data(<<?ENCAPSULATED_DATA_ID:8,
                   Seqnr:16/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #encapsulated_data{
        seqnr = Seqnr,
        data = Data
    }.

%% @doc Encode DISTANCE_SENSOR message to binary
-spec encode_distance_sensor(#distance_sensor{}) -> binary().
encode_distance_sensor(#distance_sensor{
    time_boot_ms = TimeBootMs,
    min_distance = MinDistance,
    max_distance = MaxDistance,
    current_distance = CurrentDistance,
    type = Type,
    id = Id,
    orientation = Orientation,
    covariance = Covariance,
    horizontal_fov = HorizontalFov,
    vertical_fov = VerticalFov,
    quaternion = Quaternion,
    signal_quality = SignalQuality
}) ->
    <<?DISTANCE_SENSOR_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      MinDistance:16/little-unsigned-integer,
      MaxDistance:16/little-unsigned-integer,
      CurrentDistance:16/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      Orientation:8/little-unsigned-integer,
      Covariance:8/little-unsigned-integer,
      HorizontalFov:32/little-float,
      VerticalFov:32/little-float,
      Quaternion:32/little-float,
      SignalQuality:8/little-unsigned-integer>>.

%% @doc Decode DISTANCE_SENSOR message from binary
-spec decode_distance_sensor(binary()) -> #distance_sensor{}.
decode_distance_sensor(<<?DISTANCE_SENSOR_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   MinDistance:16/little-unsigned-integer,
                   MaxDistance:16/little-unsigned-integer,
                   CurrentDistance:16/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   Orientation:8/little-unsigned-integer,
                   Covariance:8/little-unsigned-integer,
                   HorizontalFov:32/little-float,
                   VerticalFov:32/little-float,
                   Quaternion:32/little-float,
                   SignalQuality:8/little-unsigned-integer>>) ->
    #distance_sensor{
        time_boot_ms = TimeBootMs,
        min_distance = MinDistance,
        max_distance = MaxDistance,
        current_distance = CurrentDistance,
        type = Type,
        id = Id,
        orientation = Orientation,
        covariance = Covariance,
        horizontal_fov = HorizontalFov,
        vertical_fov = VerticalFov,
        quaternion = Quaternion,
        signal_quality = SignalQuality
    }.

%% @doc Encode TERRAIN_REQUEST message to binary
-spec encode_terrain_request(#terrain_request{}) -> binary().
encode_terrain_request(#terrain_request{
    lat = Lat,
    lon = Lon,
    grid_spacing = GridSpacing,
    mask = Mask
}) ->
    <<?TERRAIN_REQUEST_ID:8,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      GridSpacing:16/little-unsigned-integer,
      Mask:64/little-unsigned-integer>>.

%% @doc Decode TERRAIN_REQUEST message from binary
-spec decode_terrain_request(binary()) -> #terrain_request{}.
decode_terrain_request(<<?TERRAIN_REQUEST_ID:8,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   GridSpacing:16/little-unsigned-integer,
                   Mask:64/little-unsigned-integer>>) ->
    #terrain_request{
        lat = Lat,
        lon = Lon,
        grid_spacing = GridSpacing,
        mask = Mask
    }.

%% @doc Encode TERRAIN_DATA message to binary
-spec encode_terrain_data(#terrain_data{}) -> binary().
encode_terrain_data(#terrain_data{
    lat = Lat,
    lon = Lon,
    grid_spacing = GridSpacing,
    gridbit = Gridbit,
    data = Data
}) ->
    <<?TERRAIN_DATA_ID:8,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      GridSpacing:16/little-unsigned-integer,
      Gridbit:8/little-unsigned-integer,
      Data:16/little-signed-integer>>.

%% @doc Decode TERRAIN_DATA message from binary
-spec decode_terrain_data(binary()) -> #terrain_data{}.
decode_terrain_data(<<?TERRAIN_DATA_ID:8,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   GridSpacing:16/little-unsigned-integer,
                   Gridbit:8/little-unsigned-integer,
                   Data:16/little-signed-integer>>) ->
    #terrain_data{
        lat = Lat,
        lon = Lon,
        grid_spacing = GridSpacing,
        gridbit = Gridbit,
        data = Data
    }.

%% @doc Encode TERRAIN_CHECK message to binary
-spec encode_terrain_check(#terrain_check{}) -> binary().
encode_terrain_check(#terrain_check{
    lat = Lat,
    lon = Lon
}) ->
    <<?TERRAIN_CHECK_ID:8,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer>>.

%% @doc Decode TERRAIN_CHECK message from binary
-spec decode_terrain_check(binary()) -> #terrain_check{}.
decode_terrain_check(<<?TERRAIN_CHECK_ID:8,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer>>) ->
    #terrain_check{
        lat = Lat,
        lon = Lon
    }.

%% @doc Encode TERRAIN_REPORT message to binary
-spec encode_terrain_report(#terrain_report{}) -> binary().
encode_terrain_report(#terrain_report{
    lat = Lat,
    lon = Lon,
    spacing = Spacing,
    terrain_height = TerrainHeight,
    current_height = CurrentHeight,
    pending = Pending,
    loaded = Loaded
}) ->
    <<?TERRAIN_REPORT_ID:8,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Spacing:16/little-unsigned-integer,
      TerrainHeight:32/little-float,
      CurrentHeight:32/little-float,
      Pending:16/little-unsigned-integer,
      Loaded:16/little-unsigned-integer>>.

%% @doc Decode TERRAIN_REPORT message from binary
-spec decode_terrain_report(binary()) -> #terrain_report{}.
decode_terrain_report(<<?TERRAIN_REPORT_ID:8,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Spacing:16/little-unsigned-integer,
                   TerrainHeight:32/little-float,
                   CurrentHeight:32/little-float,
                   Pending:16/little-unsigned-integer,
                   Loaded:16/little-unsigned-integer>>) ->
    #terrain_report{
        lat = Lat,
        lon = Lon,
        spacing = Spacing,
        terrain_height = TerrainHeight,
        current_height = CurrentHeight,
        pending = Pending,
        loaded = Loaded
    }.

%% @doc Encode SCALED_PRESSURE2 message to binary
-spec encode_scaled_pressure2(#scaled_pressure2{}) -> binary().
encode_scaled_pressure2(#scaled_pressure2{
    time_boot_ms = TimeBootMs,
    press_abs = PressAbs,
    press_diff = PressDiff,
    temperature = Temperature,
    temperature_press_diff = TemperaturePressDiff
}) ->
    <<?SCALED_PRESSURE2_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      PressAbs:32/little-float,
      PressDiff:32/little-float,
      Temperature:16/little-signed-integer,
      TemperaturePressDiff:16/little-signed-integer>>.

%% @doc Decode SCALED_PRESSURE2 message from binary
-spec decode_scaled_pressure2(binary()) -> #scaled_pressure2{}.
decode_scaled_pressure2(<<?SCALED_PRESSURE2_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   PressAbs:32/little-float,
                   PressDiff:32/little-float,
                   Temperature:16/little-signed-integer,
                   TemperaturePressDiff:16/little-signed-integer>>) ->
    #scaled_pressure2{
        time_boot_ms = TimeBootMs,
        press_abs = PressAbs,
        press_diff = PressDiff,
        temperature = Temperature,
        temperature_press_diff = TemperaturePressDiff
    }.

%% @doc Encode ATT_POS_MOCAP message to binary
-spec encode_att_pos_mocap(#att_pos_mocap{}) -> binary().
encode_att_pos_mocap(#att_pos_mocap{
    time_usec = TimeUsec,
    q = Q,
    x = X,
    y = Y,
    z = Z,
    covariance = Covariance
}) ->
    <<?ATT_POS_MOCAP_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Q:32/little-float,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Covariance:32/little-float>>.

%% @doc Decode ATT_POS_MOCAP message from binary
-spec decode_att_pos_mocap(binary()) -> #att_pos_mocap{}.
decode_att_pos_mocap(<<?ATT_POS_MOCAP_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Q:32/little-float,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Covariance:32/little-float>>) ->
    #att_pos_mocap{
        time_usec = TimeUsec,
        q = Q,
        x = X,
        y = Y,
        z = Z,
        covariance = Covariance
    }.

%% @doc Encode SET_ACTUATOR_CONTROL_TARGET message to binary
-spec encode_set_actuator_control_target(#set_actuator_control_target{}) -> binary().
encode_set_actuator_control_target(#set_actuator_control_target{
    time_usec = TimeUsec,
    group_mlx = GroupMlx,
    target_system = TargetSystem,
    target_component = TargetComponent,
    controls = Controls
}) ->
    <<?SET_ACTUATOR_CONTROL_TARGET_ID:8,
      TimeUsec:64/little-unsigned-integer,
      GroupMlx:8/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Controls:32/little-float>>.

%% @doc Decode SET_ACTUATOR_CONTROL_TARGET message from binary
-spec decode_set_actuator_control_target(binary()) -> #set_actuator_control_target{}.
decode_set_actuator_control_target(<<?SET_ACTUATOR_CONTROL_TARGET_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   GroupMlx:8/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Controls:32/little-float>>) ->
    #set_actuator_control_target{
        time_usec = TimeUsec,
        group_mlx = GroupMlx,
        target_system = TargetSystem,
        target_component = TargetComponent,
        controls = Controls
    }.

%% @doc Encode ACTUATOR_CONTROL_TARGET message to binary
-spec encode_actuator_control_target(#actuator_control_target{}) -> binary().
encode_actuator_control_target(#actuator_control_target{
    time_usec = TimeUsec,
    group_mlx = GroupMlx,
    controls = Controls
}) ->
    <<?ACTUATOR_CONTROL_TARGET_ID:8,
      TimeUsec:64/little-unsigned-integer,
      GroupMlx:8/little-unsigned-integer,
      Controls:32/little-float>>.

%% @doc Decode ACTUATOR_CONTROL_TARGET message from binary
-spec decode_actuator_control_target(binary()) -> #actuator_control_target{}.
decode_actuator_control_target(<<?ACTUATOR_CONTROL_TARGET_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   GroupMlx:8/little-unsigned-integer,
                   Controls:32/little-float>>) ->
    #actuator_control_target{
        time_usec = TimeUsec,
        group_mlx = GroupMlx,
        controls = Controls
    }.

%% @doc Encode ALTITUDE message to binary
-spec encode_altitude(#altitude{}) -> binary().
encode_altitude(#altitude{
    time_usec = TimeUsec,
    altitude_monotonic = AltitudeMonotonic,
    altitude_amsl = AltitudeAmsl,
    altitude_local = AltitudeLocal,
    altitude_relative = AltitudeRelative,
    altitude_terrain = AltitudeTerrain,
    bottom_clearance = BottomClearance
}) ->
    <<?ALTITUDE_ID:8,
      TimeUsec:64/little-unsigned-integer,
      AltitudeMonotonic:32/little-float,
      AltitudeAmsl:32/little-float,
      AltitudeLocal:32/little-float,
      AltitudeRelative:32/little-float,
      AltitudeTerrain:32/little-float,
      BottomClearance:32/little-float>>.

%% @doc Decode ALTITUDE message from binary
-spec decode_altitude(binary()) -> #altitude{}.
decode_altitude(<<?ALTITUDE_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   AltitudeMonotonic:32/little-float,
                   AltitudeAmsl:32/little-float,
                   AltitudeLocal:32/little-float,
                   AltitudeRelative:32/little-float,
                   AltitudeTerrain:32/little-float,
                   BottomClearance:32/little-float>>) ->
    #altitude{
        time_usec = TimeUsec,
        altitude_monotonic = AltitudeMonotonic,
        altitude_amsl = AltitudeAmsl,
        altitude_local = AltitudeLocal,
        altitude_relative = AltitudeRelative,
        altitude_terrain = AltitudeTerrain,
        bottom_clearance = BottomClearance
    }.

%% @doc Encode RESOURCE_REQUEST message to binary
-spec encode_resource_request(#resource_request{}) -> binary().
encode_resource_request(#resource_request{
    request_id = RequestId,
    uri_type = UriType,
    uri = Uri,
    transfer_type = TransferType,
    storage = Storage
}) ->
    <<?RESOURCE_REQUEST_ID:8,
      RequestId:8/little-unsigned-integer,
      UriType:8/little-unsigned-integer,
      Uri:8/little-unsigned-integer,
      TransferType:8/little-unsigned-integer,
      Storage:8/little-unsigned-integer>>.

%% @doc Decode RESOURCE_REQUEST message from binary
-spec decode_resource_request(binary()) -> #resource_request{}.
decode_resource_request(<<?RESOURCE_REQUEST_ID:8,
                   RequestId:8/little-unsigned-integer,
                   UriType:8/little-unsigned-integer,
                   Uri:8/little-unsigned-integer,
                   TransferType:8/little-unsigned-integer,
                   Storage:8/little-unsigned-integer>>) ->
    #resource_request{
        request_id = RequestId,
        uri_type = UriType,
        uri = Uri,
        transfer_type = TransferType,
        storage = Storage
    }.

%% @doc Encode SCALED_PRESSURE3 message to binary
-spec encode_scaled_pressure3(#scaled_pressure3{}) -> binary().
encode_scaled_pressure3(#scaled_pressure3{
    time_boot_ms = TimeBootMs,
    press_abs = PressAbs,
    press_diff = PressDiff,
    temperature = Temperature,
    temperature_press_diff = TemperaturePressDiff
}) ->
    <<?SCALED_PRESSURE3_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      PressAbs:32/little-float,
      PressDiff:32/little-float,
      Temperature:16/little-signed-integer,
      TemperaturePressDiff:16/little-signed-integer>>.

%% @doc Decode SCALED_PRESSURE3 message from binary
-spec decode_scaled_pressure3(binary()) -> #scaled_pressure3{}.
decode_scaled_pressure3(<<?SCALED_PRESSURE3_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   PressAbs:32/little-float,
                   PressDiff:32/little-float,
                   Temperature:16/little-signed-integer,
                   TemperaturePressDiff:16/little-signed-integer>>) ->
    #scaled_pressure3{
        time_boot_ms = TimeBootMs,
        press_abs = PressAbs,
        press_diff = PressDiff,
        temperature = Temperature,
        temperature_press_diff = TemperaturePressDiff
    }.

%% @doc Encode FOLLOW_TARGET message to binary
-spec encode_follow_target(#follow_target{}) -> binary().
encode_follow_target(#follow_target{
    timestamp = Timestamp,
    est_capabilities = EstCapabilities,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    vel = Vel,
    acc = Acc,
    attitude_q = AttitudeQ,
    rates = Rates,
    position_cov = PositionCov,
    custom_state = CustomState
}) ->
    <<?FOLLOW_TARGET_ID:8,
      Timestamp:64/little-unsigned-integer,
      EstCapabilities:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-float,
      Vel:32/little-float,
      Acc:32/little-float,
      AttitudeQ:32/little-float,
      Rates:32/little-float,
      PositionCov:32/little-float,
      CustomState:64/little-unsigned-integer>>.

%% @doc Decode FOLLOW_TARGET message from binary
-spec decode_follow_target(binary()) -> #follow_target{}.
decode_follow_target(<<?FOLLOW_TARGET_ID:8,
                   Timestamp:64/little-unsigned-integer,
                   EstCapabilities:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-float,
                   Vel:32/little-float,
                   Acc:32/little-float,
                   AttitudeQ:32/little-float,
                   Rates:32/little-float,
                   PositionCov:32/little-float,
                   CustomState:64/little-unsigned-integer>>) ->
    #follow_target{
        timestamp = Timestamp,
        est_capabilities = EstCapabilities,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        vel = Vel,
        acc = Acc,
        attitude_q = AttitudeQ,
        rates = Rates,
        position_cov = PositionCov,
        custom_state = CustomState
    }.

%% @doc Encode CONTROL_SYSTEM_STATE message to binary
-spec encode_control_system_state(#control_system_state{}) -> binary().
encode_control_system_state(#control_system_state{
    time_usec = TimeUsec,
    x_acc = XAcc,
    y_acc = YAcc,
    z_acc = ZAcc,
    x_vel = XVel,
    y_vel = YVel,
    z_vel = ZVel,
    x_pos = XPos,
    y_pos = YPos,
    z_pos = ZPos,
    airspeed = Airspeed,
    vel_variance = VelVariance,
    pos_variance = PosVariance,
    q = Q,
    roll_rate = RollRate,
    pitch_rate = PitchRate,
    yaw_rate = YawRate
}) ->
    <<?CONTROL_SYSTEM_STATE_ID:8,
      TimeUsec:64/little-unsigned-integer,
      XAcc:32/little-float,
      YAcc:32/little-float,
      ZAcc:32/little-float,
      XVel:32/little-float,
      YVel:32/little-float,
      ZVel:32/little-float,
      XPos:32/little-float,
      YPos:32/little-float,
      ZPos:32/little-float,
      Airspeed:32/little-float,
      VelVariance:32/little-float,
      PosVariance:32/little-float,
      Q:32/little-float,
      RollRate:32/little-float,
      PitchRate:32/little-float,
      YawRate:32/little-float>>.

%% @doc Decode CONTROL_SYSTEM_STATE message from binary
-spec decode_control_system_state(binary()) -> #control_system_state{}.
decode_control_system_state(<<?CONTROL_SYSTEM_STATE_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   XAcc:32/little-float,
                   YAcc:32/little-float,
                   ZAcc:32/little-float,
                   XVel:32/little-float,
                   YVel:32/little-float,
                   ZVel:32/little-float,
                   XPos:32/little-float,
                   YPos:32/little-float,
                   ZPos:32/little-float,
                   Airspeed:32/little-float,
                   VelVariance:32/little-float,
                   PosVariance:32/little-float,
                   Q:32/little-float,
                   RollRate:32/little-float,
                   PitchRate:32/little-float,
                   YawRate:32/little-float>>) ->
    #control_system_state{
        time_usec = TimeUsec,
        x_acc = XAcc,
        y_acc = YAcc,
        z_acc = ZAcc,
        x_vel = XVel,
        y_vel = YVel,
        z_vel = ZVel,
        x_pos = XPos,
        y_pos = YPos,
        z_pos = ZPos,
        airspeed = Airspeed,
        vel_variance = VelVariance,
        pos_variance = PosVariance,
        q = Q,
        roll_rate = RollRate,
        pitch_rate = PitchRate,
        yaw_rate = YawRate
    }.

%% @doc Encode BATTERY_STATUS message to binary
-spec encode_battery_status(#battery_status{}) -> binary().
encode_battery_status(#battery_status{
    id = Id,
    battery_function = BatteryFunction,
    type = Type,
    temperature = Temperature,
    voltages = Voltages,
    current_battery = CurrentBattery,
    current_consumed = CurrentConsumed,
    energy_consumed = EnergyConsumed,
    battery_remaining = BatteryRemaining,
    time_remaining = TimeRemaining,
    charge_state = ChargeState,
    voltages_ext = VoltagesExt,
    mode = Mode,
    fault_bitmask = FaultBitmask
}) ->
    <<?BATTERY_STATUS_ID:8,
      Id:8/little-unsigned-integer,
      BatteryFunction:8/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      Temperature:16/little-signed-integer,
      Voltages:16/little-unsigned-integer,
      CurrentBattery:16/little-signed-integer,
      CurrentConsumed:32/little-signed-integer,
      EnergyConsumed:32/little-signed-integer,
      BatteryRemaining:8/little-signed-integer,
      TimeRemaining:32/little-signed-integer,
      ChargeState:8/little-unsigned-integer,
      VoltagesExt:16/little-unsigned-integer,
      Mode:8/little-unsigned-integer,
      FaultBitmask:32/little-unsigned-integer>>.

%% @doc Decode BATTERY_STATUS message from binary
-spec decode_battery_status(binary()) -> #battery_status{}.
decode_battery_status(<<?BATTERY_STATUS_ID:8,
                   Id:8/little-unsigned-integer,
                   BatteryFunction:8/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   Temperature:16/little-signed-integer,
                   Voltages:16/little-unsigned-integer,
                   CurrentBattery:16/little-signed-integer,
                   CurrentConsumed:32/little-signed-integer,
                   EnergyConsumed:32/little-signed-integer,
                   BatteryRemaining:8/little-signed-integer,
                   TimeRemaining:32/little-signed-integer,
                   ChargeState:8/little-unsigned-integer,
                   VoltagesExt:16/little-unsigned-integer,
                   Mode:8/little-unsigned-integer,
                   FaultBitmask:32/little-unsigned-integer>>) ->
    #battery_status{
        id = Id,
        battery_function = BatteryFunction,
        type = Type,
        temperature = Temperature,
        voltages = Voltages,
        current_battery = CurrentBattery,
        current_consumed = CurrentConsumed,
        energy_consumed = EnergyConsumed,
        battery_remaining = BatteryRemaining,
        time_remaining = TimeRemaining,
        charge_state = ChargeState,
        voltages_ext = VoltagesExt,
        mode = Mode,
        fault_bitmask = FaultBitmask
    }.

%% @doc Encode LANDING_TARGET message to binary
-spec encode_landing_target(#landing_target{}) -> binary().
encode_landing_target(#landing_target{
    time_usec = TimeUsec,
    target_num = TargetNum,
    frame = Frame,
    angle_x = AngleX,
    angle_y = AngleY,
    distance = Distance,
    size_x = SizeX,
    size_y = SizeY,
    x = X,
    y = Y,
    z = Z,
    q = Q,
    type = Type,
    position_valid = PositionValid
}) ->
    <<?LANDING_TARGET_ID:8,
      TimeUsec:64/little-unsigned-integer,
      TargetNum:8/little-unsigned-integer,
      Frame:8/little-unsigned-integer,
      AngleX:32/little-float,
      AngleY:32/little-float,
      Distance:32/little-float,
      SizeX:32/little-float,
      SizeY:32/little-float,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Q:32/little-float,
      Type:8/little-unsigned-integer,
      PositionValid:8/little-unsigned-integer>>.

%% @doc Decode LANDING_TARGET message from binary
-spec decode_landing_target(binary()) -> #landing_target{}.
decode_landing_target(<<?LANDING_TARGET_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   TargetNum:8/little-unsigned-integer,
                   Frame:8/little-unsigned-integer,
                   AngleX:32/little-float,
                   AngleY:32/little-float,
                   Distance:32/little-float,
                   SizeX:32/little-float,
                   SizeY:32/little-float,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Q:32/little-float,
                   Type:8/little-unsigned-integer,
                   PositionValid:8/little-unsigned-integer>>) ->
    #landing_target{
        time_usec = TimeUsec,
        target_num = TargetNum,
        frame = Frame,
        angle_x = AngleX,
        angle_y = AngleY,
        distance = Distance,
        size_x = SizeX,
        size_y = SizeY,
        x = X,
        y = Y,
        z = Z,
        q = Q,
        type = Type,
        position_valid = PositionValid
    }.

%% @doc Encode FENCE_STATUS message to binary
-spec encode_fence_status(#fence_status{}) -> binary().
encode_fence_status(#fence_status{
    breach_status = BreachStatus,
    breach_count = BreachCount,
    breach_type = BreachType,
    breach_time = BreachTime,
    breach_mitigation = BreachMitigation
}) ->
    <<?FENCE_STATUS_ID:8,
      BreachStatus:8/little-unsigned-integer,
      BreachCount:16/little-unsigned-integer,
      BreachType:8/little-unsigned-integer,
      BreachTime:32/little-unsigned-integer,
      BreachMitigation:8/little-unsigned-integer>>.

%% @doc Decode FENCE_STATUS message from binary
-spec decode_fence_status(binary()) -> #fence_status{}.
decode_fence_status(<<?FENCE_STATUS_ID:8,
                   BreachStatus:8/little-unsigned-integer,
                   BreachCount:16/little-unsigned-integer,
                   BreachType:8/little-unsigned-integer,
                   BreachTime:32/little-unsigned-integer,
                   BreachMitigation:8/little-unsigned-integer>>) ->
    #fence_status{
        breach_status = BreachStatus,
        breach_count = BreachCount,
        breach_type = BreachType,
        breach_time = BreachTime,
        breach_mitigation = BreachMitigation
    }.

%% @doc Encode MAG_CAL_REPORT message to binary
-spec encode_mag_cal_report(#mag_cal_report{}) -> binary().
encode_mag_cal_report(#mag_cal_report{
    compass_id = CompassId,
    cal_mask = CalMask,
    cal_status = CalStatus,
    autosaved = Autosaved,
    fitness = Fitness,
    ofs_x = OfsX,
    ofs_y = OfsY,
    ofs_z = OfsZ,
    diag_x = DiagX,
    diag_y = DiagY,
    diag_z = DiagZ,
    offdiag_x = OffdiagX,
    offdiag_y = OffdiagY,
    offdiag_z = OffdiagZ,
    orientation_confidence = OrientationConfidence,
    old_orientation = OldOrientation,
    new_orientation = NewOrientation,
    scale_factor = ScaleFactor
}) ->
    <<?MAG_CAL_REPORT_ID:8,
      CompassId:8/little-unsigned-integer,
      CalMask:8/little-unsigned-integer,
      CalStatus:8/little-unsigned-integer,
      Autosaved:8/little-unsigned-integer,
      Fitness:32/little-float,
      OfsX:32/little-float,
      OfsY:32/little-float,
      OfsZ:32/little-float,
      DiagX:32/little-float,
      DiagY:32/little-float,
      DiagZ:32/little-float,
      OffdiagX:32/little-float,
      OffdiagY:32/little-float,
      OffdiagZ:32/little-float,
      OrientationConfidence:32/little-float,
      OldOrientation:8/little-unsigned-integer,
      NewOrientation:8/little-unsigned-integer,
      ScaleFactor:32/little-float>>.

%% @doc Decode MAG_CAL_REPORT message from binary
-spec decode_mag_cal_report(binary()) -> #mag_cal_report{}.
decode_mag_cal_report(<<?MAG_CAL_REPORT_ID:8,
                   CompassId:8/little-unsigned-integer,
                   CalMask:8/little-unsigned-integer,
                   CalStatus:8/little-unsigned-integer,
                   Autosaved:8/little-unsigned-integer,
                   Fitness:32/little-float,
                   OfsX:32/little-float,
                   OfsY:32/little-float,
                   OfsZ:32/little-float,
                   DiagX:32/little-float,
                   DiagY:32/little-float,
                   DiagZ:32/little-float,
                   OffdiagX:32/little-float,
                   OffdiagY:32/little-float,
                   OffdiagZ:32/little-float,
                   OrientationConfidence:32/little-float,
                   OldOrientation:8/little-unsigned-integer,
                   NewOrientation:8/little-unsigned-integer,
                   ScaleFactor:32/little-float>>) ->
    #mag_cal_report{
        compass_id = CompassId,
        cal_mask = CalMask,
        cal_status = CalStatus,
        autosaved = Autosaved,
        fitness = Fitness,
        ofs_x = OfsX,
        ofs_y = OfsY,
        ofs_z = OfsZ,
        diag_x = DiagX,
        diag_y = DiagY,
        diag_z = DiagZ,
        offdiag_x = OffdiagX,
        offdiag_y = OffdiagY,
        offdiag_z = OffdiagZ,
        orientation_confidence = OrientationConfidence,
        old_orientation = OldOrientation,
        new_orientation = NewOrientation,
        scale_factor = ScaleFactor
    }.

%% @doc Encode EFI_STATUS message to binary
-spec encode_efi_status(#efi_status{}) -> binary().
encode_efi_status(#efi_status{
    health = Health,
    ecu_index = EcuIndex,
    rpm = Rpm,
    fuel_consumed = FuelConsumed,
    fuel_flow = FuelFlow,
    engine_load = EngineLoad,
    throttle_position = ThrottlePosition,
    spark_dwell_time = SparkDwellTime,
    barometric_pressure = BarometricPressure,
    intake_manifold_pressure = IntakeManifoldPressure,
    intake_manifold_temperature = IntakeManifoldTemperature,
    cylinder_head_temperature = CylinderHeadTemperature,
    ignition_timing = IgnitionTiming,
    injection_time = InjectionTime,
    exhaust_gas_temperature = ExhaustGasTemperature,
    throttle_out = ThrottleOut,
    pt_compensation = PtCompensation,
    ignition_voltage = IgnitionVoltage,
    fuel_pressure = FuelPressure
}) ->
    <<?EFI_STATUS_ID:8,
      Health:8/little-unsigned-integer,
      EcuIndex:32/little-float,
      Rpm:32/little-float,
      FuelConsumed:32/little-float,
      FuelFlow:32/little-float,
      EngineLoad:32/little-float,
      ThrottlePosition:32/little-float,
      SparkDwellTime:32/little-float,
      BarometricPressure:32/little-float,
      IntakeManifoldPressure:32/little-float,
      IntakeManifoldTemperature:32/little-float,
      CylinderHeadTemperature:32/little-float,
      IgnitionTiming:32/little-float,
      InjectionTime:32/little-float,
      ExhaustGasTemperature:32/little-float,
      ThrottleOut:32/little-float,
      PtCompensation:32/little-float,
      IgnitionVoltage:32/little-float,
      FuelPressure:32/little-float>>.

%% @doc Decode EFI_STATUS message from binary
-spec decode_efi_status(binary()) -> #efi_status{}.
decode_efi_status(<<?EFI_STATUS_ID:8,
                   Health:8/little-unsigned-integer,
                   EcuIndex:32/little-float,
                   Rpm:32/little-float,
                   FuelConsumed:32/little-float,
                   FuelFlow:32/little-float,
                   EngineLoad:32/little-float,
                   ThrottlePosition:32/little-float,
                   SparkDwellTime:32/little-float,
                   BarometricPressure:32/little-float,
                   IntakeManifoldPressure:32/little-float,
                   IntakeManifoldTemperature:32/little-float,
                   CylinderHeadTemperature:32/little-float,
                   IgnitionTiming:32/little-float,
                   InjectionTime:32/little-float,
                   ExhaustGasTemperature:32/little-float,
                   ThrottleOut:32/little-float,
                   PtCompensation:32/little-float,
                   IgnitionVoltage:32/little-float,
                   FuelPressure:32/little-float>>) ->
    #efi_status{
        health = Health,
        ecu_index = EcuIndex,
        rpm = Rpm,
        fuel_consumed = FuelConsumed,
        fuel_flow = FuelFlow,
        engine_load = EngineLoad,
        throttle_position = ThrottlePosition,
        spark_dwell_time = SparkDwellTime,
        barometric_pressure = BarometricPressure,
        intake_manifold_pressure = IntakeManifoldPressure,
        intake_manifold_temperature = IntakeManifoldTemperature,
        cylinder_head_temperature = CylinderHeadTemperature,
        ignition_timing = IgnitionTiming,
        injection_time = InjectionTime,
        exhaust_gas_temperature = ExhaustGasTemperature,
        throttle_out = ThrottleOut,
        pt_compensation = PtCompensation,
        ignition_voltage = IgnitionVoltage,
        fuel_pressure = FuelPressure
    }.

%% @doc Encode ESTIMATOR_STATUS message to binary
-spec encode_estimator_status(#estimator_status{}) -> binary().
encode_estimator_status(#estimator_status{
    time_usec = TimeUsec,
    flags = Flags,
    vel_ratio = VelRatio,
    pos_horiz_ratio = PosHorizRatio,
    pos_vert_ratio = PosVertRatio,
    mag_ratio = MagRatio,
    hagl_ratio = HaglRatio,
    tas_ratio = TasRatio,
    pos_horiz_accuracy = PosHorizAccuracy,
    pos_vert_accuracy = PosVertAccuracy
}) ->
    <<?ESTIMATOR_STATUS_ID:8,
      TimeUsec:64/little-unsigned-integer,
      Flags:16/little-unsigned-integer,
      VelRatio:32/little-float,
      PosHorizRatio:32/little-float,
      PosVertRatio:32/little-float,
      MagRatio:32/little-float,
      HaglRatio:32/little-float,
      TasRatio:32/little-float,
      PosHorizAccuracy:32/little-float,
      PosVertAccuracy:32/little-float>>.

%% @doc Decode ESTIMATOR_STATUS message from binary
-spec decode_estimator_status(binary()) -> #estimator_status{}.
decode_estimator_status(<<?ESTIMATOR_STATUS_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   Flags:16/little-unsigned-integer,
                   VelRatio:32/little-float,
                   PosHorizRatio:32/little-float,
                   PosVertRatio:32/little-float,
                   MagRatio:32/little-float,
                   HaglRatio:32/little-float,
                   TasRatio:32/little-float,
                   PosHorizAccuracy:32/little-float,
                   PosVertAccuracy:32/little-float>>) ->
    #estimator_status{
        time_usec = TimeUsec,
        flags = Flags,
        vel_ratio = VelRatio,
        pos_horiz_ratio = PosHorizRatio,
        pos_vert_ratio = PosVertRatio,
        mag_ratio = MagRatio,
        hagl_ratio = HaglRatio,
        tas_ratio = TasRatio,
        pos_horiz_accuracy = PosHorizAccuracy,
        pos_vert_accuracy = PosVertAccuracy
    }.

%% @doc Encode WIND_COV message to binary
-spec encode_wind_cov(#wind_cov{}) -> binary().
encode_wind_cov(#wind_cov{
    time_usec = TimeUsec,
    wind_x = WindX,
    wind_y = WindY,
    wind_z = WindZ,
    var_horiz = VarHoriz,
    var_vert = VarVert,
    wind_alt = WindAlt,
    horiz_accuracy = HorizAccuracy,
    vert_accuracy = VertAccuracy
}) ->
    <<?WIND_COV_ID:8,
      TimeUsec:64/little-unsigned-integer,
      WindX:32/little-float,
      WindY:32/little-float,
      WindZ:32/little-float,
      VarHoriz:32/little-float,
      VarVert:32/little-float,
      WindAlt:32/little-float,
      HorizAccuracy:32/little-float,
      VertAccuracy:32/little-float>>.

%% @doc Decode WIND_COV message from binary
-spec decode_wind_cov(binary()) -> #wind_cov{}.
decode_wind_cov(<<?WIND_COV_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   WindX:32/little-float,
                   WindY:32/little-float,
                   WindZ:32/little-float,
                   VarHoriz:32/little-float,
                   VarVert:32/little-float,
                   WindAlt:32/little-float,
                   HorizAccuracy:32/little-float,
                   VertAccuracy:32/little-float>>) ->
    #wind_cov{
        time_usec = TimeUsec,
        wind_x = WindX,
        wind_y = WindY,
        wind_z = WindZ,
        var_horiz = VarHoriz,
        var_vert = VarVert,
        wind_alt = WindAlt,
        horiz_accuracy = HorizAccuracy,
        vert_accuracy = VertAccuracy
    }.

%% @doc Encode GPS_INPUT message to binary
-spec encode_gps_input(#gps_input{}) -> binary().
encode_gps_input(#gps_input{
    time_usec = TimeUsec,
    gps_id = GpsId,
    ignore_flags = IgnoreFlags,
    time_week_ms = TimeWeekMs,
    time_week = TimeWeek,
    fix_type = FixType,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    hdop = Hdop,
    vdop = Vdop,
    vn = Vn,
    ve = Ve,
    vd = Vd,
    speed_accuracy = SpeedAccuracy,
    horiz_accuracy = HorizAccuracy,
    vert_accuracy = VertAccuracy,
    satellites_visible = SatellitesVisible,
    yaw = Yaw
}) ->
    <<?GPS_INPUT_ID:8,
      TimeUsec:64/little-unsigned-integer,
      GpsId:8/little-unsigned-integer,
      IgnoreFlags:16/little-unsigned-integer,
      TimeWeekMs:32/little-unsigned-integer,
      TimeWeek:16/little-unsigned-integer,
      FixType:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-float,
      Hdop:32/little-float,
      Vdop:32/little-float,
      Vn:32/little-float,
      Ve:32/little-float,
      Vd:32/little-float,
      SpeedAccuracy:32/little-float,
      HorizAccuracy:32/little-float,
      VertAccuracy:32/little-float,
      SatellitesVisible:8/little-unsigned-integer,
      Yaw:16/little-unsigned-integer>>.

%% @doc Decode GPS_INPUT message from binary
-spec decode_gps_input(binary()) -> #gps_input{}.
decode_gps_input(<<?GPS_INPUT_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   GpsId:8/little-unsigned-integer,
                   IgnoreFlags:16/little-unsigned-integer,
                   TimeWeekMs:32/little-unsigned-integer,
                   TimeWeek:16/little-unsigned-integer,
                   FixType:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-float,
                   Hdop:32/little-float,
                   Vdop:32/little-float,
                   Vn:32/little-float,
                   Ve:32/little-float,
                   Vd:32/little-float,
                   SpeedAccuracy:32/little-float,
                   HorizAccuracy:32/little-float,
                   VertAccuracy:32/little-float,
                   SatellitesVisible:8/little-unsigned-integer,
                   Yaw:16/little-unsigned-integer>>) ->
    #gps_input{
        time_usec = TimeUsec,
        gps_id = GpsId,
        ignore_flags = IgnoreFlags,
        time_week_ms = TimeWeekMs,
        time_week = TimeWeek,
        fix_type = FixType,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        hdop = Hdop,
        vdop = Vdop,
        vn = Vn,
        ve = Ve,
        vd = Vd,
        speed_accuracy = SpeedAccuracy,
        horiz_accuracy = HorizAccuracy,
        vert_accuracy = VertAccuracy,
        satellites_visible = SatellitesVisible,
        yaw = Yaw
    }.

%% @doc Encode GPS_RTCM_DATA message to binary
-spec encode_gps_rtcm_data(#gps_rtcm_data{}) -> binary().
encode_gps_rtcm_data(#gps_rtcm_data{
    flags = Flags,
    len = Len,
    data = Data
}) ->
    <<?GPS_RTCM_DATA_ID:8,
      Flags:8/little-unsigned-integer,
      Len:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode GPS_RTCM_DATA message from binary
-spec decode_gps_rtcm_data(binary()) -> #gps_rtcm_data{}.
decode_gps_rtcm_data(<<?GPS_RTCM_DATA_ID:8,
                   Flags:8/little-unsigned-integer,
                   Len:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #gps_rtcm_data{
        flags = Flags,
        len = Len,
        data = Data
    }.

%% @doc Encode HIGH_LATENCY message to binary
-spec encode_high_latency(#high_latency{}) -> binary().
encode_high_latency(#high_latency{
    base_mode = BaseMode,
    custom_mode = CustomMode,
    landed_state = LandedState,
    roll = Roll,
    pitch = Pitch,
    heading = Heading,
    throttle = Throttle,
    heading_sp = HeadingSp,
    latitude = Latitude,
    longitude = Longitude,
    altitude_amsl = AltitudeAmsl,
    altitude_sp = AltitudeSp,
    airspeed = Airspeed,
    airspeed_sp = AirspeedSp,
    groundspeed = Groundspeed,
    climb_rate = ClimbRate,
    gps_nsat = GpsNsat,
    gps_fix_type = GpsFixType,
    battery_remaining = BatteryRemaining,
    temperature = Temperature,
    temperature_air = TemperatureAir,
    failsafe = Failsafe,
    wp_num = WpNum,
    wp_distance = WpDistance
}) ->
    <<?HIGH_LATENCY_ID:8,
      BaseMode:8/little-unsigned-integer,
      CustomMode:32/little-unsigned-integer,
      LandedState:8/little-unsigned-integer,
      Roll:16/little-signed-integer,
      Pitch:16/little-signed-integer,
      Heading:16/little-unsigned-integer,
      Throttle:8/little-signed-integer,
      HeadingSp:16/little-signed-integer,
      Latitude:32/little-signed-integer,
      Longitude:32/little-signed-integer,
      AltitudeAmsl:16/little-signed-integer,
      AltitudeSp:16/little-signed-integer,
      Airspeed:8/little-unsigned-integer,
      AirspeedSp:8/little-unsigned-integer,
      Groundspeed:8/little-unsigned-integer,
      ClimbRate:8/little-signed-integer,
      GpsNsat:8/little-unsigned-integer,
      GpsFixType:8/little-unsigned-integer,
      BatteryRemaining:8/little-unsigned-integer,
      Temperature:8/little-signed-integer,
      TemperatureAir:8/little-signed-integer,
      Failsafe:8/little-unsigned-integer,
      WpNum:8/little-unsigned-integer,
      WpDistance:16/little-unsigned-integer>>.

%% @doc Decode HIGH_LATENCY message from binary
-spec decode_high_latency(binary()) -> #high_latency{}.
decode_high_latency(<<?HIGH_LATENCY_ID:8,
                   BaseMode:8/little-unsigned-integer,
                   CustomMode:32/little-unsigned-integer,
                   LandedState:8/little-unsigned-integer,
                   Roll:16/little-signed-integer,
                   Pitch:16/little-signed-integer,
                   Heading:16/little-unsigned-integer,
                   Throttle:8/little-signed-integer,
                   HeadingSp:16/little-signed-integer,
                   Latitude:32/little-signed-integer,
                   Longitude:32/little-signed-integer,
                   AltitudeAmsl:16/little-signed-integer,
                   AltitudeSp:16/little-signed-integer,
                   Airspeed:8/little-unsigned-integer,
                   AirspeedSp:8/little-unsigned-integer,
                   Groundspeed:8/little-unsigned-integer,
                   ClimbRate:8/little-signed-integer,
                   GpsNsat:8/little-unsigned-integer,
                   GpsFixType:8/little-unsigned-integer,
                   BatteryRemaining:8/little-unsigned-integer,
                   Temperature:8/little-signed-integer,
                   TemperatureAir:8/little-signed-integer,
                   Failsafe:8/little-unsigned-integer,
                   WpNum:8/little-unsigned-integer,
                   WpDistance:16/little-unsigned-integer>>) ->
    #high_latency{
        base_mode = BaseMode,
        custom_mode = CustomMode,
        landed_state = LandedState,
        roll = Roll,
        pitch = Pitch,
        heading = Heading,
        throttle = Throttle,
        heading_sp = HeadingSp,
        latitude = Latitude,
        longitude = Longitude,
        altitude_amsl = AltitudeAmsl,
        altitude_sp = AltitudeSp,
        airspeed = Airspeed,
        airspeed_sp = AirspeedSp,
        groundspeed = Groundspeed,
        climb_rate = ClimbRate,
        gps_nsat = GpsNsat,
        gps_fix_type = GpsFixType,
        battery_remaining = BatteryRemaining,
        temperature = Temperature,
        temperature_air = TemperatureAir,
        failsafe = Failsafe,
        wp_num = WpNum,
        wp_distance = WpDistance
    }.

%% @doc Encode HIGH_LATENCY2 message to binary
-spec encode_high_latency2(#high_latency2{}) -> binary().
encode_high_latency2(#high_latency2{
    timestamp = Timestamp,
    type = Type,
    autopilot = Autopilot,
    custom_mode = CustomMode,
    latitude = Latitude,
    longitude = Longitude,
    altitude = Altitude,
    target_altitude = TargetAltitude,
    heading = Heading,
    target_heading = TargetHeading,
    target_distance = TargetDistance,
    throttle = Throttle,
    airspeed = Airspeed,
    airspeed_sp = AirspeedSp,
    groundspeed = Groundspeed,
    windspeed = Windspeed,
    wind_heading = WindHeading,
    eph = Eph,
    epv = Epv,
    temperature_air = TemperatureAir,
    climb_rate = ClimbRate,
    battery = Battery,
    wp_num = WpNum,
    failure_flags = FailureFlags,
    custom0 = Custom0,
    custom1 = Custom1,
    custom2 = Custom2
}) ->
    <<?HIGH_LATENCY2_ID:8,
      Timestamp:32/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      Autopilot:8/little-unsigned-integer,
      CustomMode:16/little-unsigned-integer,
      Latitude:32/little-signed-integer,
      Longitude:32/little-signed-integer,
      Altitude:16/little-signed-integer,
      TargetAltitude:16/little-signed-integer,
      Heading:8/little-unsigned-integer,
      TargetHeading:8/little-unsigned-integer,
      TargetDistance:16/little-unsigned-integer,
      Throttle:8/little-unsigned-integer,
      Airspeed:8/little-unsigned-integer,
      AirspeedSp:8/little-unsigned-integer,
      Groundspeed:8/little-unsigned-integer,
      Windspeed:8/little-unsigned-integer,
      WindHeading:8/little-unsigned-integer,
      Eph:8/little-unsigned-integer,
      Epv:8/little-unsigned-integer,
      TemperatureAir:8/little-signed-integer,
      ClimbRate:8/little-signed-integer,
      Battery:8/little-signed-integer,
      WpNum:16/little-unsigned-integer,
      FailureFlags:16/little-unsigned-integer,
      Custom0:8/little-signed-integer,
      Custom1:8/little-signed-integer,
      Custom2:8/little-signed-integer>>.

%% @doc Decode HIGH_LATENCY2 message from binary
-spec decode_high_latency2(binary()) -> #high_latency2{}.
decode_high_latency2(<<?HIGH_LATENCY2_ID:8,
                   Timestamp:32/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   Autopilot:8/little-unsigned-integer,
                   CustomMode:16/little-unsigned-integer,
                   Latitude:32/little-signed-integer,
                   Longitude:32/little-signed-integer,
                   Altitude:16/little-signed-integer,
                   TargetAltitude:16/little-signed-integer,
                   Heading:8/little-unsigned-integer,
                   TargetHeading:8/little-unsigned-integer,
                   TargetDistance:16/little-unsigned-integer,
                   Throttle:8/little-unsigned-integer,
                   Airspeed:8/little-unsigned-integer,
                   AirspeedSp:8/little-unsigned-integer,
                   Groundspeed:8/little-unsigned-integer,
                   Windspeed:8/little-unsigned-integer,
                   WindHeading:8/little-unsigned-integer,
                   Eph:8/little-unsigned-integer,
                   Epv:8/little-unsigned-integer,
                   TemperatureAir:8/little-signed-integer,
                   ClimbRate:8/little-signed-integer,
                   Battery:8/little-signed-integer,
                   WpNum:16/little-unsigned-integer,
                   FailureFlags:16/little-unsigned-integer,
                   Custom0:8/little-signed-integer,
                   Custom1:8/little-signed-integer,
                   Custom2:8/little-signed-integer>>) ->
    #high_latency2{
        timestamp = Timestamp,
        type = Type,
        autopilot = Autopilot,
        custom_mode = CustomMode,
        latitude = Latitude,
        longitude = Longitude,
        altitude = Altitude,
        target_altitude = TargetAltitude,
        heading = Heading,
        target_heading = TargetHeading,
        target_distance = TargetDistance,
        throttle = Throttle,
        airspeed = Airspeed,
        airspeed_sp = AirspeedSp,
        groundspeed = Groundspeed,
        windspeed = Windspeed,
        wind_heading = WindHeading,
        eph = Eph,
        epv = Epv,
        temperature_air = TemperatureAir,
        climb_rate = ClimbRate,
        battery = Battery,
        wp_num = WpNum,
        failure_flags = FailureFlags,
        custom0 = Custom0,
        custom1 = Custom1,
        custom2 = Custom2
    }.

%% @doc Encode VIBRATION message to binary
-spec encode_vibration(#vibration{}) -> binary().
encode_vibration(#vibration{
    time_usec = TimeUsec,
    vibration_x = VibrationX,
    vibration_y = VibrationY,
    vibration_z = VibrationZ,
    clipping_0 = Clipping0,
    clipping_1 = Clipping1,
    clipping_2 = Clipping2
}) ->
    <<?VIBRATION_ID:8,
      TimeUsec:64/little-unsigned-integer,
      VibrationX:32/little-float,
      VibrationY:32/little-float,
      VibrationZ:32/little-float,
      Clipping0:32/little-unsigned-integer,
      Clipping1:32/little-unsigned-integer,
      Clipping2:32/little-unsigned-integer>>.

%% @doc Decode VIBRATION message from binary
-spec decode_vibration(binary()) -> #vibration{}.
decode_vibration(<<?VIBRATION_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   VibrationX:32/little-float,
                   VibrationY:32/little-float,
                   VibrationZ:32/little-float,
                   Clipping0:32/little-unsigned-integer,
                   Clipping1:32/little-unsigned-integer,
                   Clipping2:32/little-unsigned-integer>>) ->
    #vibration{
        time_usec = TimeUsec,
        vibration_x = VibrationX,
        vibration_y = VibrationY,
        vibration_z = VibrationZ,
        clipping_0 = Clipping0,
        clipping_1 = Clipping1,
        clipping_2 = Clipping2
    }.

%% @doc Encode HOME_POSITION message to binary
-spec encode_home_position(#home_position{}) -> binary().
encode_home_position(#home_position{
    latitude = Latitude,
    longitude = Longitude,
    altitude = Altitude,
    x = X,
    y = Y,
    z = Z,
    q = Q,
    approach_x = ApproachX,
    approach_y = ApproachY,
    approach_z = ApproachZ,
    time_usec = TimeUsec
}) ->
    <<?HOME_POSITION_ID:8,
      Latitude:32/little-signed-integer,
      Longitude:32/little-signed-integer,
      Altitude:32/little-signed-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Q:32/little-float,
      ApproachX:32/little-float,
      ApproachY:32/little-float,
      ApproachZ:32/little-float,
      TimeUsec:64/little-unsigned-integer>>.

%% @doc Decode HOME_POSITION message from binary
-spec decode_home_position(binary()) -> #home_position{}.
decode_home_position(<<?HOME_POSITION_ID:8,
                   Latitude:32/little-signed-integer,
                   Longitude:32/little-signed-integer,
                   Altitude:32/little-signed-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Q:32/little-float,
                   ApproachX:32/little-float,
                   ApproachY:32/little-float,
                   ApproachZ:32/little-float,
                   TimeUsec:64/little-unsigned-integer>>) ->
    #home_position{
        latitude = Latitude,
        longitude = Longitude,
        altitude = Altitude,
        x = X,
        y = Y,
        z = Z,
        q = Q,
        approach_x = ApproachX,
        approach_y = ApproachY,
        approach_z = ApproachZ,
        time_usec = TimeUsec
    }.

%% @doc Encode SET_HOME_POSITION message to binary
-spec encode_set_home_position(#set_home_position{}) -> binary().
encode_set_home_position(#set_home_position{
    target_system = TargetSystem,
    latitude = Latitude,
    longitude = Longitude,
    altitude = Altitude,
    x = X,
    y = Y,
    z = Z,
    q = Q,
    approach_x = ApproachX,
    approach_y = ApproachY,
    approach_z = ApproachZ,
    time_usec = TimeUsec
}) ->
    <<?SET_HOME_POSITION_ID:8,
      TargetSystem:8/little-unsigned-integer,
      Latitude:32/little-signed-integer,
      Longitude:32/little-signed-integer,
      Altitude:32/little-signed-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Q:32/little-float,
      ApproachX:32/little-float,
      ApproachY:32/little-float,
      ApproachZ:32/little-float,
      TimeUsec:64/little-unsigned-integer>>.

%% @doc Decode SET_HOME_POSITION message from binary
-spec decode_set_home_position(binary()) -> #set_home_position{}.
decode_set_home_position(<<?SET_HOME_POSITION_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   Latitude:32/little-signed-integer,
                   Longitude:32/little-signed-integer,
                   Altitude:32/little-signed-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Q:32/little-float,
                   ApproachX:32/little-float,
                   ApproachY:32/little-float,
                   ApproachZ:32/little-float,
                   TimeUsec:64/little-unsigned-integer>>) ->
    #set_home_position{
        target_system = TargetSystem,
        latitude = Latitude,
        longitude = Longitude,
        altitude = Altitude,
        x = X,
        y = Y,
        z = Z,
        q = Q,
        approach_x = ApproachX,
        approach_y = ApproachY,
        approach_z = ApproachZ,
        time_usec = TimeUsec
    }.

%% @doc Encode MESSAGE_INTERVAL message to binary
-spec encode_message_interval(#message_interval{}) -> binary().
encode_message_interval(#message_interval{
    message_id = MessageId,
    interval_us = IntervalUs
}) ->
    <<?MESSAGE_INTERVAL_ID:8,
      MessageId:16/little-unsigned-integer,
      IntervalUs:32/little-signed-integer>>.

%% @doc Decode MESSAGE_INTERVAL message from binary
-spec decode_message_interval(binary()) -> #message_interval{}.
decode_message_interval(<<?MESSAGE_INTERVAL_ID:8,
                   MessageId:16/little-unsigned-integer,
                   IntervalUs:32/little-signed-integer>>) ->
    #message_interval{
        message_id = MessageId,
        interval_us = IntervalUs
    }.

%% @doc Encode EXTENDED_SYS_STATE message to binary
-spec encode_extended_sys_state(#extended_sys_state{}) -> binary().
encode_extended_sys_state(#extended_sys_state{
    vtol_state = VtolState,
    landed_state = LandedState
}) ->
    <<?EXTENDED_SYS_STATE_ID:8,
      VtolState:8/little-unsigned-integer,
      LandedState:8/little-unsigned-integer>>.

%% @doc Decode EXTENDED_SYS_STATE message from binary
-spec decode_extended_sys_state(binary()) -> #extended_sys_state{}.
decode_extended_sys_state(<<?EXTENDED_SYS_STATE_ID:8,
                   VtolState:8/little-unsigned-integer,
                   LandedState:8/little-unsigned-integer>>) ->
    #extended_sys_state{
        vtol_state = VtolState,
        landed_state = LandedState
    }.

%% @doc Encode ADSB_VEHICLE message to binary
-spec encode_adsb_vehicle(#adsb_vehicle{}) -> binary().
encode_adsb_vehicle(#adsb_vehicle{
    icao_address = IcaoAddress,
    lat = Lat,
    lon = Lon,
    altitude_type = AltitudeType,
    altitude = Altitude,
    heading = Heading,
    hor_velocity = HorVelocity,
    ver_velocity = VerVelocity,
    callsign = Callsign,
    emitter_type = EmitterType,
    tslc = Tslc,
    flags = Flags,
    squawk = Squawk
}) ->
    <<?ADSB_VEHICLE_ID:8,
      IcaoAddress:32/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      AltitudeType:8/little-unsigned-integer,
      Altitude:32/little-signed-integer,
      Heading:16/little-unsigned-integer,
      HorVelocity:16/little-unsigned-integer,
      VerVelocity:16/little-signed-integer,
      Callsign:8/little-binary,
      EmitterType:8/little-unsigned-integer,
      Tslc:8/little-unsigned-integer,
      Flags:16/little-unsigned-integer,
      Squawk:16/little-unsigned-integer>>.

%% @doc Decode ADSB_VEHICLE message from binary
-spec decode_adsb_vehicle(binary()) -> #adsb_vehicle{}.
decode_adsb_vehicle(<<?ADSB_VEHICLE_ID:8,
                   IcaoAddress:32/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   AltitudeType:8/little-unsigned-integer,
                   Altitude:32/little-signed-integer,
                   Heading:16/little-unsigned-integer,
                   HorVelocity:16/little-unsigned-integer,
                   VerVelocity:16/little-signed-integer,
                   Callsign:8/little-binary,
                   EmitterType:8/little-unsigned-integer,
                   Tslc:8/little-unsigned-integer,
                   Flags:16/little-unsigned-integer,
                   Squawk:16/little-unsigned-integer>>) ->
    #adsb_vehicle{
        icao_address = IcaoAddress,
        lat = Lat,
        lon = Lon,
        altitude_type = AltitudeType,
        altitude = Altitude,
        heading = Heading,
        hor_velocity = HorVelocity,
        ver_velocity = VerVelocity,
        callsign = Callsign,
        emitter_type = EmitterType,
        tslc = Tslc,
        flags = Flags,
        squawk = Squawk
    }.

%% @doc Encode COLLISION message to binary
-spec encode_collision(#collision{}) -> binary().
encode_collision(#collision{
    src = Src,
    id = Id,
    action = Action,
    threat_level = ThreatLevel,
    time_to_minimum_delta = TimeToMinimumDelta,
    altitude_minimum_delta = AltitudeMinimumDelta,
    horizontal_minimum_delta = HorizontalMinimumDelta
}) ->
    <<?COLLISION_ID:8,
      Src:8/little-unsigned-integer,
      Id:32/little-unsigned-integer,
      Action:8/little-unsigned-integer,
      ThreatLevel:8/little-unsigned-integer,
      TimeToMinimumDelta:32/little-float,
      AltitudeMinimumDelta:32/little-float,
      HorizontalMinimumDelta:32/little-float>>.

%% @doc Decode COLLISION message from binary
-spec decode_collision(binary()) -> #collision{}.
decode_collision(<<?COLLISION_ID:8,
                   Src:8/little-unsigned-integer,
                   Id:32/little-unsigned-integer,
                   Action:8/little-unsigned-integer,
                   ThreatLevel:8/little-unsigned-integer,
                   TimeToMinimumDelta:32/little-float,
                   AltitudeMinimumDelta:32/little-float,
                   HorizontalMinimumDelta:32/little-float>>) ->
    #collision{
        src = Src,
        id = Id,
        action = Action,
        threat_level = ThreatLevel,
        time_to_minimum_delta = TimeToMinimumDelta,
        altitude_minimum_delta = AltitudeMinimumDelta,
        horizontal_minimum_delta = HorizontalMinimumDelta
    }.

%% @doc Encode V2_EXTENSION message to binary
-spec encode_v2_extension(#v2_extension{}) -> binary().
encode_v2_extension(#v2_extension{
    target_network = TargetNetwork,
    target_system = TargetSystem,
    target_component = TargetComponent,
    message_type = MessageType,
    payload = Payload
}) ->
    <<?V2_EXTENSION_ID:8,
      TargetNetwork:8/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      MessageType:16/little-unsigned-integer,
      Payload:8/little-unsigned-integer>>.

%% @doc Decode V2_EXTENSION message from binary
-spec decode_v2_extension(binary()) -> #v2_extension{}.
decode_v2_extension(<<?V2_EXTENSION_ID:8,
                   TargetNetwork:8/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   MessageType:16/little-unsigned-integer,
                   Payload:8/little-unsigned-integer>>) ->
    #v2_extension{
        target_network = TargetNetwork,
        target_system = TargetSystem,
        target_component = TargetComponent,
        message_type = MessageType,
        payload = Payload
    }.

%% @doc Encode MEMORY_VECT message to binary
-spec encode_memory_vect(#memory_vect{}) -> binary().
encode_memory_vect(#memory_vect{
    address = Address,
    ver = Ver,
    type = Type,
    value = Value
}) ->
    <<?MEMORY_VECT_ID:8,
      Address:16/little-unsigned-integer,
      Ver:8/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      Value:8/little-signed-integer>>.

%% @doc Decode MEMORY_VECT message from binary
-spec decode_memory_vect(binary()) -> #memory_vect{}.
decode_memory_vect(<<?MEMORY_VECT_ID:8,
                   Address:16/little-unsigned-integer,
                   Ver:8/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   Value:8/little-signed-integer>>) ->
    #memory_vect{
        address = Address,
        ver = Ver,
        type = Type,
        value = Value
    }.

%% @doc Encode DEBUG_VECT message to binary
-spec encode_debug_vect(#debug_vect{}) -> binary().
encode_debug_vect(#debug_vect{
    name = Name,
    time_usec = TimeUsec,
    x = X,
    y = Y,
    z = Z
}) ->
    <<?DEBUG_VECT_ID:8,
      Name:8/little-binary,
      TimeUsec:64/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float>>.

%% @doc Decode DEBUG_VECT message from binary
-spec decode_debug_vect(binary()) -> #debug_vect{}.
decode_debug_vect(<<?DEBUG_VECT_ID:8,
                   Name:8/little-binary,
                   TimeUsec:64/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float>>) ->
    #debug_vect{
        name = Name,
        time_usec = TimeUsec,
        x = X,
        y = Y,
        z = Z
    }.

%% @doc Encode NAMED_VALUE_FLOAT message to binary
-spec encode_named_value_float(#named_value_float{}) -> binary().
encode_named_value_float(#named_value_float{
    time_boot_ms = TimeBootMs,
    name = Name,
    value = Value
}) ->
    <<?NAMED_VALUE_FLOAT_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Name:8/little-binary,
      Value:32/little-float>>.

%% @doc Decode NAMED_VALUE_FLOAT message from binary
-spec decode_named_value_float(binary()) -> #named_value_float{}.
decode_named_value_float(<<?NAMED_VALUE_FLOAT_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Name:8/little-binary,
                   Value:32/little-float>>) ->
    #named_value_float{
        time_boot_ms = TimeBootMs,
        name = Name,
        value = Value
    }.

%% @doc Encode NAMED_VALUE_INT message to binary
-spec encode_named_value_int(#named_value_int{}) -> binary().
encode_named_value_int(#named_value_int{
    time_boot_ms = TimeBootMs,
    name = Name,
    value = Value
}) ->
    <<?NAMED_VALUE_INT_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Name:8/little-binary,
      Value:32/little-signed-integer>>.

%% @doc Decode NAMED_VALUE_INT message from binary
-spec decode_named_value_int(binary()) -> #named_value_int{}.
decode_named_value_int(<<?NAMED_VALUE_INT_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Name:8/little-binary,
                   Value:32/little-signed-integer>>) ->
    #named_value_int{
        time_boot_ms = TimeBootMs,
        name = Name,
        value = Value
    }.

%% @doc Encode STATUSTEXT message to binary
-spec encode_statustext(#statustext{}) -> binary().
encode_statustext(#statustext{
    severity = Severity,
    text = Text,
    id = Id,
    chunk_seq = ChunkSeq
}) ->
    <<?STATUSTEXT_ID:8,
      Severity:8/little-unsigned-integer,
      Text:8/little-binary,
      Id:16/little-unsigned-integer,
      ChunkSeq:8/little-unsigned-integer>>.

%% @doc Decode STATUSTEXT message from binary
-spec decode_statustext(binary()) -> #statustext{}.
decode_statustext(<<?STATUSTEXT_ID:8,
                   Severity:8/little-unsigned-integer,
                   Text:8/little-binary,
                   Id:16/little-unsigned-integer,
                   ChunkSeq:8/little-unsigned-integer>>) ->
    #statustext{
        severity = Severity,
        text = Text,
        id = Id,
        chunk_seq = ChunkSeq
    }.

%% @doc Encode DEBUG message to binary
-spec encode_debug(#debug{}) -> binary().
encode_debug(#debug{
    time_boot_ms = TimeBootMs,
    ind = Ind,
    value = Value
}) ->
    <<?DEBUG_ID:8,
      TimeBootMs:32/little-unsigned-integer,
      Ind:8/little-unsigned-integer,
      Value:32/little-float>>.

%% @doc Decode DEBUG message from binary
-spec decode_debug(binary()) -> #debug{}.
decode_debug(<<?DEBUG_ID:8,
                   TimeBootMs:32/little-unsigned-integer,
                   Ind:8/little-unsigned-integer,
                   Value:32/little-float>>) ->
    #debug{
        time_boot_ms = TimeBootMs,
        ind = Ind,
        value = Value
    }.

%% @doc Encode SETUP_SIGNING message to binary
-spec encode_setup_signing(#setup_signing{}) -> binary().
encode_setup_signing(#setup_signing{
    target_system = TargetSystem,
    target_component = TargetComponent,
    secret_key = SecretKey,
    initial_timestamp = InitialTimestamp
}) ->
    <<?SETUP_SIGNING_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      SecretKey:8/little-unsigned-integer,
      InitialTimestamp:64/little-unsigned-integer>>.

%% @doc Decode SETUP_SIGNING message from binary
-spec decode_setup_signing(binary()) -> #setup_signing{}.
decode_setup_signing(<<?SETUP_SIGNING_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   SecretKey:8/little-unsigned-integer,
                   InitialTimestamp:64/little-unsigned-integer>>) ->
    #setup_signing{
        target_system = TargetSystem,
        target_component = TargetComponent,
        secret_key = SecretKey,
        initial_timestamp = InitialTimestamp
    }.

%% @doc Encode BUTTON_CHANGE message to binary
-spec encode_button_change(#button_change{}) -> binary().
encode_button_change(#button_change{
    time_boot_ms = TimeBootMs,
    last_change_ms = LastChangeMs,
    state = State
}) ->
    <<?BUTTON_CHANGE_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      LastChangeMs:32/little-unsigned-integer,
      State:8/little-unsigned-integer>>.

%% @doc Decode BUTTON_CHANGE message from binary
-spec decode_button_change(binary()) -> #button_change{}.
decode_button_change(<<?BUTTON_CHANGE_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   LastChangeMs:32/little-unsigned-integer,
                   State:8/little-unsigned-integer>>) ->
    #button_change{
        time_boot_ms = TimeBootMs,
        last_change_ms = LastChangeMs,
        state = State
    }.

%% @doc Encode PLAY_TUNE message to binary
-spec encode_play_tune(#play_tune{}) -> binary().
encode_play_tune(#play_tune{
    target_system = TargetSystem,
    target_component = TargetComponent,
    tune = Tune,
    tune2 = Tune2
}) ->
    <<?PLAY_TUNE_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Tune:8/little-binary,
      Tune2:8/little-binary>>.

%% @doc Decode PLAY_TUNE message from binary
-spec decode_play_tune(binary()) -> #play_tune{}.
decode_play_tune(<<?PLAY_TUNE_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Tune:8/little-binary,
                   Tune2:8/little-binary>>) ->
    #play_tune{
        target_system = TargetSystem,
        target_component = TargetComponent,
        tune = Tune,
        tune2 = Tune2
    }.

%% @doc Encode CAMERA_INFORMATION message to binary
-spec encode_camera_information(#camera_information{}) -> binary().
encode_camera_information(#camera_information{
    time_boot_ms = TimeBootMs,
    vendor_name = VendorName,
    model_name = ModelName,
    firmware_version = FirmwareVersion,
    focal_length = FocalLength,
    sensor_size_h = SensorSizeH,
    sensor_size_v = SensorSizeV,
    resolution_h = ResolutionH,
    resolution_v = ResolutionV,
    lens_id = LensId,
    flags = Flags,
    cam_definition_version = CamDefinitionVersion,
    cam_definition_uri = CamDefinitionUri,
    gimbal_device_id = GimbalDeviceId,
    camera_device_id = CameraDeviceId
}) ->
    <<?CAMERA_INFORMATION_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      VendorName:8/little-unsigned-integer,
      ModelName:8/little-unsigned-integer,
      FirmwareVersion:32/little-unsigned-integer,
      FocalLength:32/little-float,
      SensorSizeH:32/little-float,
      SensorSizeV:32/little-float,
      ResolutionH:16/little-unsigned-integer,
      ResolutionV:16/little-unsigned-integer,
      LensId:8/little-unsigned-integer,
      Flags:32/little-unsigned-integer,
      CamDefinitionVersion:16/little-unsigned-integer,
      CamDefinitionUri:8/little-binary,
      GimbalDeviceId:8/little-unsigned-integer,
      CameraDeviceId:8/little-unsigned-integer>>.

%% @doc Decode CAMERA_INFORMATION message from binary
-spec decode_camera_information(binary()) -> #camera_information{}.
decode_camera_information(<<?CAMERA_INFORMATION_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   VendorName:8/little-unsigned-integer,
                   ModelName:8/little-unsigned-integer,
                   FirmwareVersion:32/little-unsigned-integer,
                   FocalLength:32/little-float,
                   SensorSizeH:32/little-float,
                   SensorSizeV:32/little-float,
                   ResolutionH:16/little-unsigned-integer,
                   ResolutionV:16/little-unsigned-integer,
                   LensId:8/little-unsigned-integer,
                   Flags:32/little-unsigned-integer,
                   CamDefinitionVersion:16/little-unsigned-integer,
                   CamDefinitionUri:8/little-binary,
                   GimbalDeviceId:8/little-unsigned-integer,
                   CameraDeviceId:8/little-unsigned-integer>>) ->
    #camera_information{
        time_boot_ms = TimeBootMs,
        vendor_name = VendorName,
        model_name = ModelName,
        firmware_version = FirmwareVersion,
        focal_length = FocalLength,
        sensor_size_h = SensorSizeH,
        sensor_size_v = SensorSizeV,
        resolution_h = ResolutionH,
        resolution_v = ResolutionV,
        lens_id = LensId,
        flags = Flags,
        cam_definition_version = CamDefinitionVersion,
        cam_definition_uri = CamDefinitionUri,
        gimbal_device_id = GimbalDeviceId,
        camera_device_id = CameraDeviceId
    }.

%% @doc Encode CAMERA_SETTINGS message to binary
-spec encode_camera_settings(#camera_settings{}) -> binary().
encode_camera_settings(#camera_settings{
    time_boot_ms = TimeBootMs,
    mode_id = ModeId,
    zoomlevel = Zoomlevel,
    focuslevel = Focuslevel,
    camera_device_id = CameraDeviceId
}) ->
    <<?CAMERA_SETTINGS_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      ModeId:8/little-unsigned-integer,
      Zoomlevel:32/little-float,
      Focuslevel:32/little-float,
      CameraDeviceId:8/little-unsigned-integer>>.

%% @doc Decode CAMERA_SETTINGS message from binary
-spec decode_camera_settings(binary()) -> #camera_settings{}.
decode_camera_settings(<<?CAMERA_SETTINGS_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   ModeId:8/little-unsigned-integer,
                   Zoomlevel:32/little-float,
                   Focuslevel:32/little-float,
                   CameraDeviceId:8/little-unsigned-integer>>) ->
    #camera_settings{
        time_boot_ms = TimeBootMs,
        mode_id = ModeId,
        zoomlevel = Zoomlevel,
        focuslevel = Focuslevel,
        camera_device_id = CameraDeviceId
    }.

%% @doc Encode STORAGE_INFORMATION message to binary
-spec encode_storage_information(#storage_information{}) -> binary().
encode_storage_information(#storage_information{
    time_boot_ms = TimeBootMs,
    storage_id = StorageId,
    storage_count = StorageCount,
    status = Status,
    total_capacity = TotalCapacity,
    used_capacity = UsedCapacity,
    available_capacity = AvailableCapacity,
    read_speed = ReadSpeed,
    write_speed = WriteSpeed,
    type = Type,
    name = Name,
    storage_usage = StorageUsage
}) ->
    <<?STORAGE_INFORMATION_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      StorageId:8/little-unsigned-integer,
      StorageCount:8/little-unsigned-integer,
      Status:8/little-unsigned-integer,
      TotalCapacity:32/little-float,
      UsedCapacity:32/little-float,
      AvailableCapacity:32/little-float,
      ReadSpeed:32/little-float,
      WriteSpeed:32/little-float,
      Type:8/little-unsigned-integer,
      Name:8/little-binary,
      StorageUsage:8/little-unsigned-integer>>.

%% @doc Decode STORAGE_INFORMATION message from binary
-spec decode_storage_information(binary()) -> #storage_information{}.
decode_storage_information(<<?STORAGE_INFORMATION_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   StorageId:8/little-unsigned-integer,
                   StorageCount:8/little-unsigned-integer,
                   Status:8/little-unsigned-integer,
                   TotalCapacity:32/little-float,
                   UsedCapacity:32/little-float,
                   AvailableCapacity:32/little-float,
                   ReadSpeed:32/little-float,
                   WriteSpeed:32/little-float,
                   Type:8/little-unsigned-integer,
                   Name:8/little-binary,
                   StorageUsage:8/little-unsigned-integer>>) ->
    #storage_information{
        time_boot_ms = TimeBootMs,
        storage_id = StorageId,
        storage_count = StorageCount,
        status = Status,
        total_capacity = TotalCapacity,
        used_capacity = UsedCapacity,
        available_capacity = AvailableCapacity,
        read_speed = ReadSpeed,
        write_speed = WriteSpeed,
        type = Type,
        name = Name,
        storage_usage = StorageUsage
    }.

%% @doc Encode CAMERA_CAPTURE_STATUS message to binary
-spec encode_camera_capture_status(#camera_capture_status{}) -> binary().
encode_camera_capture_status(#camera_capture_status{
    time_boot_ms = TimeBootMs,
    image_status = ImageStatus,
    video_status = VideoStatus,
    image_interval = ImageInterval,
    recording_time_ms = RecordingTimeMs,
    available_capacity = AvailableCapacity,
    image_count = ImageCount,
    camera_device_id = CameraDeviceId
}) ->
    <<?CAMERA_CAPTURE_STATUS_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      ImageStatus:8/little-unsigned-integer,
      VideoStatus:8/little-unsigned-integer,
      ImageInterval:32/little-float,
      RecordingTimeMs:32/little-unsigned-integer,
      AvailableCapacity:32/little-float,
      ImageCount:32/little-signed-integer,
      CameraDeviceId:8/little-unsigned-integer>>.

%% @doc Decode CAMERA_CAPTURE_STATUS message from binary
-spec decode_camera_capture_status(binary()) -> #camera_capture_status{}.
decode_camera_capture_status(<<?CAMERA_CAPTURE_STATUS_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   ImageStatus:8/little-unsigned-integer,
                   VideoStatus:8/little-unsigned-integer,
                   ImageInterval:32/little-float,
                   RecordingTimeMs:32/little-unsigned-integer,
                   AvailableCapacity:32/little-float,
                   ImageCount:32/little-signed-integer,
                   CameraDeviceId:8/little-unsigned-integer>>) ->
    #camera_capture_status{
        time_boot_ms = TimeBootMs,
        image_status = ImageStatus,
        video_status = VideoStatus,
        image_interval = ImageInterval,
        recording_time_ms = RecordingTimeMs,
        available_capacity = AvailableCapacity,
        image_count = ImageCount,
        camera_device_id = CameraDeviceId
    }.

%% @doc Encode CAMERA_IMAGE_CAPTURED message to binary
-spec encode_camera_image_captured(#camera_image_captured{}) -> binary().
encode_camera_image_captured(#camera_image_captured{
    time_boot_ms = TimeBootMs,
    time_utc = TimeUtc,
    camera_id = CameraId,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    relative_alt = RelativeAlt,
    q = Q,
    image_index = ImageIndex,
    capture_result = CaptureResult,
    file_url = FileUrl
}) ->
    <<?CAMERA_IMAGE_CAPTURED_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      TimeUtc:64/little-unsigned-integer,
      CameraId:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-signed-integer,
      RelativeAlt:32/little-signed-integer,
      Q:32/little-float,
      ImageIndex:32/little-signed-integer,
      CaptureResult:8/little-signed-integer,
      FileUrl:8/little-binary>>.

%% @doc Decode CAMERA_IMAGE_CAPTURED message from binary
-spec decode_camera_image_captured(binary()) -> #camera_image_captured{}.
decode_camera_image_captured(<<?CAMERA_IMAGE_CAPTURED_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   TimeUtc:64/little-unsigned-integer,
                   CameraId:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-signed-integer,
                   RelativeAlt:32/little-signed-integer,
                   Q:32/little-float,
                   ImageIndex:32/little-signed-integer,
                   CaptureResult:8/little-signed-integer,
                   FileUrl:8/little-binary>>) ->
    #camera_image_captured{
        time_boot_ms = TimeBootMs,
        time_utc = TimeUtc,
        camera_id = CameraId,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        relative_alt = RelativeAlt,
        q = Q,
        image_index = ImageIndex,
        capture_result = CaptureResult,
        file_url = FileUrl
    }.

%% @doc Encode FLIGHT_INFORMATION message to binary
-spec encode_flight_information(#flight_information{}) -> binary().
encode_flight_information(#flight_information{
    time_boot_ms = TimeBootMs,
    arming_time_utc = ArmingTimeUtc,
    takeoff_time_utc = TakeoffTimeUtc,
    flight_uuid = FlightUuid,
    landing_time = LandingTime
}) ->
    <<?FLIGHT_INFORMATION_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      ArmingTimeUtc:64/little-unsigned-integer,
      TakeoffTimeUtc:64/little-unsigned-integer,
      FlightUuid:64/little-unsigned-integer,
      LandingTime:32/little-unsigned-integer>>.

%% @doc Decode FLIGHT_INFORMATION message from binary
-spec decode_flight_information(binary()) -> #flight_information{}.
decode_flight_information(<<?FLIGHT_INFORMATION_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   ArmingTimeUtc:64/little-unsigned-integer,
                   TakeoffTimeUtc:64/little-unsigned-integer,
                   FlightUuid:64/little-unsigned-integer,
                   LandingTime:32/little-unsigned-integer>>) ->
    #flight_information{
        time_boot_ms = TimeBootMs,
        arming_time_utc = ArmingTimeUtc,
        takeoff_time_utc = TakeoffTimeUtc,
        flight_uuid = FlightUuid,
        landing_time = LandingTime
    }.

%% @doc Encode MOUNT_ORIENTATION message to binary
-spec encode_mount_orientation(#mount_orientation{}) -> binary().
encode_mount_orientation(#mount_orientation{
    time_boot_ms = TimeBootMs,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    yaw_absolute = YawAbsolute
}) ->
    <<?MOUNT_ORIENTATION_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      YawAbsolute:32/little-float>>.

%% @doc Decode MOUNT_ORIENTATION message from binary
-spec decode_mount_orientation(binary()) -> #mount_orientation{}.
decode_mount_orientation(<<?MOUNT_ORIENTATION_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   YawAbsolute:32/little-float>>) ->
    #mount_orientation{
        time_boot_ms = TimeBootMs,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        yaw_absolute = YawAbsolute
    }.

%% @doc Encode LOGGING_DATA message to binary
-spec encode_logging_data(#logging_data{}) -> binary().
encode_logging_data(#logging_data{
    target_system = TargetSystem,
    target_component = TargetComponent,
    sequence = Sequence,
    length = Length,
    first_message_offset = FirstMessageOffset,
    data = Data
}) ->
    <<?LOGGING_DATA_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Sequence:16/little-unsigned-integer,
      Length:8/little-unsigned-integer,
      FirstMessageOffset:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode LOGGING_DATA message from binary
-spec decode_logging_data(binary()) -> #logging_data{}.
decode_logging_data(<<?LOGGING_DATA_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Sequence:16/little-unsigned-integer,
                   Length:8/little-unsigned-integer,
                   FirstMessageOffset:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #logging_data{
        target_system = TargetSystem,
        target_component = TargetComponent,
        sequence = Sequence,
        length = Length,
        first_message_offset = FirstMessageOffset,
        data = Data
    }.

%% @doc Encode LOGGING_DATA_ACKED message to binary
-spec encode_logging_data_acked(#logging_data_acked{}) -> binary().
encode_logging_data_acked(#logging_data_acked{
    target_system = TargetSystem,
    target_component = TargetComponent,
    sequence = Sequence,
    length = Length,
    first_message_offset = FirstMessageOffset,
    data = Data
}) ->
    <<?LOGGING_DATA_ACKED_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Sequence:16/little-unsigned-integer,
      Length:8/little-unsigned-integer,
      FirstMessageOffset:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode LOGGING_DATA_ACKED message from binary
-spec decode_logging_data_acked(binary()) -> #logging_data_acked{}.
decode_logging_data_acked(<<?LOGGING_DATA_ACKED_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Sequence:16/little-unsigned-integer,
                   Length:8/little-unsigned-integer,
                   FirstMessageOffset:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #logging_data_acked{
        target_system = TargetSystem,
        target_component = TargetComponent,
        sequence = Sequence,
        length = Length,
        first_message_offset = FirstMessageOffset,
        data = Data
    }.

%% @doc Encode LOGGING_ACK message to binary
-spec encode_logging_ack(#logging_ack{}) -> binary().
encode_logging_ack(#logging_ack{
    target_system = TargetSystem,
    target_component = TargetComponent,
    sequence = Sequence
}) ->
    <<?LOGGING_ACK_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Sequence:16/little-unsigned-integer>>.

%% @doc Decode LOGGING_ACK message from binary
-spec decode_logging_ack(binary()) -> #logging_ack{}.
decode_logging_ack(<<?LOGGING_ACK_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Sequence:16/little-unsigned-integer>>) ->
    #logging_ack{
        target_system = TargetSystem,
        target_component = TargetComponent,
        sequence = Sequence
    }.

%% @doc Encode VIDEO_STREAM_INFORMATION message to binary
-spec encode_video_stream_information(#video_stream_information{}) -> binary().
encode_video_stream_information(#video_stream_information{
    stream_id = StreamId,
    count = Count,
    type = Type,
    flags = Flags,
    framerate = Framerate,
    resolution_h = ResolutionH,
    resolution_v = ResolutionV,
    bitrate = Bitrate,
    rotation = Rotation,
    hfov = Hfov,
    name = Name,
    uri = Uri,
    encoding = Encoding,
    camera_device_id = CameraDeviceId,
    vfov = Vfov
}) ->
    <<?VIDEO_STREAM_INFORMATION_ID:16/little-unsigned-integer,
      StreamId:8/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      Flags:16/little-unsigned-integer,
      Framerate:32/little-float,
      ResolutionH:16/little-unsigned-integer,
      ResolutionV:16/little-unsigned-integer,
      Bitrate:32/little-unsigned-integer,
      Rotation:16/little-unsigned-integer,
      Hfov:16/little-unsigned-integer,
      Name:8/little-binary,
      Uri:8/little-binary,
      Encoding:8/little-unsigned-integer,
      CameraDeviceId:8/little-unsigned-integer,
      Vfov:16/little-unsigned-integer>>.

%% @doc Decode VIDEO_STREAM_INFORMATION message from binary
-spec decode_video_stream_information(binary()) -> #video_stream_information{}.
decode_video_stream_information(<<?VIDEO_STREAM_INFORMATION_ID:16/little-unsigned-integer,
                   StreamId:8/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   Flags:16/little-unsigned-integer,
                   Framerate:32/little-float,
                   ResolutionH:16/little-unsigned-integer,
                   ResolutionV:16/little-unsigned-integer,
                   Bitrate:32/little-unsigned-integer,
                   Rotation:16/little-unsigned-integer,
                   Hfov:16/little-unsigned-integer,
                   Name:8/little-binary,
                   Uri:8/little-binary,
                   Encoding:8/little-unsigned-integer,
                   CameraDeviceId:8/little-unsigned-integer,
                   Vfov:16/little-unsigned-integer>>) ->
    #video_stream_information{
        stream_id = StreamId,
        count = Count,
        type = Type,
        flags = Flags,
        framerate = Framerate,
        resolution_h = ResolutionH,
        resolution_v = ResolutionV,
        bitrate = Bitrate,
        rotation = Rotation,
        hfov = Hfov,
        name = Name,
        uri = Uri,
        encoding = Encoding,
        camera_device_id = CameraDeviceId,
        vfov = Vfov
    }.

%% @doc Encode VIDEO_STREAM_STATUS message to binary
-spec encode_video_stream_status(#video_stream_status{}) -> binary().
encode_video_stream_status(#video_stream_status{
    stream_id = StreamId,
    flags = Flags,
    framerate = Framerate,
    resolution_h = ResolutionH,
    resolution_v = ResolutionV,
    bitrate = Bitrate,
    rotation = Rotation,
    hfov = Hfov,
    camera_device_id = CameraDeviceId,
    vfov = Vfov
}) ->
    <<?VIDEO_STREAM_STATUS_ID:16/little-unsigned-integer,
      StreamId:8/little-unsigned-integer,
      Flags:16/little-unsigned-integer,
      Framerate:32/little-float,
      ResolutionH:16/little-unsigned-integer,
      ResolutionV:16/little-unsigned-integer,
      Bitrate:32/little-unsigned-integer,
      Rotation:16/little-unsigned-integer,
      Hfov:16/little-unsigned-integer,
      CameraDeviceId:8/little-unsigned-integer,
      Vfov:16/little-unsigned-integer>>.

%% @doc Decode VIDEO_STREAM_STATUS message from binary
-spec decode_video_stream_status(binary()) -> #video_stream_status{}.
decode_video_stream_status(<<?VIDEO_STREAM_STATUS_ID:16/little-unsigned-integer,
                   StreamId:8/little-unsigned-integer,
                   Flags:16/little-unsigned-integer,
                   Framerate:32/little-float,
                   ResolutionH:16/little-unsigned-integer,
                   ResolutionV:16/little-unsigned-integer,
                   Bitrate:32/little-unsigned-integer,
                   Rotation:16/little-unsigned-integer,
                   Hfov:16/little-unsigned-integer,
                   CameraDeviceId:8/little-unsigned-integer,
                   Vfov:16/little-unsigned-integer>>) ->
    #video_stream_status{
        stream_id = StreamId,
        flags = Flags,
        framerate = Framerate,
        resolution_h = ResolutionH,
        resolution_v = ResolutionV,
        bitrate = Bitrate,
        rotation = Rotation,
        hfov = Hfov,
        camera_device_id = CameraDeviceId,
        vfov = Vfov
    }.

%% @doc Encode CAMERA_FOV_STATUS message to binary
-spec encode_camera_fov_status(#camera_fov_status{}) -> binary().
encode_camera_fov_status(#camera_fov_status{
    time_boot_ms = TimeBootMs,
    lat_camera = LatCamera,
    lon_camera = LonCamera,
    alt_camera = AltCamera,
    lat_image = LatImage,
    lon_image = LonImage,
    alt_image = AltImage,
    q = Q,
    hfov = Hfov,
    vfov = Vfov,
    camera_device_id = CameraDeviceId,
    stream_id = StreamId
}) ->
    <<?CAMERA_FOV_STATUS_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      LatCamera:32/little-signed-integer,
      LonCamera:32/little-signed-integer,
      AltCamera:32/little-signed-integer,
      LatImage:32/little-signed-integer,
      LonImage:32/little-signed-integer,
      AltImage:32/little-signed-integer,
      Q:32/little-float,
      Hfov:32/little-float,
      Vfov:32/little-float,
      CameraDeviceId:8/little-unsigned-integer,
      StreamId:8/little-unsigned-integer>>.

%% @doc Decode CAMERA_FOV_STATUS message from binary
-spec decode_camera_fov_status(binary()) -> #camera_fov_status{}.
decode_camera_fov_status(<<?CAMERA_FOV_STATUS_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   LatCamera:32/little-signed-integer,
                   LonCamera:32/little-signed-integer,
                   AltCamera:32/little-signed-integer,
                   LatImage:32/little-signed-integer,
                   LonImage:32/little-signed-integer,
                   AltImage:32/little-signed-integer,
                   Q:32/little-float,
                   Hfov:32/little-float,
                   Vfov:32/little-float,
                   CameraDeviceId:8/little-unsigned-integer,
                   StreamId:8/little-unsigned-integer>>) ->
    #camera_fov_status{
        time_boot_ms = TimeBootMs,
        lat_camera = LatCamera,
        lon_camera = LonCamera,
        alt_camera = AltCamera,
        lat_image = LatImage,
        lon_image = LonImage,
        alt_image = AltImage,
        q = Q,
        hfov = Hfov,
        vfov = Vfov,
        camera_device_id = CameraDeviceId,
        stream_id = StreamId
    }.

%% @doc Encode CAMERA_TRACKING_IMAGE_STATUS message to binary
-spec encode_camera_tracking_image_status(#camera_tracking_image_status{}) -> binary().
encode_camera_tracking_image_status(#camera_tracking_image_status{
    tracking_status = TrackingStatus,
    tracking_mode = TrackingMode,
    target_data = TargetData,
    point_x = PointX,
    point_y = PointY,
    radius = Radius,
    rec_top_x = RecTopX,
    rec_top_y = RecTopY,
    rec_bottom_x = RecBottomX,
    rec_bottom_y = RecBottomY,
    camera_device_id = CameraDeviceId
}) ->
    <<?CAMERA_TRACKING_IMAGE_STATUS_ID:16/little-unsigned-integer,
      TrackingStatus:8/little-unsigned-integer,
      TrackingMode:8/little-unsigned-integer,
      TargetData:8/little-unsigned-integer,
      PointX:32/little-float,
      PointY:32/little-float,
      Radius:32/little-float,
      RecTopX:32/little-float,
      RecTopY:32/little-float,
      RecBottomX:32/little-float,
      RecBottomY:32/little-float,
      CameraDeviceId:8/little-unsigned-integer>>.

%% @doc Decode CAMERA_TRACKING_IMAGE_STATUS message from binary
-spec decode_camera_tracking_image_status(binary()) -> #camera_tracking_image_status{}.
decode_camera_tracking_image_status(<<?CAMERA_TRACKING_IMAGE_STATUS_ID:16/little-unsigned-integer,
                   TrackingStatus:8/little-unsigned-integer,
                   TrackingMode:8/little-unsigned-integer,
                   TargetData:8/little-unsigned-integer,
                   PointX:32/little-float,
                   PointY:32/little-float,
                   Radius:32/little-float,
                   RecTopX:32/little-float,
                   RecTopY:32/little-float,
                   RecBottomX:32/little-float,
                   RecBottomY:32/little-float,
                   CameraDeviceId:8/little-unsigned-integer>>) ->
    #camera_tracking_image_status{
        tracking_status = TrackingStatus,
        tracking_mode = TrackingMode,
        target_data = TargetData,
        point_x = PointX,
        point_y = PointY,
        radius = Radius,
        rec_top_x = RecTopX,
        rec_top_y = RecTopY,
        rec_bottom_x = RecBottomX,
        rec_bottom_y = RecBottomY,
        camera_device_id = CameraDeviceId
    }.

%% @doc Encode CAMERA_TRACKING_GEO_STATUS message to binary
-spec encode_camera_tracking_geo_status(#camera_tracking_geo_status{}) -> binary().
encode_camera_tracking_geo_status(#camera_tracking_geo_status{
    tracking_status = TrackingStatus,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    h_acc = HAcc,
    v_acc = VAcc,
    vel_n = VelN,
    vel_e = VelE,
    vel_d = VelD,
    vel_acc = VelAcc,
    dist = Dist,
    hdg = Hdg,
    hdg_acc = HdgAcc,
    camera_device_id = CameraDeviceId
}) ->
    <<?CAMERA_TRACKING_GEO_STATUS_ID:16/little-unsigned-integer,
      TrackingStatus:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-float,
      HAcc:32/little-float,
      VAcc:32/little-float,
      VelN:32/little-float,
      VelE:32/little-float,
      VelD:32/little-float,
      VelAcc:32/little-float,
      Dist:32/little-float,
      Hdg:32/little-float,
      HdgAcc:32/little-float,
      CameraDeviceId:8/little-unsigned-integer>>.

%% @doc Decode CAMERA_TRACKING_GEO_STATUS message from binary
-spec decode_camera_tracking_geo_status(binary()) -> #camera_tracking_geo_status{}.
decode_camera_tracking_geo_status(<<?CAMERA_TRACKING_GEO_STATUS_ID:16/little-unsigned-integer,
                   TrackingStatus:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-float,
                   HAcc:32/little-float,
                   VAcc:32/little-float,
                   VelN:32/little-float,
                   VelE:32/little-float,
                   VelD:32/little-float,
                   VelAcc:32/little-float,
                   Dist:32/little-float,
                   Hdg:32/little-float,
                   HdgAcc:32/little-float,
                   CameraDeviceId:8/little-unsigned-integer>>) ->
    #camera_tracking_geo_status{
        tracking_status = TrackingStatus,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        h_acc = HAcc,
        v_acc = VAcc,
        vel_n = VelN,
        vel_e = VelE,
        vel_d = VelD,
        vel_acc = VelAcc,
        dist = Dist,
        hdg = Hdg,
        hdg_acc = HdgAcc,
        camera_device_id = CameraDeviceId
    }.

%% @doc Encode CAMERA_THERMAL_RANGE message to binary
-spec encode_camera_thermal_range(#camera_thermal_range{}) -> binary().
encode_camera_thermal_range(#camera_thermal_range{
    time_boot_ms = TimeBootMs,
    stream_id = StreamId,
    camera_device_id = CameraDeviceId,
    max = Max,
    max_point_x = MaxPointX,
    max_point_y = MaxPointY,
    min = Min,
    min_point_x = MinPointX,
    min_point_y = MinPointY
}) ->
    <<?CAMERA_THERMAL_RANGE_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      StreamId:8/little-unsigned-integer,
      CameraDeviceId:8/little-unsigned-integer,
      Max:32/little-float,
      MaxPointX:32/little-float,
      MaxPointY:32/little-float,
      Min:32/little-float,
      MinPointX:32/little-float,
      MinPointY:32/little-float>>.

%% @doc Decode CAMERA_THERMAL_RANGE message from binary
-spec decode_camera_thermal_range(binary()) -> #camera_thermal_range{}.
decode_camera_thermal_range(<<?CAMERA_THERMAL_RANGE_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   StreamId:8/little-unsigned-integer,
                   CameraDeviceId:8/little-unsigned-integer,
                   Max:32/little-float,
                   MaxPointX:32/little-float,
                   MaxPointY:32/little-float,
                   Min:32/little-float,
                   MinPointX:32/little-float,
                   MinPointY:32/little-float>>) ->
    #camera_thermal_range{
        time_boot_ms = TimeBootMs,
        stream_id = StreamId,
        camera_device_id = CameraDeviceId,
        max = Max,
        max_point_x = MaxPointX,
        max_point_y = MaxPointY,
        min = Min,
        min_point_x = MinPointX,
        min_point_y = MinPointY
    }.

%% @doc Encode GIMBAL_MANAGER_INFORMATION message to binary
-spec encode_gimbal_manager_information(#gimbal_manager_information{}) -> binary().
encode_gimbal_manager_information(#gimbal_manager_information{
    time_boot_ms = TimeBootMs,
    cap_flags = CapFlags,
    gimbal_device_id = GimbalDeviceId,
    roll_min = RollMin,
    roll_max = RollMax,
    pitch_min = PitchMin,
    pitch_max = PitchMax,
    yaw_min = YawMin,
    yaw_max = YawMax
}) ->
    <<?GIMBAL_MANAGER_INFORMATION_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      CapFlags:32/little-unsigned-integer,
      GimbalDeviceId:8/little-unsigned-integer,
      RollMin:32/little-float,
      RollMax:32/little-float,
      PitchMin:32/little-float,
      PitchMax:32/little-float,
      YawMin:32/little-float,
      YawMax:32/little-float>>.

%% @doc Decode GIMBAL_MANAGER_INFORMATION message from binary
-spec decode_gimbal_manager_information(binary()) -> #gimbal_manager_information{}.
decode_gimbal_manager_information(<<?GIMBAL_MANAGER_INFORMATION_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   CapFlags:32/little-unsigned-integer,
                   GimbalDeviceId:8/little-unsigned-integer,
                   RollMin:32/little-float,
                   RollMax:32/little-float,
                   PitchMin:32/little-float,
                   PitchMax:32/little-float,
                   YawMin:32/little-float,
                   YawMax:32/little-float>>) ->
    #gimbal_manager_information{
        time_boot_ms = TimeBootMs,
        cap_flags = CapFlags,
        gimbal_device_id = GimbalDeviceId,
        roll_min = RollMin,
        roll_max = RollMax,
        pitch_min = PitchMin,
        pitch_max = PitchMax,
        yaw_min = YawMin,
        yaw_max = YawMax
    }.

%% @doc Encode GIMBAL_MANAGER_STATUS message to binary
-spec encode_gimbal_manager_status(#gimbal_manager_status{}) -> binary().
encode_gimbal_manager_status(#gimbal_manager_status{
    time_boot_ms = TimeBootMs,
    flags = Flags,
    gimbal_device_id = GimbalDeviceId,
    primary_control_sysid = PrimaryControlSysid,
    primary_control_compid = PrimaryControlCompid,
    secondary_control_sysid = SecondaryControlSysid,
    secondary_control_compid = SecondaryControlCompid
}) ->
    <<?GIMBAL_MANAGER_STATUS_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      Flags:32/little-unsigned-integer,
      GimbalDeviceId:8/little-unsigned-integer,
      PrimaryControlSysid:8/little-unsigned-integer,
      PrimaryControlCompid:8/little-unsigned-integer,
      SecondaryControlSysid:8/little-unsigned-integer,
      SecondaryControlCompid:8/little-unsigned-integer>>.

%% @doc Decode GIMBAL_MANAGER_STATUS message from binary
-spec decode_gimbal_manager_status(binary()) -> #gimbal_manager_status{}.
decode_gimbal_manager_status(<<?GIMBAL_MANAGER_STATUS_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   Flags:32/little-unsigned-integer,
                   GimbalDeviceId:8/little-unsigned-integer,
                   PrimaryControlSysid:8/little-unsigned-integer,
                   PrimaryControlCompid:8/little-unsigned-integer,
                   SecondaryControlSysid:8/little-unsigned-integer,
                   SecondaryControlCompid:8/little-unsigned-integer>>) ->
    #gimbal_manager_status{
        time_boot_ms = TimeBootMs,
        flags = Flags,
        gimbal_device_id = GimbalDeviceId,
        primary_control_sysid = PrimaryControlSysid,
        primary_control_compid = PrimaryControlCompid,
        secondary_control_sysid = SecondaryControlSysid,
        secondary_control_compid = SecondaryControlCompid
    }.

%% @doc Encode GIMBAL_MANAGER_SET_ATTITUDE message to binary
-spec encode_gimbal_manager_set_attitude(#gimbal_manager_set_attitude{}) -> binary().
encode_gimbal_manager_set_attitude(#gimbal_manager_set_attitude{
    target_system = TargetSystem,
    target_component = TargetComponent,
    flags = Flags,
    gimbal_device_id = GimbalDeviceId,
    q = Q,
    angular_velocity_x = AngularVelocityX,
    angular_velocity_y = AngularVelocityY,
    angular_velocity_z = AngularVelocityZ
}) ->
    <<?GIMBAL_MANAGER_SET_ATTITUDE_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Flags:32/little-unsigned-integer,
      GimbalDeviceId:8/little-unsigned-integer,
      Q:32/little-float,
      AngularVelocityX:32/little-float,
      AngularVelocityY:32/little-float,
      AngularVelocityZ:32/little-float>>.

%% @doc Decode GIMBAL_MANAGER_SET_ATTITUDE message from binary
-spec decode_gimbal_manager_set_attitude(binary()) -> #gimbal_manager_set_attitude{}.
decode_gimbal_manager_set_attitude(<<?GIMBAL_MANAGER_SET_ATTITUDE_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Flags:32/little-unsigned-integer,
                   GimbalDeviceId:8/little-unsigned-integer,
                   Q:32/little-float,
                   AngularVelocityX:32/little-float,
                   AngularVelocityY:32/little-float,
                   AngularVelocityZ:32/little-float>>) ->
    #gimbal_manager_set_attitude{
        target_system = TargetSystem,
        target_component = TargetComponent,
        flags = Flags,
        gimbal_device_id = GimbalDeviceId,
        q = Q,
        angular_velocity_x = AngularVelocityX,
        angular_velocity_y = AngularVelocityY,
        angular_velocity_z = AngularVelocityZ
    }.

%% @doc Encode GIMBAL_DEVICE_INFORMATION message to binary
-spec encode_gimbal_device_information(#gimbal_device_information{}) -> binary().
encode_gimbal_device_information(#gimbal_device_information{
    time_boot_ms = TimeBootMs,
    vendor_name = VendorName,
    model_name = ModelName,
    custom_name = CustomName,
    firmware_version = FirmwareVersion,
    hardware_version = HardwareVersion,
    uid = Uid,
    cap_flags = CapFlags,
    custom_cap_flags = CustomCapFlags,
    roll_min = RollMin,
    roll_max = RollMax,
    pitch_min = PitchMin,
    pitch_max = PitchMax,
    yaw_min = YawMin,
    yaw_max = YawMax,
    gimbal_device_id = GimbalDeviceId,
    cap_flags2 = CapFlags2
}) ->
    <<?GIMBAL_DEVICE_INFORMATION_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      VendorName:8/little-binary,
      ModelName:8/little-binary,
      CustomName:8/little-binary,
      FirmwareVersion:32/little-unsigned-integer,
      HardwareVersion:32/little-unsigned-integer,
      Uid:64/little-unsigned-integer,
      CapFlags:16/little-unsigned-integer,
      CustomCapFlags:16/little-unsigned-integer,
      RollMin:32/little-float,
      RollMax:32/little-float,
      PitchMin:32/little-float,
      PitchMax:32/little-float,
      YawMin:32/little-float,
      YawMax:32/little-float,
      GimbalDeviceId:8/little-unsigned-integer,
      CapFlags2:32/little-unsigned-integer>>.

%% @doc Decode GIMBAL_DEVICE_INFORMATION message from binary
-spec decode_gimbal_device_information(binary()) -> #gimbal_device_information{}.
decode_gimbal_device_information(<<?GIMBAL_DEVICE_INFORMATION_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   VendorName:8/little-binary,
                   ModelName:8/little-binary,
                   CustomName:8/little-binary,
                   FirmwareVersion:32/little-unsigned-integer,
                   HardwareVersion:32/little-unsigned-integer,
                   Uid:64/little-unsigned-integer,
                   CapFlags:16/little-unsigned-integer,
                   CustomCapFlags:16/little-unsigned-integer,
                   RollMin:32/little-float,
                   RollMax:32/little-float,
                   PitchMin:32/little-float,
                   PitchMax:32/little-float,
                   YawMin:32/little-float,
                   YawMax:32/little-float,
                   GimbalDeviceId:8/little-unsigned-integer,
                   CapFlags2:32/little-unsigned-integer>>) ->
    #gimbal_device_information{
        time_boot_ms = TimeBootMs,
        vendor_name = VendorName,
        model_name = ModelName,
        custom_name = CustomName,
        firmware_version = FirmwareVersion,
        hardware_version = HardwareVersion,
        uid = Uid,
        cap_flags = CapFlags,
        custom_cap_flags = CustomCapFlags,
        roll_min = RollMin,
        roll_max = RollMax,
        pitch_min = PitchMin,
        pitch_max = PitchMax,
        yaw_min = YawMin,
        yaw_max = YawMax,
        gimbal_device_id = GimbalDeviceId,
        cap_flags2 = CapFlags2
    }.

%% @doc Encode GIMBAL_DEVICE_SET_ATTITUDE message to binary
-spec encode_gimbal_device_set_attitude(#gimbal_device_set_attitude{}) -> binary().
encode_gimbal_device_set_attitude(#gimbal_device_set_attitude{
    target_system = TargetSystem,
    target_component = TargetComponent,
    flags = Flags,
    q = Q,
    angular_velocity_x = AngularVelocityX,
    angular_velocity_y = AngularVelocityY,
    angular_velocity_z = AngularVelocityZ
}) ->
    <<?GIMBAL_DEVICE_SET_ATTITUDE_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Flags:16/little-unsigned-integer,
      Q:32/little-float,
      AngularVelocityX:32/little-float,
      AngularVelocityY:32/little-float,
      AngularVelocityZ:32/little-float>>.

%% @doc Decode GIMBAL_DEVICE_SET_ATTITUDE message from binary
-spec decode_gimbal_device_set_attitude(binary()) -> #gimbal_device_set_attitude{}.
decode_gimbal_device_set_attitude(<<?GIMBAL_DEVICE_SET_ATTITUDE_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Flags:16/little-unsigned-integer,
                   Q:32/little-float,
                   AngularVelocityX:32/little-float,
                   AngularVelocityY:32/little-float,
                   AngularVelocityZ:32/little-float>>) ->
    #gimbal_device_set_attitude{
        target_system = TargetSystem,
        target_component = TargetComponent,
        flags = Flags,
        q = Q,
        angular_velocity_x = AngularVelocityX,
        angular_velocity_y = AngularVelocityY,
        angular_velocity_z = AngularVelocityZ
    }.

%% @doc Encode GIMBAL_DEVICE_ATTITUDE_STATUS message to binary
-spec encode_gimbal_device_attitude_status(#gimbal_device_attitude_status{}) -> binary().
encode_gimbal_device_attitude_status(#gimbal_device_attitude_status{
    target_system = TargetSystem,
    target_component = TargetComponent,
    time_boot_ms = TimeBootMs,
    flags = Flags,
    q = Q,
    angular_velocity_x = AngularVelocityX,
    angular_velocity_y = AngularVelocityY,
    angular_velocity_z = AngularVelocityZ,
    failure_flags = FailureFlags,
    delta_yaw = DeltaYaw,
    delta_yaw_velocity = DeltaYawVelocity,
    gimbal_device_id = GimbalDeviceId
}) ->
    <<?GIMBAL_DEVICE_ATTITUDE_STATUS_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      Flags:16/little-unsigned-integer,
      Q:32/little-float,
      AngularVelocityX:32/little-float,
      AngularVelocityY:32/little-float,
      AngularVelocityZ:32/little-float,
      FailureFlags:32/little-unsigned-integer,
      DeltaYaw:32/little-float,
      DeltaYawVelocity:32/little-float,
      GimbalDeviceId:8/little-unsigned-integer>>.

%% @doc Decode GIMBAL_DEVICE_ATTITUDE_STATUS message from binary
-spec decode_gimbal_device_attitude_status(binary()) -> #gimbal_device_attitude_status{}.
decode_gimbal_device_attitude_status(<<?GIMBAL_DEVICE_ATTITUDE_STATUS_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   Flags:16/little-unsigned-integer,
                   Q:32/little-float,
                   AngularVelocityX:32/little-float,
                   AngularVelocityY:32/little-float,
                   AngularVelocityZ:32/little-float,
                   FailureFlags:32/little-unsigned-integer,
                   DeltaYaw:32/little-float,
                   DeltaYawVelocity:32/little-float,
                   GimbalDeviceId:8/little-unsigned-integer>>) ->
    #gimbal_device_attitude_status{
        target_system = TargetSystem,
        target_component = TargetComponent,
        time_boot_ms = TimeBootMs,
        flags = Flags,
        q = Q,
        angular_velocity_x = AngularVelocityX,
        angular_velocity_y = AngularVelocityY,
        angular_velocity_z = AngularVelocityZ,
        failure_flags = FailureFlags,
        delta_yaw = DeltaYaw,
        delta_yaw_velocity = DeltaYawVelocity,
        gimbal_device_id = GimbalDeviceId
    }.

%% @doc Encode AUTOPILOT_STATE_FOR_GIMBAL_DEVICE message to binary
-spec encode_autopilot_state_for_gimbal_device(#autopilot_state_for_gimbal_device{}) -> binary().
encode_autopilot_state_for_gimbal_device(#autopilot_state_for_gimbal_device{
    target_system = TargetSystem,
    target_component = TargetComponent,
    time_boot_us = TimeBootUs,
    q = Q,
    q_estimated_delay_us = QEstimatedDelayUs,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    v_estimated_delay_us = VEstimatedDelayUs,
    feed_forward_angular_velocity_z = FeedForwardAngularVelocityZ,
    estimator_status = EstimatorStatus,
    landed_state = LandedState,
    angular_velocity_z = AngularVelocityZ
}) ->
    <<?AUTOPILOT_STATE_FOR_GIMBAL_DEVICE_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      TimeBootUs:64/little-unsigned-integer,
      Q:32/little-float,
      QEstimatedDelayUs:32/little-unsigned-integer,
      Vx:32/little-float,
      Vy:32/little-float,
      Vz:32/little-float,
      VEstimatedDelayUs:32/little-unsigned-integer,
      FeedForwardAngularVelocityZ:32/little-float,
      EstimatorStatus:16/little-unsigned-integer,
      LandedState:8/little-unsigned-integer,
      AngularVelocityZ:32/little-float>>.

%% @doc Decode AUTOPILOT_STATE_FOR_GIMBAL_DEVICE message from binary
-spec decode_autopilot_state_for_gimbal_device(binary()) -> #autopilot_state_for_gimbal_device{}.
decode_autopilot_state_for_gimbal_device(<<?AUTOPILOT_STATE_FOR_GIMBAL_DEVICE_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   TimeBootUs:64/little-unsigned-integer,
                   Q:32/little-float,
                   QEstimatedDelayUs:32/little-unsigned-integer,
                   Vx:32/little-float,
                   Vy:32/little-float,
                   Vz:32/little-float,
                   VEstimatedDelayUs:32/little-unsigned-integer,
                   FeedForwardAngularVelocityZ:32/little-float,
                   EstimatorStatus:16/little-unsigned-integer,
                   LandedState:8/little-unsigned-integer,
                   AngularVelocityZ:32/little-float>>) ->
    #autopilot_state_for_gimbal_device{
        target_system = TargetSystem,
        target_component = TargetComponent,
        time_boot_us = TimeBootUs,
        q = Q,
        q_estimated_delay_us = QEstimatedDelayUs,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        v_estimated_delay_us = VEstimatedDelayUs,
        feed_forward_angular_velocity_z = FeedForwardAngularVelocityZ,
        estimator_status = EstimatorStatus,
        landed_state = LandedState,
        angular_velocity_z = AngularVelocityZ
    }.

%% @doc Encode GIMBAL_MANAGER_SET_PITCHYAW message to binary
-spec encode_gimbal_manager_set_pitchyaw(#gimbal_manager_set_pitchyaw{}) -> binary().
encode_gimbal_manager_set_pitchyaw(#gimbal_manager_set_pitchyaw{
    target_system = TargetSystem,
    target_component = TargetComponent,
    flags = Flags,
    gimbal_device_id = GimbalDeviceId,
    pitch = Pitch,
    yaw = Yaw,
    pitch_rate = PitchRate,
    yaw_rate = YawRate
}) ->
    <<?GIMBAL_MANAGER_SET_PITCHYAW_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Flags:32/little-unsigned-integer,
      GimbalDeviceId:8/little-unsigned-integer,
      Pitch:32/little-float,
      Yaw:32/little-float,
      PitchRate:32/little-float,
      YawRate:32/little-float>>.

%% @doc Decode GIMBAL_MANAGER_SET_PITCHYAW message from binary
-spec decode_gimbal_manager_set_pitchyaw(binary()) -> #gimbal_manager_set_pitchyaw{}.
decode_gimbal_manager_set_pitchyaw(<<?GIMBAL_MANAGER_SET_PITCHYAW_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Flags:32/little-unsigned-integer,
                   GimbalDeviceId:8/little-unsigned-integer,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   PitchRate:32/little-float,
                   YawRate:32/little-float>>) ->
    #gimbal_manager_set_pitchyaw{
        target_system = TargetSystem,
        target_component = TargetComponent,
        flags = Flags,
        gimbal_device_id = GimbalDeviceId,
        pitch = Pitch,
        yaw = Yaw,
        pitch_rate = PitchRate,
        yaw_rate = YawRate
    }.

%% @doc Encode GIMBAL_MANAGER_SET_MANUAL_CONTROL message to binary
-spec encode_gimbal_manager_set_manual_control(#gimbal_manager_set_manual_control{}) -> binary().
encode_gimbal_manager_set_manual_control(#gimbal_manager_set_manual_control{
    target_system = TargetSystem,
    target_component = TargetComponent,
    flags = Flags,
    gimbal_device_id = GimbalDeviceId,
    pitch = Pitch,
    yaw = Yaw,
    pitch_rate = PitchRate,
    yaw_rate = YawRate
}) ->
    <<?GIMBAL_MANAGER_SET_MANUAL_CONTROL_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Flags:32/little-unsigned-integer,
      GimbalDeviceId:8/little-unsigned-integer,
      Pitch:32/little-float,
      Yaw:32/little-float,
      PitchRate:32/little-float,
      YawRate:32/little-float>>.

%% @doc Decode GIMBAL_MANAGER_SET_MANUAL_CONTROL message from binary
-spec decode_gimbal_manager_set_manual_control(binary()) -> #gimbal_manager_set_manual_control{}.
decode_gimbal_manager_set_manual_control(<<?GIMBAL_MANAGER_SET_MANUAL_CONTROL_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Flags:32/little-unsigned-integer,
                   GimbalDeviceId:8/little-unsigned-integer,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   PitchRate:32/little-float,
                   YawRate:32/little-float>>) ->
    #gimbal_manager_set_manual_control{
        target_system = TargetSystem,
        target_component = TargetComponent,
        flags = Flags,
        gimbal_device_id = GimbalDeviceId,
        pitch = Pitch,
        yaw = Yaw,
        pitch_rate = PitchRate,
        yaw_rate = YawRate
    }.

%% @doc Encode ESC_INFO message to binary
-spec encode_esc_info(#esc_info{}) -> binary().
encode_esc_info(#esc_info{
    index = Index,
    time_usec = TimeUsec,
    counter = Counter,
    count = Count,
    connection_type = ConnectionType,
    info = Info,
    failure_flags = FailureFlags,
    error_count = ErrorCount,
    temperature = Temperature
}) ->
    <<?ESC_INFO_ID:16/little-unsigned-integer,
      Index:8/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      Counter:16/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      ConnectionType:8/little-unsigned-integer,
      Info:8/little-unsigned-integer,
      FailureFlags:16/little-unsigned-integer,
      ErrorCount:32/little-unsigned-integer,
      Temperature:16/little-signed-integer>>.

%% @doc Decode ESC_INFO message from binary
-spec decode_esc_info(binary()) -> #esc_info{}.
decode_esc_info(<<?ESC_INFO_ID:16/little-unsigned-integer,
                   Index:8/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   Counter:16/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   ConnectionType:8/little-unsigned-integer,
                   Info:8/little-unsigned-integer,
                   FailureFlags:16/little-unsigned-integer,
                   ErrorCount:32/little-unsigned-integer,
                   Temperature:16/little-signed-integer>>) ->
    #esc_info{
        index = Index,
        time_usec = TimeUsec,
        counter = Counter,
        count = Count,
        connection_type = ConnectionType,
        info = Info,
        failure_flags = FailureFlags,
        error_count = ErrorCount,
        temperature = Temperature
    }.

%% @doc Encode ESC_STATUS message to binary
-spec encode_esc_status(#esc_status{}) -> binary().
encode_esc_status(#esc_status{
    index = Index,
    time_usec = TimeUsec,
    rpm = Rpm,
    voltage = Voltage,
    current = Current
}) ->
    <<?ESC_STATUS_ID:16/little-unsigned-integer,
      Index:8/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      Rpm:32/little-signed-integer,
      Voltage:32/little-float,
      Current:32/little-float>>.

%% @doc Decode ESC_STATUS message from binary
-spec decode_esc_status(binary()) -> #esc_status{}.
decode_esc_status(<<?ESC_STATUS_ID:16/little-unsigned-integer,
                   Index:8/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   Rpm:32/little-signed-integer,
                   Voltage:32/little-float,
                   Current:32/little-float>>) ->
    #esc_status{
        index = Index,
        time_usec = TimeUsec,
        rpm = Rpm,
        voltage = Voltage,
        current = Current
    }.

%% @doc Encode AIRSPEED message to binary
-spec encode_airspeed(#airspeed{}) -> binary().
encode_airspeed(#airspeed{
    id = Id,
    airspeed = Airspeed,
    temperature = Temperature,
    raw_press = RawPress,
    flags = Flags
}) ->
    <<?AIRSPEED_ID:16/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      Airspeed:32/little-float,
      Temperature:16/little-signed-integer,
      RawPress:32/little-float,
      Flags:8/little-unsigned-integer>>.

%% @doc Decode AIRSPEED message from binary
-spec decode_airspeed(binary()) -> #airspeed{}.
decode_airspeed(<<?AIRSPEED_ID:16/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   Airspeed:32/little-float,
                   Temperature:16/little-signed-integer,
                   RawPress:32/little-float,
                   Flags:8/little-unsigned-integer>>) ->
    #airspeed{
        id = Id,
        airspeed = Airspeed,
        temperature = Temperature,
        raw_press = RawPress,
        flags = Flags
    }.

%% @doc Encode GLOBAL_POSITION_SENSOR message to binary
-spec encode_global_position_sensor(#global_position_sensor{}) -> binary().
encode_global_position_sensor(#global_position_sensor{
    target_system = TargetSystem,
    target_component = TargetComponent,
    id = Id,
    time_usec = TimeUsec,
    processing_time = ProcessingTime,
    source = Source,
    flags = Flags,
    lat = Lat,
    lon = Lon,
    alt_ellipsoid = AltEllipsoid,
    alt = Alt,
    eph = Eph,
    epv = Epv
}) ->
    <<?GLOBAL_POSITION_SENSOR_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      ProcessingTime:32/little-unsigned-integer,
      Source:8/little-unsigned-integer,
      Flags:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      AltEllipsoid:32/little-float,
      Alt:32/little-float,
      Eph:32/little-float,
      Epv:32/little-float>>.

%% @doc Decode GLOBAL_POSITION_SENSOR message from binary
-spec decode_global_position_sensor(binary()) -> #global_position_sensor{}.
decode_global_position_sensor(<<?GLOBAL_POSITION_SENSOR_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   ProcessingTime:32/little-unsigned-integer,
                   Source:8/little-unsigned-integer,
                   Flags:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   AltEllipsoid:32/little-float,
                   Alt:32/little-float,
                   Eph:32/little-float,
                   Epv:32/little-float>>) ->
    #global_position_sensor{
        target_system = TargetSystem,
        target_component = TargetComponent,
        id = Id,
        time_usec = TimeUsec,
        processing_time = ProcessingTime,
        source = Source,
        flags = Flags,
        lat = Lat,
        lon = Lon,
        alt_ellipsoid = AltEllipsoid,
        alt = Alt,
        eph = Eph,
        epv = Epv
    }.

%% @doc Encode WIFI_CONFIG_AP message to binary
-spec encode_wifi_config_ap(#wifi_config_ap{}) -> binary().
encode_wifi_config_ap(#wifi_config_ap{
    ssid = Ssid,
    password = Password,
    mode = Mode,
    response = Response
}) ->
    <<?WIFI_CONFIG_AP_ID:16/little-unsigned-integer,
      Ssid:8/little-binary,
      Password:8/little-binary,
      Mode:8/little-signed-integer,
      Response:8/little-signed-integer>>.

%% @doc Decode WIFI_CONFIG_AP message from binary
-spec decode_wifi_config_ap(binary()) -> #wifi_config_ap{}.
decode_wifi_config_ap(<<?WIFI_CONFIG_AP_ID:16/little-unsigned-integer,
                   Ssid:8/little-binary,
                   Password:8/little-binary,
                   Mode:8/little-signed-integer,
                   Response:8/little-signed-integer>>) ->
    #wifi_config_ap{
        ssid = Ssid,
        password = Password,
        mode = Mode,
        response = Response
    }.

%% @doc Encode PROTOCOL_VERSION message to binary
-spec encode_protocol_version(#protocol_version{}) -> binary().
encode_protocol_version(#protocol_version{
    version = Version,
    min_version = MinVersion,
    max_version = MaxVersion,
    spec_version_hash = SpecVersionHash,
    library_version_hash = LibraryVersionHash
}) ->
    <<?PROTOCOL_VERSION_ID:16/little-unsigned-integer,
      Version:16/little-unsigned-integer,
      MinVersion:16/little-unsigned-integer,
      MaxVersion:16/little-unsigned-integer,
      SpecVersionHash:8/little-unsigned-integer,
      LibraryVersionHash:8/little-unsigned-integer>>.

%% @doc Decode PROTOCOL_VERSION message from binary
-spec decode_protocol_version(binary()) -> #protocol_version{}.
decode_protocol_version(<<?PROTOCOL_VERSION_ID:16/little-unsigned-integer,
                   Version:16/little-unsigned-integer,
                   MinVersion:16/little-unsigned-integer,
                   MaxVersion:16/little-unsigned-integer,
                   SpecVersionHash:8/little-unsigned-integer,
                   LibraryVersionHash:8/little-unsigned-integer>>) ->
    #protocol_version{
        version = Version,
        min_version = MinVersion,
        max_version = MaxVersion,
        spec_version_hash = SpecVersionHash,
        library_version_hash = LibraryVersionHash
    }.

%% @doc Encode AIS_VESSEL message to binary
-spec encode_ais_vessel(#ais_vessel{}) -> binary().
encode_ais_vessel(#ais_vessel{
    mmsi = Mmsi,
    lat = Lat,
    lon = Lon,
    cog = Cog,
    heading = Heading,
    velocity = Velocity,
    turn_rate = TurnRate,
    navigational_status = NavigationalStatus,
    type = Type,
    dimension_bow = DimensionBow,
    dimension_stern = DimensionStern,
    dimension_port = DimensionPort,
    dimension_starboard = DimensionStarboard,
    callsign = Callsign,
    name = Name,
    tslc = Tslc,
    flags = Flags
}) ->
    <<?AIS_VESSEL_ID:16/little-unsigned-integer,
      Mmsi:32/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Cog:16/little-unsigned-integer,
      Heading:16/little-unsigned-integer,
      Velocity:16/little-unsigned-integer,
      TurnRate:8/little-signed-integer,
      NavigationalStatus:8/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      DimensionBow:16/little-unsigned-integer,
      DimensionStern:16/little-unsigned-integer,
      DimensionPort:8/little-unsigned-integer,
      DimensionStarboard:8/little-unsigned-integer,
      Callsign:8/little-binary,
      Name:8/little-binary,
      Tslc:16/little-unsigned-integer,
      Flags:16/little-unsigned-integer>>.

%% @doc Decode AIS_VESSEL message from binary
-spec decode_ais_vessel(binary()) -> #ais_vessel{}.
decode_ais_vessel(<<?AIS_VESSEL_ID:16/little-unsigned-integer,
                   Mmsi:32/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Cog:16/little-unsigned-integer,
                   Heading:16/little-unsigned-integer,
                   Velocity:16/little-unsigned-integer,
                   TurnRate:8/little-signed-integer,
                   NavigationalStatus:8/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   DimensionBow:16/little-unsigned-integer,
                   DimensionStern:16/little-unsigned-integer,
                   DimensionPort:8/little-unsigned-integer,
                   DimensionStarboard:8/little-unsigned-integer,
                   Callsign:8/little-binary,
                   Name:8/little-binary,
                   Tslc:16/little-unsigned-integer,
                   Flags:16/little-unsigned-integer>>) ->
    #ais_vessel{
        mmsi = Mmsi,
        lat = Lat,
        lon = Lon,
        cog = Cog,
        heading = Heading,
        velocity = Velocity,
        turn_rate = TurnRate,
        navigational_status = NavigationalStatus,
        type = Type,
        dimension_bow = DimensionBow,
        dimension_stern = DimensionStern,
        dimension_port = DimensionPort,
        dimension_starboard = DimensionStarboard,
        callsign = Callsign,
        name = Name,
        tslc = Tslc,
        flags = Flags
    }.

%% @doc Encode UAVCAN_NODE_STATUS message to binary
-spec encode_uavcan_node_status(#uavcan_node_status{}) -> binary().
encode_uavcan_node_status(#uavcan_node_status{
    time_usec = TimeUsec,
    uptime_sec = UptimeSec,
    health = Health,
    mode = Mode,
    sub_mode = SubMode,
    vendor_specific_status_code = VendorSpecificStatusCode
}) ->
    <<?UAVCAN_NODE_STATUS_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      UptimeSec:32/little-unsigned-integer,
      Health:8/little-unsigned-integer,
      Mode:8/little-unsigned-integer,
      SubMode:8/little-unsigned-integer,
      VendorSpecificStatusCode:16/little-unsigned-integer>>.

%% @doc Decode UAVCAN_NODE_STATUS message from binary
-spec decode_uavcan_node_status(binary()) -> #uavcan_node_status{}.
decode_uavcan_node_status(<<?UAVCAN_NODE_STATUS_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   UptimeSec:32/little-unsigned-integer,
                   Health:8/little-unsigned-integer,
                   Mode:8/little-unsigned-integer,
                   SubMode:8/little-unsigned-integer,
                   VendorSpecificStatusCode:16/little-unsigned-integer>>) ->
    #uavcan_node_status{
        time_usec = TimeUsec,
        uptime_sec = UptimeSec,
        health = Health,
        mode = Mode,
        sub_mode = SubMode,
        vendor_specific_status_code = VendorSpecificStatusCode
    }.

%% @doc Encode UAVCAN_NODE_INFO message to binary
-spec encode_uavcan_node_info(#uavcan_node_info{}) -> binary().
encode_uavcan_node_info(#uavcan_node_info{
    time_usec = TimeUsec,
    uptime_sec = UptimeSec,
    name = Name,
    hw_version_major = HwVersionMajor,
    hw_version_minor = HwVersionMinor,
    hw_unique_id = HwUniqueId,
    sw_version_major = SwVersionMajor,
    sw_version_minor = SwVersionMinor,
    sw_vcs_commit = SwVcsCommit
}) ->
    <<?UAVCAN_NODE_INFO_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      UptimeSec:32/little-unsigned-integer,
      Name:8/little-binary,
      HwVersionMajor:8/little-unsigned-integer,
      HwVersionMinor:8/little-unsigned-integer,
      HwUniqueId:8/little-unsigned-integer,
      SwVersionMajor:8/little-unsigned-integer,
      SwVersionMinor:8/little-unsigned-integer,
      SwVcsCommit:32/little-unsigned-integer>>.

%% @doc Decode UAVCAN_NODE_INFO message from binary
-spec decode_uavcan_node_info(binary()) -> #uavcan_node_info{}.
decode_uavcan_node_info(<<?UAVCAN_NODE_INFO_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   UptimeSec:32/little-unsigned-integer,
                   Name:8/little-binary,
                   HwVersionMajor:8/little-unsigned-integer,
                   HwVersionMinor:8/little-unsigned-integer,
                   HwUniqueId:8/little-unsigned-integer,
                   SwVersionMajor:8/little-unsigned-integer,
                   SwVersionMinor:8/little-unsigned-integer,
                   SwVcsCommit:32/little-unsigned-integer>>) ->
    #uavcan_node_info{
        time_usec = TimeUsec,
        uptime_sec = UptimeSec,
        name = Name,
        hw_version_major = HwVersionMajor,
        hw_version_minor = HwVersionMinor,
        hw_unique_id = HwUniqueId,
        sw_version_major = SwVersionMajor,
        sw_version_minor = SwVersionMinor,
        sw_vcs_commit = SwVcsCommit
    }.

%% @doc Encode PARAM_EXT_REQUEST_READ message to binary
-spec encode_param_ext_request_read(#param_ext_request_read{}) -> binary().
encode_param_ext_request_read(#param_ext_request_read{
    target_system = TargetSystem,
    target_component = TargetComponent,
    param_id = ParamId,
    param_index = ParamIndex
}) ->
    <<?PARAM_EXT_REQUEST_READ_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      ParamId:8/little-binary,
      ParamIndex:16/little-signed-integer>>.

%% @doc Decode PARAM_EXT_REQUEST_READ message from binary
-spec decode_param_ext_request_read(binary()) -> #param_ext_request_read{}.
decode_param_ext_request_read(<<?PARAM_EXT_REQUEST_READ_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   ParamId:8/little-binary,
                   ParamIndex:16/little-signed-integer>>) ->
    #param_ext_request_read{
        target_system = TargetSystem,
        target_component = TargetComponent,
        param_id = ParamId,
        param_index = ParamIndex
    }.

%% @doc Encode PARAM_EXT_REQUEST_LIST message to binary
-spec encode_param_ext_request_list(#param_ext_request_list{}) -> binary().
encode_param_ext_request_list(#param_ext_request_list{
    target_system = TargetSystem,
    target_component = TargetComponent
}) ->
    <<?PARAM_EXT_REQUEST_LIST_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer>>.

%% @doc Decode PARAM_EXT_REQUEST_LIST message from binary
-spec decode_param_ext_request_list(binary()) -> #param_ext_request_list{}.
decode_param_ext_request_list(<<?PARAM_EXT_REQUEST_LIST_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer>>) ->
    #param_ext_request_list{
        target_system = TargetSystem,
        target_component = TargetComponent
    }.

%% @doc Encode PARAM_EXT_VALUE message to binary
-spec encode_param_ext_value(#param_ext_value{}) -> binary().
encode_param_ext_value(#param_ext_value{
    param_id = ParamId,
    param_value = ParamValue,
    param_type = ParamType,
    param_count = ParamCount,
    param_index = ParamIndex
}) ->
    <<?PARAM_EXT_VALUE_ID:16/little-unsigned-integer,
      ParamId:8/little-binary,
      ParamValue:8/little-binary,
      ParamType:8/little-unsigned-integer,
      ParamCount:16/little-unsigned-integer,
      ParamIndex:16/little-unsigned-integer>>.

%% @doc Decode PARAM_EXT_VALUE message from binary
-spec decode_param_ext_value(binary()) -> #param_ext_value{}.
decode_param_ext_value(<<?PARAM_EXT_VALUE_ID:16/little-unsigned-integer,
                   ParamId:8/little-binary,
                   ParamValue:8/little-binary,
                   ParamType:8/little-unsigned-integer,
                   ParamCount:16/little-unsigned-integer,
                   ParamIndex:16/little-unsigned-integer>>) ->
    #param_ext_value{
        param_id = ParamId,
        param_value = ParamValue,
        param_type = ParamType,
        param_count = ParamCount,
        param_index = ParamIndex
    }.

%% @doc Encode PARAM_EXT_SET message to binary
-spec encode_param_ext_set(#param_ext_set{}) -> binary().
encode_param_ext_set(#param_ext_set{
    target_system = TargetSystem,
    target_component = TargetComponent,
    param_id = ParamId,
    param_value = ParamValue,
    param_type = ParamType
}) ->
    <<?PARAM_EXT_SET_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      ParamId:8/little-binary,
      ParamValue:8/little-binary,
      ParamType:8/little-unsigned-integer>>.

%% @doc Decode PARAM_EXT_SET message from binary
-spec decode_param_ext_set(binary()) -> #param_ext_set{}.
decode_param_ext_set(<<?PARAM_EXT_SET_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   ParamId:8/little-binary,
                   ParamValue:8/little-binary,
                   ParamType:8/little-unsigned-integer>>) ->
    #param_ext_set{
        target_system = TargetSystem,
        target_component = TargetComponent,
        param_id = ParamId,
        param_value = ParamValue,
        param_type = ParamType
    }.

%% @doc Encode PARAM_EXT_ACK message to binary
-spec encode_param_ext_ack(#param_ext_ack{}) -> binary().
encode_param_ext_ack(#param_ext_ack{
    param_id = ParamId,
    param_value = ParamValue,
    param_type = ParamType,
    param_result = ParamResult
}) ->
    <<?PARAM_EXT_ACK_ID:16/little-unsigned-integer,
      ParamId:8/little-binary,
      ParamValue:8/little-binary,
      ParamType:8/little-unsigned-integer,
      ParamResult:8/little-unsigned-integer>>.

%% @doc Decode PARAM_EXT_ACK message from binary
-spec decode_param_ext_ack(binary()) -> #param_ext_ack{}.
decode_param_ext_ack(<<?PARAM_EXT_ACK_ID:16/little-unsigned-integer,
                   ParamId:8/little-binary,
                   ParamValue:8/little-binary,
                   ParamType:8/little-unsigned-integer,
                   ParamResult:8/little-unsigned-integer>>) ->
    #param_ext_ack{
        param_id = ParamId,
        param_value = ParamValue,
        param_type = ParamType,
        param_result = ParamResult
    }.

%% @doc Encode OBSTACLE_DISTANCE message to binary
-spec encode_obstacle_distance(#obstacle_distance{}) -> binary().
encode_obstacle_distance(#obstacle_distance{
    time_usec = TimeUsec,
    sensor_type = SensorType,
    distances = Distances,
    increment = Increment,
    min_distance = MinDistance,
    max_distance = MaxDistance,
    increment_f = IncrementF,
    angle_offset = AngleOffset,
    frame = Frame
}) ->
    <<?OBSTACLE_DISTANCE_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      SensorType:8/little-unsigned-integer,
      Distances:16/little-unsigned-integer,
      Increment:8/little-unsigned-integer,
      MinDistance:16/little-unsigned-integer,
      MaxDistance:16/little-unsigned-integer,
      IncrementF:32/little-float,
      AngleOffset:32/little-float,
      Frame:8/little-unsigned-integer>>.

%% @doc Decode OBSTACLE_DISTANCE message from binary
-spec decode_obstacle_distance(binary()) -> #obstacle_distance{}.
decode_obstacle_distance(<<?OBSTACLE_DISTANCE_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   SensorType:8/little-unsigned-integer,
                   Distances:16/little-unsigned-integer,
                   Increment:8/little-unsigned-integer,
                   MinDistance:16/little-unsigned-integer,
                   MaxDistance:16/little-unsigned-integer,
                   IncrementF:32/little-float,
                   AngleOffset:32/little-float,
                   Frame:8/little-unsigned-integer>>) ->
    #obstacle_distance{
        time_usec = TimeUsec,
        sensor_type = SensorType,
        distances = Distances,
        increment = Increment,
        min_distance = MinDistance,
        max_distance = MaxDistance,
        increment_f = IncrementF,
        angle_offset = AngleOffset,
        frame = Frame
    }.

%% @doc Encode ODOMETRY message to binary
-spec encode_odometry(#odometry{}) -> binary().
encode_odometry(#odometry{
    time_usec = TimeUsec,
    frame_id = FrameId,
    child_frame_id = ChildFrameId,
    x = X,
    y = Y,
    z = Z,
    q = Q,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    rollspeed = Rollspeed,
    pitchspeed = Pitchspeed,
    yawspeed = Yawspeed,
    pose_covariance = PoseCovariance,
    velocity_covariance = VelocityCovariance,
    reset_counter = ResetCounter,
    estimator_type = EstimatorType,
    quality = Quality
}) ->
    <<?ODOMETRY_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      FrameId:8/little-unsigned-integer,
      ChildFrameId:8/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      Q:32/little-float,
      Vx:32/little-float,
      Vy:32/little-float,
      Vz:32/little-float,
      Rollspeed:32/little-float,
      Pitchspeed:32/little-float,
      Yawspeed:32/little-float,
      PoseCovariance:32/little-float,
      VelocityCovariance:32/little-float,
      ResetCounter:8/little-unsigned-integer,
      EstimatorType:8/little-unsigned-integer,
      Quality:8/little-signed-integer>>.

%% @doc Decode ODOMETRY message from binary
-spec decode_odometry(binary()) -> #odometry{}.
decode_odometry(<<?ODOMETRY_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   FrameId:8/little-unsigned-integer,
                   ChildFrameId:8/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   Q:32/little-float,
                   Vx:32/little-float,
                   Vy:32/little-float,
                   Vz:32/little-float,
                   Rollspeed:32/little-float,
                   Pitchspeed:32/little-float,
                   Yawspeed:32/little-float,
                   PoseCovariance:32/little-float,
                   VelocityCovariance:32/little-float,
                   ResetCounter:8/little-unsigned-integer,
                   EstimatorType:8/little-unsigned-integer,
                   Quality:8/little-signed-integer>>) ->
    #odometry{
        time_usec = TimeUsec,
        frame_id = FrameId,
        child_frame_id = ChildFrameId,
        x = X,
        y = Y,
        z = Z,
        q = Q,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        rollspeed = Rollspeed,
        pitchspeed = Pitchspeed,
        yawspeed = Yawspeed,
        pose_covariance = PoseCovariance,
        velocity_covariance = VelocityCovariance,
        reset_counter = ResetCounter,
        estimator_type = EstimatorType,
        quality = Quality
    }.

%% @doc Encode TRAJECTORY_REPRESENTATION_WAYPOINTS message to binary
-spec encode_trajectory_representation_waypoints(#trajectory_representation_waypoints{}) -> binary().
encode_trajectory_representation_waypoints(#trajectory_representation_waypoints{
    time_usec = TimeUsec,
    valid_points = ValidPoints,
    pos_x = PosX,
    pos_y = PosY,
    pos_z = PosZ,
    vel_x = VelX,
    vel_y = VelY,
    vel_z = VelZ,
    acc_x = AccX,
    acc_y = AccY,
    acc_z = AccZ,
    pos_yaw = PosYaw,
    vel_yaw = VelYaw,
    command = Command
}) ->
    <<?TRAJECTORY_REPRESENTATION_WAYPOINTS_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      ValidPoints:8/little-unsigned-integer,
      PosX:32/little-float,
      PosY:32/little-float,
      PosZ:32/little-float,
      VelX:32/little-float,
      VelY:32/little-float,
      VelZ:32/little-float,
      AccX:32/little-float,
      AccY:32/little-float,
      AccZ:32/little-float,
      PosYaw:32/little-float,
      VelYaw:32/little-float,
      Command:16/little-unsigned-integer>>.

%% @doc Decode TRAJECTORY_REPRESENTATION_WAYPOINTS message from binary
-spec decode_trajectory_representation_waypoints(binary()) -> #trajectory_representation_waypoints{}.
decode_trajectory_representation_waypoints(<<?TRAJECTORY_REPRESENTATION_WAYPOINTS_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   ValidPoints:8/little-unsigned-integer,
                   PosX:32/little-float,
                   PosY:32/little-float,
                   PosZ:32/little-float,
                   VelX:32/little-float,
                   VelY:32/little-float,
                   VelZ:32/little-float,
                   AccX:32/little-float,
                   AccY:32/little-float,
                   AccZ:32/little-float,
                   PosYaw:32/little-float,
                   VelYaw:32/little-float,
                   Command:16/little-unsigned-integer>>) ->
    #trajectory_representation_waypoints{
        time_usec = TimeUsec,
        valid_points = ValidPoints,
        pos_x = PosX,
        pos_y = PosY,
        pos_z = PosZ,
        vel_x = VelX,
        vel_y = VelY,
        vel_z = VelZ,
        acc_x = AccX,
        acc_y = AccY,
        acc_z = AccZ,
        pos_yaw = PosYaw,
        vel_yaw = VelYaw,
        command = Command
    }.

%% @doc Encode TRAJECTORY_REPRESENTATION_BEZIER message to binary
-spec encode_trajectory_representation_bezier(#trajectory_representation_bezier{}) -> binary().
encode_trajectory_representation_bezier(#trajectory_representation_bezier{
    time_usec = TimeUsec,
    valid_points = ValidPoints,
    pos_x = PosX,
    pos_y = PosY,
    pos_z = PosZ,
    delta = Delta,
    pos_yaw = PosYaw
}) ->
    <<?TRAJECTORY_REPRESENTATION_BEZIER_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      ValidPoints:8/little-unsigned-integer,
      PosX:32/little-float,
      PosY:32/little-float,
      PosZ:32/little-float,
      Delta:32/little-float,
      PosYaw:32/little-float>>.

%% @doc Decode TRAJECTORY_REPRESENTATION_BEZIER message from binary
-spec decode_trajectory_representation_bezier(binary()) -> #trajectory_representation_bezier{}.
decode_trajectory_representation_bezier(<<?TRAJECTORY_REPRESENTATION_BEZIER_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   ValidPoints:8/little-unsigned-integer,
                   PosX:32/little-float,
                   PosY:32/little-float,
                   PosZ:32/little-float,
                   Delta:32/little-float,
                   PosYaw:32/little-float>>) ->
    #trajectory_representation_bezier{
        time_usec = TimeUsec,
        valid_points = ValidPoints,
        pos_x = PosX,
        pos_y = PosY,
        pos_z = PosZ,
        delta = Delta,
        pos_yaw = PosYaw
    }.

%% @doc Encode CELLULAR_STATUS message to binary
-spec encode_cellular_status(#cellular_status{}) -> binary().
encode_cellular_status(#cellular_status{
    status = Status,
    failure_reason = FailureReason,
    type = Type,
    quality = Quality,
    mcc = Mcc,
    mnc = Mnc,
    lac = Lac,
    id = Id,
    link_tx_rate = LinkTxRate,
    link_rx_rate = LinkRxRate,
    cell_tower_id = CellTowerId,
    band_number = BandNumber,
    band_frequency = BandFrequency,
    channel_number = ChannelNumber,
    rx_level = RxLevel,
    tx_level = TxLevel,
    rx_quality = RxQuality,
    sinr = Sinr
}) ->
    <<?CELLULAR_STATUS_ID:16/little-unsigned-integer,
      Status:8/little-unsigned-integer,
      FailureReason:8/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      Quality:8/little-unsigned-integer,
      Mcc:16/little-unsigned-integer,
      Mnc:16/little-unsigned-integer,
      Lac:16/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      LinkTxRate:32/little-unsigned-integer,
      LinkRxRate:32/little-unsigned-integer,
      CellTowerId:8/little-binary,
      BandNumber:8/little-unsigned-integer,
      BandFrequency:32/little-float,
      ChannelNumber:32/little-unsigned-integer,
      RxLevel:32/little-float,
      TxLevel:32/little-float,
      RxQuality:32/little-float,
      Sinr:32/little-float>>.

%% @doc Decode CELLULAR_STATUS message from binary
-spec decode_cellular_status(binary()) -> #cellular_status{}.
decode_cellular_status(<<?CELLULAR_STATUS_ID:16/little-unsigned-integer,
                   Status:8/little-unsigned-integer,
                   FailureReason:8/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   Quality:8/little-unsigned-integer,
                   Mcc:16/little-unsigned-integer,
                   Mnc:16/little-unsigned-integer,
                   Lac:16/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   LinkTxRate:32/little-unsigned-integer,
                   LinkRxRate:32/little-unsigned-integer,
                   CellTowerId:8/little-binary,
                   BandNumber:8/little-unsigned-integer,
                   BandFrequency:32/little-float,
                   ChannelNumber:32/little-unsigned-integer,
                   RxLevel:32/little-float,
                   TxLevel:32/little-float,
                   RxQuality:32/little-float,
                   Sinr:32/little-float>>) ->
    #cellular_status{
        status = Status,
        failure_reason = FailureReason,
        type = Type,
        quality = Quality,
        mcc = Mcc,
        mnc = Mnc,
        lac = Lac,
        id = Id,
        link_tx_rate = LinkTxRate,
        link_rx_rate = LinkRxRate,
        cell_tower_id = CellTowerId,
        band_number = BandNumber,
        band_frequency = BandFrequency,
        channel_number = ChannelNumber,
        rx_level = RxLevel,
        tx_level = TxLevel,
        rx_quality = RxQuality,
        sinr = Sinr
    }.

%% @doc Encode ISBD_LINK_STATUS message to binary
-spec encode_isbd_link_status(#isbd_link_status{}) -> binary().
encode_isbd_link_status(#isbd_link_status{
    timestamp = Timestamp,
    last_heartbeat = LastHeartbeat,
    failed_sessions = FailedSessions,
    successful_sessions = SuccessfulSessions,
    signal_quality = SignalQuality,
    ring_pending = RingPending,
    tx_session_pending = TxSessionPending,
    rx_session_pending = RxSessionPending
}) ->
    <<?ISBD_LINK_STATUS_ID:16/little-unsigned-integer,
      Timestamp:64/little-unsigned-integer,
      LastHeartbeat:64/little-unsigned-integer,
      FailedSessions:16/little-unsigned-integer,
      SuccessfulSessions:16/little-unsigned-integer,
      SignalQuality:8/little-unsigned-integer,
      RingPending:8/little-unsigned-integer,
      TxSessionPending:8/little-unsigned-integer,
      RxSessionPending:8/little-unsigned-integer>>.

%% @doc Decode ISBD_LINK_STATUS message from binary
-spec decode_isbd_link_status(binary()) -> #isbd_link_status{}.
decode_isbd_link_status(<<?ISBD_LINK_STATUS_ID:16/little-unsigned-integer,
                   Timestamp:64/little-unsigned-integer,
                   LastHeartbeat:64/little-unsigned-integer,
                   FailedSessions:16/little-unsigned-integer,
                   SuccessfulSessions:16/little-unsigned-integer,
                   SignalQuality:8/little-unsigned-integer,
                   RingPending:8/little-unsigned-integer,
                   TxSessionPending:8/little-unsigned-integer,
                   RxSessionPending:8/little-unsigned-integer>>) ->
    #isbd_link_status{
        timestamp = Timestamp,
        last_heartbeat = LastHeartbeat,
        failed_sessions = FailedSessions,
        successful_sessions = SuccessfulSessions,
        signal_quality = SignalQuality,
        ring_pending = RingPending,
        tx_session_pending = TxSessionPending,
        rx_session_pending = RxSessionPending
    }.

%% @doc Encode CELLULAR_CONFIG message to binary
-spec encode_cellular_config(#cellular_config{}) -> binary().
encode_cellular_config(#cellular_config{
    enable_lte = EnableLte,
    enable_pin = EnablePin,
    pin = Pin,
    new_pin = NewPin,
    apn = Apn,
    puk = Puk,
    roaming = Roaming,
    response = Response
}) ->
    <<?CELLULAR_CONFIG_ID:16/little-unsigned-integer,
      EnableLte:8/little-unsigned-integer,
      EnablePin:8/little-unsigned-integer,
      Pin:8/little-binary,
      NewPin:8/little-binary,
      Apn:8/little-binary,
      Puk:8/little-binary,
      Roaming:8/little-unsigned-integer,
      Response:8/little-unsigned-integer>>.

%% @doc Decode CELLULAR_CONFIG message from binary
-spec decode_cellular_config(binary()) -> #cellular_config{}.
decode_cellular_config(<<?CELLULAR_CONFIG_ID:16/little-unsigned-integer,
                   EnableLte:8/little-unsigned-integer,
                   EnablePin:8/little-unsigned-integer,
                   Pin:8/little-binary,
                   NewPin:8/little-binary,
                   Apn:8/little-binary,
                   Puk:8/little-binary,
                   Roaming:8/little-unsigned-integer,
                   Response:8/little-unsigned-integer>>) ->
    #cellular_config{
        enable_lte = EnableLte,
        enable_pin = EnablePin,
        pin = Pin,
        new_pin = NewPin,
        apn = Apn,
        puk = Puk,
        roaming = Roaming,
        response = Response
    }.

%% @doc Encode RAW_RPM message to binary
-spec encode_raw_rpm(#raw_rpm{}) -> binary().
encode_raw_rpm(#raw_rpm{
    index = Index,
    frequency = Frequency
}) ->
    <<?RAW_RPM_ID:16/little-unsigned-integer,
      Index:8/little-unsigned-integer,
      Frequency:32/little-float>>.

%% @doc Decode RAW_RPM message from binary
-spec decode_raw_rpm(binary()) -> #raw_rpm{}.
decode_raw_rpm(<<?RAW_RPM_ID:16/little-unsigned-integer,
                   Index:8/little-unsigned-integer,
                   Frequency:32/little-float>>) ->
    #raw_rpm{
        index = Index,
        frequency = Frequency
    }.

%% @doc Encode UTM_GLOBAL_POSITION message to binary
-spec encode_utm_global_position(#utm_global_position{}) -> binary().
encode_utm_global_position(#utm_global_position{
    time = Time,
    uas_id = UasId,
    lat = Lat,
    lon = Lon,
    alt = Alt,
    relative_alt = RelativeAlt,
    vx = Vx,
    vy = Vy,
    vz = Vz,
    h_acc = HAcc,
    v_acc = VAcc,
    vel_acc = VelAcc,
    next_lat = NextLat,
    next_lon = NextLon,
    next_alt = NextAlt,
    update_rate = UpdateRate,
    flight_state = FlightState,
    flags = Flags
}) ->
    <<?UTM_GLOBAL_POSITION_ID:16/little-unsigned-integer,
      Time:64/little-unsigned-integer,
      UasId:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lon:32/little-signed-integer,
      Alt:32/little-signed-integer,
      RelativeAlt:32/little-signed-integer,
      Vx:16/little-signed-integer,
      Vy:16/little-signed-integer,
      Vz:16/little-signed-integer,
      HAcc:16/little-unsigned-integer,
      VAcc:16/little-unsigned-integer,
      VelAcc:16/little-unsigned-integer,
      NextLat:32/little-signed-integer,
      NextLon:32/little-signed-integer,
      NextAlt:32/little-signed-integer,
      UpdateRate:16/little-unsigned-integer,
      FlightState:8/little-unsigned-integer,
      Flags:8/little-unsigned-integer>>.

%% @doc Decode UTM_GLOBAL_POSITION message from binary
-spec decode_utm_global_position(binary()) -> #utm_global_position{}.
decode_utm_global_position(<<?UTM_GLOBAL_POSITION_ID:16/little-unsigned-integer,
                   Time:64/little-unsigned-integer,
                   UasId:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lon:32/little-signed-integer,
                   Alt:32/little-signed-integer,
                   RelativeAlt:32/little-signed-integer,
                   Vx:16/little-signed-integer,
                   Vy:16/little-signed-integer,
                   Vz:16/little-signed-integer,
                   HAcc:16/little-unsigned-integer,
                   VAcc:16/little-unsigned-integer,
                   VelAcc:16/little-unsigned-integer,
                   NextLat:32/little-signed-integer,
                   NextLon:32/little-signed-integer,
                   NextAlt:32/little-signed-integer,
                   UpdateRate:16/little-unsigned-integer,
                   FlightState:8/little-unsigned-integer,
                   Flags:8/little-unsigned-integer>>) ->
    #utm_global_position{
        time = Time,
        uas_id = UasId,
        lat = Lat,
        lon = Lon,
        alt = Alt,
        relative_alt = RelativeAlt,
        vx = Vx,
        vy = Vy,
        vz = Vz,
        h_acc = HAcc,
        v_acc = VAcc,
        vel_acc = VelAcc,
        next_lat = NextLat,
        next_lon = NextLon,
        next_alt = NextAlt,
        update_rate = UpdateRate,
        flight_state = FlightState,
        flags = Flags
    }.

%% @doc Encode PARAM_ERROR message to binary
-spec encode_param_error(#param_error{}) -> binary().
encode_param_error(#param_error{
    target_system = TargetSystem,
    target_component = TargetComponent,
    param_id = ParamId,
    param_index = ParamIndex,
    error = Error
}) ->
    <<?PARAM_ERROR_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      ParamId:8/little-binary,
      ParamIndex:16/little-signed-integer,
      Error:8/little-unsigned-integer>>.

%% @doc Decode PARAM_ERROR message from binary
-spec decode_param_error(binary()) -> #param_error{}.
decode_param_error(<<?PARAM_ERROR_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   ParamId:8/little-binary,
                   ParamIndex:16/little-signed-integer,
                   Error:8/little-unsigned-integer>>) ->
    #param_error{
        target_system = TargetSystem,
        target_component = TargetComponent,
        param_id = ParamId,
        param_index = ParamIndex,
        error = Error
    }.

%% @doc Encode DEBUG_FLOAT_ARRAY message to binary
-spec encode_debug_float_array(#debug_float_array{}) -> binary().
encode_debug_float_array(#debug_float_array{
    time_usec = TimeUsec,
    name = Name,
    array_id = ArrayId,
    data = Data
}) ->
    <<?DEBUG_FLOAT_ARRAY_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      Name:8/little-binary,
      ArrayId:16/little-unsigned-integer,
      Data:32/little-float>>.

%% @doc Decode DEBUG_FLOAT_ARRAY message from binary
-spec decode_debug_float_array(binary()) -> #debug_float_array{}.
decode_debug_float_array(<<?DEBUG_FLOAT_ARRAY_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   Name:8/little-binary,
                   ArrayId:16/little-unsigned-integer,
                   Data:32/little-float>>) ->
    #debug_float_array{
        time_usec = TimeUsec,
        name = Name,
        array_id = ArrayId,
        data = Data
    }.

%% @doc Encode ORBIT_EXECUTION_STATUS message to binary
-spec encode_orbit_execution_status(#orbit_execution_status{}) -> binary().
encode_orbit_execution_status(#orbit_execution_status{
    time_usec = TimeUsec,
    radius = Radius,
    frame = Frame,
    x = X,
    y = Y,
    z = Z
}) ->
    <<?ORBIT_EXECUTION_STATUS_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      Radius:32/little-float,
      Frame:8/little-unsigned-integer,
      X:32/little-signed-integer,
      Y:32/little-signed-integer,
      Z:32/little-float>>.

%% @doc Decode ORBIT_EXECUTION_STATUS message from binary
-spec decode_orbit_execution_status(binary()) -> #orbit_execution_status{}.
decode_orbit_execution_status(<<?ORBIT_EXECUTION_STATUS_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   Radius:32/little-float,
                   Frame:8/little-unsigned-integer,
                   X:32/little-signed-integer,
                   Y:32/little-signed-integer,
                   Z:32/little-float>>) ->
    #orbit_execution_status{
        time_usec = TimeUsec,
        radius = Radius,
        frame = Frame,
        x = X,
        y = Y,
        z = Z
    }.

%% @doc Encode SMART_BATTERY_INFO message to binary
-spec encode_smart_battery_info(#smart_battery_info{}) -> binary().
encode_smart_battery_info(#smart_battery_info{
    id = Id,
    battery_function = BatteryFunction,
    type = Type,
    capacity_full_specification = CapacityFullSpecification,
    capacity_full = CapacityFull,
    cycle_count = CycleCount,
    serial_number = SerialNumber,
    device_name = DeviceName,
    weight = Weight,
    discharge_minimum_voltage = DischargeMinimumVoltage,
    charging_minimum_voltage = ChargingMinimumVoltage,
    resting_minimum_voltage = RestingMinimumVoltage,
    charging_maximum_voltage = ChargingMaximumVoltage,
    cells_in_series = CellsInSeries,
    discharge_maximum_current = DischargeMaximumCurrent,
    discharge_maximum_burst_current = DischargeMaximumBurstCurrent,
    manufacture_date = ManufactureDate
}) ->
    <<?SMART_BATTERY_INFO_ID:16/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      BatteryFunction:8/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      CapacityFullSpecification:32/little-signed-integer,
      CapacityFull:32/little-signed-integer,
      CycleCount:16/little-unsigned-integer,
      SerialNumber:8/little-binary,
      DeviceName:8/little-binary,
      Weight:16/little-unsigned-integer,
      DischargeMinimumVoltage:16/little-unsigned-integer,
      ChargingMinimumVoltage:16/little-unsigned-integer,
      RestingMinimumVoltage:16/little-unsigned-integer,
      ChargingMaximumVoltage:16/little-unsigned-integer,
      CellsInSeries:8/little-unsigned-integer,
      DischargeMaximumCurrent:32/little-unsigned-integer,
      DischargeMaximumBurstCurrent:32/little-unsigned-integer,
      ManufactureDate:8/little-binary>>.

%% @doc Decode SMART_BATTERY_INFO message from binary
-spec decode_smart_battery_info(binary()) -> #smart_battery_info{}.
decode_smart_battery_info(<<?SMART_BATTERY_INFO_ID:16/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   BatteryFunction:8/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   CapacityFullSpecification:32/little-signed-integer,
                   CapacityFull:32/little-signed-integer,
                   CycleCount:16/little-unsigned-integer,
                   SerialNumber:8/little-binary,
                   DeviceName:8/little-binary,
                   Weight:16/little-unsigned-integer,
                   DischargeMinimumVoltage:16/little-unsigned-integer,
                   ChargingMinimumVoltage:16/little-unsigned-integer,
                   RestingMinimumVoltage:16/little-unsigned-integer,
                   ChargingMaximumVoltage:16/little-unsigned-integer,
                   CellsInSeries:8/little-unsigned-integer,
                   DischargeMaximumCurrent:32/little-unsigned-integer,
                   DischargeMaximumBurstCurrent:32/little-unsigned-integer,
                   ManufactureDate:8/little-binary>>) ->
    #smart_battery_info{
        id = Id,
        battery_function = BatteryFunction,
        type = Type,
        capacity_full_specification = CapacityFullSpecification,
        capacity_full = CapacityFull,
        cycle_count = CycleCount,
        serial_number = SerialNumber,
        device_name = DeviceName,
        weight = Weight,
        discharge_minimum_voltage = DischargeMinimumVoltage,
        charging_minimum_voltage = ChargingMinimumVoltage,
        resting_minimum_voltage = RestingMinimumVoltage,
        charging_maximum_voltage = ChargingMaximumVoltage,
        cells_in_series = CellsInSeries,
        discharge_maximum_current = DischargeMaximumCurrent,
        discharge_maximum_burst_current = DischargeMaximumBurstCurrent,
        manufacture_date = ManufactureDate
    }.

%% @doc Encode FIGURE_EIGHT_EXECUTION_STATUS message to binary
-spec encode_figure_eight_execution_status(#figure_eight_execution_status{}) -> binary().
encode_figure_eight_execution_status(#figure_eight_execution_status{
    time_usec = TimeUsec,
    major_radius = MajorRadius,
    minor_radius = MinorRadius,
    orientation = Orientation,
    frame = Frame,
    x = X,
    y = Y,
    z = Z
}) ->
    <<?FIGURE_EIGHT_EXECUTION_STATUS_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      MajorRadius:32/little-float,
      MinorRadius:32/little-float,
      Orientation:32/little-float,
      Frame:8/little-unsigned-integer,
      X:32/little-signed-integer,
      Y:32/little-signed-integer,
      Z:32/little-float>>.

%% @doc Decode FIGURE_EIGHT_EXECUTION_STATUS message from binary
-spec decode_figure_eight_execution_status(binary()) -> #figure_eight_execution_status{}.
decode_figure_eight_execution_status(<<?FIGURE_EIGHT_EXECUTION_STATUS_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   MajorRadius:32/little-float,
                   MinorRadius:32/little-float,
                   Orientation:32/little-float,
                   Frame:8/little-unsigned-integer,
                   X:32/little-signed-integer,
                   Y:32/little-signed-integer,
                   Z:32/little-float>>) ->
    #figure_eight_execution_status{
        time_usec = TimeUsec,
        major_radius = MajorRadius,
        minor_radius = MinorRadius,
        orientation = Orientation,
        frame = Frame,
        x = X,
        y = Y,
        z = Z
    }.

%% @doc Encode FUEL_STATUS message to binary
-spec encode_fuel_status(#fuel_status{}) -> binary().
encode_fuel_status(#fuel_status{
    id = Id,
    maximum_fuel = MaximumFuel,
    consumed_fuel = ConsumedFuel,
    remaining_fuel = RemainingFuel,
    percent_remaining = PercentRemaining,
    flow_rate = FlowRate,
    temperature = Temperature,
    fuel_type = FuelType
}) ->
    <<?FUEL_STATUS_ID:16/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      MaximumFuel:32/little-float,
      ConsumedFuel:32/little-float,
      RemainingFuel:32/little-float,
      PercentRemaining:8/little-unsigned-integer,
      FlowRate:32/little-float,
      Temperature:32/little-float,
      FuelType:32/little-unsigned-integer>>.

%% @doc Decode FUEL_STATUS message from binary
-spec decode_fuel_status(binary()) -> #fuel_status{}.
decode_fuel_status(<<?FUEL_STATUS_ID:16/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   MaximumFuel:32/little-float,
                   ConsumedFuel:32/little-float,
                   RemainingFuel:32/little-float,
                   PercentRemaining:8/little-unsigned-integer,
                   FlowRate:32/little-float,
                   Temperature:32/little-float,
                   FuelType:32/little-unsigned-integer>>) ->
    #fuel_status{
        id = Id,
        maximum_fuel = MaximumFuel,
        consumed_fuel = ConsumedFuel,
        remaining_fuel = RemainingFuel,
        percent_remaining = PercentRemaining,
        flow_rate = FlowRate,
        temperature = Temperature,
        fuel_type = FuelType
    }.

%% @doc Encode BATTERY_INFO message to binary
-spec encode_battery_info(#battery_info{}) -> binary().
encode_battery_info(#battery_info{
    id = Id,
    battery_function = BatteryFunction,
    type = Type,
    state_of_health = StateOfHealth,
    cells_in_series = CellsInSeries,
    cycle_count = CycleCount,
    weight = Weight,
    discharge_minimum_voltage = DischargeMinimumVoltage,
    charging_minimum_voltage = ChargingMinimumVoltage,
    resting_minimum_voltage = RestingMinimumVoltage,
    charging_maximum_voltage = ChargingMaximumVoltage,
    charging_maximum_current = ChargingMaximumCurrent,
    nominal_voltage = NominalVoltage,
    discharge_maximum_current = DischargeMaximumCurrent,
    discharge_maximum_burst_current = DischargeMaximumBurstCurrent,
    design_capacity = DesignCapacity,
    full_charge_capacity = FullChargeCapacity,
    manufacture_date = ManufactureDate,
    serial_number = SerialNumber,
    name = Name
}) ->
    <<?BATTERY_INFO_ID:16/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      BatteryFunction:8/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      StateOfHealth:8/little-unsigned-integer,
      CellsInSeries:8/little-unsigned-integer,
      CycleCount:16/little-unsigned-integer,
      Weight:16/little-unsigned-integer,
      DischargeMinimumVoltage:32/little-float,
      ChargingMinimumVoltage:32/little-float,
      RestingMinimumVoltage:32/little-float,
      ChargingMaximumVoltage:32/little-float,
      ChargingMaximumCurrent:32/little-float,
      NominalVoltage:32/little-float,
      DischargeMaximumCurrent:32/little-float,
      DischargeMaximumBurstCurrent:32/little-float,
      DesignCapacity:32/little-float,
      FullChargeCapacity:32/little-float,
      ManufactureDate:8/little-binary,
      SerialNumber:8/little-binary,
      Name:8/little-binary>>.

%% @doc Decode BATTERY_INFO message from binary
-spec decode_battery_info(binary()) -> #battery_info{}.
decode_battery_info(<<?BATTERY_INFO_ID:16/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   BatteryFunction:8/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   StateOfHealth:8/little-unsigned-integer,
                   CellsInSeries:8/little-unsigned-integer,
                   CycleCount:16/little-unsigned-integer,
                   Weight:16/little-unsigned-integer,
                   DischargeMinimumVoltage:32/little-float,
                   ChargingMinimumVoltage:32/little-float,
                   RestingMinimumVoltage:32/little-float,
                   ChargingMaximumVoltage:32/little-float,
                   ChargingMaximumCurrent:32/little-float,
                   NominalVoltage:32/little-float,
                   DischargeMaximumCurrent:32/little-float,
                   DischargeMaximumBurstCurrent:32/little-float,
                   DesignCapacity:32/little-float,
                   FullChargeCapacity:32/little-float,
                   ManufactureDate:8/little-binary,
                   SerialNumber:8/little-binary,
                   Name:8/little-binary>>) ->
    #battery_info{
        id = Id,
        battery_function = BatteryFunction,
        type = Type,
        state_of_health = StateOfHealth,
        cells_in_series = CellsInSeries,
        cycle_count = CycleCount,
        weight = Weight,
        discharge_minimum_voltage = DischargeMinimumVoltage,
        charging_minimum_voltage = ChargingMinimumVoltage,
        resting_minimum_voltage = RestingMinimumVoltage,
        charging_maximum_voltage = ChargingMaximumVoltage,
        charging_maximum_current = ChargingMaximumCurrent,
        nominal_voltage = NominalVoltage,
        discharge_maximum_current = DischargeMaximumCurrent,
        discharge_maximum_burst_current = DischargeMaximumBurstCurrent,
        design_capacity = DesignCapacity,
        full_charge_capacity = FullChargeCapacity,
        manufacture_date = ManufactureDate,
        serial_number = SerialNumber,
        name = Name
    }.

%% @doc Encode GENERATOR_STATUS message to binary
-spec encode_generator_status(#generator_status{}) -> binary().
encode_generator_status(#generator_status{
    status = Status,
    generator_speed = GeneratorSpeed,
    battery_current = BatteryCurrent,
    load_current = LoadCurrent,
    power_generated = PowerGenerated,
    bus_voltage = BusVoltage,
    rectifier_temperature = RectifierTemperature,
    bat_current_setpoint = BatCurrentSetpoint,
    generator_temperature = GeneratorTemperature,
    runtime = Runtime,
    time_until_maintenance = TimeUntilMaintenance
}) ->
    <<?GENERATOR_STATUS_ID:16/little-unsigned-integer,
      Status:64/little-unsigned-integer,
      GeneratorSpeed:16/little-unsigned-integer,
      BatteryCurrent:32/little-float,
      LoadCurrent:32/little-float,
      PowerGenerated:32/little-float,
      BusVoltage:32/little-float,
      RectifierTemperature:16/little-signed-integer,
      BatCurrentSetpoint:32/little-float,
      GeneratorTemperature:16/little-signed-integer,
      Runtime:32/little-unsigned-integer,
      TimeUntilMaintenance:32/little-signed-integer>>.

%% @doc Decode GENERATOR_STATUS message from binary
-spec decode_generator_status(binary()) -> #generator_status{}.
decode_generator_status(<<?GENERATOR_STATUS_ID:16/little-unsigned-integer,
                   Status:64/little-unsigned-integer,
                   GeneratorSpeed:16/little-unsigned-integer,
                   BatteryCurrent:32/little-float,
                   LoadCurrent:32/little-float,
                   PowerGenerated:32/little-float,
                   BusVoltage:32/little-float,
                   RectifierTemperature:16/little-signed-integer,
                   BatCurrentSetpoint:32/little-float,
                   GeneratorTemperature:16/little-signed-integer,
                   Runtime:32/little-unsigned-integer,
                   TimeUntilMaintenance:32/little-signed-integer>>) ->
    #generator_status{
        status = Status,
        generator_speed = GeneratorSpeed,
        battery_current = BatteryCurrent,
        load_current = LoadCurrent,
        power_generated = PowerGenerated,
        bus_voltage = BusVoltage,
        rectifier_temperature = RectifierTemperature,
        bat_current_setpoint = BatCurrentSetpoint,
        generator_temperature = GeneratorTemperature,
        runtime = Runtime,
        time_until_maintenance = TimeUntilMaintenance
    }.

%% @doc Encode ACTUATOR_OUTPUT_STATUS message to binary
-spec encode_actuator_output_status(#actuator_output_status{}) -> binary().
encode_actuator_output_status(#actuator_output_status{
    time_usec = TimeUsec,
    active = Active,
    actuator = Actuator
}) ->
    <<?ACTUATOR_OUTPUT_STATUS_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      Active:32/little-unsigned-integer,
      Actuator:32/little-float>>.

%% @doc Decode ACTUATOR_OUTPUT_STATUS message from binary
-spec decode_actuator_output_status(binary()) -> #actuator_output_status{}.
decode_actuator_output_status(<<?ACTUATOR_OUTPUT_STATUS_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   Active:32/little-unsigned-integer,
                   Actuator:32/little-float>>) ->
    #actuator_output_status{
        time_usec = TimeUsec,
        active = Active,
        actuator = Actuator
    }.

%% @doc Encode RELAY_STATUS message to binary
-spec encode_relay_status(#relay_status{}) -> binary().
encode_relay_status(#relay_status{
    time_boot_ms = TimeBootMs,
    on = On,
    present = Present
}) ->
    <<?RELAY_STATUS_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      On:16/little-unsigned-integer,
      Present:16/little-unsigned-integer>>.

%% @doc Decode RELAY_STATUS message from binary
-spec decode_relay_status(binary()) -> #relay_status{}.
decode_relay_status(<<?RELAY_STATUS_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   On:16/little-unsigned-integer,
                   Present:16/little-unsigned-integer>>) ->
    #relay_status{
        time_boot_ms = TimeBootMs,
        on = On,
        present = Present
    }.

%% @doc Encode TIME_ESTIMATE_TO_TARGET message to binary
-spec encode_time_estimate_to_target(#time_estimate_to_target{}) -> binary().
encode_time_estimate_to_target(#time_estimate_to_target{
    safe_return = SafeReturn,
    land = Land,
    mission_next_item = MissionNextItem,
    mission_end = MissionEnd,
    commanded_action = CommandedAction
}) ->
    <<?TIME_ESTIMATE_TO_TARGET_ID:16/little-unsigned-integer,
      SafeReturn:32/little-signed-integer,
      Land:32/little-signed-integer,
      MissionNextItem:32/little-signed-integer,
      MissionEnd:32/little-signed-integer,
      CommandedAction:32/little-signed-integer>>.

%% @doc Decode TIME_ESTIMATE_TO_TARGET message from binary
-spec decode_time_estimate_to_target(binary()) -> #time_estimate_to_target{}.
decode_time_estimate_to_target(<<?TIME_ESTIMATE_TO_TARGET_ID:16/little-unsigned-integer,
                   SafeReturn:32/little-signed-integer,
                   Land:32/little-signed-integer,
                   MissionNextItem:32/little-signed-integer,
                   MissionEnd:32/little-signed-integer,
                   CommandedAction:32/little-signed-integer>>) ->
    #time_estimate_to_target{
        safe_return = SafeReturn,
        land = Land,
        mission_next_item = MissionNextItem,
        mission_end = MissionEnd,
        commanded_action = CommandedAction
    }.

%% @doc Encode TUNNEL message to binary
-spec encode_tunnel(#tunnel{}) -> binary().
encode_tunnel(#tunnel{
    target_system = TargetSystem,
    target_component = TargetComponent,
    payload_type = PayloadType,
    payload_length = PayloadLength,
    payload = Payload
}) ->
    <<?TUNNEL_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      PayloadType:16/little-unsigned-integer,
      PayloadLength:8/little-unsigned-integer,
      Payload:8/little-unsigned-integer>>.

%% @doc Decode TUNNEL message from binary
-spec decode_tunnel(binary()) -> #tunnel{}.
decode_tunnel(<<?TUNNEL_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   PayloadType:16/little-unsigned-integer,
                   PayloadLength:8/little-unsigned-integer,
                   Payload:8/little-unsigned-integer>>) ->
    #tunnel{
        target_system = TargetSystem,
        target_component = TargetComponent,
        payload_type = PayloadType,
        payload_length = PayloadLength,
        payload = Payload
    }.

%% @doc Encode CAN_FRAME message to binary
-spec encode_can_frame(#can_frame{}) -> binary().
encode_can_frame(#can_frame{
    target_system = TargetSystem,
    target_component = TargetComponent,
    bus = Bus,
    len = Len,
    id = Id,
    data = Data
}) ->
    <<?CAN_FRAME_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Bus:8/little-unsigned-integer,
      Len:8/little-unsigned-integer,
      Id:32/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode CAN_FRAME message from binary
-spec decode_can_frame(binary()) -> #can_frame{}.
decode_can_frame(<<?CAN_FRAME_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Bus:8/little-unsigned-integer,
                   Len:8/little-unsigned-integer,
                   Id:32/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #can_frame{
        target_system = TargetSystem,
        target_component = TargetComponent,
        bus = Bus,
        len = Len,
        id = Id,
        data = Data
    }.

%% @doc Encode CANFD_FRAME message to binary
-spec encode_canfd_frame(#canfd_frame{}) -> binary().
encode_canfd_frame(#canfd_frame{
    target_system = TargetSystem,
    target_component = TargetComponent,
    bus = Bus,
    len = Len,
    id = Id,
    data = Data
}) ->
    <<?CANFD_FRAME_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Bus:8/little-unsigned-integer,
      Len:8/little-unsigned-integer,
      Id:32/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode CANFD_FRAME message from binary
-spec decode_canfd_frame(binary()) -> #canfd_frame{}.
decode_canfd_frame(<<?CANFD_FRAME_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Bus:8/little-unsigned-integer,
                   Len:8/little-unsigned-integer,
                   Id:32/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #canfd_frame{
        target_system = TargetSystem,
        target_component = TargetComponent,
        bus = Bus,
        len = Len,
        id = Id,
        data = Data
    }.

%% @doc Encode CAN_FILTER_MODIFY message to binary
-spec encode_can_filter_modify(#can_filter_modify{}) -> binary().
encode_can_filter_modify(#can_filter_modify{
    target_system = TargetSystem,
    target_component = TargetComponent,
    bus = Bus,
    operation = Operation,
    num_ids = NumIds,
    ids = Ids
}) ->
    <<?CAN_FILTER_MODIFY_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Bus:8/little-unsigned-integer,
      Operation:8/little-unsigned-integer,
      NumIds:8/little-unsigned-integer,
      Ids:16/little-unsigned-integer>>.

%% @doc Decode CAN_FILTER_MODIFY message from binary
-spec decode_can_filter_modify(binary()) -> #can_filter_modify{}.
decode_can_filter_modify(<<?CAN_FILTER_MODIFY_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Bus:8/little-unsigned-integer,
                   Operation:8/little-unsigned-integer,
                   NumIds:8/little-unsigned-integer,
                   Ids:16/little-unsigned-integer>>) ->
    #can_filter_modify{
        target_system = TargetSystem,
        target_component = TargetComponent,
        bus = Bus,
        operation = Operation,
        num_ids = NumIds,
        ids = Ids
    }.

%% @doc Encode ONBOARD_COMPUTER_STATUS message to binary
-spec encode_onboard_computer_status(#onboard_computer_status{}) -> binary().
encode_onboard_computer_status(#onboard_computer_status{
    time_usec = TimeUsec,
    uptime = Uptime,
    type = Type,
    cpu_cores = CpuCores,
    cpu_combined = CpuCombined,
    gpu_cores = GpuCores,
    gpu_combined = GpuCombined,
    temperature_board = TemperatureBoard,
    temperature_core = TemperatureCore,
    fan_speed = FanSpeed,
    ram_usage = RamUsage,
    ram_total = RamTotal,
    storage_type = StorageType,
    storage_usage = StorageUsage,
    storage_total = StorageTotal,
    link_type = LinkType,
    link_tx_rate = LinkTxRate,
    link_rx_rate = LinkRxRate,
    link_tx_max = LinkTxMax,
    link_rx_max = LinkRxMax,
    status_flags = StatusFlags
}) ->
    <<?ONBOARD_COMPUTER_STATUS_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      Uptime:32/little-unsigned-integer,
      Type:8/little-unsigned-integer,
      CpuCores:8/little-unsigned-integer,
      CpuCombined:8/little-unsigned-integer,
      GpuCores:8/little-unsigned-integer,
      GpuCombined:8/little-unsigned-integer,
      TemperatureBoard:8/little-signed-integer,
      TemperatureCore:8/little-signed-integer,
      FanSpeed:16/little-signed-integer,
      RamUsage:32/little-unsigned-integer,
      RamTotal:32/little-unsigned-integer,
      StorageType:32/little-unsigned-integer,
      StorageUsage:32/little-unsigned-integer,
      StorageTotal:32/little-unsigned-integer,
      LinkType:32/little-unsigned-integer,
      LinkTxRate:32/little-unsigned-integer,
      LinkRxRate:32/little-unsigned-integer,
      LinkTxMax:32/little-unsigned-integer,
      LinkRxMax:32/little-unsigned-integer,
      StatusFlags:16/little-unsigned-integer>>.

%% @doc Decode ONBOARD_COMPUTER_STATUS message from binary
-spec decode_onboard_computer_status(binary()) -> #onboard_computer_status{}.
decode_onboard_computer_status(<<?ONBOARD_COMPUTER_STATUS_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   Uptime:32/little-unsigned-integer,
                   Type:8/little-unsigned-integer,
                   CpuCores:8/little-unsigned-integer,
                   CpuCombined:8/little-unsigned-integer,
                   GpuCores:8/little-unsigned-integer,
                   GpuCombined:8/little-unsigned-integer,
                   TemperatureBoard:8/little-signed-integer,
                   TemperatureCore:8/little-signed-integer,
                   FanSpeed:16/little-signed-integer,
                   RamUsage:32/little-unsigned-integer,
                   RamTotal:32/little-unsigned-integer,
                   StorageType:32/little-unsigned-integer,
                   StorageUsage:32/little-unsigned-integer,
                   StorageTotal:32/little-unsigned-integer,
                   LinkType:32/little-unsigned-integer,
                   LinkTxRate:32/little-unsigned-integer,
                   LinkRxRate:32/little-unsigned-integer,
                   LinkTxMax:32/little-unsigned-integer,
                   LinkRxMax:32/little-unsigned-integer,
                   StatusFlags:16/little-unsigned-integer>>) ->
    #onboard_computer_status{
        time_usec = TimeUsec,
        uptime = Uptime,
        type = Type,
        cpu_cores = CpuCores,
        cpu_combined = CpuCombined,
        gpu_cores = GpuCores,
        gpu_combined = GpuCombined,
        temperature_board = TemperatureBoard,
        temperature_core = TemperatureCore,
        fan_speed = FanSpeed,
        ram_usage = RamUsage,
        ram_total = RamTotal,
        storage_type = StorageType,
        storage_usage = StorageUsage,
        storage_total = StorageTotal,
        link_type = LinkType,
        link_tx_rate = LinkTxRate,
        link_rx_rate = LinkRxRate,
        link_tx_max = LinkTxMax,
        link_rx_max = LinkRxMax,
        status_flags = StatusFlags
    }.

%% @doc Encode COMPONENT_INFORMATION message to binary
-spec encode_component_information(#component_information{}) -> binary().
encode_component_information(#component_information{
    time_boot_ms = TimeBootMs,
    general_metadata_file_crc = GeneralMetadataFileCrc,
    general_metadata_uri = GeneralMetadataUri,
    peripherals_metadata_file_crc = PeripheralsMetadataFileCrc,
    peripherals_metadata_uri = PeripheralsMetadataUri
}) ->
    <<?COMPONENT_INFORMATION_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      GeneralMetadataFileCrc:32/little-unsigned-integer,
      GeneralMetadataUri:8/little-binary,
      PeripheralsMetadataFileCrc:32/little-unsigned-integer,
      PeripheralsMetadataUri:8/little-binary>>.

%% @doc Decode COMPONENT_INFORMATION message from binary
-spec decode_component_information(binary()) -> #component_information{}.
decode_component_information(<<?COMPONENT_INFORMATION_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   GeneralMetadataFileCrc:32/little-unsigned-integer,
                   GeneralMetadataUri:8/little-binary,
                   PeripheralsMetadataFileCrc:32/little-unsigned-integer,
                   PeripheralsMetadataUri:8/little-binary>>) ->
    #component_information{
        time_boot_ms = TimeBootMs,
        general_metadata_file_crc = GeneralMetadataFileCrc,
        general_metadata_uri = GeneralMetadataUri,
        peripherals_metadata_file_crc = PeripheralsMetadataFileCrc,
        peripherals_metadata_uri = PeripheralsMetadataUri
    }.

%% @doc Encode COMPONENT_INFORMATION_BASIC message to binary
-spec encode_component_information_basic(#component_information_basic{}) -> binary().
encode_component_information_basic(#component_information_basic{
    time_boot_ms = TimeBootMs,
    capabilities = Capabilities,
    time_manufacture_s = TimeManufactureS,
    vendor_name = VendorName,
    model_name = ModelName,
    software_version = SoftwareVersion,
    hardware_version = HardwareVersion,
    serial_number = SerialNumber
}) ->
    <<?COMPONENT_INFORMATION_BASIC_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      Capabilities:64/little-unsigned-integer,
      TimeManufactureS:32/little-unsigned-integer,
      VendorName:8/little-binary,
      ModelName:8/little-binary,
      SoftwareVersion:8/little-binary,
      HardwareVersion:8/little-binary,
      SerialNumber:8/little-binary>>.

%% @doc Decode COMPONENT_INFORMATION_BASIC message from binary
-spec decode_component_information_basic(binary()) -> #component_information_basic{}.
decode_component_information_basic(<<?COMPONENT_INFORMATION_BASIC_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   Capabilities:64/little-unsigned-integer,
                   TimeManufactureS:32/little-unsigned-integer,
                   VendorName:8/little-binary,
                   ModelName:8/little-binary,
                   SoftwareVersion:8/little-binary,
                   HardwareVersion:8/little-binary,
                   SerialNumber:8/little-binary>>) ->
    #component_information_basic{
        time_boot_ms = TimeBootMs,
        capabilities = Capabilities,
        time_manufacture_s = TimeManufactureS,
        vendor_name = VendorName,
        model_name = ModelName,
        software_version = SoftwareVersion,
        hardware_version = HardwareVersion,
        serial_number = SerialNumber
    }.

%% @doc Encode COMPONENT_METADATA message to binary
-spec encode_component_metadata(#component_metadata{}) -> binary().
encode_component_metadata(#component_metadata{
    time_boot_ms = TimeBootMs,
    file_crc = FileCrc,
    uri = Uri
}) ->
    <<?COMPONENT_METADATA_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      FileCrc:32/little-unsigned-integer,
      Uri:8/little-binary>>.

%% @doc Decode COMPONENT_METADATA message from binary
-spec decode_component_metadata(binary()) -> #component_metadata{}.
decode_component_metadata(<<?COMPONENT_METADATA_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   FileCrc:32/little-unsigned-integer,
                   Uri:8/little-binary>>) ->
    #component_metadata{
        time_boot_ms = TimeBootMs,
        file_crc = FileCrc,
        uri = Uri
    }.

%% @doc Encode PLAY_TUNE_V2 message to binary
-spec encode_play_tune_v2(#play_tune_v2{}) -> binary().
encode_play_tune_v2(#play_tune_v2{
    target_system = TargetSystem,
    target_component = TargetComponent,
    format = Format,
    tune = Tune
}) ->
    <<?PLAY_TUNE_V2_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Format:32/little-unsigned-integer,
      Tune:8/little-binary>>.

%% @doc Decode PLAY_TUNE_V2 message from binary
-spec decode_play_tune_v2(binary()) -> #play_tune_v2{}.
decode_play_tune_v2(<<?PLAY_TUNE_V2_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Format:32/little-unsigned-integer,
                   Tune:8/little-binary>>) ->
    #play_tune_v2{
        target_system = TargetSystem,
        target_component = TargetComponent,
        format = Format,
        tune = Tune
    }.

%% @doc Encode SUPPORTED_TUNES message to binary
-spec encode_supported_tunes(#supported_tunes{}) -> binary().
encode_supported_tunes(#supported_tunes{
    target_system = TargetSystem,
    target_component = TargetComponent,
    format = Format
}) ->
    <<?SUPPORTED_TUNES_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Format:32/little-unsigned-integer>>.

%% @doc Decode SUPPORTED_TUNES message from binary
-spec decode_supported_tunes(binary()) -> #supported_tunes{}.
decode_supported_tunes(<<?SUPPORTED_TUNES_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Format:32/little-unsigned-integer>>) ->
    #supported_tunes{
        target_system = TargetSystem,
        target_component = TargetComponent,
        format = Format
    }.

%% @doc Encode EVENT message to binary
-spec encode_event(#event{}) -> binary().
encode_event(#event{
    destination_component = DestinationComponent,
    destination_system = DestinationSystem,
    id = Id,
    event_time_boot_ms = EventTimeBootMs,
    sequence = Sequence,
    log_levels = LogLevels,
    arguments = Arguments
}) ->
    <<?EVENT_ID:16/little-unsigned-integer,
      DestinationComponent:8/little-unsigned-integer,
      DestinationSystem:8/little-unsigned-integer,
      Id:32/little-unsigned-integer,
      EventTimeBootMs:32/little-unsigned-integer,
      Sequence:16/little-unsigned-integer,
      LogLevels:8/little-unsigned-integer,
      Arguments:8/little-unsigned-integer>>.

%% @doc Decode EVENT message from binary
-spec decode_event(binary()) -> #event{}.
decode_event(<<?EVENT_ID:16/little-unsigned-integer,
                   DestinationComponent:8/little-unsigned-integer,
                   DestinationSystem:8/little-unsigned-integer,
                   Id:32/little-unsigned-integer,
                   EventTimeBootMs:32/little-unsigned-integer,
                   Sequence:16/little-unsigned-integer,
                   LogLevels:8/little-unsigned-integer,
                   Arguments:8/little-unsigned-integer>>) ->
    #event{
        destination_component = DestinationComponent,
        destination_system = DestinationSystem,
        id = Id,
        event_time_boot_ms = EventTimeBootMs,
        sequence = Sequence,
        log_levels = LogLevels,
        arguments = Arguments
    }.

%% @doc Encode CURRENT_EVENT_SEQUENCE message to binary
-spec encode_current_event_sequence(#current_event_sequence{}) -> binary().
encode_current_event_sequence(#current_event_sequence{
    sequence = Sequence,
    flags = Flags
}) ->
    <<?CURRENT_EVENT_SEQUENCE_ID:16/little-unsigned-integer,
      Sequence:16/little-unsigned-integer,
      Flags:8/little-unsigned-integer>>.

%% @doc Decode CURRENT_EVENT_SEQUENCE message from binary
-spec decode_current_event_sequence(binary()) -> #current_event_sequence{}.
decode_current_event_sequence(<<?CURRENT_EVENT_SEQUENCE_ID:16/little-unsigned-integer,
                   Sequence:16/little-unsigned-integer,
                   Flags:8/little-unsigned-integer>>) ->
    #current_event_sequence{
        sequence = Sequence,
        flags = Flags
    }.

%% @doc Encode REQUEST_EVENT message to binary
-spec encode_request_event(#request_event{}) -> binary().
encode_request_event(#request_event{
    target_system = TargetSystem,
    target_component = TargetComponent,
    first_sequence = FirstSequence,
    last_sequence = LastSequence
}) ->
    <<?REQUEST_EVENT_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      FirstSequence:16/little-unsigned-integer,
      LastSequence:16/little-unsigned-integer>>.

%% @doc Decode REQUEST_EVENT message from binary
-spec decode_request_event(binary()) -> #request_event{}.
decode_request_event(<<?REQUEST_EVENT_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   FirstSequence:16/little-unsigned-integer,
                   LastSequence:16/little-unsigned-integer>>) ->
    #request_event{
        target_system = TargetSystem,
        target_component = TargetComponent,
        first_sequence = FirstSequence,
        last_sequence = LastSequence
    }.

%% @doc Encode RESPONSE_EVENT_ERROR message to binary
-spec encode_response_event_error(#response_event_error{}) -> binary().
encode_response_event_error(#response_event_error{
    target_system = TargetSystem,
    target_component = TargetComponent,
    sequence = Sequence,
    sequence_oldest_available = SequenceOldestAvailable,
    reason = Reason
}) ->
    <<?RESPONSE_EVENT_ERROR_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Sequence:16/little-unsigned-integer,
      SequenceOldestAvailable:16/little-unsigned-integer,
      Reason:8/little-unsigned-integer>>.

%% @doc Decode RESPONSE_EVENT_ERROR message from binary
-spec decode_response_event_error(binary()) -> #response_event_error{}.
decode_response_event_error(<<?RESPONSE_EVENT_ERROR_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Sequence:16/little-unsigned-integer,
                   SequenceOldestAvailable:16/little-unsigned-integer,
                   Reason:8/little-unsigned-integer>>) ->
    #response_event_error{
        target_system = TargetSystem,
        target_component = TargetComponent,
        sequence = Sequence,
        sequence_oldest_available = SequenceOldestAvailable,
        reason = Reason
    }.

%% @doc Encode RADIO_RC_CHANNELS message to binary
-spec encode_radio_rc_channels(#radio_rc_channels{}) -> binary().
encode_radio_rc_channels(#radio_rc_channels{
    target_system = TargetSystem,
    target_component = TargetComponent,
    time_last_update_ms = TimeLastUpdateMs,
    flags = Flags,
    count = Count,
    channels = Channels
}) ->
    <<?RADIO_RC_CHANNELS_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      TimeLastUpdateMs:32/little-unsigned-integer,
      Flags:16/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      Channels:16/little-signed-integer>>.

%% @doc Decode RADIO_RC_CHANNELS message from binary
-spec decode_radio_rc_channels(binary()) -> #radio_rc_channels{}.
decode_radio_rc_channels(<<?RADIO_RC_CHANNELS_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   TimeLastUpdateMs:32/little-unsigned-integer,
                   Flags:16/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   Channels:16/little-signed-integer>>) ->
    #radio_rc_channels{
        target_system = TargetSystem,
        target_component = TargetComponent,
        time_last_update_ms = TimeLastUpdateMs,
        flags = Flags,
        count = Count,
        channels = Channels
    }.

%% @doc Encode AVAILABLE_MODES message to binary
-spec encode_available_modes(#available_modes{}) -> binary().
encode_available_modes(#available_modes{
    number_modes = NumberModes,
    mode_index = ModeIndex,
    standard_mode = StandardMode,
    custom_mode = CustomMode,
    properties = Properties,
    mode_name = ModeName,
    seq = Seq
}) ->
    <<?AVAILABLE_MODES_ID:16/little-unsigned-integer,
      NumberModes:8/little-unsigned-integer,
      ModeIndex:8/little-unsigned-integer,
      StandardMode:8/little-unsigned-integer,
      CustomMode:32/little-unsigned-integer,
      Properties:32/little-unsigned-integer,
      ModeName:8/little-binary,
      Seq:8/little-unsigned-integer>>.

%% @doc Decode AVAILABLE_MODES message from binary
-spec decode_available_modes(binary()) -> #available_modes{}.
decode_available_modes(<<?AVAILABLE_MODES_ID:16/little-unsigned-integer,
                   NumberModes:8/little-unsigned-integer,
                   ModeIndex:8/little-unsigned-integer,
                   StandardMode:8/little-unsigned-integer,
                   CustomMode:32/little-unsigned-integer,
                   Properties:32/little-unsigned-integer,
                   ModeName:8/little-binary,
                   Seq:8/little-unsigned-integer>>) ->
    #available_modes{
        number_modes = NumberModes,
        mode_index = ModeIndex,
        standard_mode = StandardMode,
        custom_mode = CustomMode,
        properties = Properties,
        mode_name = ModeName,
        seq = Seq
    }.

%% @doc Encode CURRENT_MODE message to binary
-spec encode_current_mode(#current_mode{}) -> binary().
encode_current_mode(#current_mode{
    standard_mode = StandardMode,
    custom_mode = CustomMode,
    intended_custom_mode = IntendedCustomMode
}) ->
    <<?CURRENT_MODE_ID:16/little-unsigned-integer,
      StandardMode:8/little-unsigned-integer,
      CustomMode:32/little-unsigned-integer,
      IntendedCustomMode:32/little-unsigned-integer>>.

%% @doc Decode CURRENT_MODE message from binary
-spec decode_current_mode(binary()) -> #current_mode{}.
decode_current_mode(<<?CURRENT_MODE_ID:16/little-unsigned-integer,
                   StandardMode:8/little-unsigned-integer,
                   CustomMode:32/little-unsigned-integer,
                   IntendedCustomMode:32/little-unsigned-integer>>) ->
    #current_mode{
        standard_mode = StandardMode,
        custom_mode = CustomMode,
        intended_custom_mode = IntendedCustomMode
    }.

%% @doc Encode AVAILABLE_MODES_MONITOR message to binary
-spec encode_available_modes_monitor(#available_modes_monitor{}) -> binary().
encode_available_modes_monitor(#available_modes_monitor{
    seq = Seq
}) ->
    <<?AVAILABLE_MODES_MONITOR_ID:16/little-unsigned-integer,
      Seq:8/little-unsigned-integer>>.

%% @doc Decode AVAILABLE_MODES_MONITOR message from binary
-spec decode_available_modes_monitor(binary()) -> #available_modes_monitor{}.
decode_available_modes_monitor(<<?AVAILABLE_MODES_MONITOR_ID:16/little-unsigned-integer,
                   Seq:8/little-unsigned-integer>>) ->
    #available_modes_monitor{
        seq = Seq
    }.

%% @doc Encode ILLUMINATOR_STATUS message to binary
-spec encode_illuminator_status(#illuminator_status{}) -> binary().
encode_illuminator_status(#illuminator_status{
    uptime_ms = UptimeMs,
    enable = Enable,
    mode_bitmask = ModeBitmask,
    error_status = ErrorStatus,
    mode = Mode,
    brightness = Brightness,
    strobe_period = StrobePeriod,
    strobe_duty_cycle = StrobeDutyCycle,
    temp_c = TempC,
    min_strobe_period = MinStrobePeriod,
    max_strobe_period = MaxStrobePeriod
}) ->
    <<?ILLUMINATOR_STATUS_ID:16/little-unsigned-integer,
      UptimeMs:32/little-unsigned-integer,
      Enable:8/little-unsigned-integer,
      ModeBitmask:8/little-unsigned-integer,
      ErrorStatus:32/little-unsigned-integer,
      Mode:8/little-unsigned-integer,
      Brightness:32/little-float,
      StrobePeriod:32/little-float,
      StrobeDutyCycle:32/little-float,
      TempC:32/little-float,
      MinStrobePeriod:32/little-float,
      MaxStrobePeriod:32/little-float>>.

%% @doc Decode ILLUMINATOR_STATUS message from binary
-spec decode_illuminator_status(binary()) -> #illuminator_status{}.
decode_illuminator_status(<<?ILLUMINATOR_STATUS_ID:16/little-unsigned-integer,
                   UptimeMs:32/little-unsigned-integer,
                   Enable:8/little-unsigned-integer,
                   ModeBitmask:8/little-unsigned-integer,
                   ErrorStatus:32/little-unsigned-integer,
                   Mode:8/little-unsigned-integer,
                   Brightness:32/little-float,
                   StrobePeriod:32/little-float,
                   StrobeDutyCycle:32/little-float,
                   TempC:32/little-float,
                   MinStrobePeriod:32/little-float,
                   MaxStrobePeriod:32/little-float>>) ->
    #illuminator_status{
        uptime_ms = UptimeMs,
        enable = Enable,
        mode_bitmask = ModeBitmask,
        error_status = ErrorStatus,
        mode = Mode,
        brightness = Brightness,
        strobe_period = StrobePeriod,
        strobe_duty_cycle = StrobeDutyCycle,
        temp_c = TempC,
        min_strobe_period = MinStrobePeriod,
        max_strobe_period = MaxStrobePeriod
    }.

%% @doc Encode WHEEL_DISTANCE message to binary
-spec encode_wheel_distance(#wheel_distance{}) -> binary().
encode_wheel_distance(#wheel_distance{
    time_usec = TimeUsec,
    count = Count,
    distance = Distance
}) ->
    <<?WHEEL_DISTANCE_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      Distance:64/little-float>>.

%% @doc Decode WHEEL_DISTANCE message from binary
-spec decode_wheel_distance(binary()) -> #wheel_distance{}.
decode_wheel_distance(<<?WHEEL_DISTANCE_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   Distance:64/little-float>>) ->
    #wheel_distance{
        time_usec = TimeUsec,
        count = Count,
        distance = Distance
    }.

%% @doc Encode WINCH_STATUS message to binary
-spec encode_winch_status(#winch_status{}) -> binary().
encode_winch_status(#winch_status{
    time_usec = TimeUsec,
    line_length = LineLength,
    speed = Speed,
    tension = Tension,
    voltage = Voltage,
    current = Current,
    temperature = Temperature,
    status = Status
}) ->
    <<?WINCH_STATUS_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      LineLength:32/little-float,
      Speed:32/little-float,
      Tension:32/little-float,
      Voltage:32/little-float,
      Current:32/little-float,
      Temperature:16/little-signed-integer,
      Status:32/little-unsigned-integer>>.

%% @doc Decode WINCH_STATUS message from binary
-spec decode_winch_status(binary()) -> #winch_status{}.
decode_winch_status(<<?WINCH_STATUS_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   LineLength:32/little-float,
                   Speed:32/little-float,
                   Tension:32/little-float,
                   Voltage:32/little-float,
                   Current:32/little-float,
                   Temperature:16/little-signed-integer,
                   Status:32/little-unsigned-integer>>) ->
    #winch_status{
        time_usec = TimeUsec,
        line_length = LineLength,
        speed = Speed,
        tension = Tension,
        voltage = Voltage,
        current = Current,
        temperature = Temperature,
        status = Status
    }.

%% @doc Encode OPEN_DRONE_ID_BASIC_ID message to binary
-spec encode_open_drone_id_basic_id(#open_drone_id_basic_id{}) -> binary().
encode_open_drone_id_basic_id(#open_drone_id_basic_id{
    target_system = TargetSystem,
    target_component = TargetComponent,
    id_or_mac = IdOrMac,
    id_type = IdType,
    ua_type = UaType,
    uas_id = UasId
}) ->
    <<?OPEN_DRONE_ID_BASIC_ID_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      IdOrMac:8/little-unsigned-integer,
      IdType:8/little-unsigned-integer,
      UaType:8/little-unsigned-integer,
      UasId:8/little-unsigned-integer>>.

%% @doc Decode OPEN_DRONE_ID_BASIC_ID message from binary
-spec decode_open_drone_id_basic_id(binary()) -> #open_drone_id_basic_id{}.
decode_open_drone_id_basic_id(<<?OPEN_DRONE_ID_BASIC_ID_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   IdOrMac:8/little-unsigned-integer,
                   IdType:8/little-unsigned-integer,
                   UaType:8/little-unsigned-integer,
                   UasId:8/little-unsigned-integer>>) ->
    #open_drone_id_basic_id{
        target_system = TargetSystem,
        target_component = TargetComponent,
        id_or_mac = IdOrMac,
        id_type = IdType,
        ua_type = UaType,
        uas_id = UasId
    }.

%% @doc Encode OPEN_DRONE_ID_LOCATION message to binary
-spec encode_open_drone_id_location(#open_drone_id_location{}) -> binary().
encode_open_drone_id_location(#open_drone_id_location{
    target_system = TargetSystem,
    target_component = TargetComponent,
    id_or_mac = IdOrMac,
    status = Status,
    direction = Direction,
    speed_horizontal = SpeedHorizontal,
    speed_vertical = SpeedVertical,
    latitude = Latitude,
    longitude = Longitude,
    altitude_barometric = AltitudeBarometric,
    altitude_geodetic = AltitudeGeodetic,
    height_reference = HeightReference,
    height = Height,
    horizontal_accuracy = HorizontalAccuracy,
    vertical_accuracy = VerticalAccuracy,
    barometer_accuracy = BarometerAccuracy,
    speed_accuracy = SpeedAccuracy,
    timestamp = Timestamp,
    timestamp_accuracy = TimestampAccuracy
}) ->
    <<?OPEN_DRONE_ID_LOCATION_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      IdOrMac:8/little-unsigned-integer,
      Status:8/little-unsigned-integer,
      Direction:16/little-unsigned-integer,
      SpeedHorizontal:16/little-unsigned-integer,
      SpeedVertical:16/little-signed-integer,
      Latitude:32/little-signed-integer,
      Longitude:32/little-signed-integer,
      AltitudeBarometric:32/little-float,
      AltitudeGeodetic:32/little-float,
      HeightReference:8/little-unsigned-integer,
      Height:32/little-float,
      HorizontalAccuracy:8/little-unsigned-integer,
      VerticalAccuracy:8/little-unsigned-integer,
      BarometerAccuracy:8/little-unsigned-integer,
      SpeedAccuracy:8/little-unsigned-integer,
      Timestamp:32/little-float,
      TimestampAccuracy:8/little-unsigned-integer>>.

%% @doc Decode OPEN_DRONE_ID_LOCATION message from binary
-spec decode_open_drone_id_location(binary()) -> #open_drone_id_location{}.
decode_open_drone_id_location(<<?OPEN_DRONE_ID_LOCATION_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   IdOrMac:8/little-unsigned-integer,
                   Status:8/little-unsigned-integer,
                   Direction:16/little-unsigned-integer,
                   SpeedHorizontal:16/little-unsigned-integer,
                   SpeedVertical:16/little-signed-integer,
                   Latitude:32/little-signed-integer,
                   Longitude:32/little-signed-integer,
                   AltitudeBarometric:32/little-float,
                   AltitudeGeodetic:32/little-float,
                   HeightReference:8/little-unsigned-integer,
                   Height:32/little-float,
                   HorizontalAccuracy:8/little-unsigned-integer,
                   VerticalAccuracy:8/little-unsigned-integer,
                   BarometerAccuracy:8/little-unsigned-integer,
                   SpeedAccuracy:8/little-unsigned-integer,
                   Timestamp:32/little-float,
                   TimestampAccuracy:8/little-unsigned-integer>>) ->
    #open_drone_id_location{
        target_system = TargetSystem,
        target_component = TargetComponent,
        id_or_mac = IdOrMac,
        status = Status,
        direction = Direction,
        speed_horizontal = SpeedHorizontal,
        speed_vertical = SpeedVertical,
        latitude = Latitude,
        longitude = Longitude,
        altitude_barometric = AltitudeBarometric,
        altitude_geodetic = AltitudeGeodetic,
        height_reference = HeightReference,
        height = Height,
        horizontal_accuracy = HorizontalAccuracy,
        vertical_accuracy = VerticalAccuracy,
        barometer_accuracy = BarometerAccuracy,
        speed_accuracy = SpeedAccuracy,
        timestamp = Timestamp,
        timestamp_accuracy = TimestampAccuracy
    }.

%% @doc Encode OPEN_DRONE_ID_AUTHENTICATION message to binary
-spec encode_open_drone_id_authentication(#open_drone_id_authentication{}) -> binary().
encode_open_drone_id_authentication(#open_drone_id_authentication{
    target_system = TargetSystem,
    target_component = TargetComponent,
    id_or_mac = IdOrMac,
    authentication_type = AuthenticationType,
    data_page = DataPage,
    last_page_index = LastPageIndex,
    length = Length,
    timestamp = Timestamp,
    authentication_data = AuthenticationData
}) ->
    <<?OPEN_DRONE_ID_AUTHENTICATION_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      IdOrMac:8/little-unsigned-integer,
      AuthenticationType:8/little-unsigned-integer,
      DataPage:8/little-unsigned-integer,
      LastPageIndex:8/little-unsigned-integer,
      Length:8/little-unsigned-integer,
      Timestamp:32/little-unsigned-integer,
      AuthenticationData:8/little-unsigned-integer>>.

%% @doc Decode OPEN_DRONE_ID_AUTHENTICATION message from binary
-spec decode_open_drone_id_authentication(binary()) -> #open_drone_id_authentication{}.
decode_open_drone_id_authentication(<<?OPEN_DRONE_ID_AUTHENTICATION_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   IdOrMac:8/little-unsigned-integer,
                   AuthenticationType:8/little-unsigned-integer,
                   DataPage:8/little-unsigned-integer,
                   LastPageIndex:8/little-unsigned-integer,
                   Length:8/little-unsigned-integer,
                   Timestamp:32/little-unsigned-integer,
                   AuthenticationData:8/little-unsigned-integer>>) ->
    #open_drone_id_authentication{
        target_system = TargetSystem,
        target_component = TargetComponent,
        id_or_mac = IdOrMac,
        authentication_type = AuthenticationType,
        data_page = DataPage,
        last_page_index = LastPageIndex,
        length = Length,
        timestamp = Timestamp,
        authentication_data = AuthenticationData
    }.

%% @doc Encode OPEN_DRONE_ID_SELF_ID message to binary
-spec encode_open_drone_id_self_id(#open_drone_id_self_id{}) -> binary().
encode_open_drone_id_self_id(#open_drone_id_self_id{
    target_system = TargetSystem,
    target_component = TargetComponent,
    id_or_mac = IdOrMac,
    description_type = DescriptionType,
    description = Description
}) ->
    <<?OPEN_DRONE_ID_SELF_ID_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      IdOrMac:8/little-unsigned-integer,
      DescriptionType:8/little-unsigned-integer,
      Description:8/little-binary>>.

%% @doc Decode OPEN_DRONE_ID_SELF_ID message from binary
-spec decode_open_drone_id_self_id(binary()) -> #open_drone_id_self_id{}.
decode_open_drone_id_self_id(<<?OPEN_DRONE_ID_SELF_ID_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   IdOrMac:8/little-unsigned-integer,
                   DescriptionType:8/little-unsigned-integer,
                   Description:8/little-binary>>) ->
    #open_drone_id_self_id{
        target_system = TargetSystem,
        target_component = TargetComponent,
        id_or_mac = IdOrMac,
        description_type = DescriptionType,
        description = Description
    }.

%% @doc Encode OPEN_DRONE_ID_SYSTEM message to binary
-spec encode_open_drone_id_system(#open_drone_id_system{}) -> binary().
encode_open_drone_id_system(#open_drone_id_system{
    target_system = TargetSystem,
    target_component = TargetComponent,
    id_or_mac = IdOrMac,
    operator_location_type = OperatorLocationType,
    classification_type = ClassificationType,
    operator_latitude = OperatorLatitude,
    operator_longitude = OperatorLongitude,
    area_count = AreaCount,
    area_radius = AreaRadius,
    area_ceiling = AreaCeiling,
    area_floor = AreaFloor,
    category_eu = CategoryEu,
    class_eu = ClassEu,
    operator_altitude_geo = OperatorAltitudeGeo,
    timestamp = Timestamp
}) ->
    <<?OPEN_DRONE_ID_SYSTEM_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      IdOrMac:8/little-unsigned-integer,
      OperatorLocationType:8/little-unsigned-integer,
      ClassificationType:8/little-unsigned-integer,
      OperatorLatitude:32/little-signed-integer,
      OperatorLongitude:32/little-signed-integer,
      AreaCount:16/little-unsigned-integer,
      AreaRadius:16/little-unsigned-integer,
      AreaCeiling:32/little-float,
      AreaFloor:32/little-float,
      CategoryEu:8/little-unsigned-integer,
      ClassEu:8/little-unsigned-integer,
      OperatorAltitudeGeo:32/little-float,
      Timestamp:32/little-unsigned-integer>>.

%% @doc Decode OPEN_DRONE_ID_SYSTEM message from binary
-spec decode_open_drone_id_system(binary()) -> #open_drone_id_system{}.
decode_open_drone_id_system(<<?OPEN_DRONE_ID_SYSTEM_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   IdOrMac:8/little-unsigned-integer,
                   OperatorLocationType:8/little-unsigned-integer,
                   ClassificationType:8/little-unsigned-integer,
                   OperatorLatitude:32/little-signed-integer,
                   OperatorLongitude:32/little-signed-integer,
                   AreaCount:16/little-unsigned-integer,
                   AreaRadius:16/little-unsigned-integer,
                   AreaCeiling:32/little-float,
                   AreaFloor:32/little-float,
                   CategoryEu:8/little-unsigned-integer,
                   ClassEu:8/little-unsigned-integer,
                   OperatorAltitudeGeo:32/little-float,
                   Timestamp:32/little-unsigned-integer>>) ->
    #open_drone_id_system{
        target_system = TargetSystem,
        target_component = TargetComponent,
        id_or_mac = IdOrMac,
        operator_location_type = OperatorLocationType,
        classification_type = ClassificationType,
        operator_latitude = OperatorLatitude,
        operator_longitude = OperatorLongitude,
        area_count = AreaCount,
        area_radius = AreaRadius,
        area_ceiling = AreaCeiling,
        area_floor = AreaFloor,
        category_eu = CategoryEu,
        class_eu = ClassEu,
        operator_altitude_geo = OperatorAltitudeGeo,
        timestamp = Timestamp
    }.

%% @doc Encode OPEN_DRONE_ID_OPERATOR_ID message to binary
-spec encode_open_drone_id_operator_id(#open_drone_id_operator_id{}) -> binary().
encode_open_drone_id_operator_id(#open_drone_id_operator_id{
    target_system = TargetSystem,
    target_component = TargetComponent,
    id_or_mac = IdOrMac,
    operator_id_type = OperatorIdType,
    operator_id = OperatorId
}) ->
    <<?OPEN_DRONE_ID_OPERATOR_ID_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      IdOrMac:8/little-unsigned-integer,
      OperatorIdType:8/little-unsigned-integer,
      OperatorId:8/little-binary>>.

%% @doc Decode OPEN_DRONE_ID_OPERATOR_ID message from binary
-spec decode_open_drone_id_operator_id(binary()) -> #open_drone_id_operator_id{}.
decode_open_drone_id_operator_id(<<?OPEN_DRONE_ID_OPERATOR_ID_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   IdOrMac:8/little-unsigned-integer,
                   OperatorIdType:8/little-unsigned-integer,
                   OperatorId:8/little-binary>>) ->
    #open_drone_id_operator_id{
        target_system = TargetSystem,
        target_component = TargetComponent,
        id_or_mac = IdOrMac,
        operator_id_type = OperatorIdType,
        operator_id = OperatorId
    }.

%% @doc Encode OPEN_DRONE_ID_MESSAGE_PACK message to binary
-spec encode_open_drone_id_message_pack(#open_drone_id_message_pack{}) -> binary().
encode_open_drone_id_message_pack(#open_drone_id_message_pack{
    target_system = TargetSystem,
    target_component = TargetComponent,
    id_or_mac = IdOrMac,
    single_message_size = SingleMessageSize,
    msg_pack_size = MsgPackSize,
    messages = Messages
}) ->
    <<?OPEN_DRONE_ID_MESSAGE_PACK_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      IdOrMac:8/little-unsigned-integer,
      SingleMessageSize:8/little-unsigned-integer,
      MsgPackSize:8/little-unsigned-integer,
      Messages:8/little-unsigned-integer>>.

%% @doc Decode OPEN_DRONE_ID_MESSAGE_PACK message from binary
-spec decode_open_drone_id_message_pack(binary()) -> #open_drone_id_message_pack{}.
decode_open_drone_id_message_pack(<<?OPEN_DRONE_ID_MESSAGE_PACK_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   IdOrMac:8/little-unsigned-integer,
                   SingleMessageSize:8/little-unsigned-integer,
                   MsgPackSize:8/little-unsigned-integer,
                   Messages:8/little-unsigned-integer>>) ->
    #open_drone_id_message_pack{
        target_system = TargetSystem,
        target_component = TargetComponent,
        id_or_mac = IdOrMac,
        single_message_size = SingleMessageSize,
        msg_pack_size = MsgPackSize,
        messages = Messages
    }.

%% @doc Encode OPEN_DRONE_ID_ARM_STATUS message to binary
-spec encode_open_drone_id_arm_status(#open_drone_id_arm_status{}) -> binary().
encode_open_drone_id_arm_status(#open_drone_id_arm_status{
    status = Status,
    error = Error
}) ->
    <<?OPEN_DRONE_ID_ARM_STATUS_ID:16/little-unsigned-integer,
      Status:8/little-unsigned-integer,
      Error:8/little-binary>>.

%% @doc Decode OPEN_DRONE_ID_ARM_STATUS message from binary
-spec decode_open_drone_id_arm_status(binary()) -> #open_drone_id_arm_status{}.
decode_open_drone_id_arm_status(<<?OPEN_DRONE_ID_ARM_STATUS_ID:16/little-unsigned-integer,
                   Status:8/little-unsigned-integer,
                   Error:8/little-binary>>) ->
    #open_drone_id_arm_status{
        status = Status,
        error = Error
    }.

%% @doc Encode OPEN_DRONE_ID_SYSTEM_UPDATE message to binary
-spec encode_open_drone_id_system_update(#open_drone_id_system_update{}) -> binary().
encode_open_drone_id_system_update(#open_drone_id_system_update{
    target_system = TargetSystem,
    target_component = TargetComponent,
    operator_latitude = OperatorLatitude,
    operator_longitude = OperatorLongitude,
    operator_altitude_geo = OperatorAltitudeGeo,
    timestamp = Timestamp
}) ->
    <<?OPEN_DRONE_ID_SYSTEM_UPDATE_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      OperatorLatitude:32/little-signed-integer,
      OperatorLongitude:32/little-signed-integer,
      OperatorAltitudeGeo:32/little-float,
      Timestamp:32/little-unsigned-integer>>.

%% @doc Decode OPEN_DRONE_ID_SYSTEM_UPDATE message from binary
-spec decode_open_drone_id_system_update(binary()) -> #open_drone_id_system_update{}.
decode_open_drone_id_system_update(<<?OPEN_DRONE_ID_SYSTEM_UPDATE_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   OperatorLatitude:32/little-signed-integer,
                   OperatorLongitude:32/little-signed-integer,
                   OperatorAltitudeGeo:32/little-float,
                   Timestamp:32/little-unsigned-integer>>) ->
    #open_drone_id_system_update{
        target_system = TargetSystem,
        target_component = TargetComponent,
        operator_latitude = OperatorLatitude,
        operator_longitude = OperatorLongitude,
        operator_altitude_geo = OperatorAltitudeGeo,
        timestamp = Timestamp
    }.

%% @doc Encode HYGROMETER_SENSOR message to binary
-spec encode_hygrometer_sensor(#hygrometer_sensor{}) -> binary().
encode_hygrometer_sensor(#hygrometer_sensor{
    id = Id,
    temperature = Temperature,
    humidity = Humidity
}) ->
    <<?HYGROMETER_SENSOR_ID:16/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      Temperature:16/little-signed-integer,
      Humidity:16/little-unsigned-integer>>.

%% @doc Decode HYGROMETER_SENSOR message from binary
-spec decode_hygrometer_sensor(binary()) -> #hygrometer_sensor{}.
decode_hygrometer_sensor(<<?HYGROMETER_SENSOR_ID:16/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   Temperature:16/little-signed-integer,
                   Humidity:16/little-unsigned-integer>>) ->
    #hygrometer_sensor{
        id = Id,
        temperature = Temperature,
        humidity = Humidity
    }.
