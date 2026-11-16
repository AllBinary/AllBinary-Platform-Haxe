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
package org.allbinary.game.ag.ai.tactical;

import javax.microedition.lcdui.Canvas;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.ag.ai.InputProbability;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.time.GameTickTimeDelayHelperFactory;

class BasicRandomAI extends BasicAI {
    private var i_random : Int = 0;
    private final inputProbability : InputProbability;
    private final visitor : Visitor;
    private final keyArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([Canvas.UP, Canvas.DOWN, Canvas.LEFT, Canvas.RIGHT, Canvas.KEY_NUM1, Canvas.KEY_NUM7, Canvas.KEY_NUM9]);
    public function new(ownerLayerInterface : AllBinaryLayer, gameInput : GameInput, inputProbability : InputProbability, visitor : Visitor) {
        super(ownerLayerInterface, gameInput);
        this.inputProbability = inputProbability;
        this.visitor = visitor;
    }

    private final myRandomFactory : MyRandomFactory = MyRandomFactory.getInstance();
    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (this.inputProbability.getTimeDelayHelper().isTime(GameTickTimeDelayHelperFactory.getInstance().startTime)) {
            this.i_random = this.myRandomFactory.getAbsoluteNextInt(this.inputProbability.getMax());
            var repeat : Bool = false;
            var repeatLikelyhoodIntegerArray : haxe.ds.Vector<Null<Int>> = this.inputProbability.getRepeatLikelyhoodIntegerArray();
            if (this.getLastKey() != -1 && jre.lang.JavaObject.intValue(repeatLikelyhoodIntegerArray[this.getLastKey()]) >= this.i_random) {
                repeat = true;
            }
            if (!repeat) {
                var likelyhoodIntegerArray : haxe.ds.Vector<haxe.ds.Vector<Null<Int>>> = this.inputProbability.getLikelyhoodIntegerArray();
                this.i_random = this.myRandomFactory.getAbsoluteNextInt(this.inputProbability.getMax());
                var size : Int = this.keyArray.length;
                var likelyhoodIntegerKeyArray : haxe.ds.Vector<Null<Int>> = null;
                for (index in 0...size) {
                    var key : Int = this.keyArray[index];
                    likelyhoodIntegerKeyArray = likelyhoodIntegerArray[key];
                    if (likelyhoodIntegerArray.length >= key && likelyhoodIntegerKeyArray[0] != null) {
                        if (this.i_random >= jre.lang.JavaObject.intValue(likelyhoodIntegerKeyArray[0]) && this.i_random < jre.lang.JavaObject.intValue(likelyhoodIntegerKeyArray[1])) {
                            this.setLastKey(key);
                            break;
                        }
                    }
                }
            }
            this.visitor.visit(this);
        }
    }

}

