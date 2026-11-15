// Generated Code Do Not Modify
package org.allbinary.game.terrain;

import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class TerrainEventListener implements TerrainEventListenerInterface {
    private final list : BasicArrayList = new BasicArrayListD();
    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public function onTerrainEvent(terrainEvent : TerrainEvent) : Void {
        this.list.clear();
        this.list.add(terrainEvent);
    }

    public function getList() : BasicArrayList {
        return this.list;
    }

    public function new() {
    }
}

