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
package org.allbinary.android.input.motion;

import org.allbinary.android.input.motion.event.AnalogControllerConfigurationEvent;
import org.allbinary.android.input.motion.event.AnalogControllerConfigurationEventHandler;
import org.allbinary.logic.math.ScaleFactorFactory;

class AnalogControllerConfigurationFactory {
    private static final instance : AnalogControllerConfigurationFactory = new AnalogControllerConfigurationFactory();
    public static function getInstance() : AnalogControllerConfigurationFactory {
        return AnalogControllerConfigurationFactory.instance;
    }

    public final SCALE_FACTOR : Int = ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR;
    public final SCALE_VALUE : Int = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE;
    private var available : Bool = false;
    private final analogControllerConfigurationEvent : AnalogControllerConfigurationEvent = new AnalogControllerConfigurationEvent(this);
    public function new() {
    }

    public function isAvailable() : Bool {
        return this.available;
    }

    // throws Exception
    public function setAvailable(available : Bool) : Void {
        this.available = available;
        AnalogControllerConfigurationEventHandler.getInstance().fireEvent(this.analogControllerConfigurationEvent);
    }

}

