/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

import org.allbinary.canvas.Processor;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.image.ImageCacheFactory;

class LazyProgressCanvas extends ProgressCanvas {
    public function new(title : String, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(title, backgroundBasicColor, foregroundBasicColor);
    }

    public override function start() : Void {
        super.start();
        this.hasPainted = false;
    }

    public override function end() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.END_METHOD_NAME);
            this.endActual();
            this.paintable = this.GAUGE_PAINTABLE;
            ImageCacheFactory.getInstance().runTask();
            ImageCacheFactory.getInstance().progressEnded();
        } catch (e : haxe.Exception) {
            this.logUtil.putF(this.commonStrings.EXCEPTION, this, this.commonStrings.END_METHOD_NAME);
        }
    }

    public override function inGame() : Void {
        this.inGameProcessor = Processor.getInstance();
    }

    public override function endFromInitialLazyLoadingComplete() : Void {
        super.endFromInitialLazyLoadingComplete();
        this.paintable = NullPaintable.getInstance();
    }

    public override function endIfPaintedSinceStart() : Void {
        if (this.paintable == this.GAUGE_PAINTABLE && this.hasPainted) {
            this.endFromInitialLazyLoadingComplete();
        }
    }

}

