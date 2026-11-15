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


class EarlySoundsFactory extends BaseSoundsFactory {
    private static final instance : EarlySoundsFactory = new EarlySoundsFactory();
    // throws Exception
    public override function getSoundInterfaceArray() : haxe.ds.Vector<Sound> {
        var soundInterfaceArray : haxe.ds.Vector<Sound> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
        var index : Int = 0;
        soundInterfaceArray[index++] = SelectSound.getInstance();
        soundInterfaceArray[index++] = ErrorSound.getInstance();
        return soundInterfaceArray;
    }

    public static function getInstance() : EarlySoundsFactory {
        return EarlySoundsFactory.instance;
    }

    public function new() {
        super();
    }
}

