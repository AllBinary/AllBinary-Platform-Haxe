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
package org.allbinary.game.ag.ai.scroller;

import org.allbinary.game.input.GameInput;
import org.allbinary.game.terrain.BasicTerrainInfo;
import org.allbinary.game.terrain.TerrainEvent;
import org.allbinary.game.terrain.TerrainEventCircularStaticPool;
import org.allbinary.game.terrain.TerrainEventHandler;
import org.allbinary.game.terrain.TerrainEventListener;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.math.Angle;
import org.allbinary.math.AngleFactory;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;

class TerrainPatrolAI extends PacePatrolAI {
    private final terrainEventListener : TerrainEventListener = new TerrainEventListener();
    private final DOWN : Angle = AngleFactory.getInstance().DOWN;
    private final CLIFF : BasicTerrainInfo = new BasicTerrainInfo(this.DOWN);
    public function new(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(hashtable, ownerLayerInterface, gameInput);
        TerrainEventHandler.getInstance(ownerLayerInterface).addListener(this.terrainEventListener);
        this.terrainEventListener.onTerrainEvent(TerrainEventCircularStaticPool.getInstance().getNext(this.CLIFF));
    }

    public override function update() : Void {
        super.update();
        this.changeDirectionIfCliffReached();
    }

    private function changeDirectionIfCliffReached() : Void {
        final list : BasicArrayList = this.terrainEventListener.getList();
        final size : Int = list.size();
        for (index in 0...size) {
            final terrainEvent : TerrainEvent = (cast list.removeAt(index) : TerrainEvent);
            final basicTerrainInfo : BasicTerrainInfo = terrainEvent.getBasicTerrainInfo();
            final angle : Angle = basicTerrainInfo.getAngle();
            if (angle == this.DOWN) {
                this.nextDirection();
                if (!this.isFollowLimitedByTerrain) {
                    this.logUtil.putF("Following Limited", this, "onTerrainEvent");
                    this.isFollowLimitedByTerrain = true;
                }
            }
        }
    }

}

