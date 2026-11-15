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
package org.allbinary.input.motion.button;

import org.allbinary.game.input.InputFactory;
import org.allbinary.logic.NullUtil;

class CancelTouchButtonInputFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : CancelTouchButtonInputFactory {
        if (CancelTouchButtonInputFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            CancelTouchButtonInputFactory.instance = new CancelTouchButtonInputFactory();
        }
        return (cast CancelTouchButtonInputFactory.instance : CancelTouchButtonInputFactory);
    }

    private final cancelInputArray : haxe.ds.Vector<TouchButtonInput> = haxe.ds.Vector.fromArrayCopy([for (index in 0...InputFactory.getInstance().MAX) null]);
    public function new() {
        final basicTouchInputFactory : BasicTouchInputFactory = BasicTouchInputFactory.getInstance();
        {
            var index : Int = this.cancelInputArray.length - 1;
            while (index >= 0) {
            this.cancelInputArray[index] = basicTouchInputFactory.NONE;
                index--;
            }
        }
        this.cancelInputArray[basicTouchInputFactory.UP.getSourceId()] = basicTouchInputFactory.DOWN;
        this.cancelInputArray[basicTouchInputFactory.DOWN.getSourceId()] = basicTouchInputFactory.UP;
        this.cancelInputArray[basicTouchInputFactory.LEFT.getSourceId()] = basicTouchInputFactory.RIGHT;
        this.cancelInputArray[basicTouchInputFactory.RIGHT.getSourceId()] = basicTouchInputFactory.LEFT;
    }

    public function getCancel(touchButtonInput : TouchButtonInput) : TouchButtonInput {
        return this.cancelInputArray[touchButtonInput.getSourceId()];
    }

}

