-module(mavlink_ardupilotmega_codec).
-include("mavlink_ardupilotmega.hrl").

%% API
-export([
    encode_sensor_offsets/1,
    decode_sensor_offsets/1,
    encode_set_mag_offsets/1,
    decode_set_mag_offsets/1,
    encode_meminfo/1,
    decode_meminfo/1,
    encode_ap_adc/1,
    decode_ap_adc/1,
    encode_digicam_configure/1,
    decode_digicam_configure/1,
    encode_digicam_control/1,
    decode_digicam_control/1,
    encode_mount_configure/1,
    decode_mount_configure/1,
    encode_mount_control/1,
    decode_mount_control/1,
    encode_mount_status/1,
    decode_mount_status/1,
    encode_fence_point/1,
    decode_fence_point/1,
    encode_fence_fetch_point/1,
    decode_fence_fetch_point/1,
    encode_ahrs/1,
    decode_ahrs/1,
    encode_simstate/1,
    decode_simstate/1,
    encode_hwstatus/1,
    decode_hwstatus/1,
    encode_radio/1,
    decode_radio/1,
    encode_limits_status/1,
    decode_limits_status/1,
    encode_wind/1,
    decode_wind/1,
    encode_data16/1,
    decode_data16/1,
    encode_data32/1,
    decode_data32/1,
    encode_data64/1,
    decode_data64/1,
    encode_data96/1,
    decode_data96/1,
    encode_rangefinder/1,
    decode_rangefinder/1,
    encode_airspeed_autocal/1,
    decode_airspeed_autocal/1,
    encode_rally_point/1,
    decode_rally_point/1,
    encode_rally_fetch_point/1,
    decode_rally_fetch_point/1,
    encode_compassmot_status/1,
    decode_compassmot_status/1,
    encode_ahrs2/1,
    decode_ahrs2/1,
    encode_camera_status/1,
    decode_camera_status/1,
    encode_camera_feedback/1,
    decode_camera_feedback/1,
    encode_battery2/1,
    decode_battery2/1,
    encode_ahrs3/1,
    decode_ahrs3/1,
    encode_autopilot_version_request/1,
    decode_autopilot_version_request/1,
    encode_remote_log_data_block/1,
    decode_remote_log_data_block/1,
    encode_remote_log_block_status/1,
    decode_remote_log_block_status/1,
    encode_led_control/1,
    decode_led_control/1,
    encode_mag_cal_progress/1,
    decode_mag_cal_progress/1,
    encode_ekf_status_report/1,
    decode_ekf_status_report/1,
    encode_pid_tuning/1,
    decode_pid_tuning/1,
    encode_deepstall/1,
    decode_deepstall/1,
    encode_gimbal_report/1,
    decode_gimbal_report/1,
    encode_gimbal_control/1,
    decode_gimbal_control/1,
    encode_gimbal_torque_cmd_report/1,
    decode_gimbal_torque_cmd_report/1,
    encode_gopro_heartbeat/1,
    decode_gopro_heartbeat/1,
    encode_gopro_get_request/1,
    decode_gopro_get_request/1,
    encode_gopro_get_response/1,
    decode_gopro_get_response/1,
    encode_gopro_set_request/1,
    decode_gopro_set_request/1,
    encode_gopro_set_response/1,
    decode_gopro_set_response/1,
    encode_rpm/1,
    decode_rpm/1,
    encode_device_op_read/1,
    decode_device_op_read/1,
    encode_device_op_read_reply/1,
    decode_device_op_read_reply/1,
    encode_device_op_write/1,
    decode_device_op_write/1,
    encode_device_op_write_reply/1,
    decode_device_op_write_reply/1,
    encode_secure_command/1,
    decode_secure_command/1,
    encode_secure_command_reply/1,
    decode_secure_command_reply/1,
    encode_adap_tuning/1,
    decode_adap_tuning/1,
    encode_vision_position_delta/1,
    decode_vision_position_delta/1,
    encode_aoa_ssa/1,
    decode_aoa_ssa/1,
    encode_esc_telemetry_1_to_4/1,
    decode_esc_telemetry_1_to_4/1,
    encode_esc_telemetry_5_to_8/1,
    decode_esc_telemetry_5_to_8/1,
    encode_esc_telemetry_9_to_12/1,
    decode_esc_telemetry_9_to_12/1,
    encode_osd_param_config/1,
    decode_osd_param_config/1,
    encode_osd_param_config_reply/1,
    decode_osd_param_config_reply/1,
    encode_osd_param_show_config/1,
    decode_osd_param_show_config/1,
    encode_osd_param_show_config_reply/1,
    decode_osd_param_show_config_reply/1,
    encode_obstacle_distance_3d/1,
    decode_obstacle_distance_3d/1,
    encode_water_depth/1,
    decode_water_depth/1,
    encode_mcu_status/1,
    decode_mcu_status/1,
    encode_esc_telemetry_13_to_16/1,
    decode_esc_telemetry_13_to_16/1,
    encode_esc_telemetry_17_to_20/1,
    decode_esc_telemetry_17_to_20/1,
    encode_esc_telemetry_21_to_24/1,
    decode_esc_telemetry_21_to_24/1,
    encode_esc_telemetry_25_to_28/1,
    decode_esc_telemetry_25_to_28/1,
    encode_esc_telemetry_29_to_32/1,
    decode_esc_telemetry_29_to_32/1,
    encode_named_value_string/1,
    decode_named_value_string/1
]).

%% @doc Encode SENSOR_OFFSETS message to binary
-spec encode_sensor_offsets(#sensor_offsets{}) -> binary().
encode_sensor_offsets(#sensor_offsets{
    mag_ofs_x = MagOfsX,
    mag_ofs_y = MagOfsY,
    mag_ofs_z = MagOfsZ,
    mag_declination = MagDeclination,
    raw_press = RawPress,
    raw_temp = RawTemp,
    gyro_cal_x = GyroCalX,
    gyro_cal_y = GyroCalY,
    gyro_cal_z = GyroCalZ,
    accel_cal_x = AccelCalX,
    accel_cal_y = AccelCalY,
    accel_cal_z = AccelCalZ
}) ->
    <<?SENSOR_OFFSETS_ID:8,
      MagOfsX:16/little-signed-integer,
      MagOfsY:16/little-signed-integer,
      MagOfsZ:16/little-signed-integer,
      MagDeclination:32/little-float,
      RawPress:32/little-signed-integer,
      RawTemp:32/little-signed-integer,
      GyroCalX:32/little-float,
      GyroCalY:32/little-float,
      GyroCalZ:32/little-float,
      AccelCalX:32/little-float,
      AccelCalY:32/little-float,
      AccelCalZ:32/little-float>>.

%% @doc Decode SENSOR_OFFSETS message from binary
-spec decode_sensor_offsets(binary()) -> #sensor_offsets{}.
decode_sensor_offsets(<<?SENSOR_OFFSETS_ID:8,
                   MagOfsX:16/little-signed-integer,
                   MagOfsY:16/little-signed-integer,
                   MagOfsZ:16/little-signed-integer,
                   MagDeclination:32/little-float,
                   RawPress:32/little-signed-integer,
                   RawTemp:32/little-signed-integer,
                   GyroCalX:32/little-float,
                   GyroCalY:32/little-float,
                   GyroCalZ:32/little-float,
                   AccelCalX:32/little-float,
                   AccelCalY:32/little-float,
                   AccelCalZ:32/little-float>>) ->
    #sensor_offsets{
        mag_ofs_x = MagOfsX,
        mag_ofs_y = MagOfsY,
        mag_ofs_z = MagOfsZ,
        mag_declination = MagDeclination,
        raw_press = RawPress,
        raw_temp = RawTemp,
        gyro_cal_x = GyroCalX,
        gyro_cal_y = GyroCalY,
        gyro_cal_z = GyroCalZ,
        accel_cal_x = AccelCalX,
        accel_cal_y = AccelCalY,
        accel_cal_z = AccelCalZ
    }.

%% @doc Encode SET_MAG_OFFSETS message to binary
-spec encode_set_mag_offsets(#set_mag_offsets{}) -> binary().
encode_set_mag_offsets(#set_mag_offsets{
    target_system = TargetSystem,
    target_component = TargetComponent,
    mag_ofs_x = MagOfsX,
    mag_ofs_y = MagOfsY,
    mag_ofs_z = MagOfsZ
}) ->
    <<?SET_MAG_OFFSETS_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      MagOfsX:16/little-signed-integer,
      MagOfsY:16/little-signed-integer,
      MagOfsZ:16/little-signed-integer>>.

%% @doc Decode SET_MAG_OFFSETS message from binary
-spec decode_set_mag_offsets(binary()) -> #set_mag_offsets{}.
decode_set_mag_offsets(<<?SET_MAG_OFFSETS_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   MagOfsX:16/little-signed-integer,
                   MagOfsY:16/little-signed-integer,
                   MagOfsZ:16/little-signed-integer>>) ->
    #set_mag_offsets{
        target_system = TargetSystem,
        target_component = TargetComponent,
        mag_ofs_x = MagOfsX,
        mag_ofs_y = MagOfsY,
        mag_ofs_z = MagOfsZ
    }.

%% @doc Encode MEMINFO message to binary
-spec encode_meminfo(#meminfo{}) -> binary().
encode_meminfo(#meminfo{
    brkval = Brkval,
    freemem = Freemem,
    freemem32 = Freemem32
}) ->
    <<?MEMINFO_ID:8,
      Brkval:16/little-unsigned-integer,
      Freemem:16/little-unsigned-integer,
      Freemem32:32/little-unsigned-integer>>.

%% @doc Decode MEMINFO message from binary
-spec decode_meminfo(binary()) -> #meminfo{}.
decode_meminfo(<<?MEMINFO_ID:8,
                   Brkval:16/little-unsigned-integer,
                   Freemem:16/little-unsigned-integer,
                   Freemem32:32/little-unsigned-integer>>) ->
    #meminfo{
        brkval = Brkval,
        freemem = Freemem,
        freemem32 = Freemem32
    }.

%% @doc Encode AP_ADC message to binary
-spec encode_ap_adc(#ap_adc{}) -> binary().
encode_ap_adc(#ap_adc{
    adc1 = Adc1,
    adc2 = Adc2,
    adc3 = Adc3,
    adc4 = Adc4,
    adc5 = Adc5,
    adc6 = Adc6
}) ->
    <<?AP_ADC_ID:8,
      Adc1:16/little-unsigned-integer,
      Adc2:16/little-unsigned-integer,
      Adc3:16/little-unsigned-integer,
      Adc4:16/little-unsigned-integer,
      Adc5:16/little-unsigned-integer,
      Adc6:16/little-unsigned-integer>>.

%% @doc Decode AP_ADC message from binary
-spec decode_ap_adc(binary()) -> #ap_adc{}.
decode_ap_adc(<<?AP_ADC_ID:8,
                   Adc1:16/little-unsigned-integer,
                   Adc2:16/little-unsigned-integer,
                   Adc3:16/little-unsigned-integer,
                   Adc4:16/little-unsigned-integer,
                   Adc5:16/little-unsigned-integer,
                   Adc6:16/little-unsigned-integer>>) ->
    #ap_adc{
        adc1 = Adc1,
        adc2 = Adc2,
        adc3 = Adc3,
        adc4 = Adc4,
        adc5 = Adc5,
        adc6 = Adc6
    }.

%% @doc Encode DIGICAM_CONFIGURE message to binary
-spec encode_digicam_configure(#digicam_configure{}) -> binary().
encode_digicam_configure(#digicam_configure{
    target_system = TargetSystem,
    target_component = TargetComponent,
    mode = Mode,
    shutter_speed = ShutterSpeed,
    aperture = Aperture,
    iso = Iso,
    exposure_type = ExposureType,
    command_id = CommandId,
    engine_cut_off = EngineCutOff,
    extra_param = ExtraParam,
    extra_value = ExtraValue
}) ->
    <<?DIGICAM_CONFIGURE_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Mode:8/little-unsigned-integer,
      ShutterSpeed:16/little-unsigned-integer,
      Aperture:8/little-unsigned-integer,
      Iso:8/little-unsigned-integer,
      ExposureType:8/little-unsigned-integer,
      CommandId:8/little-unsigned-integer,
      EngineCutOff:8/little-unsigned-integer,
      ExtraParam:8/little-unsigned-integer,
      ExtraValue:32/little-float>>.

