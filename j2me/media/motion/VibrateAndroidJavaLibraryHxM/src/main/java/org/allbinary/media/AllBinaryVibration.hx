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
package org.allbinary.media;

import android.content.Context;
import android.os.Vibrator;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.configuration.GameConfigurationCentral;

class AllBinaryVibration extends AllBinaryVibrationME {
    private static var VIBRATION : AllBinaryVibrationME = AllBinaryNoVibration.NO_VIBRATION;
    private final vibrator : Vibrator = (cast ResourceUtil.getInstance().getContext().getSystemService(Context.VIBRATOR_SERVICE) : Vibrator);
    public function new() {
        super();
    }

    public static function getInstance() : AllBinaryVibrationME {
        return AllBinaryVibration.VIBRATION;
    }

    public static function init() : Void {
        if (jre.lang.JavaObject.intValue(GameConfigurationCentral.getInstance().VIBRATION.getValue()) == 0) {
            AllBinaryVibration.VIBRATION = AllBinaryNoVibration.NO_VIBRATION;
        } else {
            AllBinaryVibration.VIBRATION = new AllBinaryVibration();
        }
    }

    public override function vibrate(duration : Int, type : Int, volume : Int) : Void {
        this.vibrator.vibrate(haxe.Int64.ofInt(duration));
    }

}

