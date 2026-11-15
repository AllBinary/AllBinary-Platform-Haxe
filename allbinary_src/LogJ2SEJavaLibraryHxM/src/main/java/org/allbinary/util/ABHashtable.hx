/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2026 AllBinary 
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
package org.allbinary.util;

import jre.util.Hashtable;

class ABHashtable<K, V> extends Hashtable<K, V> {
    public function new(...args : Dynamic) {
        if (args.length == 1) {
            final initialCapacity : Int = args[0];
            super(initialCapacity);
            this._new0(initialCapacity);
        }
        else if (args.length == 0) {
            super();
            this._new1();
        }
    }

    private function _new0(initialCapacity : Int) : Void {
    }

    private function _new1() : Void {
    }

}