%% @doc Decode DIGICAM_CONFIGURE message from binary
-spec decode_digicam_configure(binary()) -> #digicam_configure{}.
decode_digicam_configure(<<?DIGICAM_CONFIGURE_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Mode:8/little-unsigned-integer,
                   ShutterSpeed:16/little-unsigned-integer,
                   Aperture:8/little-unsigned-integer,
                   Iso:8/little-unsigned-integer,
                   ExposureType:8/little-unsigned-integer,
                   CommandId:8/little-unsigned-integer,
                   EngineCutOff:8/little-unsigned-integer,
                   ExtraParam:8/little-unsigned-integer,
                   ExtraValue:32/little-float>>) ->
    #digicam_configure{
        target_system = TargetSystem,
        target_component = TargetComponent,
        mode = Mode,
        shutter_speed = ShutterSpeed,
        aperture = Aperture,
        iso = Iso,
        exposure_type = ExposureType,
        command_id = CommandId,
        engine_cut_off = EngineCutOff,
        extra_param = ExtraParam,
        extra_value = ExtraValue
    }.

%% @doc Encode DIGICAM_CONTROL message to binary
-spec encode_digicam_control(#digicam_control{}) -> binary().
encode_digicam_control(#digicam_control{
    target_system = TargetSystem,
    target_component = TargetComponent,
    session = Session,
    zoom_pos = ZoomPos,
    zoom_step = ZoomStep,
    focus_lock = FocusLock,
    shot = Shot,
    command_id = CommandId,
    extra_param = ExtraParam,
    extra_value = ExtraValue
}) ->
    <<?DIGICAM_CONTROL_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Session:8/little-unsigned-integer,
      ZoomPos:8/little-unsigned-integer,
      ZoomStep:8/little-signed-integer,
      FocusLock:8/little-unsigned-integer,
      Shot:8/little-unsigned-integer,
      CommandId:8/little-unsigned-integer,
      ExtraParam:8/little-unsigned-integer,
      ExtraValue:32/little-float>>.

%% @doc Decode DIGICAM_CONTROL message from binary
-spec decode_digicam_control(binary()) -> #digicam_control{}.
decode_digicam_control(<<?DIGICAM_CONTROL_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Session:8/little-unsigned-integer,
                   ZoomPos:8/little-unsigned-integer,
                   ZoomStep:8/little-signed-integer,
                   FocusLock:8/little-unsigned-integer,
                   Shot:8/little-unsigned-integer,
                   CommandId:8/little-unsigned-integer,
                   ExtraParam:8/little-unsigned-integer,
                   ExtraValue:32/little-float>>) ->
    #digicam_control{
        target_system = TargetSystem,
        target_component = TargetComponent,
        session = Session,
        zoom_pos = ZoomPos,
        zoom_step = ZoomStep,
        focus_lock = FocusLock,
        shot = Shot,
        command_id = CommandId,
        extra_param = ExtraParam,
        extra_value = ExtraValue
    }.

%% @doc Encode MOUNT_CONFIGURE message to binary
-spec encode_mount_configure(#mount_configure{}) -> binary().
encode_mount_configure(#mount_configure{
    target_system = TargetSystem,
    target_component = TargetComponent,
    mount_mode = MountMode,
    stab_roll = StabRoll,
    stab_pitch = StabPitch,
    stab_yaw = StabYaw
}) ->
    <<?MOUNT_CONFIGURE_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      MountMode:8/little-unsigned-integer,
      StabRoll:8/little-unsigned-integer,
      StabPitch:8/little-unsigned-integer,
      StabYaw:8/little-unsigned-integer>>.

%% @doc Decode MOUNT_CONFIGURE message from binary
-spec decode_mount_configure(binary()) -> #mount_configure{}.
decode_mount_configure(<<?MOUNT_CONFIGURE_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   MountMode:8/little-unsigned-integer,
                   StabRoll:8/little-unsigned-integer,
                   StabPitch:8/little-unsigned-integer,
                   StabYaw:8/little-unsigned-integer>>) ->
    #mount_configure{
        target_system = TargetSystem,
        target_component = TargetComponent,
        mount_mode = MountMode,
        stab_roll = StabRoll,
        stab_pitch = StabPitch,
        stab_yaw = StabYaw
    }.

%% @doc Encode MOUNT_CONTROL message to binary
-spec encode_mount_control(#mount_control{}) -> binary().
encode_mount_control(#mount_control{
    target_system = TargetSystem,
    target_component = TargetComponent,
    input_a = InputA,
    input_b = InputB,
    input_c = InputC,
    save_position = SavePosition
}) ->
    <<?MOUNT_CONTROL_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      InputA:32/little-signed-integer,
      InputB:32/little-signed-integer,
      InputC:32/little-signed-integer,
      SavePosition:8/little-unsigned-integer>>.

%% @doc Decode MOUNT_CONTROL message from binary
-spec decode_mount_control(binary()) -> #mount_control{}.
decode_mount_control(<<?MOUNT_CONTROL_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   InputA:32/little-signed-integer,
                   InputB:32/little-signed-integer,
                   InputC:32/little-signed-integer,
                   SavePosition:8/little-unsigned-integer>>) ->
    #mount_control{
        target_system = TargetSystem,
        target_component = TargetComponent,
        input_a = InputA,
        input_b = InputB,
        input_c = InputC,
        save_position = SavePosition
    }.

%% @doc Encode MOUNT_STATUS message to binary
-spec encode_mount_status(#mount_status{}) -> binary().
encode_mount_status(#mount_status{
    target_system = TargetSystem,
    target_component = TargetComponent,
    pointing_a = PointingA,
    pointing_b = PointingB,
    pointing_c = PointingC,
    mount_mode = MountMode
}) ->
    <<?MOUNT_STATUS_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      PointingA:32/little-signed-integer,
      PointingB:32/little-signed-integer,
      PointingC:32/little-signed-integer,
      MountMode:8/little-unsigned-integer>>.

%% @doc Decode MOUNT_STATUS message from binary
-spec decode_mount_status(binary()) -> #mount_status{}.
decode_mount_status(<<?MOUNT_STATUS_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   PointingA:32/little-signed-integer,
                   PointingB:32/little-signed-integer,
                   PointingC:32/little-signed-integer,
                   MountMode:8/little-unsigned-integer>>) ->
    #mount_status{
        target_system = TargetSystem,
        target_component = TargetComponent,
        pointing_a = PointingA,
        pointing_b = PointingB,
        pointing_c = PointingC,
        mount_mode = MountMode
    }.

%% @doc Encode FENCE_POINT message to binary
-spec encode_fence_point(#fence_point{}) -> binary().
encode_fence_point(#fence_point{
    target_system = TargetSystem,
    target_component = TargetComponent,
    idx = Idx,
    count = Count,
    lat = Lat,
    lng = Lng
}) ->
    <<?FENCE_POINT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Idx:8/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      Lat:32/little-float,
      Lng:32/little-float>>.

%% @doc Decode FENCE_POINT message from binary
-spec decode_fence_point(binary()) -> #fence_point{}.
decode_fence_point(<<?FENCE_POINT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Idx:8/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   Lat:32/little-float,
                   Lng:32/little-float>>) ->
    #fence_point{
        target_system = TargetSystem,
        target_component = TargetComponent,
        idx = Idx,
        count = Count,
        lat = Lat,
        lng = Lng
    }.

%% @doc Encode FENCE_FETCH_POINT message to binary
-spec encode_fence_fetch_point(#fence_fetch_point{}) -> binary().
encode_fence_fetch_point(#fence_fetch_point{
    target_system = TargetSystem,
    target_component = TargetComponent,
    idx = Idx
}) ->
    <<?FENCE_FETCH_POINT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Idx:8/little-unsigned-integer>>.

%% @doc Decode FENCE_FETCH_POINT message from binary
-spec decode_fence_fetch_point(binary()) -> #fence_fetch_point{}.
decode_fence_fetch_point(<<?FENCE_FETCH_POINT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Idx:8/little-unsigned-integer>>) ->
    #fence_fetch_point{
        target_system = TargetSystem,
        target_component = TargetComponent,
        idx = Idx
    }.

%% @doc Encode AHRS message to binary
-spec encode_ahrs(#ahrs{}) -> binary().
encode_ahrs(#ahrs{
    omegaix = Omegaix,
    omegaiy = Omegaiy,
    omegaiz = Omegaiz,
    accel_weight = AccelWeight,
    renorm_val = RenormVal,
    error_rp = ErrorRp,
    error_yaw = ErrorYaw
}) ->
    <<?AHRS_ID:8,
      Omegaix:32/little-float,
      Omegaiy:32/little-float,
      Omegaiz:32/little-float,
      AccelWeight:32/little-float,
      RenormVal:32/little-float,
      ErrorRp:32/little-float,
      ErrorYaw:32/little-float>>.

%% @doc Decode AHRS message from binary
-spec decode_ahrs(binary()) -> #ahrs{}.
decode_ahrs(<<?AHRS_ID:8,
                   Omegaix:32/little-float,
                   Omegaiy:32/little-float,
                   Omegaiz:32/little-float,
                   AccelWeight:32/little-float,
                   RenormVal:32/little-float,
                   ErrorRp:32/little-float,
                   ErrorYaw:32/little-float>>) ->
    #ahrs{
        omegaix = Omegaix,
        omegaiy = Omegaiy,
        omegaiz = Omegaiz,
        accel_weight = AccelWeight,
        renorm_val = RenormVal,
        error_rp = ErrorRp,
        error_yaw = ErrorYaw
    }.

%% @doc Encode SIMSTATE message to binary
-spec encode_simstate(#simstate{}) -> binary().
encode_simstate(#simstate{
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
    lng = Lng
}) ->
    <<?SIMSTATE_ID:8,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Xacc:32/little-float,
      Yacc:32/little-float,
      Zacc:32/little-float,
      Xgyro:32/little-float,
      Ygyro:32/little-float,
      Zgyro:32/little-float,
      Lat:32/little-signed-integer,
      Lng:32/little-signed-integer>>.

%% @doc Decode SIMSTATE message from binary
-spec decode_simstate(binary()) -> #simstate{}.
decode_simstate(<<?SIMSTATE_ID:8,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   Xacc:32/little-float,
                   Yacc:32/little-float,
                   Zacc:32/little-float,
                   Xgyro:32/little-float,
                   Ygyro:32/little-float,
                   Zgyro:32/little-float,
                   Lat:32/little-signed-integer,
                   Lng:32/little-signed-integer>>) ->
    #simstate{
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
        lng = Lng
    }.

%% @doc Encode HWSTATUS message to binary
-spec encode_hwstatus(#hwstatus{}) -> binary().
encode_hwstatus(#hwstatus{
    vcc = Vcc,
    i2cerr = I2cerr
}) ->
    <<?HWSTATUS_ID:8,
      Vcc:16/little-unsigned-integer,
      I2cerr:8/little-unsigned-integer>>.

%% @doc Decode HWSTATUS message from binary
-spec decode_hwstatus(binary()) -> #hwstatus{}.
decode_hwstatus(<<?HWSTATUS_ID:8,
                   Vcc:16/little-unsigned-integer,
                   I2cerr:8/little-unsigned-integer>>) ->
    #hwstatus{
        vcc = Vcc,
        i2cerr = I2cerr
    }.

%% @doc Encode RADIO message to binary
-spec encode_radio(#radio{}) -> binary().
encode_radio(#radio{
    rssi = Rssi,
    remrssi = Remrssi,
    txbuf = Txbuf,
    noise = Noise,
    remnoise = Remnoise,
    rxerrors = Rxerrors,
    fixed = Fixed
}) ->
    <<?RADIO_ID:8,
      Rssi:8/little-unsigned-integer,
      Remrssi:8/little-unsigned-integer,
      Txbuf:8/little-unsigned-integer,
      Noise:8/little-unsigned-integer,
      Remnoise:8/little-unsigned-integer,
      Rxerrors:16/little-unsigned-integer,
      Fixed:16/little-unsigned-integer>>.

%% @doc Decode RADIO message from binary
-spec decode_radio(binary()) -> #radio{}.
decode_radio(<<?RADIO_ID:8,
                   Rssi:8/little-unsigned-integer,
                   Remrssi:8/little-unsigned-integer,
                   Txbuf:8/little-unsigned-integer,
                   Noise:8/little-unsigned-integer,
                   Remnoise:8/little-unsigned-integer,
                   Rxerrors:16/little-unsigned-integer,
                   Fixed:16/little-unsigned-integer>>) ->
    #radio{
        rssi = Rssi,
        remrssi = Remrssi,
        txbuf = Txbuf,
        noise = Noise,
        remnoise = Remnoise,
        rxerrors = Rxerrors,
        fixed = Fixed
    }.

