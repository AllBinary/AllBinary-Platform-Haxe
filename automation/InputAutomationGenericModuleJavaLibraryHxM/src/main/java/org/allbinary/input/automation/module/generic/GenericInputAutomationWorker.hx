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

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.input.automation.module.AbstractInputAutomationWorker;
import org.allbinary.input.automation.module.InputAutomationActionInterface;
import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile;
import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript;
import org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.cache.J2SECacheInterface;
import org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface;
import org.allbinary.media.image.comparison.ImageComparisonWorker;
import org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface;
import org.allbinary.media.image.comparison.motion.MotionRectanglesWorker;

class GenericInputAutomationWorker extends AbstractInputAutomationWorker {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final PROCESS_DATA_WORKER_RESULTS : String = "processDataWorkerResults";
    private var lastFrame : Null<haxe.Int64> = -1;
    private var frame : Null<haxe.Int64> = null;
    private var genericProfile : GenericProfile = null;
    public function new(inputAutomationActionInterface : InputAutomationActionInterface, genericProfile : GenericProfile, motionRectangleConstraintsInterface : MotionRectangleConstraintsInterface, imageComparatorConstraintsInterface : ImageComparatorConstraintsInterface) {
        super(inputAutomationActionInterface);
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.setCaptureWorker(GenericProfileCaptureWorkerFactory.getInstance(genericProfile));
        this.setInputAutomationActionInterface(inputAutomationActionInterface);
        this.setImageComparisonWorker(new ImageComparisonWorker(imageComparatorConstraintsInterface));
        this.setMotionRectanglesWorker(new MotionRectanglesWorker(motionRectangleConstraintsInterface));
        this.setGenericProfile(genericProfile);
        final vector : BasicArrayList = this.getGenericProfile().getGenericProfileDataWorkerTypeVector();
        final size : Int = vector.size();
        for (index in 0...size) {
            final genericProfileDataWorkerType : GenericProfileDataWorkerType = (cast vector.get(index) : GenericProfileDataWorkerType);
            this.logUtil.putF("Adding Listener: " + genericProfileDataWorkerType, this, this.commonStrings.CONSTRUCTOR);
            if (genericProfileDataWorkerType == GenericProfileDataWorkerType.COMPARISON) {
                this.getCaptureWorker().addListenerInterface(this.getImageComparisonWorker());
            } else if (genericProfileDataWorkerType == GenericProfileDataWorkerType.MOTION) {
                this.getImageComparisonWorker().addListenerInterface(this.getMotionRectanglesWorker());
            }
        }
    }

    // throws Exception
    public function processDataWorkerResults() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.PROCESS_DATA_WORKER_RESULTS);
        this.waitForDataWorkers();
        final cacheInterface : J2SECacheInterface = (cast CapturedBufferedImagesCacheSingleton.getInstance() : J2SECacheInterface);
        final keyArray : haxe.ds.Vector<Any> = cacheInterface.keySet().toArray();
        if (keyArray.length > 0) {
            this.logUtil.putF("Image Available", this, this.PROCESS_DATA_WORKER_RESULTS);
            this.setFrame((cast keyArray[keyArray.length - 1] : Null<haxe.Int64>));
            if (getFrame() > this.lastFrame) {
                this.logUtil.putF("Processing new frame: " + getFrame(), this, this.PROCESS_DATA_WORKER_RESULTS);
                final hashMap : HashMap = this.getGenericProfile().getGenericProfileActions().getHashMap();
                final set : Set = hashMap.keySet();
                this.logUtil.putF("Processing " + set.size() + "Actions", this, this.PROCESS_DATA_WORKER_RESULTS);
                final actionNameArray : haxe.ds.Vector<Any> = set.toArray();
                final size : Int = actionNameArray.length;
                for (index in 0...size) {
                    var actionNameString : String = (cast actionNameArray[index] : String);
                    this.logUtil.putF("Processing Action: " + actionNameString, this, this.PROCESS_DATA_WORKER_RESULTS);
                    final genericProfileAction : GenericProfileAction = (cast hashMap.get(actionNameString) : GenericProfileAction);
                    final genericProfileActionScript : GenericProfileActionScript = genericProfileAction.getGenericProfileActionScript();
                    final vector : BasicArrayList = genericProfileActionScript.getProfileActionConditionInterfaceVector();
                    CaptureWorkerUtil.processProfileActionConditions(vector, getFrame());
                }
                this.lastFrame = this.getFrame();
            }
        } else {
            this.logUtil.putF("Image Not Available", this, this.PROCESS_DATA_WORKER_RESULTS);
        }
    }

    // throws Exception
    public function process() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.PROCESS);
        this.startDataWorkers();
        this.processDataWorkerResults();
    }

    public function getGenericProfile() : GenericProfile {
        return this.genericProfile;
    }

    public function setGenericProfile(genericProfile : GenericProfile) : Void {
        this.genericProfile = genericProfile;
    }

    public function getFrame() : Null<haxe.Int64> {
        return this.frame;
    }

    public function setFrame(frame : Null<haxe.Int64>) : Void {
        this.frame = frame;
    }

}

