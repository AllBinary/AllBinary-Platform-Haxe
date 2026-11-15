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
package org.allbinary.logic.util.cache;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class KeylessBasicArrayListCache extends IndexedBasicArrayListCache {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    public function new() {
        super();
    }

    public function get() : BasicArrayList {
        try {
            if (this.index >= this.list.size()) {
                this.addDefault();
            }
            final list : BasicArrayList = (cast this.getAt(this.index++) : BasicArrayList);
            return list;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.GET, e);
            return this.basicArrayListUtil.getImmutableInstance();
        }
    }

    public override function clear() : Void {
        super.clear();
        var basicArrayList : BasicArrayList = null;
        {
            var index : Int = this.list.size() - 1;
            while (index >= 0) {
            basicArrayList = ((cast this.list.objectArray[index] : BasicArrayList));
            basicArrayList.clear();
                index--;
            }
        }
    }

    public override function log() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("S: ");
        stringBuffer.appendint(this.list.size());
        final S_LABEL : String = " s: ";
        var basicArrayList : BasicArrayList = null;
        {
            var index : Int = this.list.size() - 1;
            while (index >= 0) {
            stringBuffer.append(S_LABEL);
            basicArrayList = ((cast this.list.objectArray[index] : BasicArrayList));
            stringBuffer.appendint(basicArrayList.size());
                index--;
            }
        }
        return stringBuffer.toString();
    }

}

