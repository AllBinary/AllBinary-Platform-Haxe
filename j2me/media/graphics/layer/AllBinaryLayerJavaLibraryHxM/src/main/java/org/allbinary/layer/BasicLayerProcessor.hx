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
package org.allbinary.layer;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicLayerProcessor {
    public static final NULL_LAYER_PROCESSOR : BasicLayerProcessor = new BasicLayerProcessor();
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public function add(layerInterface : AllBinaryLayer) : Void {
        if (!this.list.contains(layerInterface)) {
            this.list.add(layerInterface);
        }
    }

    // throws Exception
    public function process(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        throw new haxe.Exception(CommonStrings.getInstance().NOT_IMPLEMENTED);
    }

    public function getList() : BasicArrayList {
        return this.list;
    }

}

