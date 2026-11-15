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

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class Group implements GroupInterface {
    private var name : String = StringUtil.getInstance().EMPTY_STRING;
    private final teamId : Int;
    private var string : String = StringUtil.getInstance().EMPTY_STRING;
    public function new(teamName : String, teamId : Int) {
        this.teamId = teamId;
        this.setName(teamName);
    }

    public function getGroupName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.name = name;
        final groupCommonFactory : GroupCommonFactory = GroupCommonFactory.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(groupCommonFactory.GROUP_NAME_LABEL);
        stringBuffer.append(this.name);
        stringBuffer.append(groupCommonFactory.ID_LABEL);
        stringBuffer.appendshort(this.teamId);
        this.string = stringBuffer.toString();
    }

    public function getGroupId() : Int {
        return this.teamId;
    }

    public function toString() : String {
        return this.string;
    }

}

