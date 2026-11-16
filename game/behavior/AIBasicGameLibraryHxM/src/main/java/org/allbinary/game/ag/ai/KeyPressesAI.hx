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

import org.allbinary.game.input.GameInput;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.util.HashtableUtil;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.util.ABHashtable;

class KeyPressesAI extends BasicAI {
    private var on : Bool = true;
    public var keys : haxe.ds.Vector<Null<Int>>;
    public function new(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(ownerLayerInterface, gameInput);
        this.keys = haxe.ds.Vector.fromArrayCopy([for (index in 0...hashtable.size()) null]);
        var objectArray : haxe.ds.Vector<Any> = HashtableUtil.getInstance().getKeysAsArray(hashtable);
        var size : Int = objectArray.length;
        for (index in 0...size) {
            this.keys[index] = (cast hashtable.get((cast objectArray[index] : Any)) : Null<Int>);
        }
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (this.on) {
            for (index in 0...this.keys.length) {
                super.processKeyAI(jre.lang.JavaObject.intValue(this.keys[index]));
            }
        }
    }

    // throws Exception
    public function toggle() : Void {
        if (this.isOn()) {
            this.setOn(false);
        } else {
            this.setOn(true);
        }
    }

    // throws Exception
    public function disable() : Void {
        this.setOn(false);
    }

    // throws Exception
    public function enable() : Void {
        this.setOn(true);
    }

    private function setOn(on : Bool) : Void {
        this.on = on;
    }

    public function isOn() : Bool {
        return this.on;
    }

}

