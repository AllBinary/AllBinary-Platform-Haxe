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
package org.allbinary.media.graphics.geography.map.racetrack;

//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.graphics.CellPosition;
import org.allbinary.logic.NullUtil;

class RaceTrackData {
    private var tileSetImage : Image = NullImage.NULL_IMAGE;
    private var miniTileSetImage : Image = NullImage.NULL_IMAGE;
    private var cellWidth : Int = 0;
    private var cellHeight : Int = 0;
    private var miniCellWidth : Int = 0;
    private var miniCellHeight : Int = 0;
    private var mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>> = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY;
    private var cellTypeIdToGeographicMapCellTypeArray : haxe.ds.Vector<Int> = NullUtil.getInstance().NULL_INT_ARRAY;
    private var NO_OVER_PASSES_ARRAY : haxe.ds.Vector<CellPosition> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    private var overPassGeographicMapCellPositionArray : haxe.ds.Vector<CellPosition> = this.NO_OVER_PASSES_ARRAY;
    private var id : Null<Int>;
    public function new(id : Null<Int>, cellWidth : Int, cellHeight : Int, miniCellWidth : Int, miniCellHeight : Int, cellTypeIdToGeographicMapCellTypeArray : haxe.ds.Vector<Int>, mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) {
        this.id = id;
        this.cellWidth = cellWidth;
        this.cellHeight = cellHeight;
        this.miniCellWidth = miniCellWidth;
        this.miniCellHeight = miniCellHeight;
        this.mapArray = mapArray;
        this.cellTypeIdToGeographicMapCellTypeArray = cellTypeIdToGeographicMapCellTypeArray;
    }

    public function setMapArray(mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) : Void {
        this.mapArray = mapArray;
    }

    public function getMapArray() : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        return this.mapArray;
    }

    public function setCellTypeIdToGeographicMapCellTypeArray(cellTypeIdToGeographicMapCellTypeArray : haxe.ds.Vector<Int>) : Void {
        this.cellTypeIdToGeographicMapCellTypeArray = cellTypeIdToGeographicMapCellTypeArray;
    }

    public function getCellTypeIdToGeographicMapCellTypeArray() : haxe.ds.Vector<Int> {
        return this.cellTypeIdToGeographicMapCellTypeArray;
    }

    private function setCellWidth(cellWidth : Int) : Void {
        this.cellWidth = cellWidth;
    }

    public function getCellWidth() : Int {
        return this.cellWidth;
    }

    private function setCellHeight(cellHeight : Int) : Void {
        this.cellHeight = cellHeight;
    }

    public function getCellHeight() : Int {
        return this.cellHeight;
    }

    public function getOverPassGeographicMapCellPositionArray() : haxe.ds.Vector<CellPosition> {
        return this.overPassGeographicMapCellPositionArray;
    }

    public function setOverPassGeographicMapCellPositionArray(overPassGeographicMapCellPositionArray : haxe.ds.Vector<CellPosition>) : Void {
        this.overPassGeographicMapCellPositionArray = overPassGeographicMapCellPositionArray;
    }

    public function getTileSetImage() : Image {
        return this.tileSetImage;
    }

    public function setTileSetImage(tileSetImage : Image) : Void {
        this.tileSetImage = tileSetImage;
    }

    public function getMiniTileSetImage() : Image {
        return this.miniTileSetImage;
    }

    public function setMiniTileSetImage(miniTileSetImage : Image) : Void {
        this.miniTileSetImage = miniTileSetImage;
    }

    public function getMiniCellWidth() : Int {
        return this.miniCellWidth;
    }

    public function setMiniCellWidth(miniCellWidth : Int) : Void {
        this.miniCellWidth = miniCellWidth;
    }

    public function getMiniCellHeight() : Int {
        return this.miniCellHeight;
    }

    public function setMiniCellHeight(miniCellHeight : Int) : Void {
        this.miniCellHeight = miniCellHeight;
    }

    public function setId(id : Null<Int>) : Void {
        this.id = id;
    }

    public function getId() : Null<Int> {
        return this.id;
    }

}