%% @doc Encode LIMITS_STATUS message to binary
-spec encode_limits_status(#limits_status{}) -> binary().
encode_limits_status(#limits_status{
    limits_state = LimitsState,
    last_trigger = LastTrigger,
    last_action = LastAction,
    last_recovery = LastRecovery,
    last_clear = LastClear,
    breach_count = BreachCount,
    mods_enabled = ModsEnabled,
    mods_required = ModsRequired,
    mods_triggered = ModsTriggered
}) ->
    <<?LIMITS_STATUS_ID:8,
      LimitsState:8/little-unsigned-integer,
      LastTrigger:32/little-unsigned-integer,
      LastAction:32/little-unsigned-integer,
      LastRecovery:32/little-unsigned-integer,
      LastClear:32/little-unsigned-integer,
      BreachCount:16/little-unsigned-integer,
      ModsEnabled:8/little-unsigned-integer,
      ModsRequired:8/little-unsigned-integer,
      ModsTriggered:8/little-unsigned-integer>>.

%% @doc Decode LIMITS_STATUS message from binary
-spec decode_limits_status(binary()) -> #limits_status{}.
decode_limits_status(<<?LIMITS_STATUS_ID:8,
                   LimitsState:8/little-unsigned-integer,
                   LastTrigger:32/little-unsigned-integer,
                   LastAction:32/little-unsigned-integer,
                   LastRecovery:32/little-unsigned-integer,
                   LastClear:32/little-unsigned-integer,
                   BreachCount:16/little-unsigned-integer,
                   ModsEnabled:8/little-unsigned-integer,
                   ModsRequired:8/little-unsigned-integer,
                   ModsTriggered:8/little-unsigned-integer>>) ->
    #limits_status{
        limits_state = LimitsState,
        last_trigger = LastTrigger,
        last_action = LastAction,
        last_recovery = LastRecovery,
        last_clear = LastClear,
        breach_count = BreachCount,
        mods_enabled = ModsEnabled,
        mods_required = ModsRequired,
        mods_triggered = ModsTriggered
    }.

%% @doc Encode WIND message to binary
-spec encode_wind(#wind{}) -> binary().
encode_wind(#wind{
    direction = Direction,
    speed = Speed,
    speed_z = SpeedZ
}) ->
    <<?WIND_ID:8,
      Direction:32/little-float,
      Speed:32/little-float,
      SpeedZ:32/little-float>>.

%% @doc Decode WIND message from binary
-spec decode_wind(binary()) -> #wind{}.
decode_wind(<<?WIND_ID:8,
                   Direction:32/little-float,
                   Speed:32/little-float,
                   SpeedZ:32/little-float>>) ->
    #wind{
        direction = Direction,
        speed = Speed,
        speed_z = SpeedZ
    }.

%% @doc Encode DATA16 message to binary
-spec encode_data16(#data16{}) -> binary().
encode_data16(#data16{
    type = Type,
    len = Len,
    data = Data
}) ->
    <<?DATA16_ID:8,
      Type:8/little-unsigned-integer,
      Len:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode DATA16 message from binary
-spec decode_data16(binary()) -> #data16{}.
decode_data16(<<?DATA16_ID:8,
                   Type:8/little-unsigned-integer,
                   Len:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #data16{
        type = Type,
        len = Len,
        data = Data
    }.

%% @doc Encode DATA32 message to binary
-spec encode_data32(#data32{}) -> binary().
encode_data32(#data32{
    type = Type,
    len = Len,
    data = Data
}) ->
    <<?DATA32_ID:8,
      Type:8/little-unsigned-integer,
      Len:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode DATA32 message from binary
-spec decode_data32(binary()) -> #data32{}.
decode_data32(<<?DATA32_ID:8,
                   Type:8/little-unsigned-integer,
                   Len:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #data32{
        type = Type,
        len = Len,
        data = Data
    }.

%% @doc Encode DATA64 message to binary
-spec encode_data64(#data64{}) -> binary().
encode_data64(#data64{
    type = Type,
    len = Len,
    data = Data
}) ->
    <<?DATA64_ID:8,
      Type:8/little-unsigned-integer,
      Len:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode DATA64 message from binary
-spec decode_data64(binary()) -> #data64{}.
decode_data64(<<?DATA64_ID:8,
                   Type:8/little-unsigned-integer,
                   Len:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #data64{
        type = Type,
        len = Len,
        data = Data
    }.

%% @doc Encode DATA96 message to binary
-spec encode_data96(#data96{}) -> binary().
encode_data96(#data96{
    type = Type,
    len = Len,
    data = Data
}) ->
    <<?DATA96_ID:8,
      Type:8/little-unsigned-integer,
      Len:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode DATA96 message from binary
-spec decode_data96(binary()) -> #data96{}.
decode_data96(<<?DATA96_ID:8,
                   Type:8/little-unsigned-integer,
                   Len:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #data96{
        type = Type,
        len = Len,
        data = Data
    }.

%% @doc Encode RANGEFINDER message to binary
-spec encode_rangefinder(#rangefinder{}) -> binary().
encode_rangefinder(#rangefinder{
    distance = Distance,
    voltage = Voltage
}) ->
    <<?RANGEFINDER_ID:8,
      Distance:32/little-float,
      Voltage:32/little-float>>.

%% @doc Decode RANGEFINDER message from binary
-spec decode_rangefinder(binary()) -> #rangefinder{}.
decode_rangefinder(<<?RANGEFINDER_ID:8,
                   Distance:32/little-float,
                   Voltage:32/little-float>>) ->
    #rangefinder{
        distance = Distance,
        voltage = Voltage
    }.

%% @doc Encode AIRSPEED_AUTOCAL message to binary
-spec encode_airspeed_autocal(#airspeed_autocal{}) -> binary().
encode_airspeed_autocal(#airspeed_autocal{
    vx = Vx,
    vy = Vy,
    vz = Vz,
    diff_pressure = DiffPressure,
    eas2tas = Eas2tas,
    ratio = Ratio,
    state_x = StateX,
    state_y = StateY,
    state_z = StateZ,
    pax = Pax,
    pby = Pby,
    pcz = Pcz
}) ->
    <<?AIRSPEED_AUTOCAL_ID:8,
      Vx:32/little-float,
      Vy:32/little-float,
      Vz:32/little-float,
      DiffPressure:32/little-float,
      Eas2tas:32/little-float,
      Ratio:32/little-float,
      StateX:32/little-float,
      StateY:32/little-float,
      StateZ:32/little-float,
      Pax:32/little-float,
      Pby:32/little-float,
      Pcz:32/little-float>>.

%% @doc Decode AIRSPEED_AUTOCAL message from binary
-spec decode_airspeed_autocal(binary()) -> #airspeed_autocal{}.
decode_airspeed_autocal(<<?AIRSPEED_AUTOCAL_ID:8,
                   Vx:32/little-float,
                   Vy:32/little-float,
                   Vz:32/little-float,
                   DiffPressure:32/little-float,
                   Eas2tas:32/little-float,
                   Ratio:32/little-float,
                   StateX:32/little-float,
                   StateY:32/little-float,
                   StateZ:32/little-float,
                   Pax:32/little-float,
                   Pby:32/little-float,
                   Pcz:32/little-float>>) ->
    #airspeed_autocal{
        vx = Vx,
        vy = Vy,
        vz = Vz,
        diff_pressure = DiffPressure,
        eas2tas = Eas2tas,
        ratio = Ratio,
        state_x = StateX,
        state_y = StateY,
        state_z = StateZ,
        pax = Pax,
        pby = Pby,
        pcz = Pcz
    }.

%% @doc Encode RALLY_POINT message to binary
-spec encode_rally_point(#rally_point{}) -> binary().
encode_rally_point(#rally_point{
    target_system = TargetSystem,
    target_component = TargetComponent,
    idx = Idx,
    count = Count,
    lat = Lat,
    lng = Lng,
    alt = Alt,
    break_alt = BreakAlt,
    land_dir = LandDir,
    flags = Flags
}) ->
    <<?RALLY_POINT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Idx:8/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lng:32/little-signed-integer,
      Alt:16/little-signed-integer,
      BreakAlt:16/little-signed-integer,
      LandDir:16/little-unsigned-integer,
      Flags:8/little-unsigned-integer>>.

%% @doc Decode RALLY_POINT message from binary
-spec decode_rally_point(binary()) -> #rally_point{}.
decode_rally_point(<<?RALLY_POINT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Idx:8/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lng:32/little-signed-integer,
                   Alt:16/little-signed-integer,
                   BreakAlt:16/little-signed-integer,
                   LandDir:16/little-unsigned-integer,
                   Flags:8/little-unsigned-integer>>) ->
    #rally_point{
        target_system = TargetSystem,
        target_component = TargetComponent,
        idx = Idx,
        count = Count,
        lat = Lat,
        lng = Lng,
        alt = Alt,
        break_alt = BreakAlt,
        land_dir = LandDir,
        flags = Flags
    }.

%% @doc Encode RALLY_FETCH_POINT message to binary
-spec encode_rally_fetch_point(#rally_fetch_point{}) -> binary().
encode_rally_fetch_point(#rally_fetch_point{
    target_system = TargetSystem,
    target_component = TargetComponent,
    idx = Idx
}) ->
    <<?RALLY_FETCH_POINT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Idx:8/little-unsigned-integer>>.

%% @doc Decode RALLY_FETCH_POINT message from binary
-spec decode_rally_fetch_point(binary()) -> #rally_fetch_point{}.
decode_rally_fetch_point(<<?RALLY_FETCH_POINT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Idx:8/little-unsigned-integer>>) ->
    #rally_fetch_point{
        target_system = TargetSystem,
        target_component = TargetComponent,
        idx = Idx
    }.

%% @doc Encode COMPASSMOT_STATUS message to binary
-spec encode_compassmot_status(#compassmot_status{}) -> binary().
encode_compassmot_status(#compassmot_status{
    throttle = Throttle,
    current = Current,
    interference = Interference,
    compensationx = Compensationx,
    compensationy = Compensationy,
    compensationz = Compensationz
}) ->
    <<?COMPASSMOT_STATUS_ID:8,
      Throttle:16/little-unsigned-integer,
      Current:32/little-float,
      Interference:16/little-unsigned-integer,
      Compensationx:32/little-float,
      Compensationy:32/little-float,
      Compensationz:32/little-float>>.

%% @doc Decode COMPASSMOT_STATUS message from binary
-spec decode_compassmot_status(binary()) -> #compassmot_status{}.
decode_compassmot_status(<<?COMPASSMOT_STATUS_ID:8,
                   Throttle:16/little-unsigned-integer,
                   Current:32/little-float,
                   Interference:16/little-unsigned-integer,
                   Compensationx:32/little-float,
                   Compensationy:32/little-float,
                   Compensationz:32/little-float>>) ->
    #compassmot_status{
        throttle = Throttle,
        current = Current,
        interference = Interference,
        compensationx = Compensationx,
        compensationy = Compensationy,
        compensationz = Compensationz
    }.

%% @doc Encode AHRS2 message to binary
-spec encode_ahrs2(#ahrs2{}) -> binary().
encode_ahrs2(#ahrs2{
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    altitude = Altitude,
    lat = Lat,
    lng = Lng
}) ->
    <<?AHRS2_ID:8,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Altitude:32/little-float,
      Lat:32/little-signed-integer,
      Lng:32/little-signed-integer>>.

%% @doc Decode AHRS2 message from binary
-spec decode_ahrs2(binary()) -> #ahrs2{}.
decode_ahrs2(<<?AHRS2_ID:8,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   Altitude:32/little-float,
                   Lat:32/little-signed-integer,
                   Lng:32/little-signed-integer>>) ->
    #ahrs2{
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        altitude = Altitude,
        lat = Lat,
        lng = Lng
    }.

%% @doc Encode CAMERA_STATUS message to binary
-spec encode_camera_status(#camera_status{}) -> binary().
encode_camera_status(#camera_status{
    time_usec = TimeUsec,
    target_system = TargetSystem,
    cam_idx = CamIdx,
    img_idx = ImgIdx,
    event_id = EventId,
    p1 = P1,
    p2 = P2,
    p3 = P3,
    p4 = P4
}) ->
    <<?CAMERA_STATUS_ID:8,
      TimeUsec:64/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      CamIdx:8/little-unsigned-integer,
      ImgIdx:16/little-unsigned-integer,
      EventId:8/little-unsigned-integer,
      P1:32/little-float,
      P2:32/little-float,
      P3:32/little-float,
      P4:32/little-float>>.

