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
package org.allbinary.layer;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class LayerInterfaceFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final SINGLETON : LayerInterfaceFactory = new LayerInterfaceFactory();
    private var list : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    public static function getInstance() : LayerInterfaceFactory {
        return LayerInterfaceFactory.SINGLETON;
    }

    public function init() : Void {
        this.list = new BasicArrayListD();
    }

    private final HASHTABLE_LABEL : String = "Hashtable: ";
    // throws Exception
    public function getNexInstance(hashtable : ABHashtable<Any, Any>, x : Int, y : Int, z : Int) : AllBinaryLayer {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(Std.string(new StringMaker().append(this.HASHTABLE_LABEL).append(StringUtil.getInstance().toString(hashtable))), this, commonStrings.GET_INSTANCE);
        final typeInteger : Null<Int> = (cast hashtable.get((cast Layer.ID : Any)) : Null<Int>);
        final layerInterfaceFactoryInterface : LayerInterfaceFactoryInterface = (cast this.list.objectArray[jre.lang.JavaNumber.toInt(typeInteger) - 1] : LayerInterfaceFactoryInterface);
        return layerInterfaceFactoryInterface.getNextInstance(hashtable, x, y, z);
    }

    public function add(layerInterfaceFactoryInterface : LayerInterfaceFactoryInterface) : Void {
        this.list.add(layerInterfaceFactoryInterface);
    }

    public function new() {
    }
}

