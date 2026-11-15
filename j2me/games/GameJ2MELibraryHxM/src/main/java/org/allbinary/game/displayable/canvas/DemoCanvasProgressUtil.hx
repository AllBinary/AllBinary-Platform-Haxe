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

import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.paint.PaintableComposite;
import org.allbinary.graphics.paint.PaintableInterface;

class DemoCanvasProgressUtil {
    public static function showProgress(demoCanvas : DemoCanvas) : Void {
        DemoCanvasProgressUtil.showProgressOptionallyInTheBackground(demoCanvas, false);
    }

    public static function showProgressOptionallyInTheBackground(demoCanvas : DemoCanvas, background : Bool) : Void {
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        progressCanvas.startBackground(background);
        var paintableArray : haxe.ds.Vector<PaintableInterface> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
        paintableArray[0] = progressCanvas;
        paintableArray[1] = demoCanvas.getDefaultPaintableInterface();
        demoCanvas.setDefaultPaintableInterface(new PaintableComposite(paintableArray));
        demoCanvas.setPaintableInterface(demoCanvas.getDefaultPaintableInterface());
    }

    public function new() {
    }
}

