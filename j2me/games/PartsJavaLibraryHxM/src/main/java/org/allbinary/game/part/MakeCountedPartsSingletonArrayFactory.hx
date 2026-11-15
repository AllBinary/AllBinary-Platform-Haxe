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
package org.allbinary.game.part;

import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory;
import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactoryPool;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class MakeCountedPartsSingletonArrayFactory {
    private static final instance : MakeCountedPartsSingletonArrayFactory = new MakeCountedPartsSingletonArrayFactory();
    public static function getInstance() : MakeCountedPartsSingletonArrayFactory {
        return MakeCountedPartsSingletonArrayFactory.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private var list : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    // throws Exception
    public function getUpdated(partInterfaceArray : haxe.ds.Vector<PartInterface>) : haxe.ds.Vector<PartInterface> {
        this.list = new BasicArrayListD();
        for (index in 0...partInterfaceArray.length) {
            this.list.add(partInterfaceArray[index]);
        }
        final countedBasicArrayList : BasicArrayList = CountedPickedUpLayerInterfaceFactoryPool.getInstance().getList();
        var layerInterfaceFactoryInterface : CountedPickedUpLayerInterfaceFactory = null;
        var size : Int = countedBasicArrayList.size();
        for (index in 0...size) {
            layerInterfaceFactoryInterface = (cast countedBasicArrayList.objectArray[index] : CountedPickedUpLayerInterfaceFactory);
            this.list.add(new CountedLayerInterfaceFactoryPart(0, layerInterfaceFactoryInterface));
        }
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Total Parts: ");
        stringBuffer.appendint(this.list.size());
        stringBuffer.append(" Counted: ");
        stringBuffer.appendint(countedBasicArrayList.size());
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(stringBuffer.toString(), this, commonStrings.GET_INSTANCE);
        final newPartInterfaceArray : haxe.ds.Vector<PartInterface> = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.list.size()) null]);
        final newSize : Int = newPartInterfaceArray.length;
        for (index in 0...newSize) {
            newPartInterfaceArray[index] = (cast this.list.get(index) : PartInterface);
        }
        return newPartInterfaceArray;
    }

    public function new() {
    }
}

