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
package org.allbinary.input;

import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class AllBinarySensor implements AllBinarySensorListener {
    public static final NULL_ALLBINARY_SENSOR : AllBinarySensor = new AllBinarySensor();
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private static var max : Int = 100;
    public function new() {
    }

    public function init() : Void {
    }

    // throws Exception
    public function update() : Void {
    }

    public static function setMax(max : Int) : Void {
        AllBinarySensor.max = max;
    }

    public static function getMax() : Int {
        return AllBinarySensor.max;
    }

    public function getId() : Int {
        return AllBinarySensor.getMax();
    }

    public function shutdown() : Void {
        this.logUtil.putF(this.commonStrings.START, this, "shutdown");
    }

    public function onSensorChange() : Void {
        ForcedLogUtil.log(this.commonStrings.NOT_IMPLEMENTED, this);
    }

}

