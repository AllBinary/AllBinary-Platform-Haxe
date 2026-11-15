/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.game.configuration.persistance;

import javax.microedition.rms.RecordComparator;

class NullRecordComparator implements RecordComparator {
    public static final NULL_RECORD_COMPARATOR : NullRecordComparator = new NullRecordComparator();
    public function compare(rec1 : haxe.ds.Vector<Int>, rec2 : haxe.ds.Vector<Int>) : Int {
        return 0;
    }

    public function new() {
    }
}

