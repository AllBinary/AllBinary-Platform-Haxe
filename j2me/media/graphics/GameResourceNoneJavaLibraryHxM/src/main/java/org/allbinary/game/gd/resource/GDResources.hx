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
package org.allbinary.game.gd.resource;


class GDResources {
    private static final instance : GDResources = new GDResources();
    public static function getInstance() : GDResources {
        return GDResources.instance;
    }

    public final resourceStringArray : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([]);
    public var currentLayoutRequiredTotal : Int = 0;
    public function new() {
    }
}

