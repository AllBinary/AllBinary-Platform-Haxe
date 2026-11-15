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
package org.allbinary.game.terrain;

import org.allbinary.logic.util.event.AllBinaryEventCircularPool;

class TerrainEventCircularStaticPool {
    private static final instance : TerrainEventCircularStaticPool = new TerrainEventCircularStaticPool();
    public static function getInstance() : TerrainEventCircularStaticPool {
        return TerrainEventCircularStaticPool.instance;
    }

    private var EVENT_POOL : AllBinaryEventCircularPool = new AllBinaryEventCircularPool(20);
    public function init() : Void {
        this.EVENT_POOL.initAllBinaryEventCircularPool(new TerrainEventFactory());
    }

    // throws Exception
    // synchronized
    public function getNext(basicTerrainInfo : BasicTerrainInfo) : TerrainEvent {
        var trackingEvent : TerrainEvent = (cast this.EVENT_POOL.getNextInstance() : TerrainEvent);
        trackingEvent.setBasicTerrainInfoForCircularStaticPool(basicTerrainInfo);
        return trackingEvent;
    }

    public function new() {
    }
}

