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


class GDLazyResources {
    private static final instance : GDLazyResources = new GDLazyResources();
    public static function getInstance() : GDLazyResources {
        return GDLazyResources.instance;
    }

    public final imageResourceWidthArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([]);
    public final imageResourceHeightArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([]);
    public final requiredResourcesBeforeLoadingArray : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([]);
    public function new() {
    }
}

