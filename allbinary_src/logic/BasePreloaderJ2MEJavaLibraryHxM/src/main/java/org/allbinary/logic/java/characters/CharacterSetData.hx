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
package org.allbinary.logic.java.characters;


class CharacterSetData {
    private static final instance : CharacterSetData = new CharacterSetData();
    public static function getInstance() : CharacterSetData {
        return CharacterSetData.instance;
    }

    public function new() {
    }

    public final US_ASCII : String = "US-ASCII";
    public final ISO_8859_1 : String = "ISO-8859-1";
    public final UTF_8 : String = "UTF-8";
    public final UTF_16 : String = "UTF-16";
    public final UTF_16BE : String = "UTF-16BE";
    public final UTF_16LE : String = "UTF-16LE";
}

