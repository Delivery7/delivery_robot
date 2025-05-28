#!/usr/bin/env bash

gnome-terminal --tab -- bash -c "ros2 launch delivery_robot launch_sim.launch.py world:=./src/delivery_robot/worlds/labirin2.world; echo 'press enter to close'; read -n 1"

gnome-terminal --tab -- bash -c "rviz2 -d src/delivery_robot/config/labirin2.rviz; echo 'press enter to close'; read -n 1"

gnome-terminal --tab -- bash -c "ros2 launch delivery_robot navigation_launch.py use_sim_time:=true map_subcribe_transient_local:=true; echo 'press enter to close'; read -n 1"

gnome-terminal --tab -- bash -c "ros2 run teleop_twist_keyboard teleop_twist_keyboard; echo 'press enter to close'; read -n 1"

gnome-terminal --tab -- bash -c "ros2 launch slam_toolbox online_async_launch.py params_file:=./src/delivery_robot/config/mapper_params_online_async.yaml use_time:=true; echo 'press enter to close'; read -n 1"

gnome-terminal --tab -- bash -c "ros2 run gamepad_pkg gamepad_testing; echo 'press enter to close'; read -n 1"

gnome-terminal --tab -- bash -c "ros2 run rplidar_ros rplidar_composition --ros-args -p serial_port:=/dev/ttyUSB1 -p frame_id:=laser_frame -p angle_compensate:=true -p scan_mode:=Standard -p serial_baudrate:=256000; echo 'press enter to close'; read -n 1"
