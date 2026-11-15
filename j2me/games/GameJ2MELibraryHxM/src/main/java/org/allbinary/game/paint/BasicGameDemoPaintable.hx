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
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.graphics.paint.StatePaintable;

class BasicGameDemoPaintable extends StatePaintable {
    private final mainDemoStatePaintable : Paintable;
    private final ownershipPaintable : Paintable;
    private final helpPaintableInterface : Paintable;
    private var currentStatePaintable : Paintable = NullPaintable.getInstance();
    public function new(mainDemoStatePaintable : Paintable, ownershipPaintable : Paintable, helpPaintableInterface : Paintable) {
        super();
        this.mainDemoStatePaintable = mainDemoStatePaintable;
        this.setCurrentStatePaintable(NullPaintable.getInstance());
        this.ownershipPaintable = ownershipPaintable;
        this.helpPaintableInterface = helpPaintableInterface;
    }

    public override function setState(state : Int) : Void {
        if (state == 0) {
            this.setCurrentStatePaintable(this.getMainDemoStatePaintable());
        } else if (state == 1) {
            this.setCurrentStatePaintable(this.helpPaintableInterface);
        } else {
            this.setCurrentStatePaintable(this.ownershipPaintable);
        }
    }

    public override function paint(graphics : Graphics) : Void {
        this.getCurrentStatePaintable().paint(graphics);
    }

    public function getHelpPaintableInterface() : Paintable {
        return this.helpPaintableInterface;
    }

    public function setCurrentStatePaintable(currentStatePaintable : Paintable) : Void {
        this.currentStatePaintable = currentStatePaintable;
    }

    public function getCurrentStatePaintable() : Paintable {
        return this.currentStatePaintable;
    }

    public function getMainDemoStatePaintable() : Paintable {
        return this.mainDemoStatePaintable;
    }

}

