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
package org.allbinary.business.advertisement;

import org.allbinary.game.GameAdState;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;

class BottomLimiter {
    private static final instance : BottomLimiter = new BottomLimiter();
    public static function getInstance() : BottomLimiter {
        return BottomLimiter.instance;
    }

    private var bottom : Int = 0;
    private var deltaY : Int = 0;
    private var lower : Int = 0;
    private var higher : Int = 0;
    public function new() {
    }

    public function init(lower : Int, higher : Int) : Void {
        this.lower = lower;
        this.higher = higher;
    }

    public function update() : Void {
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        var gameAdState : GameAdState = GameAdStateFactory.getInstance().getCurrentInstance();
        if (gameAdState.isShowingAt()) {
            this.deltaY = this.higher;
        } else {
            this.deltaY = this.lower;
        }
        this.bottom = displayInfo.getLastHeight() - this.deltaY;
    }

    public function getDeltaY() : Int {
        return this.deltaY;
    }

    public function getBottom() : Int {
        return this.bottom;
    }

}

