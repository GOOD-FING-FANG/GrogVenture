///apply_friction(amount)
var amount = argument[0];

if (plHspeed != 0) {
    if (abs(plHspeed)-amount > 0) {
        plHspeed -= amount*image_xscale;
    } else {
        plHspeed = 0;
    }
}

