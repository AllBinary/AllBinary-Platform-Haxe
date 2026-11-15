/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.layer;

import org.allbinary.logic.NullUtil;
import org.allbinary.thread.ARunnable;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.pathfinding.MultipassState;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class MultipassWaypointPathRunnable extends WaypointPathRunnableBase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    private final multipassState : MultipassState = new MultipassState();
    private var done : Bool = false;
    private var list : BasicArrayList = this.basicArrayListUtil.getImmutableInstance();
    private var pathFindingInfo : Any = NullUtil.getInstance().NULL_OBJECT;
    // Java inner class: Haxe does not nest classes so move this to its own module
    class FirstRunnable extends ARunnable {
        private final multipassWaypointPathRunnable : MultipassWaypointPathRunnable;
        public function new(multipassWaypointPathRunnable : MultipassWaypointPathRunnable) {
            super();
            this.multipassWaypointPathRunnable = multipassWaypointPathRunnable;
        }

        public override function run() : Void {
            this.multipassWaypointPathRunnable.processFirstRunnable();
        }

    }
    private final FIRST_RUNNABLE : Runnable = new FirstRunnable(this);
    //    private boolean first = true;
    // Java inner class: Haxe does not nest classes so move this to its own module
    class SecondRunnable extends ARunnable {
        private final multipassWaypointPathRunnable : MultipassWaypointPathRunnable;
        public function new(multipassWaypointPathRunnable : MultipassWaypointPathRunnable) {
            super();
            this.multipassWaypointPathRunnable = multipassWaypointPathRunnable;
        }

        public override function run() : Void {
            this.multipassWaypointPathRunnable.processSecondRunnable();
        }

    }
    private final SECOND_RUNNABLE : Runnable = new SecondRunnable(this);
    // Java inner class: Haxe does not nest classes so move this to its own module
    class EndRunnable extends ARunnable {
        private final multipassWaypointPathRunnable : MultipassWaypointPathRunnable;
        public function new(multipassWaypointPathRunnable : MultipassWaypointPathRunnable) {
            super();
            this.multipassWaypointPathRunnable = multipassWaypointPathRunnable;
        }

        public override function run() : Void {
            this.multipassWaypointPathRunnable.processEndRunnable();
        }

    }
    private final END_RUNNABLE : Runnable = new EndRunnable(this);
    private final ALREADY_ENDED_RUNNABLE : Runnable = /* anonymous class body:
        public function run() : Void {
            throw new haxe.Exception();
        }

*/ new ARunnable();
    private var currentPassRunnable : Runnable = this.FIRST_RUNNABLE;
    public function new() {
        super();
    }

    public override function setRunning(isRunning : Bool) : Void {
        this.runningP = isRunning;
        if (this.runningP) {
            this.reset();
            this.done = false;
        }
    }

    public override function run() : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            this.currentPassRunnable.run();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            this.setRunning(false);
        }
    }

    private function reset2() : Void {
        this.multipassState.step = 0;
        this.multipassState.iteration = 0;
        this.multipassState.iteration2 = 0;
        this.pathFindingInfo = NullUtil.getInstance().NULL_OBJECT;
    }

    private function finish() : Void {
        this.reset2();
        this.currentPassRunnable = this.ALREADY_ENDED_RUNNABLE;
        this.done = true;
    }

    public override function isDone() : Bool {
        return this.done;
    }

    public override function reset() : Void {
        this.reset2();
        this.currentPassRunnable = this.FIRST_RUNNABLE;
        this.done = false;
    }

    private function processFirstRunnable() : Void {
        try {
            this.pathFindingLayer.getWaypointRunnableLogHelper().start(this.pathFindingLayer);
            this.reset2();
            final geographicMapCellPosition : GeographicMapCellPosition = this.pathFindingLayer.getCurrentGeographicMapCellPosition();
            if (geographicMapCellPosition == null) {
                throw new haxe.Exception("Should never be running here");
            }
            this.pathFindingInfo = this.targetPathFindingLayer.getWaypointBehavior().getWaypoint().getPathFindingInfo(geographicMapCellPosition);
            final localPathFindingInfo : PathFindingInfo = (cast this.pathFindingInfo : PathFindingInfo);
            this.list = this.targetPathFindingLayer.getWaypointBehavior().getWaypoint().getPathsList(geographicMapCellPosition, localPathFindingInfo, this.multipassState);
            if (this.list != this.basicArrayListUtil.getImmutableInstance()) {
                this.END_RUNNABLE.run();
            } else {
                this.currentPassRunnable = this.SECOND_RUNNABLE;
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            this.setRunning(false);
            this.finish();
        }
    }

    private function processSecondRunnable() : Void {
        try {
            final geographicMapCellPosition : GeographicMapCellPosition = this.pathFindingLayer.getCurrentGeographicMapCellPosition();
            final localPathFindingInfo : PathFindingInfo = (cast this.pathFindingInfo : PathFindingInfo);
            this.list = this.targetPathFindingLayer.getWaypointBehavior().getWaypoint().getPathsList(geographicMapCellPosition, localPathFindingInfo, this.multipassState);
            if (this.list != this.basicArrayListUtil.getImmutableInstance()) {
                this.END_RUNNABLE.run();
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            this.setRunning(false);
            this.finish();
        }
    }

    private function processEndRunnable() : Void {
        try {
            final waypointBehavior : WaypointBehaviorBase = this.pathFindingLayer.getWaypointBehavior();
            waypointBehavior.setWaypointPathsList(this.list);
            this.pathFindingLayer.getWaypointRunnableLogHelper().end(this.pathFindingLayer);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            this.setRunning(false);
        }
        this.finish();
    }

}

