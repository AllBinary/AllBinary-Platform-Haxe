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
package org.allbinary.input.automation.module.game.test;

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.input.automation.module.AbstractInputAutomationWorker;
import org.allbinary.input.automation.module.InputAutomationActionInterface;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript;
import org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.cache.J2SECacheInterface;
import org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface;
import org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface;

class TestInputAutomationCaptureWorker extends AbstractInputAutomationWorker {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var genericProfileActions : GenericProfileActions = null;
    private final MESSAGE : String = "GenericInputAutomationCaptureWorker";
    private final PROCESS_DATA_WORKER_RESULTS : String = "processDataWorkerResults";
    private final IMAGE_AVAILABLE_SO_PROCESSING : String = "Image Available so processing";
    private final IMAGE_NOT_AVAILABLE : String = "Image Not Available";
    public function new(inputAutomationActionInterface : InputAutomationActionInterface, genericProfileActions : GenericProfileActions, imageComparatorConstraintsInterface : ImageComparatorConstraintsInterface, motionRectangleConstraintsInterface : MotionRectangleConstraintsInterface) {
        super(inputAutomationActionInterface);
        this.logUtil.putF(this.MESSAGE, this, this.commonStrings.CONSTRUCTOR);
        this.setGenericProfileActions(genericProfileActions);
    }

    // throws Exception
    public function processDataWorkerResults() : Void {
        final cacheInterface : J2SECacheInterface = (cast CapturedBufferedImagesCacheSingleton.getInstance() : J2SECacheInterface);
        if (cacheInterface.keySet().size() > 0) {
            this.logUtil.putF(this.IMAGE_AVAILABLE_SO_PROCESSING, this, this.PROCESS_DATA_WORKER_RESULTS);
            var anyType : Any = cacheInterface.keySet().toArray()[0];
            var hashMap : HashMap = this.getGenericProfileActions().getHashMap();
            var set : Set = hashMap.keySet();
            final actionNameArray : haxe.ds.Vector<Any> = set.toArray();
            final size : Int = actionNameArray.length;
            for (index in 0...size) {
                var actionNameString : String = (cast actionNameArray[index] : String);
                var genericProfileAction : GenericProfileAction = (cast hashMap.get(actionNameString) : GenericProfileAction);
                var genericProfileActionScript : GenericProfileActionScript = genericProfileAction.getGenericProfileActionScript();
                var vector : BasicArrayList = genericProfileActionScript.getProfileActionConditionInterfaceVector();
            }
            cacheInterface.get(anyType);
        } else {
            this.logUtil.putF(this.IMAGE_NOT_AVAILABLE, this, this.PROCESS_DATA_WORKER_RESULTS);
        }
    }

    // throws Exception
    public function process() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.PROCESS);
        this.startDataWorkers();
        this.processDataWorkerResults();
    }

    public function getGenericProfileActions() : GenericProfileActions {
        return this.genericProfileActions;
    }

    public function setGenericProfileActions(genericProfileActions : GenericProfileActions) : Void {
        this.genericProfileActions = genericProfileActions;
    }

}

