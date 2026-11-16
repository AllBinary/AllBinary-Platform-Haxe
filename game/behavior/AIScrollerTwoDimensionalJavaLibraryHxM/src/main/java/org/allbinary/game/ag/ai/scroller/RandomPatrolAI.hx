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
package org.allbinary.game.ag.ai.scroller;

import javax.microedition.lcdui.Canvas;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.util.ABHashtable;

class RandomPatrolAI extends BasePatrolAI {
    private var changedDirection : Bool = true;
    public function new(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(hashtable, ownerLayerInterface, gameInput);
        this.updateRandomDistance();
    }

    private function updateRandomDistance() : Void {
        this.currentDistance = MyRandomFactory.getInstance().getAbsoluteNextInt(jre.lang.JavaObject.intValue(this.maxDistance));
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        super.update();
        super.processKeyAI(this.keyDirection);
        if (this.changedDirection) {
            super.processKeyAI(Canvas.KEY_NUM1);
            this.updateRandomDistance();
            this.changedDirection = false;
        }
    }

    public override function nextDirection() : Void {
        super.nextDirection();
        this.changedDirection = true;
    }

}

