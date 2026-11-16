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

import javax.microedition.lcdui.Canvas;
import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionCompositeInterface;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.tracking.TrackingEvent;
import org.allbinary.game.tracking.TrackingEventHandler;
import org.allbinary.game.tracking.TrackingEventListenerInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.LayerInterface;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class PacePatrolAI extends BasePatrolAI implements TrackingEventListenerInterface {
    private var trackingList : BasicArrayList;
    private var firingDistance : Int = 0;
    public var isFollowLimitedByTerrain : Bool = false;
    public function new(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(hashtable, ownerLayerInterface, gameInput);
        TrackingEventHandler.getInstance().addListenerInterface(this);
        this.trackingList = new BasicArrayListD();
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        this.update();
        final direction : Direction = this.setFiringDirectionForTargetIfInRange();
        final directionFactory : DirectionFactory = DirectionFactory.getInstance();
        if (direction == directionFactory.LEFT) {
            if (this.lastKeyDirection != keyDirection || !this.isFollowLimitedByTerrain) {
                super.processKeyAI(Canvas.LEFT);
            }
            keyDirection = Canvas.LEFT;
            this.lastKeyDirection = keyDirection;
            xTotalDistance = 0;
            super.processKeyAI(Canvas.KEY_NUM1);
        } else if (direction == directionFactory.RIGHT) {
            if (this.lastKeyDirection != keyDirection || !this.isFollowLimitedByTerrain) {
                super.processKeyAI(Canvas.RIGHT);
            }
            keyDirection = Canvas.RIGHT;
            this.lastKeyDirection = keyDirection;
            xTotalDistance = 0;
            super.processKeyAI(Canvas.KEY_NUM1);
        } else {
            super.processKeyAI(this.keyDirection);
        }
    }

    private function setFiringDirectionForTargetIfInRange() : Direction {
        final directionFactory : DirectionFactory = DirectionFactory.getInstance();
        final ownerLayerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
        var direction : Direction = directionFactory.NOT_BORDERED_WITH;
        var lastTrackingEvent : TrackingEvent = null;
        var lastTrackingLayerInterface : LayerInterface = null;
        var directionCompositeInterface : DirectionCompositeInterface = null;
        final size : Int = this.trackingList.size();
        for (index in 0...size) {
            lastTrackingEvent = (cast this.trackingList.get(0) : TrackingEvent);
            lastTrackingLayerInterface = lastTrackingEvent.getLayerInterface();
            var x : Int = lastTrackingLayerInterface.getXP();
            var y : Int = lastTrackingLayerInterface.getYP();
            var yDistance : Int = ownerLayerInterface.getYP() - y - ownerLayerInterface.getHeight();
            var xDistance : Int = ownerLayerInterface.getXP() - x - ownerLayerInterface.getWidth();
            var absXDistance : Int = jre.lang.JavaMath.abs(xDistance);
            var absYDistance : Int = jre.lang.JavaMath.abs(yDistance);
            if (absYDistance <= 100) {
                if (absXDistance < Std.int(getFiringDistance() / 2)) {
                    directionCompositeInterface = (cast this.getOwnerLayerInterface() : DirectionCompositeInterface);
                    if (xDistance < 0 && directionCompositeInterface.getDirection() == directionFactory.RIGHT) {
                        direction = directionFactory.RIGHT;
                    } else if (xDistance > 0 && directionCompositeInterface.getDirection() == directionFactory.LEFT) {
                        direction = directionFactory.LEFT;
                    }
                }
            }
        }
        return direction;
    }

    public override function disable() : Void {
    }

    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public function onMovement(trackingEvent : TrackingEvent) : Void {
        this.trackingList.clear();
        this.trackingList.add(trackingEvent);
    }

    public function getFiringDistance() : Int {
        return this.firingDistance;
    }

    public function setFiringDistance(firingDistance : Int) : Void {
        this.firingDistance = firingDistance;
    }

}

