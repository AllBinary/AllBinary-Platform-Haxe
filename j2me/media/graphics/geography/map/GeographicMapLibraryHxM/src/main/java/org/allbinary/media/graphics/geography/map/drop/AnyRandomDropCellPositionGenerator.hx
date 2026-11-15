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
package org.allbinary.media.graphics.geography.map.drop;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.NullUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;

class AnyRandomDropCellPositionGenerator extends BaseDropCellPositionGenerator {
    public final list : BasicArrayList = new BasicArrayListD();
    public var geographicMapInterface : Any = NullUtil.getInstance().NULL_OBJECT;
    // throws Exception
    public override function update(allBinaryGameLayerManager : AllBinaryGameLayerManager, geographicMapInterface : BasicGeographicMap) : Void {
        this.geographicMapInterface = geographicMapInterface;
        final basicGeographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
        final randomFactory : MyRandomFactory = MyRandomFactory.getInstance();
        final tiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        final total : Int = tiledLayer.getColumns() * tiledLayer.getRows();
        var randomColumn : Int = 0;
        var randomRow : Int = 0;
        var geographicMapCellPosition : GeographicMapCellPosition = null;
        {
            var index : Int = total;
            while (--index >= 0) {
            randomColumn = randomFactory.getAbsoluteNextInt(tiledLayer.getColumns());
            randomRow = randomFactory.getAbsoluteNextInt(tiledLayer.getRows());
            geographicMapCellPosition = basicGeographicMapCellPositionFactory.getAt(randomColumn, randomRow);
            if (this.isDropAllowedAt(geographicMapCellPosition)) {
                this.list.add(geographicMapCellPosition);
            }
            }
        }
    }

    // throws Exception
    public override function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
    }

    public function new() {
        super();
    }
}

