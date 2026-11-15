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

//import java.io.ByteArrayInputStream;
//import java.io.ByteArrayOutputStream;
//import java.io.DataInputStream;
//import java.io.DataOutputStream;
//import javax.microedition.rms.RecordEnumeration;
//import javax.microedition.rms.RecordStore;
import org.allbinary.TsUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.HashtableUtil;

class KeyValuePersistance extends BasicPersitance {
    private final tsUtil : TsUtil = TsUtil.getInstance();
    public function new(recordId : String) {
        super(recordId);
    }

    // throws Exception
    public function loadAll(abeClientInformation : AbeClientInformationInterface) : Void {
        this.loadAllSize(abeClientInformation, 1);
    }

    // throws Exception
    public function loadAllSize(abeClientInformation : AbeClientInformationInterface, size : Int) : Void {
        var recordStore : RecordStore = NullRecordStore.NULL_RECORD_STORE;
        try {
            recordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true);
            final recordEnum : RecordEnumeration = recordStore.enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true);
            var hashtable : ABHashtable<String, String> = null;
            var name : String = null;
            var value : String = null;
            final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
            final stringBuffer : StringMaker = new StringMaker();
            var recordAsBytes : haxe.ds.Vector<Int> = null;
            var byteArrayInputStream : ByteArrayInputStream = null;
            var inputStream : DataInputStream = null;
            while (recordEnum.hasNextElement()) {
                final id : Int = recordEnum.nextRecordId();
                stringBuffer.delete(0, stringBuffer.length());
                this.logUtil.putF(stringBuffer.append(this.persistanceStrings.LOADING_ID).appendint(id).toString(), this, this.persistanceStrings.LOAD_ALL);
                recordAsBytes = this.tsUtil.getRecord(recordStore, id);
                if (recordAsBytes != null) {
                    byteArrayInputStream = new ByteArrayInputStream(recordAsBytes);
                    inputStream = new DataInputStream(byteArrayInputStream);
                    hashtable = new ABHashtable<String, String>();
                    for (index in 0...size) {
                        name = inputStream.readUTF();
                        inputStream.readUTF();
                        value = inputStream.readUTF();
                        hashtable.put(name, value);
                    }
                    this.valueList.add(hashtable);
                    this.idList.add(smallIntegerSingletonFactory.getAt(id));
                }
            }
        } catch (e : haxe.Exception) {
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            if (recordStore != null) {
                PreLogUtil.put(this.persistanceStrings.CLOSING_RECORDSTORE, this, this.persistanceStrings.LOAD_ALL);
                recordStore.closeRecordStore();
            }
        }
    }

    // throws Exception
    public function save(abeClientInformation : AbeClientInformationInterface, hashtable : ABHashtable<Any, Any>) : Void {
        var recordStore : RecordStore = NullRecordStore.NULL_RECORD_STORE;
        try {
            this.logUtil.putF(new StringMaker().append(this.persistanceStrings.SAVING).append(StringUtil.getInstance().toString(hashtable)).toString(), this, this.commonStrings.SAVE);
            recordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true);
            final byteArrayOutputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            final outputStream : DataOutputStream = new DataOutputStream(byteArrayOutputStream);
            var value : String = null;
            final commonSeps : CommonSeps = CommonSeps.getInstance();
            final objectArray : haxe.ds.Vector<Any> = HashtableUtil.getInstance().getKeysAsArray(hashtable);
            var anyType : Any = null;
            final size : Int = objectArray.length;
            for (index in 0...size) {
                outputStream.writeUTF((cast objectArray[index] : String));
                outputStream.writeUTF(commonSeps.EQUALS);
                anyType = (cast objectArray[index] : Any);
                value = (cast hashtable.get(anyType) : String);
                outputStream.writeUTF(value);
            }
            final tsUtil : TsUtil = TsUtil.getInstance();
            final savedGameBytes : haxe.ds.Vector<Int> = tsUtil.getByteArray(byteArrayOutputStream.toString());
            recordStore.addRecord(savedGameBytes, 0, savedGameBytes.length);
        } catch (e : haxe.Exception) {
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            if (recordStore != null) {
                PreLogUtil.put(this.persistanceStrings.CLOSING_RECORDSTORE, this, this.commonStrings.SAVE);
                recordStore.closeRecordStore();
            }
        }
    }

    public function get(index : Int) : ABHashtable<Any, Any> {
        final hashtable : ABHashtable<Any, Any> = (cast this.valueList.objectArray[index] : ABHashtable<Any, Any>);
        return hashtable;
    }

}

