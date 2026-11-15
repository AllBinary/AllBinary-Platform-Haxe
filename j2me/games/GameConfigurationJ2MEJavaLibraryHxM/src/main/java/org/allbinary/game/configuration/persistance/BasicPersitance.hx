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
package org.allbinary.game.configuration.persistance;

import javax.microedition.rms.RecordStore;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.persistance.PlatformRecordIdUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicPersitance {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final persistanceStrings : PersistanceStrings = PersistanceStrings.getInstance();
    private final platformRecordIdUtil : PlatformRecordIdUtil = PlatformRecordIdUtil.getInstance();
    private final recordId : String;
    public final valueList : BasicArrayList = new BasicArrayListD();
    public final idList : BasicArrayList = new BasicArrayListD();
    public function new(recordId : String) {
        this.recordId = recordId;
    }

    // throws Exception
    public function deleteRecoreStore(abeClientInformation : AbeClientInformationInterface) : Void {
        RecordStore.deleteRecordStore(this.getRecordId(abeClientInformation));
    }

    // throws Exception
    public function deleteAll(abeClientInformation : AbeClientInformationInterface) : Void {
        var size : Int = this.idList.size();
        for (index in 0...size) {
            var integer : Null<Int> = (cast this.idList.objectArray[index] : Null<Int>);
            this.delete(abeClientInformation, Std.int(integer));
        }
        this.clear();
    }

    // throws Exception
    public function delete(abeClientInformation : AbeClientInformationInterface, deleteId : Int) : Void {
        var recordStore : RecordStore = NullRecordStore.NULL_RECORD_STORE;
        try {
            this.logUtil.putF(Std.string(new StringMaker().append(this.persistanceStrings.DELETING_WITH_ID).appendint(deleteId)), this, this.commonStrings.delete);
            recordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true);
            recordStore.deleteRecord(deleteId);
        } catch (e : haxe.Exception) {
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            if (recordStore != null) {
                PreLogUtil.put(this.persistanceStrings.CLOSING_RECORDSTORE, this, this.commonStrings.delete);
                recordStore.closeRecordStore();
            }
        }
    }

    public function getRecordId(abeClientInformation : AbeClientInformationInterface) : String {
        return this.platformRecordIdUtil.getRecordId(abeClientInformation, this.recordId);
    }

    public function getList() : BasicArrayList {
        return this.valueList;
    }

    public function getIds() : BasicArrayList {
        return this.idList;
    }

    public function clear() : Void {
        this.valueList.clear();
        this.idList.clear();
    }

}

