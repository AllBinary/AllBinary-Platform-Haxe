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
package org.allbinary.image;

//import java.io.InputStream;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.J2MEUtil;
import org.allbinary.TsUtil;
import org.allbinary.animation.image.LazyImageRotationAnimation;
import org.allbinary.canvas.GameGlobalsFactory;
import org.allbinary.canvas.Processor;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.canvas.ABToGBUtil;
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.game.gd.resource.GDLazyResources;
import org.allbinary.game.gd.resource.GDResources;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.system.Memory;
import org.allbinary.thread.BaseImageLoadingProcessor;
import org.allbinary.thread.ConcurrentImageLoadingProcessor;
import org.allbinary.thread.SynchObject;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.ABSystemWrapper;

class ImageCache extends ImageCacheBase {
    public static final NULL_IMAGE_CACHE : ImageCache = new ImageCache();
    private final tsUtil : TsUtil = TsUtil.getInstance();
    private final concurrentImageLoadingProcessor : BaseImageLoadingProcessor = new ConcurrentImageLoadingProcessor(this);
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final commonSeps : CommonSeps = CommonSeps.getInstance();
    public final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
    private final gameGlobalsFactory : GameGlobalsFactory = GameGlobalsFactory.getInstance();
    private final gdResources : GDResources = GDResources.getInstance();
    public final loadNowList : BasicArrayList = new BasicArrayListD();
    public final loadSoonList : BasicArrayList = new BasicArrayListD();
    public final loadList : BasicArrayList = new BasicArrayListD();
    public final loadAfterList : BasicArrayList = new BasicArrayListD();
    private final lock : SynchObject = new SynchObject();
    private var firstTime : Bool = true;
    private var totalLoaded : Int = 0;
    public var progressEnded : Bool = false;
    public var hasAnyLazyAnimationFactories : Bool = false;
    // Java inner class: Haxe does not nest classes so move this to its own module
    class NotHTMLProcessor extends Processor {
        public override function process() : Void {
            concurrentImageLoadingProcessor.runTask();
        }

        public function new() {
            super();
        }
    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class NotHTMLEndProcessor extends Processor {
        public override function process() : Void {
            final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
            progressCanvas.endIfPaintedSinceStart();
        }

        public function new() {
            super();
        }
    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class HTMLEndProcessor extends Processor {
        public override function process() : Void {
            final size : Int = gdResources.currentLayoutRequiredTotal;
            if (size == 0) {
                final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
                progressCanvas.endIfPaintedSinceStart();
            } else if (totalLoaded > Std.int(size / 12)) {
                final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
                progressCanvas.endIfPaintedSinceStart();
                endProcessor = new NotHTMLEndProcessor();
            }
        }

        public function new() {
            super();
        }
    }
    // Java inner class: Haxe does not nest classes so move this to its own module
    class FirstProcessor extends Processor {
        public override function process() : Void {
            this.firstProcess();
        }

        public function new() {
            super();
        }
    }
    private var processor : Processor = new FirstProcessor();
    private var endProcessor : Processor = Processor.getInstance();
    public function new() {
        super();
    }

    public function firstProcess() : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final isHTML : Bool = J2MEUtil.isHTML();
        if (isHTML) {
            this.processor = Processor.getInstance();
            this.endProcessor = new HTMLEndProcessor();
        } else {
            this.processor = new NotHTMLProcessor();
            this.endProcessor = new NotHTMLEndProcessor();
            try {
                this.runTask();
            } catch (e : haxe.Exception) {
                logUtil.putF(this.commonStrings.EXCEPTION, this, this.commonStrings.END_METHOD_NAME);
            }
        }
    }

    public function addListener(renderer : Any) : Void {
    }

    // throws Exception
    public function waitForLoadNow() : Void {
        if (this.firstTime) {
            final abToGBUtil : ABToGBUtil = ABToGBUtil.getInstance();
            final abCanvas : AllBinaryGameCanvas = (cast abToGBUtil.abCanvas : AllBinaryGameCanvas);
            while (this.loadNowList.isEmpty() && (!abCanvas.isInitialized() || (abCanvas.isInitialized() && this.hasAnyLazyAnimationFactories)) && !this.progressEnded) {
                Sys.sleep(haxe.Int64.toInt(120) / 1000);
            }
            this.firstTime = false;
        }
    }

