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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.CircularIndexUtil;
import org.allbinary.game.layer.geographic.map.LayerCoveringCellPositionsUtil;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.CellPositionsUtil;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.util.BasicArrayListS;
import org.allbinary.util.BasicArrayListUtil;

class GeographicMapCellPositionArea extends GeographicMapCellPositionAreaBase {
    private final cellPositionsUtil : CellPositionsUtil = CellPositionsUtil.getInstance();
    private final layerCoveringCellPositionsUtil : LayerCoveringCellPositionsUtil = LayerCoveringCellPositionsUtil.getInstance();
    private final reusableOccupyingGeographicMapCellPositionList : BasicArrayList = new BasicArrayListS(4);
    private final reusableSurroundingGeographicMapCellPositionList : BasicArrayList = new BasicArrayListS(12);
    private final surroundingCircularIndexUtil : CircularIndexUtil = CircularIndexUtil.createInstance(0);
    private final layerInterface : AllBinaryLayer;
    private var LIST : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    private var occupyingGeographicMapCellPositionList : BasicArrayList = this.LIST;
    private var surroundingGeographicMapCellPositionList : BasicArrayList = this.LIST;
    public function new(layerInterface : AllBinaryLayer) {
        super();
        this.layerInterface = layerInterface;
    }

    // throws Exception
    public override function update(geographicMapInterface : BasicGeographicMap) : Void {
        this.occupyingGeographicMapCellPositionList = this.layerCoveringCellPositionsUtil.getAllXY(geographicMapInterface, this.layerInterface, this.layerInterface.getXP(), this.layerInterface.getYP(), this.reusableOccupyingGeographicMapCellPositionList);
        this.surroundingGeographicMapCellPositionList = this.cellPositionsUtil.getAllSurrounding(geographicMapInterface, this.occupyingGeographicMapCellPositionList, this.reusableSurroundingGeographicMapCellPositionList);
        this.surroundingCircularIndexUtil.setSize(this.surroundingGeographicMapCellPositionList.size());
    }

    public override function getOccupyingGeographicMapCellPositionList() : BasicArrayList {
        return this.occupyingGeographicMapCellPositionList;
    }

    public override function getSurroundingGeographicMapCellPositionList() : BasicArrayList {
        return this.surroundingGeographicMapCellPositionList;
    }

    public override function getNextSurroundingGeographicMapCellPosition() : GeographicMapCellPosition {
        final geographicMapCellPosition : GeographicMapCellPosition = (cast this.surroundingGeographicMapCellPositionList.get(this.surroundingCircularIndexUtil.getIndex()) : GeographicMapCellPosition);
        this.surroundingCircularIndexUtil.next();
        return geographicMapCellPosition;
    }

}

