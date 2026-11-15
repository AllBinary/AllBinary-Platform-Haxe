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

class EndLevelTouchButtonsBuilder extends TouchButtonsListBuilder {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public override function getList() : BasicArrayList {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
            final list : BasicArrayList = new BasicArrayListD();
            list.addAllList(new BasicTouchButtonsBuilder().getList());
            list.addAllList(new BuildingScrollTouchButtonsBuilder().getList());
            list.addAllList(new UpgradeDowngradeTouchButtonsBuilder().getList());
            this.addList(list);
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

