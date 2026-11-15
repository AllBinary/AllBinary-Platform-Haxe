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
package org.allbinary.game.displayable.canvas;

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.NullCanvas;
import javax.microedition.lcdui.NullImage;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.graphics.paint.ProcessPaintable;
import org.allbinary.util.CircularIndexUtil;

class BufferedGameCanvasPaintHelper extends ProcessPaintable {
    private var gameCanvas : Canvas = NullCanvas.NULL_CANVAS;
    private static final MAX_IMAGES : Int = 4;
    private final offScreenImage : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...BufferedGameCanvasPaintHelper.MAX_IMAGES) null]);
    private var previousImage : Image = NullImage.NULL_IMAGE;
    private final circularIndexUtil : CircularIndexUtil = CircularIndexUtil.createInstance(BufferedGameCanvasPaintHelper.MAX_IMAGES);
    private final drawCircularIndexUtil : CircularIndexUtil = CircularIndexUtil.createInstanceAt(BufferedGameCanvasPaintHelper.MAX_IMAGES - 1, BufferedGameCanvasPaintHelper.MAX_IMAGES);
    public function new(gameCanvas : AllBinaryGameCanvas) {
        super();
        throw new jre.lang.JavaException("No Longer Used");
    }

    public override function process() : Void {
        final myCanvas : MyCanvas = ((cast this.gameCanvas : MyCanvas));
        myCanvas.draw(this.offScreenImage[this.circularIndexUtil.getIndex()].getGraphics());
        this.circularIndexUtil.next();
        this.drawCircularIndexUtil.next();
    }

    private var anchor : Int = Anchor.TOP_LEFT;
    public override function paint(graphics : Graphics) : Void {
        this.previousImage = this.offScreenImage[this.drawCircularIndexUtil.getIndex()];
        graphics.drawImage(this.previousImage, 0, 0, this.anchor);
    }

}

