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

import org.allbinary.game.input.resource.TouchButtonDowngradeResource;
import org.allbinary.game.input.resource.TouchButtonUpgradeResource;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.graphics.CellPositionFactory;

class UpgradeDowngradeTouchButtonsBuilder extends BaseTouchInput {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public override function getList() : BasicArrayList {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
            final list : BasicArrayList = new BasicArrayListD();
            final touchButtonLocationHelper : TouchButtonLocationHelper = new TouchButtonLocationHelper();
            final cellPositionFactory : CellPositionFactory = CellPositionFactory.getInstance();
            final basicTouchButtonCellPositionFactory : BasicTouchButtonCellPositionFactory = new BasicTouchButtonCellPositionFactory();
            if (basicTouchButtonCellPositionFactory.SECOND_FROM_TOP_LEFT != cellPositionFactory.NONE && basicTouchButtonCellPositionFactory.SECOND_FROM_TOP_RIGHT != cellPositionFactory.NONE) {
                var commonButtons : CommonButtons = CommonButtons.getInstance();
                var UP : TouchButton = TouchButton.createButton(BasicTouchInputFactory.getInstance().SPECIAL_BUTTON_TWO, TouchButtonUpgradeResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.SECOND_FROM_TOP_LEFT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
                var DOWN : TouchButton = TouchButton.createButton(BasicTouchInputFactory.getInstance().SPECIAL_BUTTON_ONE, TouchButtonDowngradeResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.SECOND_FROM_TOP_RIGHT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
                list.add(UP);
                list.add(DOWN);
            }
            return list;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
            return BasicArrayListUtil.getInstance().getImmutableInstance();
        }
    }

    public function new() {
        super();
    }
}

