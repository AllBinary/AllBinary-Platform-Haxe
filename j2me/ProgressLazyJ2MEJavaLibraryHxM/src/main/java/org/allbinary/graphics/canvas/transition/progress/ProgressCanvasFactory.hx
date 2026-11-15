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

import org.allbinary.logic.string.StringUtil;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.logic.NullUtil;

class ProgressCanvasFactory {
    private static var PROGRESS_FORM_SCREEN : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : ProgressCanvas {
        if (ProgressCanvasFactory.PROGRESS_FORM_SCREEN == NullUtil.getInstance().NULL_OBJECT) {
            ProgressCanvasFactory.PROGRESS_FORM_SCREEN = new LazyProgressCanvas(StringUtil.getInstance().EMPTY_STRING, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE);
        }
        return (cast ProgressCanvasFactory.PROGRESS_FORM_SCREEN : ProgressCanvas);
    }

    public static function getLazyInstance() : PaintableInterface {
        return ProgressCanvasFactory.getInstance();
    }

    public function new() {
    }
}

