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
package org.allbinary.game.tracking;

import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.util.event.AllBinaryEventCircularPool;

class TrackingEventCircularStaticPool {
    private static var instance : TrackingEventCircularStaticPool = new TrackingEventCircularStaticPool();
    public static function getInstance() : TrackingEventCircularStaticPool {
        return TrackingEventCircularStaticPool.instance;
    }

    private var EVENT_POOL : AllBinaryEventCircularPool = new AllBinaryEventCircularPool(20);
    public function init() : Void {
        this.EVENT_POOL.initAllBinaryEventCircularPool(new TrackingEventFactory());
    }

    // throws Exception
    // synchronized
    public function getNextInstance(layerInterface : AllBinaryLayer) : TrackingEvent {
        var trackingEvent : TrackingEvent = (cast this.EVENT_POOL.getNextInstance() : TrackingEvent);
        trackingEvent.setLayerInterfaceForCircularStaticPool(layerInterface);
        return trackingEvent;
    }

    public function new() {
    }
}

