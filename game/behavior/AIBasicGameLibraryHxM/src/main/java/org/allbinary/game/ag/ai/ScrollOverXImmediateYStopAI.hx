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
package org.allbinary.game.ag.ai;

import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;

class ScrollOverXImmediateYStopAI extends BasicAI {
    public function new(ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(ownerLayerInterface, gameInput);
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        var ownerLayerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
        var x : Int = ownerLayerInterface.getXP();
        var y : Int = ownerLayerInterface.getYP();
        var x2 : Int = ownerLayerInterface.getX2();
        var y2 : Int = ownerLayerInterface.getY2();
        var width : Int = ownerLayerInterface.getWidth();
        var height : Int = ownerLayerInterface.getHeight();
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        if (x2 > displayInfo.getLastWidth()) {
            ownerLayerInterface.setPosition(0, y, ownerLayerInterface.getZP());
        }
        if (y2 > displayInfo.getLastHeight()) {
            ownerLayerInterface.setPosition(x, displayInfo.getLastHeight() - height, ownerLayerInterface.getZP());
        }
        if (x < 0) {
            ownerLayerInterface.setPosition(displayInfo.getLastWidth() - width, y, ownerLayerInterface.getZP());
        }
        if (y < 0) {
            ownerLayerInterface.setPosition(x, 0, ownerLayerInterface.getZP());
        }
    }

}

