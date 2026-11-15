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
package org.allbinary.game.input;

import javax.microedition.rms.RecordEnumeration;
import javax.microedition.rms.RecordStore;
import org.allbinary.game.configuration.persistance.BasicPersitance;
import org.allbinary.game.configuration.persistance.NullRecordComparator;
import org.allbinary.game.configuration.persistance.NullRecordFilter;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.HashtableUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

//GameInputNoPersistanceLibrary
class InputPersistance extends BasicPersitance {
    private final hashtableUtil : HashtableUtil = HashtableUtil.getInstance();
    public function new(name : String) {
        super(name);
    }

    // throws Exception
    public function loadAll(abeClientInformation : AbeClientInformationInterface) : Void {
        final recordStore : RecordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true);
        final recordEnum : RecordEnumeration = recordStore.enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true);
        var hashtable : ABHashtable<Any, Any> = null;
        final stringBuffer : StringMaker = new StringMaker();
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        var id : Int = 0;
        while (recordEnum.hasNextElement()) {
            id = recordEnum.nextRecordId();
            stringBuffer.delete(0, stringBuffer.length());
            this.logUtil.putF(Std.string(stringBuffer.append(this.persistanceStrings.LOADING_ID).appendint(id)), this, this.persistanceStrings.LOAD_ALL);
            hashtable = StdUtil.getInstance().createHashtable();
            this.valueList.add(hashtable);
            this.idList.add(smallIntegerSingletonFactory.getAt(id));
        }
        recordStore.closeRecordStore();
    }

    // throws Exception
    public function save(abeClientInformation : AbeClientInformationInterface, hashtable : ABHashtable<Any, Any>) : Void {
        PreLogUtil.put(Std.string(new StringMaker().append(this.persistanceStrings.NOT_SAVING).append(StringUtil.getInstance().toString(hashtable))), this, this.commonStrings.SAVE);
        final recordStore : RecordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true);
        var gameActionInput : Input = null;
        var list : BasicArrayList = null;
        var input : Input = null;
        final inputObjectArray : haxe.ds.Vector<Any> = this.hashtableUtil.getKeysAsArray(hashtable);
        final size : Int = inputObjectArray.length;
        for (index in 0...size) {
            gameActionInput = (cast inputObjectArray[index] : Input);
            list = (cast hashtable.get(inputObjectArray[index]) : BasicArrayList);
            for (index2 in 0...list.size()) {
                input = (cast list.get(index2) : Input);
            }
        }
        recordStore.closeRecordStore();
    }

}

