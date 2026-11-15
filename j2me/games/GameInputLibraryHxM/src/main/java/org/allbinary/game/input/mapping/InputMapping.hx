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
package org.allbinary.game.input.mapping;

import org.allbinary.game.input.Input;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

class InputMapping {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    private final mappedList : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public function getTotalMapped() : Int {
        return this.hashtable.size();
    }

    public function isDefaultNew() : Bool {
        return false;
    }

    public function getDefault() : InputToGameKeyMapping {
        return InputToGameKeyMapping.getNullInstance();
    }

    public function removeAll() : Void {
        this.hashtable.clear();
        this.mappedList.clear();
    }

    public function remove(input : Input, mappedToInput : Input) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        final stringUtil : StringUtil = StringUtil.getInstance();
        stringBuffer.append(CommonLabels.getInstance().START_LABEL);
        stringBuffer.append(stringUtil.toString(input));
        stringBuffer.append(" == ");
        stringBuffer.append(stringUtil.toString(mappedToInput));
        this.logUtil.putF(stringBuffer.toString(), this, "InputMapping::remove");
        final list : BasicArrayList = this.getMappedInput(input);
        if (list.contains(mappedToInput)) {
            list.remove(mappedToInput);
            this.mappedList.remove(mappedToInput);
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append("Removed: ");
            stringBuffer.append(stringUtil.toString(input));
            stringBuffer.append(" == ");
            stringBuffer.append(stringUtil.toString(mappedToInput));
            this.logUtil.putF(stringBuffer.toString(), this, "InputMapping::remove");
        } else {
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append("Not Deleted: ");
            stringBuffer.append(stringUtil.toString(input));
            stringBuffer.append(" == ");
            stringBuffer.append(stringUtil.toString(mappedToInput));
            this.logUtil.putF(stringBuffer.toString(), this, "InputMapping::remove");
        }
    }

    // throws Exception
    public function addMapping(inputToGameKeyMapping : InputToGameKeyMapping) : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function add(input : Input, mappedToInput : Input) : Void {
        var list : BasicArrayList = this.getMappedInput(input);
        if (!list.contains(mappedToInput)) {
            list.add(mappedToInput);
            this.mappedList.add(mappedToInput);
        }
    }

    public function isMapped(input : Input) : Bool {
        return this.mappedList.contains(input);
    }

    public function getMappedInput(id : Input) : BasicArrayList {
        final mappingInputCanBeNullList : Any = this.hashtable.get(id);
        if (mappingInputCanBeNullList == null) {
            final list : BasicArrayList = new BasicArrayListD();
            this.hashtable.put(id, list);
            return list;
        }
        return (cast mappingInputCanBeNullList : BasicArrayList);
    }

    public function getHashtable() : ABHashtable<Any, Any> {
        return this.hashtable;
    }

}

