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
package org.allbinary.game.identification;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class CompositeGroup {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final groupInterface : Group;
    private final list : BasicArrayList = new BasicArrayListD();
    public function new(groupInterface : Group) {
        this.groupInterface = groupInterface;
    }

    public function clear() : Void {
        this.list.clear();
    }

    public function add(groupInterface : Group) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final groupCommonFactory : GroupCommonFactory = GroupCommonFactory.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(groupCommonFactory.ADDING_LABEL);
        stringBuffer.append(groupInterface.toString());
        stringBuffer.append(groupCommonFactory.TO_LABEL);
        stringBuffer.append(StringUtil.getInstance().toString(this.groupInterface));
        this.logUtil.putF(stringBuffer.toString(), this, commonStrings.ADD);
        this.list.add(groupInterface);
    }

    public function isInGroup(groupInterface : Group) : Bool {
        if (this.list.contains(groupInterface)) {
            return true;
        } else {
            return false;
        }
    }

    public function getGroup() : Group {
        return this.groupInterface;
    }

}

