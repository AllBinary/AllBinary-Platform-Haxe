// Generated Code Do Not Modify
package org.allbinary.graphics.opengles;

//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Image;
import org.allbinary.device.LoadTextures;
import org.allbinary.device.OpenGLESGraphics;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.opengles.renderer.RendererStrings;
import org.allbinary.image.PreResourceImageUtil;
import org.allbinary.image.opengles.OpenGLESImage;
import org.allbinary.image.opengles.OpenGLImageCache;
import org.allbinary.image.opengles.OpenGLImageCacheFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.SynchObject;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class OpenGLUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : OpenGLUtil = new OpenGLUtil();
    public static function getInstance() : OpenGLUtil {
        return OpenGLUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final renderStrings : RendererStrings = RendererStrings.getInstance();
    public final canvasStrings : CanvasStrings = CanvasStrings.getInstance();
    public final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final preResourceImageUtil : PreResourceImageUtil = PreResourceImageUtil.getInstance();
    private final lockObject : SynchObject = new SynchObject();
    private final anyType : SynchObject = new SynchObject();
    private final list : BasicArrayList = new BasicArrayListD();
    public final runnableList : BasicArrayList = new BasicArrayListD();
    private var created : Bool = false;
    public function onSurfaceCreated(gl : GL10) : Void {
        try {
            if (!this.created) {
                this.created = true;
                PreLogUtil.put(CommonLabels.getInstance().START_LABEL + OpenGLCapabilities.getInstance().toString(), this, this.renderStrings.ON_SURFACE_CREATED);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.renderStrings.ON_SURFACE_CREATED, e);
        }
    }

    public function onSurfaceCreated(gl : GL10, loadTextures : LoadTextures) : Void {
        try {
            loadTextures.load(gl);
            OpenGLLogUtil.getInstance().logError(gl);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.renderStrings.ON_SURFACE_CREATED, e);
        }
    }

    private var surfaceCreatedAndInitialized : Bool = false;
    // throws Exception
    public function onSurfaceChanged(gl : GL10, graphics : OpenGLESGraphics) : Void {
        if (!this.surfaceCreatedAndInitialized) {
            graphics.init();
            this.surfaceCreatedAndInitialized = true;
        }
        graphics.update();
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        progressCanvas.update(graphics);
        ((cast OpenGLImageCacheFactory.getInstance() : OpenGLImageCache)).update(gl);
        this.processRunnables();
        this.set(gl);
    }

    public function addImage(image : Image) : Image {
        final encapsulateImage : Image = this.preResourceImageUtil.encapsulate(image);
        if (encapsulateImage != image) {
            // synchronized (this.anyType)
            {
                this.list.add(encapsulateImage);
            }
            return encapsulateImage;
        }
        return image;
    }

    public function clear() : Void {
        // synchronized (this.anyType)
        {
            this.list.clear();
        }
    }

    public function addRunnable(runnable : Runnable) : Void {
        // synchronized (this.lockObject)
        {
            if (!this.runnableList.contains(runnable)) {
                this.runnableList.add(runnable);
                this.displayInfoSingleton.add(this.canvasStrings.SCALED_IMAGES);
            }
        }
    }

    private function processRunnables() : Void {
        // synchronized (this.lockObject)
        {
            var runnable : Runnable = null;
            final size : Int = this.runnableList.size();
            for (index in 0...size) {
                runnable = (cast this.runnableList.get(index) : Runnable);
                runnable.run();
            }
            this.runnableList.clear();
        }
    }

    // throws Exception
    private function set(gl : GL10) : Void {
        final size : Int = this.list.size();
        var image : Any = null;
        for (index2 in 0...size) {
            image = this.list.get(index2);
            ((cast image : OpenGLESImage)).set(gl);
        }
    }

    public function new() {
    }
}

