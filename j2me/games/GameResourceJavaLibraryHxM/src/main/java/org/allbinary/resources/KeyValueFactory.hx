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
package org.allbinary.resources;

import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

class KeyValueFactory {
    private static final instance : KeyValueFactory = new KeyValueFactory();
    public static function getInstance() : KeyValueFactory {
        return KeyValueFactory.instance;
    }

    public final MAP : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public function get(key : String) : String {
        if (!this.MAP.containsKey((cast key : Any))) {
            return key;
        }
        return (cast this.MAP.get((cast key : Any)) : String);
    }

    public function new() {
    }
}

