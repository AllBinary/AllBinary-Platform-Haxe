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

import org.allbinary.graphics.CellPosition;
import org.allbinary.graphics.CellPositionFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class BasicTouchButtonCellPositionFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final TOP_RIGHT : CellPosition;
    public final TOP_LEFT : CellPosition;
    public final SECOND_FROM_TOP_LEFT : CellPosition = null;
    public final SECOND_FROM_TOP_RIGHT : CellPosition = null;
    public final TOP_SECOND_FROM_LEFT : CellPosition = null;
    public final TOP_SECOND_FROM_RIGHT : CellPosition = null;
    public final BOTTOM_RIGHT : CellPosition;
    public final BOTTOM_SECOND_FROM_RIGHT : CellPosition;
    public final SECOND_FROM_BOTTOM_RIGHT : CellPosition;
    public final THIRD_FROM_BOTTOM_RIGHT : CellPosition = null;
    public final FOURTH_FROM_BOTTOM_RIGHT : CellPosition = null;
    public final SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT : CellPosition;
    public final SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT : CellPosition = null;
    public final SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT : CellPosition = null;
    public final BOTTOM_THIRD_FROM_RIGHT : CellPosition = null;
    public final BOTTOM_FOURTH_FROM_RIGHT : CellPosition = null;
    public final BOTTOM_SECOND_FROM_LEFT : CellPosition;
    public final SECOND_FROM_BOTTOM_LEFT : CellPosition;
    public final THIRD_FROM_BOTTOM_LEFT : CellPosition = null;
    public final BOTTOM_LEFT : CellPosition;
    public final SECOND_FROM_BOTTOM_SECOND_FROM_LEFT : CellPosition;
    public function new() {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        final touchButtonLocationHelper : TouchButtonLocationHelper = new TouchButtonLocationHelper();
        final cellPositionFactory : CellPositionFactory = CellPositionFactory.getInstance();
        cellPositionFactory.init(touchButtonLocationHelper.getTotalColumns(), touchButtonLocationHelper.getTotalRows());
        this.TOP_LEFT = cellPositionFactory.getInstanceColRow(0, 0);
        this.TOP_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 1, 0);
        this.BOTTOM_LEFT = cellPositionFactory.getInstanceColRow(0, touchButtonLocationHelper.getTotalRows() - 1);
        this.BOTTOM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 1, touchButtonLocationHelper.getTotalRows() - 1);
        this.BOTTOM_SECOND_FROM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 2, touchButtonLocationHelper.getTotalRows() - 1);
        this.SECOND_FROM_BOTTOM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 1, touchButtonLocationHelper.getTotalRows() - 2);
        this.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 2, touchButtonLocationHelper.getTotalRows() - 2);
        this.BOTTOM_SECOND_FROM_LEFT = cellPositionFactory.getInstanceColRow(1, touchButtonLocationHelper.getTotalRows() - 1);
        this.SECOND_FROM_BOTTOM_LEFT = cellPositionFactory.getInstanceColRow(0, touchButtonLocationHelper.getTotalRows() - 2);
        this.SECOND_FROM_BOTTOM_SECOND_FROM_LEFT = cellPositionFactory.getInstanceColRow(1, touchButtonLocationHelper.getTotalRows() - 2);
        if (touchButtonLocationHelper.getTotalRows() > 2) {
            this.SECOND_FROM_TOP_LEFT = cellPositionFactory.getInstanceColRow(0, 1);
            this.SECOND_FROM_TOP_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 1, 1);
        } else {
            this.SECOND_FROM_TOP_LEFT = cellPositionFactory.NONE;
            this.SECOND_FROM_TOP_RIGHT = cellPositionFactory.NONE;
        }
        if (touchButtonLocationHelper.getTotalRows() >= 4) {
            this.THIRD_FROM_BOTTOM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 1, touchButtonLocationHelper.getTotalRows() - 3);
            this.FOURTH_FROM_BOTTOM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 1, touchButtonLocationHelper.getTotalRows() - 4);
            this.THIRD_FROM_BOTTOM_LEFT = cellPositionFactory.getInstanceColRow(0, touchButtonLocationHelper.getTotalRows() - 3);
        } else {
            this.THIRD_FROM_BOTTOM_RIGHT = cellPositionFactory.NONE;
            this.FOURTH_FROM_BOTTOM_RIGHT = cellPositionFactory.NONE;
            this.THIRD_FROM_BOTTOM_LEFT = cellPositionFactory.NONE;
        }
        if (touchButtonLocationHelper.getTotalColumns() >= 4) {
            this.SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 3, touchButtonLocationHelper.getTotalRows() - 2);
            this.SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 4, touchButtonLocationHelper.getTotalRows() - 2);
            this.BOTTOM_THIRD_FROM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 3, touchButtonLocationHelper.getTotalRows() - 1);
            this.BOTTOM_FOURTH_FROM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 4, touchButtonLocationHelper.getTotalRows() - 1);
            this.TOP_SECOND_FROM_LEFT = cellPositionFactory.getInstanceColRow(1, 0);
            this.TOP_SECOND_FROM_RIGHT = cellPositionFactory.getInstanceColRow(touchButtonLocationHelper.getTotalColumns() - 2, 0);
        } else {
            this.SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT = cellPositionFactory.NONE;
            this.SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT = cellPositionFactory.NONE;
            this.BOTTOM_THIRD_FROM_RIGHT = cellPositionFactory.NONE;
            this.BOTTOM_FOURTH_FROM_RIGHT = cellPositionFactory.NONE;
            this.TOP_SECOND_FROM_LEFT = cellPositionFactory.NONE;
            this.TOP_SECOND_FROM_RIGHT = cellPositionFactory.NONE;
        }
    }

}