%% @doc Decode CAMERA_STATUS message from binary
-spec decode_camera_status(binary()) -> #camera_status{}.
decode_camera_status(<<?CAMERA_STATUS_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   CamIdx:8/little-unsigned-integer,
                   ImgIdx:16/little-unsigned-integer,
                   EventId:8/little-unsigned-integer,
                   P1:32/little-float,
                   P2:32/little-float,
                   P3:32/little-float,
                   P4:32/little-float>>) ->
    #camera_status{
        time_usec = TimeUsec,
        target_system = TargetSystem,
        cam_idx = CamIdx,
        img_idx = ImgIdx,
        event_id = EventId,
        p1 = P1,
        p2 = P2,
        p3 = P3,
        p4 = P4
    }.

%% @doc Encode CAMERA_FEEDBACK message to binary
-spec encode_camera_feedback(#camera_feedback{}) -> binary().
encode_camera_feedback(#camera_feedback{
    time_usec = TimeUsec,
    target_system = TargetSystem,
    cam_idx = CamIdx,
    img_idx = ImgIdx,
    lat = Lat,
    lng = Lng,
    alt_msl = AltMsl,
    alt_rel = AltRel,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    foc_len = FocLen,
    flags = Flags,
    completed_captures = CompletedCaptures
}) ->
    <<?CAMERA_FEEDBACK_ID:8,
      TimeUsec:64/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      CamIdx:8/little-unsigned-integer,
      ImgIdx:16/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lng:32/little-signed-integer,
      AltMsl:32/little-float,
      AltRel:32/little-float,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      FocLen:32/little-float,
      Flags:8/little-unsigned-integer,
      CompletedCaptures:16/little-unsigned-integer>>.

%% @doc Decode CAMERA_FEEDBACK message from binary
-spec decode_camera_feedback(binary()) -> #camera_feedback{}.
decode_camera_feedback(<<?CAMERA_FEEDBACK_ID:8,
                   TimeUsec:64/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   CamIdx:8/little-unsigned-integer,
                   ImgIdx:16/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lng:32/little-signed-integer,
                   AltMsl:32/little-float,
                   AltRel:32/little-float,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   FocLen:32/little-float,
                   Flags:8/little-unsigned-integer,
                   CompletedCaptures:16/little-unsigned-integer>>) ->
    #camera_feedback{
        time_usec = TimeUsec,
        target_system = TargetSystem,
        cam_idx = CamIdx,
        img_idx = ImgIdx,
        lat = Lat,
        lng = Lng,
        alt_msl = AltMsl,
        alt_rel = AltRel,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        foc_len = FocLen,
        flags = Flags,
        completed_captures = CompletedCaptures
    }.

%% @doc Encode BATTERY2 message to binary
-spec encode_battery2(#battery2{}) -> binary().
encode_battery2(#battery2{
    voltage = Voltage,
    current_battery = CurrentBattery
}) ->
    <<?BATTERY2_ID:8,
      Voltage:16/little-unsigned-integer,
      CurrentBattery:16/little-signed-integer>>.

%% @doc Decode BATTERY2 message from binary
-spec decode_battery2(binary()) -> #battery2{}.
decode_battery2(<<?BATTERY2_ID:8,
                   Voltage:16/little-unsigned-integer,
                   CurrentBattery:16/little-signed-integer>>) ->
    #battery2{
        voltage = Voltage,
        current_battery = CurrentBattery
    }.

%% @doc Encode AHRS3 message to binary
-spec encode_ahrs3(#ahrs3{}) -> binary().
encode_ahrs3(#ahrs3{
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    altitude = Altitude,
    lat = Lat,
    lng = Lng,
    v1 = V1,
    v2 = V2,
    v3 = V3,
    v4 = V4
}) ->
    <<?AHRS3_ID:8,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Altitude:32/little-float,
      Lat:32/little-signed-integer,
      Lng:32/little-signed-integer,
      V1:32/little-float,
      V2:32/little-float,
      V3:32/little-float,
      V4:32/little-float>>.

%% @doc Decode AHRS3 message from binary
-spec decode_ahrs3(binary()) -> #ahrs3{}.
decode_ahrs3(<<?AHRS3_ID:8,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   Altitude:32/little-float,
                   Lat:32/little-signed-integer,
                   Lng:32/little-signed-integer,
                   V1:32/little-float,
                   V2:32/little-float,
                   V3:32/little-float,
                   V4:32/little-float>>) ->
    #ahrs3{
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        altitude = Altitude,
        lat = Lat,
        lng = Lng,
        v1 = V1,
        v2 = V2,
        v3 = V3,
        v4 = V4
    }.

%% @doc Encode AUTOPILOT_VERSION_REQUEST message to binary
-spec encode_autopilot_version_request(#autopilot_version_request{}) -> binary().
encode_autopilot_version_request(#autopilot_version_request{
    target_system = TargetSystem,
    target_component = TargetComponent
}) ->
    <<?AUTOPILOT_VERSION_REQUEST_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer>>.

%% @doc Decode AUTOPILOT_VERSION_REQUEST message from binary
-spec decode_autopilot_version_request(binary()) -> #autopilot_version_request{}.
decode_autopilot_version_request(<<?AUTOPILOT_VERSION_REQUEST_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer>>) ->
    #autopilot_version_request{
        target_system = TargetSystem,
        target_component = TargetComponent
    }.

%% @doc Encode REMOTE_LOG_DATA_BLOCK message to binary
-spec encode_remote_log_data_block(#remote_log_data_block{}) -> binary().
encode_remote_log_data_block(#remote_log_data_block{
    target_system = TargetSystem,
    target_component = TargetComponent,
    seqno = Seqno,
    data = Data
}) ->
    <<?REMOTE_LOG_DATA_BLOCK_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Seqno:32/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode REMOTE_LOG_DATA_BLOCK message from binary
-spec decode_remote_log_data_block(binary()) -> #remote_log_data_block{}.
decode_remote_log_data_block(<<?REMOTE_LOG_DATA_BLOCK_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Seqno:32/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #remote_log_data_block{
        target_system = TargetSystem,
        target_component = TargetComponent,
        seqno = Seqno,
        data = Data
    }.

%% @doc Encode REMOTE_LOG_BLOCK_STATUS message to binary
-spec encode_remote_log_block_status(#remote_log_block_status{}) -> binary().
encode_remote_log_block_status(#remote_log_block_status{
    target_system = TargetSystem,
    target_component = TargetComponent,
    seqno = Seqno,
    status = Status
}) ->
    <<?REMOTE_LOG_BLOCK_STATUS_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Seqno:32/little-unsigned-integer,
      Status:8/little-unsigned-integer>>.

%% @doc Decode REMOTE_LOG_BLOCK_STATUS message from binary
-spec decode_remote_log_block_status(binary()) -> #remote_log_block_status{}.
decode_remote_log_block_status(<<?REMOTE_LOG_BLOCK_STATUS_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Seqno:32/little-unsigned-integer,
                   Status:8/little-unsigned-integer>>) ->
    #remote_log_block_status{
        target_system = TargetSystem,
        target_component = TargetComponent,
        seqno = Seqno,
        status = Status
    }.

%% @doc Encode LED_CONTROL message to binary
-spec encode_led_control(#led_control{}) -> binary().
encode_led_control(#led_control{
    target_system = TargetSystem,
    target_component = TargetComponent,
    instance = Instance,
    pattern = Pattern,
    custom_len = CustomLen,
    custom_bytes = CustomBytes
}) ->
    <<?LED_CONTROL_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Instance:8/little-unsigned-integer,
      Pattern:8/little-unsigned-integer,
      CustomLen:8/little-unsigned-integer,
      CustomBytes:8/little-unsigned-integer>>.

%% @doc Decode LED_CONTROL message from binary
-spec decode_led_control(binary()) -> #led_control{}.
decode_led_control(<<?LED_CONTROL_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Instance:8/little-unsigned-integer,
                   Pattern:8/little-unsigned-integer,
                   CustomLen:8/little-unsigned-integer,
                   CustomBytes:8/little-unsigned-integer>>) ->
    #led_control{
        target_system = TargetSystem,
        target_component = TargetComponent,
        instance = Instance,
        pattern = Pattern,
        custom_len = CustomLen,
        custom_bytes = CustomBytes
    }.

%% @doc Encode MAG_CAL_PROGRESS message to binary
-spec encode_mag_cal_progress(#mag_cal_progress{}) -> binary().
encode_mag_cal_progress(#mag_cal_progress{
    compass_id = CompassId,
    cal_mask = CalMask,
    cal_status = CalStatus,
    attempt = Attempt,
    completion_pct = CompletionPct,
    completion_mask = CompletionMask,
    direction_x = DirectionX,
    direction_y = DirectionY,
    direction_z = DirectionZ
}) ->
    <<?MAG_CAL_PROGRESS_ID:8,
      CompassId:8/little-unsigned-integer,
      CalMask:8/little-unsigned-integer,
      CalStatus:8/little-unsigned-integer,
      Attempt:8/little-unsigned-integer,
      CompletionPct:8/little-unsigned-integer,
      CompletionMask:8/little-unsigned-integer,
      DirectionX:32/little-float,
      DirectionY:32/little-float,
      DirectionZ:32/little-float>>.

%% @doc Decode MAG_CAL_PROGRESS message from binary
-spec decode_mag_cal_progress(binary()) -> #mag_cal_progress{}.
decode_mag_cal_progress(<<?MAG_CAL_PROGRESS_ID:8,
                   CompassId:8/little-unsigned-integer,
                   CalMask:8/little-unsigned-integer,
                   CalStatus:8/little-unsigned-integer,
                   Attempt:8/little-unsigned-integer,
                   CompletionPct:8/little-unsigned-integer,
                   CompletionMask:8/little-unsigned-integer,
                   DirectionX:32/little-float,
                   DirectionY:32/little-float,
                   DirectionZ:32/little-float>>) ->
    #mag_cal_progress{
        compass_id = CompassId,
        cal_mask = CalMask,
        cal_status = CalStatus,
        attempt = Attempt,
        completion_pct = CompletionPct,
        completion_mask = CompletionMask,
        direction_x = DirectionX,
        direction_y = DirectionY,
        direction_z = DirectionZ
    }.

%% @doc Encode EKF_STATUS_REPORT message to binary
-spec encode_ekf_status_report(#ekf_status_report{}) -> binary().
encode_ekf_status_report(#ekf_status_report{
    flags = Flags,
    velocity_variance = VelocityVariance,
    pos_horiz_variance = PosHorizVariance,
    pos_vert_variance = PosVertVariance,
    compass_variance = CompassVariance,
    terrain_alt_variance = TerrainAltVariance,
    airspeed_variance = AirspeedVariance
}) ->
    <<?EKF_STATUS_REPORT_ID:8,
      Flags:16/little-unsigned-integer,
      VelocityVariance:32/little-float,
      PosHorizVariance:32/little-float,
      PosVertVariance:32/little-float,
      CompassVariance:32/little-float,
      TerrainAltVariance:32/little-float,
      AirspeedVariance:32/little-float>>.

%% @doc Decode EKF_STATUS_REPORT message from binary
-spec decode_ekf_status_report(binary()) -> #ekf_status_report{}.
decode_ekf_status_report(<<?EKF_STATUS_REPORT_ID:8,
                   Flags:16/little-unsigned-integer,
                   VelocityVariance:32/little-float,
                   PosHorizVariance:32/little-float,
                   PosVertVariance:32/little-float,
                   CompassVariance:32/little-float,
                   TerrainAltVariance:32/little-float,
                   AirspeedVariance:32/little-float>>) ->
    #ekf_status_report{
        flags = Flags,
        velocity_variance = VelocityVariance,
        pos_horiz_variance = PosHorizVariance,
        pos_vert_variance = PosVertVariance,
        compass_variance = CompassVariance,
        terrain_alt_variance = TerrainAltVariance,
        airspeed_variance = AirspeedVariance
    }.

%% @doc Encode PID_TUNING message to binary
-spec encode_pid_tuning(#pid_tuning{}) -> binary().
encode_pid_tuning(#pid_tuning{
    axis = Axis,
    desired = Desired,
    achieved = Achieved,
    ff = Ff,
    p = P,
    i = I,
    d = D,
    srate = Srate,
    pdmod = Pdmod
}) ->
    <<?PID_TUNING_ID:8,
      Axis:8/little-unsigned-integer,
      Desired:32/little-float,
      Achieved:32/little-float,
      Ff:32/little-float,
      P:32/little-float,
      I:32/little-float,
      D:32/little-float,
      Srate:32/little-float,
      Pdmod:32/little-float>>.

