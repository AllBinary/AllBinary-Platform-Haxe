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
package org.allbinary.input.automation.module.actions.script.condition.processors.output;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.input.media.image.InputImageIOInterfaceFactory;
import org.allbinary.input.media.image.InputImageType;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.image.io.ImageIOInterface;
import org.allbinary.string.CommonStrings;

class ImageActionScriptOutputProcessor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public static function process(imageActionScriptOutputInterface : ImageActionScriptOutputInterface, frame : Null<haxe.Int64>) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        logUtil.putF("Start - Processing at: " + imageActionScriptOutputInterface.toString(), "ImageActionScriptOutputProcessor", commonStrings.PROCESS);
        final imageTypes : ImageTypes = imageActionScriptOutputInterface.getImageTypes();
        final vector : BasicArrayList = imageTypes.getVector();
        final size : Int = vector.size();
        for (index in 0...size) {
            var imageType : InputImageType = (cast vector.get(index) : InputImageType);
            var imageIOInterface : ImageIOInterface = InputImageIOInterfaceFactory.getInstance(imageType);
            imageIOInterface.save(frame);
        }
    }

}

