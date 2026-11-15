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
package org.allbinary.input.automation.module;

import org.allbinary.input.media.image.capture.ScreenCaptureImagesWorker;
import org.allbinary.media.image.comparison.ImageComparisonWorker;
import org.allbinary.media.image.comparison.SaveImageComparisonWorker;
import org.allbinary.media.image.comparison.motion.MotionRectanglesWorker;
import org.allbinary.media.image.comparison.motion.SaveMotionRectanglesResultsWorker;
import org.allbinary.media.image.comparison.motion.TestInputForMotionRectanglesResultsWorker;

class TestInputAutomationWorker {
    private var captureWorker : ScreenCaptureImagesWorker;
    private var imageComparisonWorker : ImageComparisonWorker = null;
    private var motionRectanglesWorker : MotionRectanglesWorker = null;
    private var changedPixelsImageComparisonResultsWorker : SaveImageComparisonWorker;
    private var saveMotionRectanglesAsImagesWorker : SaveMotionRectanglesResultsWorker;
    private var moveMouseToFirstMotionRectanglesResultsWorker : TestInputForMotionRectanglesResultsWorker;
    public function new() {
        this.captureWorker = new ScreenCaptureImagesWorker();
        this.changedPixelsImageComparisonResultsWorker = new SaveImageComparisonWorker();
        this.saveMotionRectanglesAsImagesWorker = new SaveMotionRectanglesResultsWorker();
        this.moveMouseToFirstMotionRectanglesResultsWorker = new TestInputForMotionRectanglesResultsWorker();
        this.motionRectanglesWorker.addListenerInterface(this.saveMotionRectanglesAsImagesWorker);
        this.motionRectanglesWorker.addListenerInterface(this.moveMouseToFirstMotionRectanglesResultsWorker);
        this.imageComparisonWorker.addListenerInterface(this.changedPixelsImageComparisonResultsWorker);
        this.imageComparisonWorker.addListenerInterface(this.motionRectanglesWorker);
        this.captureWorker.addListenerInterface(this.imageComparisonWorker);
    }

}

