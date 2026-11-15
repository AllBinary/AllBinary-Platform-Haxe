/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.game.layer;

import org.allbinary.animation.transition.shake.NoShakeAnimationListener;
import org.allbinary.animation.transition.shake.ShakeAnimationListener;
import org.allbinary.animation.transition.shake.ShakeAnimationListenerFactory;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.game.tick.TickableInterface;
import org.allbinary.media.AllBinaryNoVibration;
import org.allbinary.media.AllBinaryVibration;
import org.allbinary.media.AllBinaryVibrationME;

class AdvancedRTSProperties {
    public static function createPropertiesSimulated() : AdvancedRTSProperties {
        return new AdvancedRTSProperties(NoShakeAnimationListener.NO_SHAKE_ANIMATION_LISTENER, AllBinaryNoVibration.NO_VIBRATION, 0, new WaypointBehaviorBase());
    }

    public static function createProperties() : AdvancedRTSProperties {
        return new AdvancedRTSProperties(ShakeAnimationListenerFactory.getInstance(), AllBinaryVibration.getInstance(), Std.int(GameConfigurationCentral.getInstance().VIBRATION.getValue()) * 100, new WaypointBehaviorBase());
    }

    public final shakeListener : ShakeAnimationListener;
    public final vibration : AllBinaryVibrationME;
    public final duration : Int;
    public var waypointBehaviorBase : TickableInterface;
    public function new(shakeListener : ShakeAnimationListener, vibration : AllBinaryVibrationME, duration : Int, waypointBehaviorBase : TickableInterface) {
        this.shakeListener = shakeListener;
        this.vibration = vibration;
        this.duration = duration;
        this.waypointBehaviorBase = waypointBehaviorBase;
    }

}

