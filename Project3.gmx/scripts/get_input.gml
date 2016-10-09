///get_input
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check_pressed(vk_up);
up_release = keyboard_check_released(vk_up);
down = keyboard_check(vk_down);

//Override the controls for a gamepad
var gp_id = 0;

if (gamepad_is_connected(gp_id)) {
    gamepad_set_axis_deadzone(gp_id, 0.5);
    if (gamepad_axis_value(gp_id, gp_axislh) < 0) left = gamepad_axis_value(gp_id, gp_axislh);
    if (gamepad_axis_value(gp_id, gp_axislh) > 0) right = gamepad_axis_value(gp_id, gp_axislh);
    up = gamepad_button_check_pressed(gp_id, gp_face1);
    up_release = gamepad_button_check_released(gp_id, gp_face1);
    if (gamepad_axis_value(gp_id, gp_axislv) > 0) down = gamepad_axis_value(gp_id, gp_axislv);
}
