/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2007 AllBinary 
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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;
import org.allbinary.logic.communication.log.LogUtil;

class PreGameScrollSelectionTouchButtonsBuilder extends BaseTouchInput {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public override function getList() : BasicArrayList {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.GET_LIST);
            final list : BasicArrayList = new BasicArrayListD();
            final touchButtonLocationHelper : TouchButtonLocationHelper = new TouchButtonLocationHelper();
            final commonButtons : CommonButtons = CommonButtons.getInstance();
            final basicTouchButtonCellPositionFactory : BasicTouchButtonCellPositionFactory = new BasicTouchButtonCellPositionFactory();
            var LEFT : TouchButton = TouchButton.createButton(BasicTouchInputFactory.getInstance().LEFT, TouchButtonStrafeLeftResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.TOP_LEFT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            var RIGHT : TouchButton = TouchButton.createButton(BasicTouchInputFactory.getInstance().RIGHT, TouchButtonStrafeRightResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.TOP_RIGHT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            var START : TouchButton = TouchButton.createButton(BasicTouchInputFactory.getInstance().SPECIAL_BUTTON_FIVE, TouchButtonStartResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.BOTTOM_RIGHT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            list.add(LEFT);
            list.add(RIGHT);
            list.add(START);
            return list;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.GET_LIST, e);
            return BasicArrayListUtil.getInstance().getImmutableInstance();
        }
    }

    public function new() {
        super();
    }
}