%% @doc Decode PID_TUNING message from binary
-spec decode_pid_tuning(binary()) -> #pid_tuning{}.
decode_pid_tuning(<<?PID_TUNING_ID:8,
                   Axis:8/little-unsigned-integer,
                   Desired:32/little-float,
                   Achieved:32/little-float,
                   Ff:32/little-float,
                   P:32/little-float,
                   I:32/little-float,
                   D:32/little-float,
                   Srate:32/little-float,
                   Pdmod:32/little-float>>) ->
    #pid_tuning{
        axis = Axis,
        desired = Desired,
        achieved = Achieved,
        ff = Ff,
        p = P,
        i = I,
        d = D,
        srate = Srate,
        pdmod = Pdmod
    }.

%% @doc Encode DEEPSTALL message to binary
-spec encode_deepstall(#deepstall{}) -> binary().
encode_deepstall(#deepstall{
    landing_lat = LandingLat,
    landing_lon = LandingLon,
    path_lat = PathLat,
    path_lon = PathLon,
    arc_entry_lat = ArcEntryLat,
    arc_entry_lon = ArcEntryLon,
    altitude = Altitude,
    expected_travel_distance = ExpectedTravelDistance,
    cross_track_error = CrossTrackError,
    stage = Stage
}) ->
    <<?DEEPSTALL_ID:8,
      LandingLat:32/little-signed-integer,
      LandingLon:32/little-signed-integer,
      PathLat:32/little-signed-integer,
      PathLon:32/little-signed-integer,
      ArcEntryLat:32/little-signed-integer,
      ArcEntryLon:32/little-signed-integer,
      Altitude:32/little-float,
      ExpectedTravelDistance:32/little-float,
      CrossTrackError:32/little-float,
      Stage:8/little-unsigned-integer>>.

%% @doc Decode DEEPSTALL message from binary
-spec decode_deepstall(binary()) -> #deepstall{}.
decode_deepstall(<<?DEEPSTALL_ID:8,
                   LandingLat:32/little-signed-integer,
                   LandingLon:32/little-signed-integer,
                   PathLat:32/little-signed-integer,
                   PathLon:32/little-signed-integer,
                   ArcEntryLat:32/little-signed-integer,
                   ArcEntryLon:32/little-signed-integer,
                   Altitude:32/little-float,
                   ExpectedTravelDistance:32/little-float,
                   CrossTrackError:32/little-float,
                   Stage:8/little-unsigned-integer>>) ->
    #deepstall{
        landing_lat = LandingLat,
        landing_lon = LandingLon,
        path_lat = PathLat,
        path_lon = PathLon,
        arc_entry_lat = ArcEntryLat,
        arc_entry_lon = ArcEntryLon,
        altitude = Altitude,
        expected_travel_distance = ExpectedTravelDistance,
        cross_track_error = CrossTrackError,
        stage = Stage
    }.

%% @doc Encode GIMBAL_REPORT message to binary
-spec encode_gimbal_report(#gimbal_report{}) -> binary().
encode_gimbal_report(#gimbal_report{
    target_system = TargetSystem,
    target_component = TargetComponent,
    delta_time = DeltaTime,
    delta_angle_x = DeltaAngleX,
    delta_angle_y = DeltaAngleY,
    delta_angle_z = DeltaAngleZ,
    delta_velocity_x = DeltaVelocityX,
    delta_velocity_y = DeltaVelocityY,
    delta_velocity_z = DeltaVelocityZ,
    joint_roll = JointRoll,
    joint_el = JointEl,
    joint_az = JointAz
}) ->
    <<?GIMBAL_REPORT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      DeltaTime:32/little-float,
      DeltaAngleX:32/little-float,
      DeltaAngleY:32/little-float,
      DeltaAngleZ:32/little-float,
      DeltaVelocityX:32/little-float,
      DeltaVelocityY:32/little-float,
      DeltaVelocityZ:32/little-float,
      JointRoll:32/little-float,
      JointEl:32/little-float,
      JointAz:32/little-float>>.

%% @doc Decode GIMBAL_REPORT message from binary
-spec decode_gimbal_report(binary()) -> #gimbal_report{}.
decode_gimbal_report(<<?GIMBAL_REPORT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   DeltaTime:32/little-float,
                   DeltaAngleX:32/little-float,
                   DeltaAngleY:32/little-float,
                   DeltaAngleZ:32/little-float,
                   DeltaVelocityX:32/little-float,
                   DeltaVelocityY:32/little-float,
                   DeltaVelocityZ:32/little-float,
                   JointRoll:32/little-float,
                   JointEl:32/little-float,
                   JointAz:32/little-float>>) ->
    #gimbal_report{
        target_system = TargetSystem,
        target_component = TargetComponent,
        delta_time = DeltaTime,
        delta_angle_x = DeltaAngleX,
        delta_angle_y = DeltaAngleY,
        delta_angle_z = DeltaAngleZ,
        delta_velocity_x = DeltaVelocityX,
        delta_velocity_y = DeltaVelocityY,
        delta_velocity_z = DeltaVelocityZ,
        joint_roll = JointRoll,
        joint_el = JointEl,
        joint_az = JointAz
    }.

%% @doc Encode GIMBAL_CONTROL message to binary
-spec encode_gimbal_control(#gimbal_control{}) -> binary().
encode_gimbal_control(#gimbal_control{
    target_system = TargetSystem,
    target_component = TargetComponent,
    demanded_rate_x = DemandedRateX,
    demanded_rate_y = DemandedRateY,
    demanded_rate_z = DemandedRateZ
}) ->
    <<?GIMBAL_CONTROL_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      DemandedRateX:32/little-float,
      DemandedRateY:32/little-float,
      DemandedRateZ:32/little-float>>.

%% @doc Decode GIMBAL_CONTROL message from binary
-spec decode_gimbal_control(binary()) -> #gimbal_control{}.
decode_gimbal_control(<<?GIMBAL_CONTROL_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   DemandedRateX:32/little-float,
                   DemandedRateY:32/little-float,
                   DemandedRateZ:32/little-float>>) ->
    #gimbal_control{
        target_system = TargetSystem,
        target_component = TargetComponent,
        demanded_rate_x = DemandedRateX,
        demanded_rate_y = DemandedRateY,
        demanded_rate_z = DemandedRateZ
    }.

%% @doc Encode GIMBAL_TORQUE_CMD_REPORT message to binary
-spec encode_gimbal_torque_cmd_report(#gimbal_torque_cmd_report{}) -> binary().
encode_gimbal_torque_cmd_report(#gimbal_torque_cmd_report{
    target_system = TargetSystem,
    target_component = TargetComponent,
    rl_torque_cmd = RlTorqueCmd,
    el_torque_cmd = ElTorqueCmd,
    az_torque_cmd = AzTorqueCmd
}) ->
    <<?GIMBAL_TORQUE_CMD_REPORT_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      RlTorqueCmd:16/little-signed-integer,
      ElTorqueCmd:16/little-signed-integer,
      AzTorqueCmd:16/little-signed-integer>>.

%% @doc Decode GIMBAL_TORQUE_CMD_REPORT message from binary
-spec decode_gimbal_torque_cmd_report(binary()) -> #gimbal_torque_cmd_report{}.
decode_gimbal_torque_cmd_report(<<?GIMBAL_TORQUE_CMD_REPORT_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   RlTorqueCmd:16/little-signed-integer,
                   ElTorqueCmd:16/little-signed-integer,
                   AzTorqueCmd:16/little-signed-integer>>) ->
    #gimbal_torque_cmd_report{
        target_system = TargetSystem,
        target_component = TargetComponent,
        rl_torque_cmd = RlTorqueCmd,
        el_torque_cmd = ElTorqueCmd,
        az_torque_cmd = AzTorqueCmd
    }.

%% @doc Encode GOPRO_HEARTBEAT message to binary
-spec encode_gopro_heartbeat(#gopro_heartbeat{}) -> binary().
encode_gopro_heartbeat(#gopro_heartbeat{
    status = Status,
    capture_mode = CaptureMode,
    flags = Flags
}) ->
    <<?GOPRO_HEARTBEAT_ID:8,
      Status:8/little-unsigned-integer,
      CaptureMode:8/little-unsigned-integer,
      Flags:8/little-unsigned-integer>>.

%% @doc Decode GOPRO_HEARTBEAT message from binary
-spec decode_gopro_heartbeat(binary()) -> #gopro_heartbeat{}.
decode_gopro_heartbeat(<<?GOPRO_HEARTBEAT_ID:8,
                   Status:8/little-unsigned-integer,
                   CaptureMode:8/little-unsigned-integer,
                   Flags:8/little-unsigned-integer>>) ->
    #gopro_heartbeat{
        status = Status,
        capture_mode = CaptureMode,
        flags = Flags
    }.

%% @doc Encode GOPRO_GET_REQUEST message to binary
-spec encode_gopro_get_request(#gopro_get_request{}) -> binary().
encode_gopro_get_request(#gopro_get_request{
    target_system = TargetSystem,
    target_component = TargetComponent,
    cmd_id = CmdId
}) ->
    <<?GOPRO_GET_REQUEST_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      CmdId:8/little-unsigned-integer>>.

%% @doc Decode GOPRO_GET_REQUEST message from binary
-spec decode_gopro_get_request(binary()) -> #gopro_get_request{}.
decode_gopro_get_request(<<?GOPRO_GET_REQUEST_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   CmdId:8/little-unsigned-integer>>) ->
    #gopro_get_request{
        target_system = TargetSystem,
        target_component = TargetComponent,
        cmd_id = CmdId
    }.

%% @doc Encode GOPRO_GET_RESPONSE message to binary
-spec encode_gopro_get_response(#gopro_get_response{}) -> binary().
encode_gopro_get_response(#gopro_get_response{
    cmd_id = CmdId,
    status = Status,
    value = Value
}) ->
    <<?GOPRO_GET_RESPONSE_ID:8,
      CmdId:8/little-unsigned-integer,
      Status:8/little-unsigned-integer,
      Value:8/little-unsigned-integer>>.

%% @doc Decode GOPRO_GET_RESPONSE message from binary
-spec decode_gopro_get_response(binary()) -> #gopro_get_response{}.
decode_gopro_get_response(<<?GOPRO_GET_RESPONSE_ID:8,
                   CmdId:8/little-unsigned-integer,
                   Status:8/little-unsigned-integer,
                   Value:8/little-unsigned-integer>>) ->
    #gopro_get_response{
        cmd_id = CmdId,
        status = Status,
        value = Value
    }.

%% @doc Encode GOPRO_SET_REQUEST message to binary
-spec encode_gopro_set_request(#gopro_set_request{}) -> binary().
encode_gopro_set_request(#gopro_set_request{
    target_system = TargetSystem,
    target_component = TargetComponent,
    cmd_id = CmdId,
    value = Value
}) ->
    <<?GOPRO_SET_REQUEST_ID:8,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      CmdId:8/little-unsigned-integer,
      Value:8/little-unsigned-integer>>.

%% @doc Decode GOPRO_SET_REQUEST message from binary
-spec decode_gopro_set_request(binary()) -> #gopro_set_request{}.
decode_gopro_set_request(<<?GOPRO_SET_REQUEST_ID:8,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   CmdId:8/little-unsigned-integer,
                   Value:8/little-unsigned-integer>>) ->
    #gopro_set_request{
        target_system = TargetSystem,
        target_component = TargetComponent,
        cmd_id = CmdId,
        value = Value
    }.

%% @doc Encode GOPRO_SET_RESPONSE message to binary
-spec encode_gopro_set_response(#gopro_set_response{}) -> binary().
encode_gopro_set_response(#gopro_set_response{
    cmd_id = CmdId,
    status = Status
}) ->
    <<?GOPRO_SET_RESPONSE_ID:8,
      CmdId:8/little-unsigned-integer,
      Status:8/little-unsigned-integer>>.

%% @doc Decode GOPRO_SET_RESPONSE message from binary
-spec decode_gopro_set_response(binary()) -> #gopro_set_response{}.
decode_gopro_set_response(<<?GOPRO_SET_RESPONSE_ID:8,
                   CmdId:8/little-unsigned-integer,
                   Status:8/little-unsigned-integer>>) ->
    #gopro_set_response{
        cmd_id = CmdId,
        status = Status
    }.

