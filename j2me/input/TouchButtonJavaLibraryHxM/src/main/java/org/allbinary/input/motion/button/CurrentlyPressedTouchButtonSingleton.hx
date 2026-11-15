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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class CurrentlyPressedTouchButtonSingleton {
    private static final instance : CurrentlyPressedTouchButtonSingleton = new CurrentlyPressedTouchButtonSingleton();
    public static function getInstance() : CurrentlyPressedTouchButtonSingleton {
        return CurrentlyPressedTouchButtonSingleton.instance;
    }

    public final list : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public function size() : Int {
        return this.list.size();
    }

    public function removeAt(index : Int) : TouchButtonInput {
        return (cast this.list.removeAt(index) : TouchButtonInput);
    }

    public function remove(touchButtonInput : TouchButtonInput) : Bool {
        return this.list.remove(touchButtonInput);
    }

    public function get(index : Int) : TouchButtonInput {
        return (cast this.list.objectArray[index] : TouchButtonInput);
    }

    public function contains(touchButtonInput : TouchButtonInput) : Bool {
        return this.list.contains(touchButtonInput);
    }

    public function add(touchButtonInput : TouchButtonInput) : Void {
        this.list.add(touchButtonInput);
    }

}

