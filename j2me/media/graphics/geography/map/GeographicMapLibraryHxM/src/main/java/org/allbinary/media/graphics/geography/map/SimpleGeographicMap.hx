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
package org.allbinary.media.graphics.geography.map;

import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.string.CommonStrings;

class SimpleGeographicMap {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final id : Null<Int>;
    private final name : String;
    public final cellTypeIdToGeographicMapCellType : haxe.ds.Vector<Int>;
    private final tiledLayer : AllBinaryTiledLayer;
    private var foregroundBasicColor : BasicColor = BasicColorFactory.getInstance().NULL_COLOR;
    private var backgroundBasicColor : BasicColor = BasicColorFactory.getInstance().NULL_COLOR;
    public function new(id : Null<Int>, name : String, cellTypeIdToGeographicMapCellType : haxe.ds.Vector<Int>, tiledLayer : AllBinaryTiledLayer, foregroundBasicColor : BasicColor, backgroundBasicColor : BasicColor) {
        this.id = id;
        this.name = name;
        this.cellTypeIdToGeographicMapCellType = cellTypeIdToGeographicMapCellType;
        this.tiledLayer = tiledLayer;
        this.setBackgroundBasicColor(backgroundBasicColor);
        this.setForegroundBasicColor(foregroundBasicColor);
    }

    public function getId() : Null<Int> {
        return this.id;
    }

    public function getName() : String {
        return this.name;
    }

    public function reset() : Void {
    }

    public function getAllBinaryTiledLayer() : AllBinaryTiledLayer {
        return this.tiledLayer;
    }

    private final geographicMapCellTypeFactory : GeographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance();
    // throws Exception
    public function getCellTypeAt(cellPosition : GeographicMapCellPosition) : GeographicMapCellType {
        final i_column : Int = cellPosition.getColumn();
        final i_row : Int = cellPosition.getRow();
        var cellTypeId : Int = this.tiledLayer.getCell(i_column, i_row);
        if (cellTypeId < 0) {
            cellTypeId = this.tiledLayer.getAnimatedTile(cellTypeId);
        }
        return this.geographicMapCellTypeFactory.get(this.cellTypeIdToGeographicMapCellType[cellTypeId]);
    }

    public function getCellTypeFromMapCellTypeInt(cellTypeId : Int) : Int {
        return this.cellTypeIdToGeographicMapCellType[cellTypeId];
    }

    public function getForegroundBasicColor() : BasicColor {
        return this.foregroundBasicColor;
    }

    private function setForegroundBasicColor(foregroundBasicColor : BasicColor) : Void {
        this.foregroundBasicColor = foregroundBasicColor;
    }

    public function getBackgroundBasicColor() : BasicColor {
        return this.backgroundBasicColor;
    }

    private function setBackgroundBasicColor(backgroundBasicColor : BasicColor) : Void {
        this.backgroundBasicColor = backgroundBasicColor;
    }

}

