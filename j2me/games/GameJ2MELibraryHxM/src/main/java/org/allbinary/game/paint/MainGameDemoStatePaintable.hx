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
package org.allbinary.game.paint;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.paint.Paintable;

class MainGameDemoStatePaintable extends Paintable {
    private final ownershipPaintableInterface : Paintable;
    private final menuPaintableInterface : Paintable;
    public function new(ownershipPaintableInterface : Paintable, menuPaintableInterface : Paintable) {
        super();
        this.ownershipPaintableInterface = ownershipPaintableInterface;
        this.menuPaintableInterface = menuPaintableInterface;
    }

    public override function paint(graphics : Graphics) : Void {
        this.menuPaintableInterface.paint(graphics);
        this.ownershipPaintableInterface.paint(graphics);
    }

    public function getOwnershipPaintableInterface() : Paintable {
        return this.ownershipPaintableInterface;
    }

    public function getMenuPaintableInterface() : Paintable {
        return this.menuPaintableInterface;
    }

}

