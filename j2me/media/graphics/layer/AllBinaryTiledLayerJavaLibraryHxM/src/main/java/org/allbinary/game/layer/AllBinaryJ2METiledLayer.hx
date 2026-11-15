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

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.game.TiledLayer;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;

class AllBinaryJ2METiledLayer extends AllBinaryTiledLayer {
    public final tiledLayerP : TiledLayer;
    public final debugColor : Int;
    public function new(dataId : Null<Int>, tiledLayer : TiledLayer, mapTwoDArray : haxe.ds.Vector<haxe.ds.Vector<Int>>, debugColor : Int) {
        super(dataId, tiledLayer.getWidth(), tiledLayer.getHeight(), tiledLayer.getCellWidth(), tiledLayer.getCellHeight());
        this.tiledLayerP = tiledLayer;
        this.debugColor = debugColor;
        this.setCells(mapTwoDArray);
    }

    public override function paint(graphics : Graphics) : Void {
        this.tiledLayerP.paint(graphics);
    }

    public final font2 : Font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, 4);
    public function paintDebug(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        graphics.setFont(this.font2);
        graphics.setColor(this.debugColor);
        var x : Int = this.tiledLayerP.getX();
        var y : Int = this.tiledLayerP.getY();
        var firstColumn : Int = 0;
        var firstRow : Int = 0;
        final totalColumns : Int = this.tiledLayerP.getColumns();
        final totalRows : Int = this.tiledLayerP.getRows();
        var x0 : Int = x;
        var tile : Int = 0;
        final tileHeight : Int = this.tiledLayerP.getCellHeight();
        final tileWidth : Int = this.tiledLayerP.getCellWidth();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final stringMaker : StringMaker = new StringMaker();
        {
            var rowIndex : Int = firstRow;
            while (rowIndex < totalRows) {
                // continue skips the update below
            x = x0;
            {
                var columnIndex : Int = firstColumn;
                while (columnIndex < totalColumns) {
                    // continue skips the update below
                tile = this.tiledLayerP.getCell(columnIndex, rowIndex);
                if (tile < 0) {
                    tile = this.tiledLayerP.getAnimatedTile(tile);
                }
                if (tile == 0) {
                    continue;
                }
                tile--;
                stringMaker.delete(0, stringMaker.length());
                graphics.drawString(stringMaker.appendint(columnIndex).append(commonSeps.COMMA).appendint(rowIndex).append(commonSeps.COLON).appendint(tile).toString(), x + 5, y + 10, 0);
                    columnIndex++;
                    x += tileWidth;
                }
            }
                rowIndex++;
                y += tileHeight;
            }
        }
        graphics.setFont(font);
    }

    public override function moveDXY(dx : Int, dy : Int) : Void {
        this.tiledLayerP.move(dx, dy);
        super.moveDXY(-dx, -dy);
    }

    public override function setPosition(x : Int, y : Int, z : Int) : Void {
        this.tiledLayerP.setPosition(x, y);
        super.setPosition(-x, -y, z);
    }

    public function getTiledLayer() : TiledLayer {
        return this.tiledLayerP;
    }

    public override function getCellWidth() : Int {
        return this.tiledLayerP.getCellWidth();
    }

    public override function getCellHeight() : Int {
        return this.tiledLayerP.getCellHeight();
    }

    public override function getCell(col : Int, row : Int) : Int {
        return this.tiledLayerP.getCell(col, row);
    }

    public override function getColumns() : Int {
        return this.tiledLayerP.getColumns();
    }

    public override function getRows() : Int {
        return this.tiledLayerP.getRows();
    }

    public override function setCell(col : Int, row : Int, index : Int) : Void {
        this.tiledLayerP.setCell(col, row, index);
    }

    public override function getAnimatedTile(animationTileIndex : Int) : Int {
        return this.tiledLayerP.getAnimatedTile(animationTileIndex);
    }

}

