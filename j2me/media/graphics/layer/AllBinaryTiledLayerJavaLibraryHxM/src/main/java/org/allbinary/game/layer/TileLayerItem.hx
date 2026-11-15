/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Screen;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.graphics.form.item.ABCustomItemInterface;
import org.allbinary.graphics.color.BasicColor;

class TileLayerItem extends ABCustomItem implements ABCustomItemInterface {
    private final tiledLayer : AllBinaryTiledLayer;
    public function new(label : String, tiledLayer : AllBinaryTiledLayer, layout : Int, altText : String, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(label, backgroundBasicColor, foregroundBasicColor);
        this.tiledLayer = tiledLayer;
    }

    public override function setOwner(owner : Screen) : Void {
    }

    public override function getMinimumWidth() : Int {
        return this.tiledLayer.getWidth();
    }

    public override function getMinimumHeight() : Int {
        return this.tiledLayer.getHeight();
    }

    public function getMinContentHeight() : Int {
        return this.tiledLayer.getHeight();
    }

    public function getMinContentWidth() : Int {
        return this.tiledLayer.getWidth();
    }

    public function getPrefContentHeight(width : Int) : Int {
        return this.tiledLayer.getHeight();
    }

    public function getPrefContentWidth(height : Int) : Int {
        return this.tiledLayer.getWidth();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.tiledLayer.setPosition(x, y, this.tiledLayer.getZP());
        this.tiledLayer.paint(graphics);
    }

    public override function paintUnselected(graphics : Graphics, x : Int, y : Int) : Void {
    }

}

