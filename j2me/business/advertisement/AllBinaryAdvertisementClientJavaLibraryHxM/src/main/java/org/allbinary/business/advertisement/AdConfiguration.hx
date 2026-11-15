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

import org.allbinary.direction.Direction;
import org.allbinary.game.state.GameState;

class AdConfiguration {
    public final INNERACTIVE : String;
    public final LEADBOLT : String;
    public final ADMOB : String;
    public function new(advertIdArray : haxe.ds.Vector<Any>) {
        this.INNERACTIVE = (cast advertIdArray[0] : String);
        this.ADMOB = (cast advertIdArray[1] : String);
        this.LEADBOLT = (cast advertIdArray[2] : String);
    }

    public function getValidAdSpots() : haxe.ds.Vector<Direction> {
        return haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    }

    public function process(gameState : GameState) : Void {
    }

    public function processDemo(state : Int) : Void {
    }

    public function setShowAds() : Void {
    }

    public function setToggleAds(showAds : Bool) : Void {
    }

    public function isShowAds() : Bool {
        return true;
    }

}

