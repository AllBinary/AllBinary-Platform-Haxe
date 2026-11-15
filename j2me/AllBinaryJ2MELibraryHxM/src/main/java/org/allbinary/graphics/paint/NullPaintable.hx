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
package org.allbinary.graphics.paint;


class NullPaintable extends Paintable {
    private static final SINGLETON : NullPaintable = new NullPaintable();
    public function new() {
        super();
    }

    public static function getInstance() : Paintable {
        return NullPaintable.SINGLETON;
    }

}