    private final LOAD_IMAGE_FOR_ANIMATION : String = "Load Image Animation";
    // throws Exception
    public function loadImageForAnimation() : Void {
        var lazyImageRotationAnimation : LazyImageRotationAnimation = null;
        // synchronized (this.lock)
        {
            if (this.loadNowList.isEmpty()) {
                this.endProcessor.process();
                if (this.loadSoonList.isEmpty()) {
                    if (this.loadAfterList.isEmpty()) {
                        if (this.firstTime) {
                        } else if (this.gameGlobalsFactory.newCanvas) {
                        } else {
                            this.loadNextImage();
                        }
                        return;
                    } else {
                        lazyImageRotationAnimation = (cast this.loadAfterList.get(0) : LazyImageRotationAnimation);
                        if (this.loadImageForLazyAnimation(lazyImageRotationAnimation)) {
                            this.loadAfterList.remove(lazyImageRotationAnimation);
                        }
                    }
                } else {
                    lazyImageRotationAnimation = (cast this.loadSoonList.get(0) : LazyImageRotationAnimation);
                    if (this.loadImageForLazyAnimation(lazyImageRotationAnimation)) {
                        this.loadSoonList.remove(lazyImageRotationAnimation);
                    }
                }
                return;
            }
            lazyImageRotationAnimation = (cast this.loadNowList.get(0) : LazyImageRotationAnimation);
        }
        if (this.loadImageForLazyAnimation(lazyImageRotationAnimation)) {
            // synchronized (this.lock)
            {
                this.loadNowList.remove(lazyImageRotationAnimation);
            }
            if (lazyImageRotationAnimation.layoutIndex != 0) {
                final list : BasicArrayList = this.getAssociated(lazyImageRotationAnimation);
                // synchronized (this.lock)
                {
                    final size : Int = list.size();
                    if (size > 0) {
                        this.loadSoonList.addAllList(list);
                    }
                }
            }
            final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
            final isHTML : Bool = J2MEUtil.isHTML();
            if (this.loadNowList.isEmpty() && (!isHTML || this.firstTime)) {
                progressCanvas.endFromInitialLazyLoadingComplete();
            } else {
                if (this.totalLoaded % 10 == 0) {
                    progressCanvas.addNormalPortion(1, this.LOAD_IMAGE_FOR_ANIMATION);
                }
            }
        }
    }

    // throws Exception
    public function loadImages() : Void {
        while (!this.loadList.isEmpty() || !this.loadNowList.isEmpty()) {
            this.loadImageForAnimations();
            this.loadNextImage();
        }
    }

    // throws Exception
    public function loadImageForAnimations() : Void {
        while (!this.loadNowList.isEmpty()) {
            this.loadImageForAnimation();
        }
    }

    // throws Exception
    public function loadRemainingAnimations() : Void {
        while (!this.loadAfterList.isEmpty() || !this.loadNowList.isEmpty()) {
            while (!this.loadNowList.isEmpty()) {
                this.loadImageForAnimation();
            }
            var lazyImageRotationAnimation : LazyImageRotationAnimation = null;
            // synchronized (this.lock)
            {
                if (!this.loadAfterList.isEmpty()) {
                    lazyImageRotationAnimation = (cast this.loadAfterList.removeAt(0) : LazyImageRotationAnimation);
                }
            }
            if (lazyImageRotationAnimation != null) {
                this.loadImageForLazyAnimation(lazyImageRotationAnimation);
            }
        }
    }

    // throws Exception
    private function loadImageForLazyAnimation(lazyImageRotationAnimation : LazyImageRotationAnimation) : Bool {
        final image : Image = lazyImageRotationAnimation.animationInterfaceFactoryInterface.getImage();
        if (this.loadImage(image)) {
            lazyImageRotationAnimation.setRealAnimation();
            return true;
        }
        return false;
    }

    // throws Exception
    private function loadNextImage() : Void {
        var image : Image = null;
        // synchronized (this.lock)
        {
            if (this.loadList.size() == 0) {
                return;
            }
            image = (cast this.loadList.removeAt(0) : Image);
        }
        this.loadImage(image);
    }

    // throws Exception
    private function loadImage(image : Image) : Bool {
        if (image.isReady()) {
            return true;
        } else {
            if (image.getImage() != null) {
                if (image.setReady()) {
                    if (image.isReady()) {
                        this.totalLoaded++;
                        return true;
                    }
                }
            } else {
                final key : String = image.getName();
                final image2 : Image = this.creatImage(key);
                if (image2.isReady()) {
                    this.init(image, image2);
                    return true;
                } else {
                    image.setImage(image2.getImage());
                }
            }
        }
        return false;
    }

    // throws Exception
    public function init(image : Image, image2 : Image) : Void {
        image.init(image2.getImage());
    }

    // throws Exception
    public function creatImage(key : String) : Image {
        final inputStream : InputStream = this.resourceUtil.getResourceAsStream(key);
        final image : Image = ImageFactory.getInstance().createImageFromInputStream(inputStream);
        image.setName(key);
        return image;
    }

