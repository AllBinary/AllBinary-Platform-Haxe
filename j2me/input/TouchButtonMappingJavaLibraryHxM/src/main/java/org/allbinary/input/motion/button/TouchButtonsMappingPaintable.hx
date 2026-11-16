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
package org.allbinary.input.motion.button;

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.CellPositionFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class TouchButtonsMappingPaintable extends Paintable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var foregroundColor : Int;
    private var paintableTable : haxe.ds.Vector<haxe.ds.Vector<Paintable>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) null])]);
    private var touchButtonLocationHelper : TouchButtonLocationHelper = new TouchButtonLocationHelper();
    public function new(basicColor : BasicColor) {
        super();
        this.foregroundColor = jre.lang.JavaObject.intValue(basicColor);
        this.init();
    }

    private function init() : Void {
        try {
            this.paintableTable = this.createPaintableTable();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "updateRectangle", e);
        }
    }

    // throws Exception
    private function createPaintableTable() : haxe.ds.Vector<haxe.ds.Vector<Paintable>> {
        var totalColumns : Int = this.touchButtonLocationHelper.getTotalColumns();
        var totalRows : Int = this.touchButtonLocationHelper.getTotalRows();
        var paintableTable : haxe.ds.Vector<haxe.ds.Vector<Paintable>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...totalColumns) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...totalRows) null])]);
        var cellPositionFactory : CellPositionFactory = CellPositionFactory.getInstance();
        var commonButtons : CommonButtons = CommonButtons.getInstance();
        {
            var index : Int = totalColumns - 1;
            while (index >= 0) {
            {
                var rowIndex : Int = totalRows - 1;
                while (rowIndex >= 0) {
                this.paintableTable[index][rowIndex] = TouchButton.createButton(BasicTouchInputFactory.getInstance().NONE, TouchButtonBlankResource.getInstance(), commonButtons.NORMAL_BUTTON, cellPositionFactory.getInstanceColRow(index, rowIndex), this.touchButtonLocationHelper.getColumnsRemainderHalf(), this.touchButtonLocationHelper.getRowsRemainderHalf());
                    rowIndex--;
                }
            }
                index--;
            }
        }
        return paintableTable;
    }

    public override function paint(graphics : Graphics) : Void {
        var totalColumns : Int = this.touchButtonLocationHelper.getTotalColumns();
        var totalRows : Int = this.touchButtonLocationHelper.getTotalRows();
        {
            var index : Int = totalColumns - 1;
            while (index >= 0) {
            {
                var rowIndex : Int = totalRows - 1;
                while (rowIndex >= 0) {
                this.paintableTable[index][rowIndex].paint(graphics);
                    rowIndex--;
                }
            }
                index--;
            }
        }
    }

}

