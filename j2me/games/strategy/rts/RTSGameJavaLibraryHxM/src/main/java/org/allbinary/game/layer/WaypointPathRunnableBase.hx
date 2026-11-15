/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.math.LayerDistanceUtil;
import org.allbinary.thread.PriorityRunnable;
import org.allbinary.thread.RunnableInterface;

class WaypointPathRunnableBase implements RunnableInterface implements PriorityRunnable {
    private final layerDistanceUtil : LayerDistanceUtil = LayerDistanceUtil.getInstance();
    public var pathFindingLayer : PathFindingLayerInterface = NullPathFindingLayer.NULL_PATH_FINDING_LAYER;
    public var targetPathFindingLayer : PathFindingLayerInterface = NullPathFindingLayer.NULL_PATH_FINDING_LAYER;
    public var priorityP : Int = Integer.MAX_VALUE;
    public var runningP : Bool = false;
    public function isRunning() : Bool {
        return this.runningP;
    }

    public function setRunning(isRunning : Bool) : Void {
        this.runningP = isRunning;
    }

    // throws Exception
    public function setThread(thread : Thread) : Void {
    }

    public function setTargetLayer(waypointLayer : PathFindingLayerInterface) : Void {
        this.targetPathFindingLayer = waypointLayer;
        this.setPriority();
    }

    public function setPriority() : Void {
        final pathFindingLayer : AllBinaryLayer = (cast this.pathFindingLayer : AllBinaryLayer);
        final targetLayer : AllBinaryLayer = (cast this.targetPathFindingLayer : AllBinaryLayer);
        if (targetLayer != null) {
            final distance : Int = this.layerDistanceUtil.getDistance(targetLayer, pathFindingLayer);
            final distanceCategory : Int = Std.int(distance / 70);
            this.priorityP = distanceCategory;
        }
    }

    public function getTargetLayer() : PathFindingLayerInterface {
        return this.targetPathFindingLayer;
    }

    public function setUnitLayer(unitLayer : PathFindingLayerInterface) : Void {
        this.pathFindingLayer = unitLayer;
    }

    public function getPriority() : Int {
        return this.priorityP;
    }

    public function isDone() : Bool {
        return true;
    }

    public function run() : Void {
    }

    public function reset() : Void {
    }

    public function new() {
    }
}

