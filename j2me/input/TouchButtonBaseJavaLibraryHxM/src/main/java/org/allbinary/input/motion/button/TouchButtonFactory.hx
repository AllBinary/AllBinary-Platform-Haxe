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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class TouchButtonFactory {
    private static final SINGLETON : TouchButtonFactory = new TouchButtonFactory();
    public static function getInstance() : TouchButtonFactory {
        return TouchButtonFactory.SINGLETON;
    }

    private var LIST : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    private var list : BasicArrayList;
    private var savedList : BasicArrayList;
    public function new() {
        this.list = this.LIST;
        this.savedList = this.LIST;
    }

    public function defaultList() : Void {
        this.list = this.LIST;
        this.toggle(false, this.LIST);
    }

    private var saved : Bool = false;
    // synchronized
    public function toggle(save : Bool, list : BasicArrayList) : Void {
        if (list != BasicArrayListUtil.getInstance().getImmutableInstance()) {
            this.savedList = list;
            if (!this.saved) {
                this.list = this.savedList;
            }
        } else {
            if (save) {
                if (!this.saved) {
                    this.saved = true;
                    this.savedList = this.list;
                    this.list = this.LIST;
                } else {
                }
            } else {
                this.list = this.savedList;
                this.saved = false;
            }
        }
    }

    // throws Exception
    public function setList(list : BasicArrayList) : Void {
        if (list == null) {
            throw new jre.lang.JavaException("Null List");
        }
        this.list = list;
    }

    public function getList() : BasicArrayList {
        return this.list;
    }

}

