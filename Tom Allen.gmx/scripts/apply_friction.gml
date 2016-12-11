///apply_friction(amount)
var amount = argument[0];

if (pHspd != 0) {
    if (abs(pHspd)-amount > 0) {
        pHspd -= amount*image_xscale;
    } else {
        pHspd = 0;
    }
}

