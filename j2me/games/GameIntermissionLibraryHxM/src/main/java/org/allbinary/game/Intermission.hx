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
package org.allbinary.game;

import org.allbinary.time.TimeDelayHelper;

class Intermission implements IntermissionInterface {
    private var enabled : Bool = false;
    private final timeElapsedHelper : TimeDelayHelper = new TimeDelayHelper(0);
    private var intermissionEnableListener : IntermissionEnableListenerInterface = NullIntermissionEnableListener.getInstance();
    public function new() {
    }

    public function setListener(enableListener : IntermissionEnableListenerInterface) : Void {
        this.intermissionEnableListener = enableListener;
    }

    public function getTimeDelayHelper() : TimeDelayHelper {
        return this.timeElapsedHelper;
    }

    public function setEnabled(enabled : Bool) : Void {
        this.enabled = enabled;
        if (this.isEnabled()) {
            this.getTimeDelayHelper().setStartTimeTNT();
        }
        this.intermissionEnableListener.notifyIntermission(enabled);
    }

    public function isEnabled() : Bool {
        return this.enabled;
    }

}

