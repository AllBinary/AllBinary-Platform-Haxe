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
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GroupFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var instance : GroupFactory = new GroupFactory();
    public static function getInstance() : GroupFactory {
        return GroupFactory.instance;
    }

    public final NULL_GROUP_ARRAY : haxe.ds.Vector<Group> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    private final list : BasicArrayList = new BasicArrayListD();
    private var index : Int = 0;
    public function getNextGroup() : Group {
        var group : Group = (cast this.list.objectArray[this.index] : Group);
        this.index++;
        return group;
    }

    public function getNextGroupByName(name : String) : Group {
        final group : Group = this.getNextGroup();
        group.setName(name);
        return group;
    }

    public function init(groups : Int, nameArray : haxe.ds.Vector<String>) : Void {
        final stringMaker : StringMaker = new StringMaker();
        final stringUtil : StringUtil = StringUtil.getInstance();
        final TEAM : String = "Team ";
        this.list.clear();
        this.index = 0;
        var size : Int = this.list.size();
        while (size < groups) {
            var name : String = stringUtil.EMPTY_STRING;
            if (size < nameArray.length) {
                name = nameArray[size];
            } else {
                stringMaker.delete(0, stringMaker.length());
                name = stringMaker.append(TEAM).appendint(size).toString();
            }
            this.list.add(new Group(name, (size + 3)));
            size++;
        }
    }

    public function new() {
    }
}

