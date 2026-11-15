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

import javax.microedition.lcdui.Canvas;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;

class SpinnerAI extends BasicAI {
    private var isEven : Bool = false;
    private var direction : haxe.ds.Vector<Int>;
    public function new(direction : haxe.ds.Vector<Int>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(ownerLayerInterface, gameInput);
        this.direction = direction;
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (this.isEven) {
            super.processKeyAI(this.direction[0]);
            this.isEven = false;
        } else {
            super.processKeyAI(Canvas.KEY_NUM1);
            this.isEven = true;
        }
    }

}

