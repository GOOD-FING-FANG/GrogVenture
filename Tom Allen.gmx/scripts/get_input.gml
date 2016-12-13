///get_input

right = keyboard_check(vk_right);
left = keyboard_check(vk_left);

down = keyboard_check(vk_down);
down_release = keyboard_check_released(vk_down);

shift_press = keyboard_check_pressed(vk_shift);
tab_press = keyboard_check_pressed(vk_tab);

space = keyboard_check_pressed(vk_space);
space_release = keyboard_check_released(vk_space);

ctrl = keyboard_check(vk_control);

esc = keyboard_check(vk_escape);

if (esc) game_restart();
