/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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

//import javax.microedition.lcdui.Graphics;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.layer.Layer;
import org.allbinary.layer.NamedInterface;
import org.allbinary.string.CommonStrings;

class AllBinaryTiledLayer extends Layer implements NamedInterface implements PaintableInterface {
    private var cellWidth : Int;
    private var cellHeight : Int;
    private final halfWidth : Int;
    private final halfHeight : Int;
    private final halfCellWidth : Int;
    private final halfCellHeight : Int;
    private final dataId : Null<Int>;
    public function new(dataId : Null<Int>, width : Int, height : Int, cellWidth : Int, cellHeight : Int) {
        super(0, 0);
        this.dataId = dataId;
        this.setLayerWidth(width);
        this.setLayerHeight(height);
        super.setPosition(0, 0, 0);
        this.cellWidth = cellWidth;
        this.cellHeight = cellHeight;
        this.halfWidth = (this.getWidth() >> 1);
        this.halfHeight = (this.getHeight() >> 1);
        this.halfCellWidth = (cellWidth >> 1);
        this.halfCellHeight = (cellHeight >> 1);
    }

    public function setCells(mapTwoDArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Start: r: ");
        stringBuffer.appendint(mapTwoDArray.length);
        stringBuffer.append(" c: ");
        stringBuffer.appendint(mapTwoDArray[0].length);
        stringBuffer.append(" rows: ");
        stringBuffer.appendint(this.getRows());
        stringBuffer.append(" columns: ");
        stringBuffer.appendint(this.getColumns());
        this.logUtil.putF(stringBuffer.toString(), this, "setCells");
        final rows : Int = this.getRows();
        final columns : Int = this.getColumns();
        for (col in 0...columns) {
            for (row in 0...rows) {
                this.setCell(col, row, mapTwoDArray[row][col]);
            }
        }
    }

    public function updateCells(mapTwoDArray : haxe.ds.Vector<haxe.ds.Vector<Int>>, fromTileId : Int, toTileId : Int) : Void {
        final rows : Int = this.getRows();
        final columns : Int = this.getColumns();
        for (col in 0...columns) {
            for (row in 0...rows) {
                if (fromTileId == mapTwoDArray[row][col]) {
                    mapTwoDArray[row][col] = toTileId;
                    this.setCell(col, row, mapTwoDArray[row][col]);
                }
            }
        }
    }

    public override function getName() : String {
        return Type.getClassName(Type.getClass(this));
    }

    public override function paint(graphics : Graphics) : Void {
    }

    public override function paintThreed(graphics : Graphics) : Void {
    }

    public function getX2() : Int {
        return this.x + this.getWidth();
    }

    public function getY2() : Int {
        return this.y + this.getHeight();
    }

    public function getZ2() : Int {
        return Std.int((this.z + this.getDepth()));
    }

    public function getCellWidth() : Int {
        return this.cellWidth;
    }

    public function getCellHeight() : Int {
        return this.cellHeight;
    }

    public function getCell(col : Int, row : Int) : Int {
        return -1;
    }

    public function getColumns() : Int {
        return -1;
    }

    public function getRows() : Int {
        return -1;
    }

    public function setCell(col : Int, row : Int, tileIndex : Int) : Void {
    }

    public function getHalfWidth() : Int {
        return this.halfWidth;
    }

    public function getHalfHeight() : Int {
        return this.halfHeight;
    }

    public function getDataId() : Null<Int> {
        return this.dataId;
    }

    public function getHalfCellWidth() : Int {
        return this.halfCellWidth;
    }

    public function getHalfCellHeight() : Int {
        return this.halfCellHeight;
    }

    public function isOnTileLayer(column : Int, row : Int) : Bool {
        if (this.getColumns() > column && this.getRows() > row && row >= 0 && column >= 0) {
            return true;
        } else {
            return false;
        }
    }

    public function getAnimatedTile(animationTileIndex : Int) : Int {
        return animationTileIndex;
    }

}

