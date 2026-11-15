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

//import javax.microedition.rms.RecordFilter;

class NullRecordFilter implements RecordFilter {
    public static var NULL_RECORD_FILTER : NullRecordFilter = new NullRecordFilter();
    public function matches(candidate : haxe.ds.Vector<Int>) : Bool {
        return true;
    }

    public function new() {
    }
}

