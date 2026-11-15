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
package org.allbinary.layer;

import javax.microedition.lcdui.Graphics;

class NullLayer extends Layer {
    private static final instance : NullLayer = new NullLayer();
    public static function getInstance() : NullLayer {
        return NullLayer.instance;
    }

    public function new() {
        super(0, 0);
    }

    public override function paint(graphics : Graphics) : Void {
    }

}

