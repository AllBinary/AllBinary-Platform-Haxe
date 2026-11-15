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
package org.allbinary.thread;

import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.image.ImageCache;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class ConcurrentImageLoadingProcessor extends BaseImageLoadingProcessor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    // Java inner class: Haxe does not nest classes so move this to its own module
    class ImageCacheRunnable extends ABRunnable {
        private final imageCache : ImageCache;
        public function new(imageCache : ImageCache) {
            super();
            this.imageCache = imageCache;
        }

        public override function run() : Void {
            final logUtil : LogUtil = LogUtil.getInstance();
            try {
                this.setRunning(true);
                this.imageCache.waitForLoadNow();
                this.imageCache.loadImages();
                this.imageCache.loadRemainingAnimations();
                this.setRunning(false);
                final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
                if (!progressCanvas.inProgress) {
                    progressCanvas.endFromInitialLazyLoadingComplete();
                }
            } catch (e : haxe.Exception) {
                this.setRunning(false);
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            }
        }

    }
    private final runnable : ABRunnable;
    public function new(imageCache : ImageCache) {
        super();
        this.runnable = new ImageCacheRunnable(imageCache);
    }

    public override function runTask() : Void {
        if (!this.runnable.isRunning()) {
            ImageThreadPool.getInstance().runTask(this.runnable);
        }
    }

}

