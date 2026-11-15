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
package org.allbinary.media.audio;


class BaseSoundsFactory implements SoundsFactoryInterface {
    private var initialized : Bool = false;
    public function init() : Void {
    }

    // throws Exception
    public function getSoundInterfaceArray() : haxe.ds.Vector<Sound> {
        return haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    }

    public function setInitialized(initialized : Bool) : Void {
        this.initialized = initialized;
    }

    public function isInitialized() : Bool {
        return this.initialized;
    }

    public function new() {
    }
}