%% @doc Encode RPM message to binary
-spec encode_rpm(#rpm{}) -> binary().
encode_rpm(#rpm{
    rpm1 = Rpm1,
    rpm2 = Rpm2
}) ->
    <<?RPM_ID:8,
      Rpm1:32/little-float,
      Rpm2:32/little-float>>.

%% @doc Decode RPM message from binary
-spec decode_rpm(binary()) -> #rpm{}.
decode_rpm(<<?RPM_ID:8,
                   Rpm1:32/little-float,
                   Rpm2:32/little-float>>) ->
    #rpm{
        rpm1 = Rpm1,
        rpm2 = Rpm2
    }.

%% @doc Encode DEVICE_OP_READ message to binary
-spec encode_device_op_read(#device_op_read{}) -> binary().
encode_device_op_read(#device_op_read{
    target_system = TargetSystem,
    target_component = TargetComponent,
    request_id = RequestId,
    bustype = Bustype,
    bus = Bus,
    address = Address,
    busname = Busname,
    regstart = Regstart,
    count = Count,
    bank = Bank
}) ->
    <<?DEVICE_OP_READ_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      RequestId:32/little-unsigned-integer,
      Bustype:8/little-unsigned-integer,
      Bus:8/little-unsigned-integer,
      Address:8/little-unsigned-integer,
      Busname:8/little-binary,
      Regstart:8/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      Bank:8/little-unsigned-integer>>.

%% @doc Decode DEVICE_OP_READ message from binary
-spec decode_device_op_read(binary()) -> #device_op_read{}.
decode_device_op_read(<<?DEVICE_OP_READ_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   RequestId:32/little-unsigned-integer,
                   Bustype:8/little-unsigned-integer,
                   Bus:8/little-unsigned-integer,
                   Address:8/little-unsigned-integer,
                   Busname:8/little-binary,
                   Regstart:8/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   Bank:8/little-unsigned-integer>>) ->
    #device_op_read{
        target_system = TargetSystem,
        target_component = TargetComponent,
        request_id = RequestId,
        bustype = Bustype,
        bus = Bus,
        address = Address,
        busname = Busname,
        regstart = Regstart,
        count = Count,
        bank = Bank
    }.

%% @doc Encode DEVICE_OP_READ_REPLY message to binary
-spec encode_device_op_read_reply(#device_op_read_reply{}) -> binary().
encode_device_op_read_reply(#device_op_read_reply{
    request_id = RequestId,
    result = Result,
    regstart = Regstart,
    count = Count,
    data = Data,
    bank = Bank
}) ->
    <<?DEVICE_OP_READ_REPLY_ID:16/little-unsigned-integer,
      RequestId:32/little-unsigned-integer,
      Result:8/little-unsigned-integer,
      Regstart:8/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      Data:8/little-unsigned-integer,
      Bank:8/little-unsigned-integer>>.

%% @doc Decode DEVICE_OP_READ_REPLY message from binary
-spec decode_device_op_read_reply(binary()) -> #device_op_read_reply{}.
decode_device_op_read_reply(<<?DEVICE_OP_READ_REPLY_ID:16/little-unsigned-integer,
                   RequestId:32/little-unsigned-integer,
                   Result:8/little-unsigned-integer,
                   Regstart:8/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer,
                   Bank:8/little-unsigned-integer>>) ->
    #device_op_read_reply{
        request_id = RequestId,
        result = Result,
        regstart = Regstart,
        count = Count,
        data = Data,
        bank = Bank
    }.

%% @doc Encode DEVICE_OP_WRITE message to binary
-spec encode_device_op_write(#device_op_write{}) -> binary().
encode_device_op_write(#device_op_write{
    target_system = TargetSystem,
    target_component = TargetComponent,
    request_id = RequestId,
    bustype = Bustype,
    bus = Bus,
    address = Address,
    busname = Busname,
    regstart = Regstart,
    count = Count,
    data = Data,
    bank = Bank
}) ->
    <<?DEVICE_OP_WRITE_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      RequestId:32/little-unsigned-integer,
      Bustype:8/little-unsigned-integer,
      Bus:8/little-unsigned-integer,
      Address:8/little-unsigned-integer,
      Busname:8/little-binary,
      Regstart:8/little-unsigned-integer,
      Count:8/little-unsigned-integer,
      Data:8/little-unsigned-integer,
      Bank:8/little-unsigned-integer>>.

%% @doc Decode DEVICE_OP_WRITE message from binary
-spec decode_device_op_write(binary()) -> #device_op_write{}.
decode_device_op_write(<<?DEVICE_OP_WRITE_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   RequestId:32/little-unsigned-integer,
                   Bustype:8/little-unsigned-integer,
                   Bus:8/little-unsigned-integer,
                   Address:8/little-unsigned-integer,
                   Busname:8/little-binary,
                   Regstart:8/little-unsigned-integer,
                   Count:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer,
                   Bank:8/little-unsigned-integer>>) ->
    #device_op_write{
        target_system = TargetSystem,
        target_component = TargetComponent,
        request_id = RequestId,
        bustype = Bustype,
        bus = Bus,
        address = Address,
        busname = Busname,
        regstart = Regstart,
        count = Count,
        data = Data,
        bank = Bank
    }.

%% @doc Encode DEVICE_OP_WRITE_REPLY message to binary
-spec encode_device_op_write_reply(#device_op_write_reply{}) -> binary().
encode_device_op_write_reply(#device_op_write_reply{
    request_id = RequestId,
    result = Result
}) ->
    <<?DEVICE_OP_WRITE_REPLY_ID:16/little-unsigned-integer,
      RequestId:32/little-unsigned-integer,
      Result:8/little-unsigned-integer>>.

%% @doc Decode DEVICE_OP_WRITE_REPLY message from binary
-spec decode_device_op_write_reply(binary()) -> #device_op_write_reply{}.
decode_device_op_write_reply(<<?DEVICE_OP_WRITE_REPLY_ID:16/little-unsigned-integer,
                   RequestId:32/little-unsigned-integer,
                   Result:8/little-unsigned-integer>>) ->
    #device_op_write_reply{
        request_id = RequestId,
        result = Result
    }.

%% @doc Encode SECURE_COMMAND message to binary
-spec encode_secure_command(#secure_command{}) -> binary().
encode_secure_command(#secure_command{
    target_system = TargetSystem,
    target_component = TargetComponent,
    sequence = Sequence,
    operation = Operation,
    data_length = DataLength,
    sig_length = SigLength,
    data = Data
}) ->
    <<?SECURE_COMMAND_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      Sequence:32/little-unsigned-integer,
      Operation:32/little-unsigned-integer,
      DataLength:8/little-unsigned-integer,
      SigLength:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode SECURE_COMMAND message from binary
-spec decode_secure_command(binary()) -> #secure_command{}.
decode_secure_command(<<?SECURE_COMMAND_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   Sequence:32/little-unsigned-integer,
                   Operation:32/little-unsigned-integer,
                   DataLength:8/little-unsigned-integer,
                   SigLength:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #secure_command{
        target_system = TargetSystem,
        target_component = TargetComponent,
        sequence = Sequence,
        operation = Operation,
        data_length = DataLength,
        sig_length = SigLength,
        data = Data
    }.

%% @doc Encode SECURE_COMMAND_REPLY message to binary
-spec encode_secure_command_reply(#secure_command_reply{}) -> binary().
encode_secure_command_reply(#secure_command_reply{
    sequence = Sequence,
    operation = Operation,
    result = Result,
    data_length = DataLength,
    data = Data
}) ->
    <<?SECURE_COMMAND_REPLY_ID:16/little-unsigned-integer,
      Sequence:32/little-unsigned-integer,
      Operation:32/little-unsigned-integer,
      Result:8/little-unsigned-integer,
      DataLength:8/little-unsigned-integer,
      Data:8/little-unsigned-integer>>.

%% @doc Decode SECURE_COMMAND_REPLY message from binary
-spec decode_secure_command_reply(binary()) -> #secure_command_reply{}.
decode_secure_command_reply(<<?SECURE_COMMAND_REPLY_ID:16/little-unsigned-integer,
                   Sequence:32/little-unsigned-integer,
                   Operation:32/little-unsigned-integer,
                   Result:8/little-unsigned-integer,
                   DataLength:8/little-unsigned-integer,
                   Data:8/little-unsigned-integer>>) ->
    #secure_command_reply{
        sequence = Sequence,
        operation = Operation,
        result = Result,
        data_length = DataLength,
        data = Data
    }.

%% @doc Encode ADAP_TUNING message to binary
-spec encode_adap_tuning(#adap_tuning{}) -> binary().
encode_adap_tuning(#adap_tuning{
    axis = Axis,
    desired = Desired,
    achieved = Achieved,
    error = Error,
    theta = Theta,
    omega = Omega,
    sigma = Sigma,
    theta_dot = ThetaDot,
    omega_dot = OmegaDot,
    sigma_dot = SigmaDot,
    f = F,
    f_dot = FDot,
    u = U
}) ->
    <<?ADAP_TUNING_ID:16/little-unsigned-integer,
      Axis:8/little-unsigned-integer,
      Desired:32/little-float,
      Achieved:32/little-float,
      Error:32/little-float,
      Theta:32/little-float,
      Omega:32/little-float,
      Sigma:32/little-float,
      ThetaDot:32/little-float,
      OmegaDot:32/little-float,
      SigmaDot:32/little-float,
      F:32/little-float,
      FDot:32/little-float,
      U:32/little-float>>.

%% @doc Decode ADAP_TUNING message from binary
-spec decode_adap_tuning(binary()) -> #adap_tuning{}.
decode_adap_tuning(<<?ADAP_TUNING_ID:16/little-unsigned-integer,
                   Axis:8/little-unsigned-integer,
                   Desired:32/little-float,
                   Achieved:32/little-float,
                   Error:32/little-float,
                   Theta:32/little-float,
                   Omega:32/little-float,
                   Sigma:32/little-float,
                   ThetaDot:32/little-float,
                   OmegaDot:32/little-float,
                   SigmaDot:32/little-float,
                   F:32/little-float,
                   FDot:32/little-float,
                   U:32/little-float>>) ->
    #adap_tuning{
        axis = Axis,
        desired = Desired,
        achieved = Achieved,
        error = Error,
        theta = Theta,
        omega = Omega,
        sigma = Sigma,
        theta_dot = ThetaDot,
        omega_dot = OmegaDot,
        sigma_dot = SigmaDot,
        f = F,
        f_dot = FDot,
        u = U
    }.

%% @doc Encode VISION_POSITION_DELTA message to binary
-spec encode_vision_position_delta(#vision_position_delta{}) -> binary().
encode_vision_position_delta(#vision_position_delta{
    time_usec = TimeUsec,
    time_delta_usec = TimeDeltaUsec,
    angle_delta = AngleDelta,
    position_delta = PositionDelta,
    confidence = Confidence
}) ->
    <<?VISION_POSITION_DELTA_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      TimeDeltaUsec:64/little-unsigned-integer,
      AngleDelta:32/little-float,
      PositionDelta:32/little-float,
      Confidence:32/little-float>>.

%% @doc Decode VISION_POSITION_DELTA message from binary
-spec decode_vision_position_delta(binary()) -> #vision_position_delta{}.
decode_vision_position_delta(<<?VISION_POSITION_DELTA_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   TimeDeltaUsec:64/little-unsigned-integer,
                   AngleDelta:32/little-float,
                   PositionDelta:32/little-float,
                   Confidence:32/little-float>>) ->
    #vision_position_delta{
        time_usec = TimeUsec,
        time_delta_usec = TimeDeltaUsec,
        angle_delta = AngleDelta,
        position_delta = PositionDelta,
        confidence = Confidence
    }.

%% @doc Encode AOA_SSA message to binary
-spec encode_aoa_ssa(#aoa_ssa{}) -> binary().
encode_aoa_ssa(#aoa_ssa{
    time_usec = TimeUsec,
    aoa = Aoa,
    ssa = Ssa
}) ->
    <<?AOA_SSA_ID:16/little-unsigned-integer,
      TimeUsec:64/little-unsigned-integer,
      Aoa:32/little-float,
      Ssa:32/little-float>>.

%% @doc Decode AOA_SSA message from binary
-spec decode_aoa_ssa(binary()) -> #aoa_ssa{}.
decode_aoa_ssa(<<?AOA_SSA_ID:16/little-unsigned-integer,
                   TimeUsec:64/little-unsigned-integer,
                   Aoa:32/little-float,
                   Ssa:32/little-float>>) ->
    #aoa_ssa{
        time_usec = TimeUsec,
        aoa = Aoa,
        ssa = Ssa
    }.

