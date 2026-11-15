/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.android.input.motion.button;

import org.allbinary.AndroidResources;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.init.Init;
import org.allbinary.input.motion.button.CommonButtons;
import org.allbinary.input.motion.button.TouchButtonBlankResource;
import org.allbinary.input.motion.button.TouchButtonDownResource;
import org.allbinary.input.motion.button.TouchButtonGenericActionResource;
import org.allbinary.input.motion.button.TouchButtonResource;
import org.allbinary.input.motion.button.TouchButtonStartResource;
import org.allbinary.input.motion.button.TouchButtonStrafeLeftResource;
import org.allbinary.input.motion.button.TouchButtonStrafeRightResource;
import org.allbinary.input.motion.button.TouchButtonTurnLeftResource;
import org.allbinary.input.motion.button.TouchButtonTurnRightResource;
import org.allbinary.input.motion.button.TouchButtonUpResource;
import org.allbinary.logic.system.os.OperatingSystemFactory;

class TouchButtonAndroidResources extends Init {
    public override function init() : Void {
        final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
        final androidResources : AndroidResources = AndroidResources.getInstance();
        final RESOURCE_STRING_ARRAY : haxe.ds.Vector<TouchButtonResource> = haxe.ds.Vector.fromArrayCopy([TouchButtonBlankResource.getInstance(), TouchButtonGenericActionResource.getInstance(), TouchButtonStartResource.getInstance(), TouchButtonUpResource.getInstance(), TouchButtonDownResource.getInstance(), TouchButtonTurnLeftResource.getInstance(), TouchButtonTurnRightResource.getInstance(), TouchButtonStrafeLeftResource.getInstance(), TouchButtonStrafeRightResource.getInstance()]);
        final RESOURCE_ARRAY : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...RESOURCE_STRING_ARRAY.length) 0]);
        if (CommonButtons.getInstance().STANDARD_BUTTON_SIZE == 128) {
            RESOURCE_ARRAY[0] = androidResources.raw.touch_button_128_by_128;
            RESOURCE_ARRAY[1] = androidResources.raw.touch_button_generic_action_128_by_128;
            RESOURCE_ARRAY[2] = androidResources.raw.touch_button_start_128_by_128;
            RESOURCE_ARRAY[3] = androidResources.raw.touch_button_up_arrow_128_by_128;
            RESOURCE_ARRAY[4] = androidResources.raw.touch_button_down_arrow_128_by_128;
            RESOURCE_ARRAY[5] = androidResources.raw.touch_button_turn_left_arrow_128_by_128;
            RESOURCE_ARRAY[6] = androidResources.raw.touch_button_turn_right_arrow_128_by_128;
            RESOURCE_ARRAY[7] = androidResources.raw.touch_button_strafe_left_arrow_128_by_128;
            RESOURCE_ARRAY[8] = androidResources.raw.touch_button_strafe_right_arrow_128_by_128;
            if (OperatingSystemFactory.getInstance().getOperatingSystemInstance().isOverScan()) {
                resourceUtil.addResource(RESOURCE_STRING_ARRAY[2].HINT, Std.string(androidResources.raw.ouya_o));
            }
        } else {
            RESOURCE_ARRAY[0] = androidResources.raw.touch_button_64_by_64;
            RESOURCE_ARRAY[1] = androidResources.raw.touch_button_generic_action_64_by_64;
            RESOURCE_ARRAY[2] = androidResources.raw.touch_button_start_64_by_64;
            RESOURCE_ARRAY[3] = androidResources.raw.touch_button_up_arrow_64_by_64;
            RESOURCE_ARRAY[4] = androidResources.raw.touch_button_down_arrow_64_by_64;
            RESOURCE_ARRAY[5] = androidResources.raw.touch_button_turn_left_arrow_64_by_64;
            RESOURCE_ARRAY[6] = androidResources.raw.touch_button_turn_right_arrow_64_by_64;
            RESOURCE_ARRAY[7] = androidResources.raw.touch_button_strafe_left_arrow_64_by_64;
            RESOURCE_ARRAY[8] = androidResources.raw.touch_button_strafe_right_arrow_64_by_64;
        }
        for (index in 0...RESOURCE_ARRAY.length) {
            resourceUtil.addResource(RESOURCE_STRING_ARRAY[index].RESOURCE, Std.string(RESOURCE_ARRAY[index]));
        }
    }

    public function new() {
        super();
    }
}

