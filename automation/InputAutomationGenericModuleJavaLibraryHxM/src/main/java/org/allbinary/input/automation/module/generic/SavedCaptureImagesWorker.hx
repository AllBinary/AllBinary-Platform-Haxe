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
package org.allbinary.input.automation.module.generic;

//import java.awt.image.BufferedImage;
//import java.io.File;
//import javax.imageio.ImageIO;
import org.allbinary.input.automation.module.generic.configuration.profile.SavedCaptureGenericProfileDataWorkerType;
import org.allbinary.input.media.image.capture.CaptureWorkerInterface;
import org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton;
import org.allbinary.input.media.image.capture.CapturedImageWorkerResultsEvent;
import org.allbinary.input.media.image.capture.ProcessingFrameIndexFactory;
import org.allbinary.input.media.image.capture.ScreenScavangerRobot;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.number.LongUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.logic.visual.media.MediaDataFactory;
import org.allbinary.media.image.cache.BufferedImageFrameCacheable;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;

class SavedCaptureImagesWorker extends BasicEventHandler implements CaptureWorkerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private static var index : haxe.Int64;
    private var running : Bool = false;
    private var screenScavangerRobot : ScreenScavangerRobot;
    private var savedCaptureGenericProfileDataWorkerType : SavedCaptureGenericProfileDataWorkerType;
    public function new(savedCaptureGenericProfileDataWorkerType : SavedCaptureGenericProfileDataWorkerType) {
        super();
        this.savedCaptureGenericProfileDataWorkerType = savedCaptureGenericProfileDataWorkerType;
        this.screenScavangerRobot = new ScreenScavangerRobot();
        SavedCaptureImagesWorker.index = ProcessingFrameIndexFactory.next();
    }

    // throws Exception
    public function setThread(thread : Thread) : Void {
    }

    // synchronized
    public function isRunning() : Bool {
        return this.running;
    }

    // synchronized
    public function setRunning(running : Bool) : Void {
        this.running = running;
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.RUN);
            this.setRunning(true);
            var timeHelper : TimeDelayHelper = new TimeDelayHelper(1000);
            while (this.isRunning()) {
                timeHelper.setStartTimeTNT();
                var frame : Null<haxe.Int64> = index;
                var filePathStringBuffer : StringMaker = new StringMaker();
                filePathStringBuffer.append(this.savedCaptureGenericProfileDataWorkerType.getPath());
                filePathStringBuffer.append(LongUtil.fillIn(frame.toString()));
                filePathStringBuffer.append(MediaDataFactory.getInstance().JPG.getExtension());
                var filePath : String = filePathStringBuffer.toString();
                this.logUtil.putF("Loading Image File Path: " + filePath, this, this.commonStrings.RUN);
                var file : File = new File(filePath);
                if (file.isFile()) {
                    var bufferedImage : BufferedImage = ImageIO.read(file);
                    SavedCaptureImagesWorker.index++;
                    CapturedBufferedImagesCacheSingleton.getInstance().add(new BufferedImageFrameCacheable(bufferedImage, frame));
                    var capturedImageEvent : CapturedImageWorkerResultsEvent = new CapturedImageWorkerResultsEvent(this, frame, bufferedImage);
                    this.fireEvent(capturedImageEvent);
                } else {
                    this.logUtil.putF("Could Not Load File: " + filePath, this, this.commonStrings.RUN);
                }
                this.logUtil.putF(CommonLabels.getInstance().ELAPSED + timeHelper.getElapsedTNT(), this, this.commonStrings.RUN);
                this.setRunning(false);
            }
            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

}

