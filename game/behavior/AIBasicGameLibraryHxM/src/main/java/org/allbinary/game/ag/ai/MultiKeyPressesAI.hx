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
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.ABHashtable;

class MultiKeyPressesAI extends KeyPressesAI {
    private final toggleTimeHelper : TimeDelayHelper = new TimeDelayHelper(600);
    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    public function new(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(hashtable, ownerLayerInterface, gameInput);
        this.update();
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
    }

    // throws Exception
    private function update() : Void {
        var gameInput : GameInput = this.getGameInput();
        final keys : haxe.ds.Vector<Null<Int>> = this.keys;
        final size : Int = keys.length;
        if (this.isOn()) {
            for (index in 0...size) {
                var key : Int = Std.int(keys[index]);
                if (key != -1) {
                    gameInput.add(this.gameKeyEventFactory.getInstanceForKey(this, key));
                }
            }
        } else {
            for (index in 0...size) {
                var key : Int = Std.int(keys[index]);
                if (key != -1) {
                    gameInput.addForRemoval(this.gameKeyEventFactory.getInstanceForKey(this, key));
                }
            }
        }
    }

    // throws Exception
    public override function toggle() : Void {
        if (this.toggleTimeHelper.isTime(this.gameTickTimeDelayHelper.startTime)) {
            super.toggle();
            this.update();
        }
    }

    // throws Exception
    public override function disable() : Void {
        if (this.toggleTimeHelper.isTime(this.gameTickTimeDelayHelper.startTime)) {
            super.disable();
            this.update();
        }
    }

    // throws Exception
    public override function enable() : Void {
        if (this.toggleTimeHelper.isTime(this.gameTickTimeDelayHelper.startTime)) {
            super.enable();
            this.update();
        }
    }

}