%% @doc Encode ESC_TELEMETRY_1_TO_4 message to binary
-spec encode_esc_telemetry_1_to_4(#esc_telemetry_1_to_4{}) -> binary().
encode_esc_telemetry_1_to_4(#esc_telemetry_1_to_4{
    temperature = Temperature,
    voltage = Voltage,
    current = Current,
    totalcurrent = Totalcurrent,
    rpm = Rpm,
    count = Count
}) ->
    <<?ESC_TELEMETRY_1_TO_4_ID:16/little-unsigned-integer,
      Temperature:8/little-unsigned-integer,
      Voltage:16/little-unsigned-integer,
      Current:16/little-unsigned-integer,
      Totalcurrent:16/little-unsigned-integer,
      Rpm:16/little-unsigned-integer,
      Count:16/little-unsigned-integer>>.

%% @doc Decode ESC_TELEMETRY_1_TO_4 message from binary
-spec decode_esc_telemetry_1_to_4(binary()) -> #esc_telemetry_1_to_4{}.
decode_esc_telemetry_1_to_4(<<?ESC_TELEMETRY_1_TO_4_ID:16/little-unsigned-integer,
                   Temperature:8/little-unsigned-integer,
                   Voltage:16/little-unsigned-integer,
                   Current:16/little-unsigned-integer,
                   Totalcurrent:16/little-unsigned-integer,
                   Rpm:16/little-unsigned-integer,
                   Count:16/little-unsigned-integer>>) ->
    #esc_telemetry_1_to_4{
        temperature = Temperature,
        voltage = Voltage,
        current = Current,
        totalcurrent = Totalcurrent,
        rpm = Rpm,
        count = Count
    }.

%% @doc Encode ESC_TELEMETRY_5_TO_8 message to binary
-spec encode_esc_telemetry_5_to_8(#esc_telemetry_5_to_8{}) -> binary().
encode_esc_telemetry_5_to_8(#esc_telemetry_5_to_8{
    temperature = Temperature,
    voltage = Voltage,
    current = Current,
    totalcurrent = Totalcurrent,
    rpm = Rpm,
    count = Count
}) ->
    <<?ESC_TELEMETRY_5_TO_8_ID:16/little-unsigned-integer,
      Temperature:8/little-unsigned-integer,
      Voltage:16/little-unsigned-integer,
      Current:16/little-unsigned-integer,
      Totalcurrent:16/little-unsigned-integer,
      Rpm:16/little-unsigned-integer,
      Count:16/little-unsigned-integer>>.

%% @doc Decode ESC_TELEMETRY_5_TO_8 message from binary
-spec decode_esc_telemetry_5_to_8(binary()) -> #esc_telemetry_5_to_8{}.
decode_esc_telemetry_5_to_8(<<?ESC_TELEMETRY_5_TO_8_ID:16/little-unsigned-integer,
                   Temperature:8/little-unsigned-integer,
                   Voltage:16/little-unsigned-integer,
                   Current:16/little-unsigned-integer,
                   Totalcurrent:16/little-unsigned-integer,
                   Rpm:16/little-unsigned-integer,
                   Count:16/little-unsigned-integer>>) ->
    #esc_telemetry_5_to_8{
        temperature = Temperature,
        voltage = Voltage,
        current = Current,
        totalcurrent = Totalcurrent,
        rpm = Rpm,
        count = Count
    }.

%% @doc Encode ESC_TELEMETRY_9_TO_12 message to binary
-spec encode_esc_telemetry_9_to_12(#esc_telemetry_9_to_12{}) -> binary().
encode_esc_telemetry_9_to_12(#esc_telemetry_9_to_12{
    temperature = Temperature,
    voltage = Voltage,
    current = Current,
    totalcurrent = Totalcurrent,
    rpm = Rpm,
    count = Count
}) ->
    <<?ESC_TELEMETRY_9_TO_12_ID:16/little-unsigned-integer,
      Temperature:8/little-unsigned-integer,
      Voltage:16/little-unsigned-integer,
      Current:16/little-unsigned-integer,
      Totalcurrent:16/little-unsigned-integer,
      Rpm:16/little-unsigned-integer,
      Count:16/little-unsigned-integer>>.

%% @doc Decode ESC_TELEMETRY_9_TO_12 message from binary
-spec decode_esc_telemetry_9_to_12(binary()) -> #esc_telemetry_9_to_12{}.
decode_esc_telemetry_9_to_12(<<?ESC_TELEMETRY_9_TO_12_ID:16/little-unsigned-integer,
                   Temperature:8/little-unsigned-integer,
                   Voltage:16/little-unsigned-integer,
                   Current:16/little-unsigned-integer,
                   Totalcurrent:16/little-unsigned-integer,
                   Rpm:16/little-unsigned-integer,
                   Count:16/little-unsigned-integer>>) ->
    #esc_telemetry_9_to_12{
        temperature = Temperature,
        voltage = Voltage,
        current = Current,
        totalcurrent = Totalcurrent,
        rpm = Rpm,
        count = Count
    }.

%% @doc Encode OSD_PARAM_CONFIG message to binary
-spec encode_osd_param_config(#osd_param_config{}) -> binary().
encode_osd_param_config(#osd_param_config{
    target_system = TargetSystem,
    target_component = TargetComponent,
    request_id = RequestId,
    osd_screen = OsdScreen,
    osd_index = OsdIndex,
    param_id = ParamId,
    config_type = ConfigType,
    min_value = MinValue,
    max_value = MaxValue,
    increment = Increment
}) ->
    <<?OSD_PARAM_CONFIG_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      RequestId:32/little-unsigned-integer,
      OsdScreen:8/little-unsigned-integer,
      OsdIndex:8/little-unsigned-integer,
      ParamId:8/little-binary,
      ConfigType:8/little-unsigned-integer,
      MinValue:32/little-float,
      MaxValue:32/little-float,
      Increment:32/little-float>>.

%% @doc Decode OSD_PARAM_CONFIG message from binary
-spec decode_osd_param_config(binary()) -> #osd_param_config{}.
decode_osd_param_config(<<?OSD_PARAM_CONFIG_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   RequestId:32/little-unsigned-integer,
                   OsdScreen:8/little-unsigned-integer,
                   OsdIndex:8/little-unsigned-integer,
                   ParamId:8/little-binary,
                   ConfigType:8/little-unsigned-integer,
                   MinValue:32/little-float,
                   MaxValue:32/little-float,
                   Increment:32/little-float>>) ->
    #osd_param_config{
        target_system = TargetSystem,
        target_component = TargetComponent,
        request_id = RequestId,
        osd_screen = OsdScreen,
        osd_index = OsdIndex,
        param_id = ParamId,
        config_type = ConfigType,
        min_value = MinValue,
        max_value = MaxValue,
        increment = Increment
    }.

%% @doc Encode OSD_PARAM_CONFIG_REPLY message to binary
-spec encode_osd_param_config_reply(#osd_param_config_reply{}) -> binary().
encode_osd_param_config_reply(#osd_param_config_reply{
    request_id = RequestId,
    result = Result
}) ->
    <<?OSD_PARAM_CONFIG_REPLY_ID:16/little-unsigned-integer,
      RequestId:32/little-unsigned-integer,
      Result:8/little-unsigned-integer>>.

%% @doc Decode OSD_PARAM_CONFIG_REPLY message from binary
-spec decode_osd_param_config_reply(binary()) -> #osd_param_config_reply{}.
decode_osd_param_config_reply(<<?OSD_PARAM_CONFIG_REPLY_ID:16/little-unsigned-integer,
                   RequestId:32/little-unsigned-integer,
                   Result:8/little-unsigned-integer>>) ->
    #osd_param_config_reply{
        request_id = RequestId,
        result = Result
    }.

%% @doc Encode OSD_PARAM_SHOW_CONFIG message to binary
-spec encode_osd_param_show_config(#osd_param_show_config{}) -> binary().
encode_osd_param_show_config(#osd_param_show_config{
    target_system = TargetSystem,
    target_component = TargetComponent,
    request_id = RequestId,
    osd_screen = OsdScreen,
    osd_index = OsdIndex
}) ->
    <<?OSD_PARAM_SHOW_CONFIG_ID:16/little-unsigned-integer,
      TargetSystem:8/little-unsigned-integer,
      TargetComponent:8/little-unsigned-integer,
      RequestId:32/little-unsigned-integer,
      OsdScreen:8/little-unsigned-integer,
      OsdIndex:8/little-unsigned-integer>>.

%% @doc Decode OSD_PARAM_SHOW_CONFIG message from binary
-spec decode_osd_param_show_config(binary()) -> #osd_param_show_config{}.
decode_osd_param_show_config(<<?OSD_PARAM_SHOW_CONFIG_ID:16/little-unsigned-integer,
                   TargetSystem:8/little-unsigned-integer,
                   TargetComponent:8/little-unsigned-integer,
                   RequestId:32/little-unsigned-integer,
                   OsdScreen:8/little-unsigned-integer,
                   OsdIndex:8/little-unsigned-integer>>) ->
    #osd_param_show_config{
        target_system = TargetSystem,
        target_component = TargetComponent,
        request_id = RequestId,
        osd_screen = OsdScreen,
        osd_index = OsdIndex
    }.

%% @doc Encode OSD_PARAM_SHOW_CONFIG_REPLY message to binary
-spec encode_osd_param_show_config_reply(#osd_param_show_config_reply{}) -> binary().
encode_osd_param_show_config_reply(#osd_param_show_config_reply{
    request_id = RequestId,
    result = Result,
    param_id = ParamId,
    config_type = ConfigType,
    min_value = MinValue,
    max_value = MaxValue,
    increment = Increment
}) ->
    <<?OSD_PARAM_SHOW_CONFIG_REPLY_ID:16/little-unsigned-integer,
      RequestId:32/little-unsigned-integer,
      Result:8/little-unsigned-integer,
      ParamId:8/little-binary,
      ConfigType:8/little-unsigned-integer,
      MinValue:32/little-float,
      MaxValue:32/little-float,
      Increment:32/little-float>>.

%% @doc Decode OSD_PARAM_SHOW_CONFIG_REPLY message from binary
-spec decode_osd_param_show_config_reply(binary()) -> #osd_param_show_config_reply{}.
decode_osd_param_show_config_reply(<<?OSD_PARAM_SHOW_CONFIG_REPLY_ID:16/little-unsigned-integer,
                   RequestId:32/little-unsigned-integer,
                   Result:8/little-unsigned-integer,
                   ParamId:8/little-binary,
                   ConfigType:8/little-unsigned-integer,
                   MinValue:32/little-float,
                   MaxValue:32/little-float,
                   Increment:32/little-float>>) ->
    #osd_param_show_config_reply{
        request_id = RequestId,
        result = Result,
        param_id = ParamId,
        config_type = ConfigType,
        min_value = MinValue,
        max_value = MaxValue,
        increment = Increment
    }.

%% @doc Encode OBSTACLE_DISTANCE_3D message to binary
-spec encode_obstacle_distance_3d(#obstacle_distance_3d{}) -> binary().
encode_obstacle_distance_3d(#obstacle_distance_3d{
    time_boot_ms = TimeBootMs,
    sensor_type = SensorType,
    frame = Frame,
    obstacle_id = ObstacleId,
    x = X,
    y = Y,
    z = Z,
    min_distance = MinDistance,
    max_distance = MaxDistance
}) ->
    <<?OBSTACLE_DISTANCE_3D_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      SensorType:8/little-unsigned-integer,
      Frame:8/little-unsigned-integer,
      ObstacleId:16/little-unsigned-integer,
      X:32/little-float,
      Y:32/little-float,
      Z:32/little-float,
      MinDistance:32/little-float,
      MaxDistance:32/little-float>>.

%% @doc Decode OBSTACLE_DISTANCE_3D message from binary
-spec decode_obstacle_distance_3d(binary()) -> #obstacle_distance_3d{}.
decode_obstacle_distance_3d(<<?OBSTACLE_DISTANCE_3D_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   SensorType:8/little-unsigned-integer,
                   Frame:8/little-unsigned-integer,
                   ObstacleId:16/little-unsigned-integer,
                   X:32/little-float,
                   Y:32/little-float,
                   Z:32/little-float,
                   MinDistance:32/little-float,
                   MaxDistance:32/little-float>>) ->
    #obstacle_distance_3d{
        time_boot_ms = TimeBootMs,
        sensor_type = SensorType,
        frame = Frame,
        obstacle_id = ObstacleId,
        x = X,
        y = Y,
        z = Z,
        min_distance = MinDistance,
        max_distance = MaxDistance
    }.

