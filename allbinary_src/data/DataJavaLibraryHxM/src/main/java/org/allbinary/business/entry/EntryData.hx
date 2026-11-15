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
package org.allbinary.business.entry;


class EntryData {
    private static final instance : EntryData = new EntryData();
    public static function getInstance() : EntryData {
        return EntryData.instance;
    }

    public function new() {
    }

    public final ID : String = "ENTRY_ID";
    public final ENCRYPTION : String = "ENTRY_ENCRYPTION";
    public final TIMECREATED : String = "ENTRY_TIMECREATED";
    public final LASTMODIFIED : String = "ENTRY_LASTMODIFIED";
    public final DEFAULT : String = "ENTRY_DEFAULT";
    public final SPECIAL : String = "ENTRY_SPECIAL";
    public final ENABLE : String = "ENTRY_ENABLE";
    public final YES : String = "Yes";
    public final NO : String = "No";
}

