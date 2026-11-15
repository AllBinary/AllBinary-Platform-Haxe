/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2009 AllBinary
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
package org.allbinary.android.input.motion;

import org.allbinary.android.AndroidInfoFactory;
import org.allbinary.android.input.motion.api1.GameInputMotionEventProcessorAPI1;
import org.allbinary.android.input.motion.api5.GameInputMotionEventProcessorAPI5;

class GameInputMotionEventProcessorFactory {
    public static function getInstance() : BaseGameInputMotionEventProcessor {
        var SDK_VERSION : Int = AndroidInfoFactory.getInstance().getVersion();
        if (SDK_VERSION <= 4) {
            return GameInputMotionEventProcessorAPI1.getInstance();
        } else {
            return GameInputMotionEventProcessorAPI5.getInstance();
        }
    }

    public function new() {
    }
}

