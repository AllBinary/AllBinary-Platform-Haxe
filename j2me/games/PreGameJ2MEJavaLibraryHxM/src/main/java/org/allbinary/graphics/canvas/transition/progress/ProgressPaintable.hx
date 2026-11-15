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
package org.allbinary.graphics.canvas.transition.progress;

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.paint.Paintable;

class ProgressPaintable extends Paintable {
    private final progressCanvas : ProgressCanvas;
    public function new(progressCanvas : ProgressCanvas) {
        super();
        this.progressCanvas = progressCanvas;
    }

    public override function paint(graphics : Graphics) : Void {
        this.progressCanvas.paint2(graphics);
    }

}

