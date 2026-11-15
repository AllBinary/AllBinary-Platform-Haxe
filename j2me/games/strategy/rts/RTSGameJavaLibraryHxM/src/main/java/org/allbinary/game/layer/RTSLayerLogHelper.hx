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

import org.allbinary.math.AngleInfo;
import org.allbinary.math.NamedAngle;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.util.BasicArrayList;

class RTSLayerLogHelper {
    private static final instance : RTSLayerLogHelper = new RTSLayerLogHelper();
    public static function getInstance() : RTSLayerLogHelper {
        return RTSLayerLogHelper.instance;
    }

    public function setClosestGeographicMapCellHistory(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, pathsList : BasicArrayList) : Void {
    }

    public function trackTo(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, nextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition, dx : Int, dy : Int, reason : String) : Void {
    }

    public function turnTo(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, dx : Int, dy : Int, angleInfo : AngleInfo, angle : Int, movementAngle : NamedAngle, evading : Bool, targetAngle : Int) : Void {
    }

    public function doneMoving(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function closeEnough(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function movingLeft(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function movingRight(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function movingUp(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function movingDown(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function currentMoveEnded(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function evade(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function rotateLeft(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function rotateRight(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function handle(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, movementAngle : NamedAngle) : Void {
    }

    public function noRotation(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function notOnPath(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, geographicMapCellHistory : GeographicMapCellHistory, currentGeographicMapCellPosition : GeographicMapCellPosition, pathList : BasicArrayList) : Void {
    }

    public function new() {
    }
}