%% @doc Encode WATER_DEPTH message to binary
-spec encode_water_depth(#water_depth{}) -> binary().
encode_water_depth(#water_depth{
    time_boot_ms = TimeBootMs,
    id = Id,
    healthy = Healthy,
    lat = Lat,
    lng = Lng,
    alt = Alt,
    roll = Roll,
    pitch = Pitch,
    yaw = Yaw,
    distance = Distance,
    temperature = Temperature
}) ->
    <<?WATER_DEPTH_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      Healthy:8/little-unsigned-integer,
      Lat:32/little-signed-integer,
      Lng:32/little-signed-integer,
      Alt:32/little-float,
      Roll:32/little-float,
      Pitch:32/little-float,
      Yaw:32/little-float,
      Distance:32/little-float,
      Temperature:32/little-float>>.

%% @doc Decode WATER_DEPTH message from binary
-spec decode_water_depth(binary()) -> #water_depth{}.
decode_water_depth(<<?WATER_DEPTH_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   Healthy:8/little-unsigned-integer,
                   Lat:32/little-signed-integer,
                   Lng:32/little-signed-integer,
                   Alt:32/little-float,
                   Roll:32/little-float,
                   Pitch:32/little-float,
                   Yaw:32/little-float,
                   Distance:32/little-float,
                   Temperature:32/little-float>>) ->
    #water_depth{
        time_boot_ms = TimeBootMs,
        id = Id,
        healthy = Healthy,
        lat = Lat,
        lng = Lng,
        alt = Alt,
        roll = Roll,
        pitch = Pitch,
        yaw = Yaw,
        distance = Distance,
        temperature = Temperature
    }.

%% @doc Encode MCU_STATUS message to binary
-spec encode_mcu_status(#mcu_status{}) -> binary().
encode_mcu_status(#mcu_status{
    id = Id,
    mcu_temperature = McuTemperature,
    mcu_voltage = McuVoltage,
    mcu_voltage_min = McuVoltageMin,
    mcu_voltage_max = McuVoltageMax
}) ->
    <<?MCU_STATUS_ID:16/little-unsigned-integer,
      Id:8/little-unsigned-integer,
      McuTemperature:16/little-signed-integer,
      McuVoltage:16/little-unsigned-integer,
      McuVoltageMin:16/little-unsigned-integer,
      McuVoltageMax:16/little-unsigned-integer>>.

%% @doc Decode MCU_STATUS message from binary
-spec decode_mcu_status(binary()) -> #mcu_status{}.
decode_mcu_status(<<?MCU_STATUS_ID:16/little-unsigned-integer,
                   Id:8/little-unsigned-integer,
                   McuTemperature:16/little-signed-integer,
                   McuVoltage:16/little-unsigned-integer,
                   McuVoltageMin:16/little-unsigned-integer,
                   McuVoltageMax:16/little-unsigned-integer>>) ->
    #mcu_status{
        id = Id,
        mcu_temperature = McuTemperature,
        mcu_voltage = McuVoltage,
        mcu_voltage_min = McuVoltageMin,
        mcu_voltage_max = McuVoltageMax
    }.

%% @doc Encode ESC_TELEMETRY_13_TO_16 message to binary
-spec encode_esc_telemetry_13_to_16(#esc_telemetry_13_to_16{}) -> binary().
encode_esc_telemetry_13_to_16(#esc_telemetry_13_to_16{
    temperature = Temperature,
    voltage = Voltage,
    current = Current,
    totalcurrent = Totalcurrent,
    rpm = Rpm,
    count = Count
}) ->
    <<?ESC_TELEMETRY_13_TO_16_ID:16/little-unsigned-integer,
      Temperature:8/little-unsigned-integer,
      Voltage:16/little-unsigned-integer,
      Current:16/little-unsigned-integer,
      Totalcurrent:16/little-unsigned-integer,
      Rpm:16/little-unsigned-integer,
      Count:16/little-unsigned-integer>>.

%% @doc Decode ESC_TELEMETRY_13_TO_16 message from binary
-spec decode_esc_telemetry_13_to_16(binary()) -> #esc_telemetry_13_to_16{}.
decode_esc_telemetry_13_to_16(<<?ESC_TELEMETRY_13_TO_16_ID:16/little-unsigned-integer,
                   Temperature:8/little-unsigned-integer,
                   Voltage:16/little-unsigned-integer,
                   Current:16/little-unsigned-integer,
                   Totalcurrent:16/little-unsigned-integer,
                   Rpm:16/little-unsigned-integer,
                   Count:16/little-unsigned-integer>>) ->
    #esc_telemetry_13_to_16{
        temperature = Temperature,
        voltage = Voltage,
        current = Current,
        totalcurrent = Totalcurrent,
        rpm = Rpm,
        count = Count
    }.

%% @doc Encode ESC_TELEMETRY_17_TO_20 message to binary
-spec encode_esc_telemetry_17_to_20(#esc_telemetry_17_to_20{}) -> binary().
encode_esc_telemetry_17_to_20(#esc_telemetry_17_to_20{
    temperature = Temperature,
    voltage = Voltage,
    current = Current,
    totalcurrent = Totalcurrent,
    rpm = Rpm,
    count = Count
}) ->
    <<?ESC_TELEMETRY_17_TO_20_ID:16/little-unsigned-integer,
      Temperature:8/little-unsigned-integer,
      Voltage:16/little-unsigned-integer,
      Current:16/little-unsigned-integer,
      Totalcurrent:16/little-unsigned-integer,
      Rpm:16/little-unsigned-integer,
      Count:16/little-unsigned-integer>>.

%% @doc Decode ESC_TELEMETRY_17_TO_20 message from binary
-spec decode_esc_telemetry_17_to_20(binary()) -> #esc_telemetry_17_to_20{}.
decode_esc_telemetry_17_to_20(<<?ESC_TELEMETRY_17_TO_20_ID:16/little-unsigned-integer,
                   Temperature:8/little-unsigned-integer,
                   Voltage:16/little-unsigned-integer,
                   Current:16/little-unsigned-integer,
                   Totalcurrent:16/little-unsigned-integer,
                   Rpm:16/little-unsigned-integer,
                   Count:16/little-unsigned-integer>>) ->
    #esc_telemetry_17_to_20{
        temperature = Temperature,
        voltage = Voltage,
        current = Current,
        totalcurrent = Totalcurrent,
        rpm = Rpm,
        count = Count
    }.

%% @doc Encode ESC_TELEMETRY_21_TO_24 message to binary
-spec encode_esc_telemetry_21_to_24(#esc_telemetry_21_to_24{}) -> binary().
encode_esc_telemetry_21_to_24(#esc_telemetry_21_to_24{
    temperature = Temperature,
    voltage = Voltage,
    current = Current,
    totalcurrent = Totalcurrent,
    rpm = Rpm,
    count = Count
}) ->
    <<?ESC_TELEMETRY_21_TO_24_ID:16/little-unsigned-integer,
      Temperature:8/little-unsigned-integer,
      Voltage:16/little-unsigned-integer,
      Current:16/little-unsigned-integer,
      Totalcurrent:16/little-unsigned-integer,
      Rpm:16/little-unsigned-integer,
      Count:16/little-unsigned-integer>>.

%% @doc Decode ESC_TELEMETRY_21_TO_24 message from binary
-spec decode_esc_telemetry_21_to_24(binary()) -> #esc_telemetry_21_to_24{}.
decode_esc_telemetry_21_to_24(<<?ESC_TELEMETRY_21_TO_24_ID:16/little-unsigned-integer,
                   Temperature:8/little-unsigned-integer,
                   Voltage:16/little-unsigned-integer,
                   Current:16/little-unsigned-integer,
                   Totalcurrent:16/little-unsigned-integer,
                   Rpm:16/little-unsigned-integer,
                   Count:16/little-unsigned-integer>>) ->
    #esc_telemetry_21_to_24{
        temperature = Temperature,
        voltage = Voltage,
        current = Current,
        totalcurrent = Totalcurrent,
        rpm = Rpm,
        count = Count
    }.

%% @doc Encode ESC_TELEMETRY_25_TO_28 message to binary
-spec encode_esc_telemetry_25_to_28(#esc_telemetry_25_to_28{}) -> binary().
encode_esc_telemetry_25_to_28(#esc_telemetry_25_to_28{
    temperature = Temperature,
    voltage = Voltage,
    current = Current,
    totalcurrent = Totalcurrent,
    rpm = Rpm,
    count = Count
}) ->
    <<?ESC_TELEMETRY_25_TO_28_ID:16/little-unsigned-integer,
      Temperature:8/little-unsigned-integer,
      Voltage:16/little-unsigned-integer,
      Current:16/little-unsigned-integer,
      Totalcurrent:16/little-unsigned-integer,
      Rpm:16/little-unsigned-integer,
      Count:16/little-unsigned-integer>>.

%% @doc Decode ESC_TELEMETRY_25_TO_28 message from binary
-spec decode_esc_telemetry_25_to_28(binary()) -> #esc_telemetry_25_to_28{}.
decode_esc_telemetry_25_to_28(<<?ESC_TELEMETRY_25_TO_28_ID:16/little-unsigned-integer,
                   Temperature:8/little-unsigned-integer,
                   Voltage:16/little-unsigned-integer,
                   Current:16/little-unsigned-integer,
                   Totalcurrent:16/little-unsigned-integer,
                   Rpm:16/little-unsigned-integer,
                   Count:16/little-unsigned-integer>>) ->
    #esc_telemetry_25_to_28{
        temperature = Temperature,
        voltage = Voltage,
        current = Current,
        totalcurrent = Totalcurrent,
        rpm = Rpm,
        count = Count
    }.

%% @doc Encode ESC_TELEMETRY_29_TO_32 message to binary
-spec encode_esc_telemetry_29_to_32(#esc_telemetry_29_to_32{}) -> binary().
encode_esc_telemetry_29_to_32(#esc_telemetry_29_to_32{
    temperature = Temperature,
    voltage = Voltage,
    current = Current,
    totalcurrent = Totalcurrent,
    rpm = Rpm,
    count = Count
}) ->
    <<?ESC_TELEMETRY_29_TO_32_ID:16/little-unsigned-integer,
      Temperature:8/little-unsigned-integer,
      Voltage:16/little-unsigned-integer,
      Current:16/little-unsigned-integer,
      Totalcurrent:16/little-unsigned-integer,
      Rpm:16/little-unsigned-integer,
      Count:16/little-unsigned-integer>>.

%% @doc Decode ESC_TELEMETRY_29_TO_32 message from binary
-spec decode_esc_telemetry_29_to_32(binary()) -> #esc_telemetry_29_to_32{}.
decode_esc_telemetry_29_to_32(<<?ESC_TELEMETRY_29_TO_32_ID:16/little-unsigned-integer,
                   Temperature:8/little-unsigned-integer,
                   Voltage:16/little-unsigned-integer,
                   Current:16/little-unsigned-integer,
                   Totalcurrent:16/little-unsigned-integer,
                   Rpm:16/little-unsigned-integer,
                   Count:16/little-unsigned-integer>>) ->
    #esc_telemetry_29_to_32{
        temperature = Temperature,
        voltage = Voltage,
        current = Current,
        totalcurrent = Totalcurrent,
        rpm = Rpm,
        count = Count
    }.

%% @doc Encode NAMED_VALUE_STRING message to binary
-spec encode_named_value_string(#named_value_string{}) -> binary().
encode_named_value_string(#named_value_string{
    time_boot_ms = TimeBootMs,
    name = Name,
    value = Value
}) ->
    <<?NAMED_VALUE_STRING_ID:16/little-unsigned-integer,
      TimeBootMs:32/little-unsigned-integer,
      Name:8/little-binary,
      Value:8/little-binary>>.

%% @doc Decode NAMED_VALUE_STRING message from binary
-spec decode_named_value_string(binary()) -> #named_value_string{}.
decode_named_value_string(<<?NAMED_VALUE_STRING_ID:16/little-unsigned-integer,
                   TimeBootMs:32/little-unsigned-integer,
                   Name:8/little-binary,
                   Value:8/little-binary>>) ->
    #named_value_string{
        time_boot_ms = TimeBootMs,
        name = Name,
        value = Value
    }.
