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
package org.allbinary.game.layer.geographic.map;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.graphics.Anchor;
import org.allbinary.image.PaintableToImageUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.view.ViewPositionBase;

class ImageMiniMapLayer extends MiniMapLayer {
    private var image : Image = NullImage.NULL_IMAGE;
    public function new(geographicMapInterface : BasicGeographicMap, viewPosition : ViewPositionBase) {
        super(geographicMapInterface, viewPosition);
    }

    // throws Exception
    public override function init() : Void {
        var aWidth : Int = this.allBinaryTiledLayer.getWidth();
        var aHeight : Int = this.allBinaryTiledLayer.getHeight();
        this.image = PaintableToImageUtil.getImage(this.allBinaryTiledLayer, aWidth, aHeight);
    }

    private var anchor : Int = Anchor.TOP_LEFT;
    public override function paint(graphics : Graphics) : Void {
        graphics.drawImage(this.image, this.x, this.y, this.anchor);
        this.paintDots(graphics);
    }

}