    // throws Exception
    public override function get(caller : String, width : Int, height : Int) : Image {
        var foundIndex : Int = this.getIndexWH(width, height);
        var image : Image = this.getFromAvailable(foundIndex, width, height);
        if (image == NullImage.NULL_IMAGE) {
            this.volume += width * height;
            if (this.volume > 32000) {
                this.tsUtil.gc();
                this.volume = 0;
            }
            image = this.createImage(caller, width, height);
            if (this.nextIndex > this.widths.length - 1) {
                if (foundIndex == -1) {
                    foundIndex = this.nextIndex;
                    this.widths[this.nextIndex] = width;
                    this.heights[this.nextIndex] = height;
                    this.nextIndex++;
                }
                this.listOfList[foundIndex].add(image);
            }
        }
        return image;
    }

    // throws Exception
    public override function getWithKey(key : Any) : Image {
        var image : Image = this.getImage(key);
        if (image == NullImage.NULL_IMAGE) {
            final inputStream : InputStream = null;
            try {
                image = this.createImageFromInputStream(key, inputStream);
            } catch (e : haxe.Exception) {
                this.logUtil.put("Exception: Trying Again After GC", this, this.commonStrings.GET, e);
                this.logUtil.putF(new StringMaker().append("InputStream: ").append(StringUtil.getInstance().toString(inputStream)).toString(), this, this.commonStrings.GET);
                this.tsUtil.gc();
                this.tsUtil.gc();
                this.logUtil.putF(Memory.getInfo(), this, this.commonStrings.GET);
                Sys.sleep(haxe.Int64.toInt(100) / 1000);
                image = this.createImageFromInputStream(key, inputStream);
            }
            this.hashtable.put(key, image);
        }
        return image;
    }

    public function getIndex(key : Any) : Int {
        final gdResources : GDResources = GDResources.getInstance();
        final resourceStringArray : haxe.ds.Vector<String> = gdResources.resourceStringArray;
        final size : Int = resourceStringArray.length;
        for (index in 0...size) {
            if (resourceStringArray[index] == key) {
                return index;
            }
        }
        this.logUtil.putF(new StringMaker().append("unable to find key: ").append(StringUtil.getInstance().toString(key)).toString(), this, this.commonStrings.RUN);
        throw new haxe.Exception();
    }

    // throws Exception
    public override function createImageFromInputStream(key : Any, inputStream : InputStream) : Image {
        final gdLazyResources : GDLazyResources = GDLazyResources.getInstance();
        var resourceStringArray : haxe.ds.Vector<String> = gdLazyResources.requiredResourcesBeforeLoadingArray;
        final size : Int = resourceStringArray.length;
        for (index in 0...size) {
            if (key == resourceStringArray[index]) {
                return this.creatImage((cast key : String));
            }
        }
        this.runTask();
        final index : Int = this.getIndex(key);
        final width : Int = gdLazyResources.imageResourceWidthArray[index];
        final height : Int = gdLazyResources.imageResourceHeightArray[index];
        final image : Image = this.createImageLater((cast key : String), width, height);
        // synchronized (this.lock)
        {
            this.loadList.add(image);
        }
        return image;
    }

    // throws Exception
    public function createImageLater(key : String, width : Int, height : Int) : Image {
        return Image.createImageLater(key, width, height);
    }

    public function getAssociated(lazyImageRotationAnimation : LazyImageRotationAnimation) : BasicArrayList {
        final list : BasicArrayList = new BasicArrayListD();
        // synchronized (this.lock)
        {
            var lazyImageRotationAnimation2 : LazyImageRotationAnimation = null;
            final size : Int = this.loadAfterList.size();
            for (index in 0...size) {
                lazyImageRotationAnimation2 = (cast this.loadAfterList.get(index) : LazyImageRotationAnimation);
                if (lazyImageRotationAnimation2.instanceId == lazyImageRotationAnimation.instanceId) {
                    list.add(lazyImageRotationAnimation2);
                }
            }
            final size2 : Int = list.size();
            for (index in 0...size2) {
                this.loadAfterList.remove(list.get(index));
            }
        }
        return list;
    }

    public function add(lazyImageRotationAnimation : LazyImageRotationAnimation) : Void {
        // synchronized (this.lock)
        {
            this.loadAfterList.add(lazyImageRotationAnimation);
        }
    }

    // throws Exception
    public function insertFirst(lazyImageRotationAnimation : LazyImageRotationAnimation) : Void {
        if (this.loadNowList.contains(lazyImageRotationAnimation)) {
        } else {
            // synchronized (this.lock)
            {
                this.loadNowList.add(lazyImageRotationAnimation);
                this.loadAfterList.remove(lazyImageRotationAnimation);
            }
        }
        this.runTask();
    }

    public function progressEnded() : Void {
        this.progressEnded = true;
    }

    // throws Exception
    public function runTask() : Void {
        this.processor.process();
    }

    public override function initProgress() : Void {
        if (this.firstTime) {
            this.firstTime = false;
        }
    }

    public function isLazy() : Bool {
        return true;
    }

}

