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

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.draw.CanvasDrawLineString;
import org.allbinary.graphics.paint.InitUpdatePaintable;

class PreGameSelectorPaintable extends InitUpdatePaintable {
    private final title : String;
    private var canvasDrawLineString : CanvasDrawLineString;
    private final preGameScrollSelectionForm : PreGameScrollSelectionForm;
    public function new(title : String, preGameScrollSelectionForm : PreGameScrollSelectionForm) {
        super();
        this.title = title;
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        this.canvasDrawLineString = new CanvasDrawLineString(displayInfo.getLastHalfWidth(), 0);
        this.preGameScrollSelectionForm = preGameScrollSelectionForm;
    }

    public override function update() : Void {
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        this.canvasDrawLineString = new CanvasDrawLineString(displayInfo.getLastHalfWidth(), 0);
    }

    public override function paint(graphics : Graphics) : Void {
        graphics.setColor(Std.int(BasicColorFactory.getInstance().WHITE));
        this.canvasDrawLineString.paint(graphics, title, 0);
        this.getPreGameSelectionForm().paint(graphics);
    }

    public function getPreGameSelectionForm() : PreGameScrollSelectionForm {
        return this.preGameScrollSelectionForm;
    }

}

