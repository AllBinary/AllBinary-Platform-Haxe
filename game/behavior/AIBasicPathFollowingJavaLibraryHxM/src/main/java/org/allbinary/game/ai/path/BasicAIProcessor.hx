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
package org.allbinary.game.ai.path;

import org.allbinary.util.BasicArrayList;
import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil;
import org.allbinary.media.graphics.geography.pathfinding.GeographicMapCellPathHistoryInfo;

class BasicAIProcessor {
    private var name : String;
    private var geographicMapCellHistory : GeographicMapCellHistory;
    private var geographicMapCellPositionBasicArrayList : BasicArrayList;
    private var geographicMapCellPathHistoryInfo : GeographicMapCellPathHistoryInfo;
    private var basicAI : BasicDirectionAIHelper;
    public function new(name : String, geographicMapCellHistory : GeographicMapCellHistory, geographicMapCellPathHistoryInfo : GeographicMapCellPathHistoryInfo, chosenPathList : BasicArrayList, angleInfo : AngleInfo, seed : Int) {
        this.name = name;
        this.geographicMapCellHistory = geographicMapCellHistory;
        this.geographicMapCellPositionBasicArrayList = chosenPathList;
        this.geographicMapCellPathHistoryInfo = geographicMapCellPathHistoryInfo;
        this.setName(name);
        this.setNewPath(geographicMapCellHistory, chosenPathList);
        this.basicAI = new BasicDirectionAIHelper(this.getName(), angleInfo);
    }

    private function setNewPath(geographicMapCellHistory : GeographicMapCellHistory, chosenPathList : BasicArrayList) : Void {
        this.setGeographicMapCellHistory(geographicMapCellHistory);
        this.geographicMapCellPositionBasicArrayList = chosenPathList;
        this.init();
    }

    public function init() : Void {
        this.geographicMapCellPathHistoryInfo = new GeographicMapCellPathHistoryInfo();
        this.geographicMapCellPathHistoryInfo.setPreviousOnPathGeographicMapCellPosition((cast this.geographicMapCellPositionBasicArrayList.get(this.geographicMapCellPositionBasicArrayList.size() - 1) : GeographicMapCellPosition));
        this.geographicMapCellPathHistoryInfo.setNextOnPathGeographicMapCellPosition((cast this.geographicMapCellPositionBasicArrayList.get(this.geographicMapCellPositionBasicArrayList.size() - 1) : GeographicMapCellPosition));
        this.update();
    }

    private final geographicMapDirectionUtil : GeographicMapDirectionUtil = GeographicMapDirectionUtil.getInstance();
    // throws Exception
    private function goTowardNextChosenOnPathPosition(currentGeographicMapCellPosition : GeographicMapCellPosition) : Int {
        var keyDirection : Int = -1;
        var goToGeographicMapCellPosition : GeographicMapCellPosition = this.geographicMapCellPathHistoryInfo.getNextChosenOnPathGeographicMapCellPosition();
        var geographicMapDirectionData : Direction = this.geographicMapDirectionUtil.getDirectionFromCellPositionToAdjacentCellPosition(currentGeographicMapCellPosition, goToGeographicMapCellPosition);
        if (geographicMapDirectionData == DirectionFactory.getInstance().NOT_BORDERED_WITH) {
            geographicMapDirectionData = this.geographicMapDirectionUtil.getDirectionFromCellPositionToCellPosition(currentGeographicMapCellPosition, goToGeographicMapCellPosition);
        }
        keyDirection = this.basicAI.getAIKeyPressedFromDirection(geographicMapDirectionData);
        return keyDirection;
    }

    private function update() : Void {
        this.geographicMapCellPathHistoryInfo.setNextUnvisitedOnPathGeographicMapCellPosition(this.getGeographicMapCellHistory().getFirstUnvisited());
        this.geographicMapCellPathHistoryInfo.setNextChosenOnPathGeographicMapCellPosition(this.geographicMapCellPathHistoryInfo.getNextUnvisitedOnPathGeographicMapCellPosition());
    }

    // throws Exception
    public function processAI(myManager : AllBinaryLayerManager, currentGeographicMapCellPosition : GeographicMapCellPosition) : Int {
        var keyDirection : Int = -1;
        if (this.geographicMapCellPositionBasicArrayList.contains(currentGeographicMapCellPosition)) {
            this.update();
            keyDirection = this.goTowardNextChosenOnPathPosition(currentGeographicMapCellPosition);
            this.geographicMapCellPathHistoryInfo.setPreviousOnPathGeographicMapCellPosition(currentGeographicMapCellPosition);
        } else {
            keyDirection = this.goTowardNextChosenOnPathPosition(currentGeographicMapCellPosition);
        }
        return keyDirection;
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function getGeographicMapCellPathHistoryInfo() : GeographicMapCellPathHistoryInfo {
        return this.geographicMapCellPathHistoryInfo;
    }

    public function setGeographicMapCellPathHistoryInfo(geographicMapCellPathHistoryInfo : GeographicMapCellPathHistoryInfo) : Void {
        this.geographicMapCellPathHistoryInfo = geographicMapCellPathHistoryInfo;
    }

    public function getGeographicMapCellHistory() : GeographicMapCellHistory {
        return this.geographicMapCellHistory;
    }

    public function setGeographicMapCellHistory(geographicMapCellHistory : GeographicMapCellHistory) : Void {
        this.geographicMapCellHistory = geographicMapCellHistory;
    }

}

