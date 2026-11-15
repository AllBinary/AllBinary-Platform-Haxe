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
package org.allbinary.game.midlet;

import org.allbinary.logic.util.event.AllBinaryEventObject;

class DemoGameMidletEvent extends AllBinaryEventObject {
    private var demoGameMidletState : DemoGameMidletState;
    public function new(anyType : Any, demoGameMidletState : DemoGameMidletState) {
        super(anyType);
        this.demoGameMidletState = demoGameMidletState;
    }

    public function init(anyType : Any) : Void {
        this.setSource(anyType);
    }

    public function setDemoGameMidletState(demoGameMidletState : DemoGameMidletState) : Void {
        this.demoGameMidletState = demoGameMidletState;
    }

    public function getDemoGameMidletState() : DemoGameMidletState {
        return this.demoGameMidletState;
    }

}

