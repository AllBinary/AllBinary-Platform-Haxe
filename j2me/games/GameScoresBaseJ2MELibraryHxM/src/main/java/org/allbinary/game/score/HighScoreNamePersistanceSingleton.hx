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
package org.allbinary.game.score;

import jre.io.ByteArrayInputStream;
import jre.io.ByteArrayOutputStream;
import jre.io.DataInputStream;
import jre.io.DataOutputStream;
import javax.microedition.rms.RecordEnumeration;
import javax.microedition.rms.RecordStore;
import javax.microedition.rms.RecordStoreException;
import org.allbinary.TsUtil;
import org.allbinary.game.GameInfo;
import org.allbinary.game.configuration.persistance.NullRecordComparator;
import org.allbinary.game.configuration.persistance.NullRecordFilter;
import org.allbinary.game.configuration.persistance.NullRecordStore;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.java.exception.ExceptionUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.persistance.PlatformRecordIdUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class HighScoreNamePersistanceSingleton {
    private static var SINGLETON : HighScoreNamePersistanceSingleton = new HighScoreNamePersistanceSingleton();
    public static function getInstance() : HighScoreNamePersistanceSingleton {
        return HighScoreNamePersistanceSingleton.SINGLETON;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final tsUtil : TsUtil = TsUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final platformRecordIdUtil : PlatformRecordIdUtil = PlatformRecordIdUtil.getInstance();
    private final RECORD_ID : String = "_SN";
    private var name : String = StringUtil.getInstance().EMPTY_STRING;
    private var nameBasicArrayList : BasicArrayList = new BasicArrayListD();
    public function clear() : Void {
        this.name = StringUtil.getInstance().EMPTY_STRING;
    }

    // throws Exception
    public function deleteAll(abeClientInformation : AbeClientInformationInterface, gameInfo : GameInfo) : Void {
        var size : Int = this.nameBasicArrayList.size();
        for (index in 0...size) {
            final integer : Null<Int> = (cast this.nameBasicArrayList.objectArray[index] : Null<Int>);
            this.delete(abeClientInformation, gameInfo, Std.int(integer));
        }
        this.clear();
    }

    private function getRecordId(abeClientInformation : AbeClientInformationInterface) : String {
        return this.platformRecordIdUtil.getRecordId(abeClientInformation, this.RECORD_ID);
    }

    // throws Exception
    public function delete(abeClientInformation : AbeClientInformationInterface, gameInfo : GameInfo, deleteId : Int) : Void {
        var recordStore : RecordStore = NullRecordStore.NULL_RECORD_STORE;
        try {
            this.logUtil.putF(Std.string(new StringMaker().append("Deleting: ").appendint(deleteId)), this, this.commonStrings.delete);
            recordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true);
            recordStore.deleteRecord(deleteId);
        } catch (e : haxe.Exception) {
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            if (recordStore != null) {
                PreLogUtil.put("Closing RecordStore", this, this.commonStrings.delete);
                recordStore.closeRecordStore();
            }
        }
    }

    public function getIds() : BasicArrayList {
        return this.nameBasicArrayList;
    }

    public function load(abeClientInformation : AbeClientInformationInterface, gameInfo : GameInfo) : String {
        var recordStore : RecordStore = NullRecordStore.NULL_RECORD_STORE;
        try {
            if (this.name == StringUtil.getInstance().EMPTY_STRING) {
                final LOADING_ID : String = "Loading id: ";
                recordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true);
                final recordEnum : RecordEnumeration = recordStore.enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true);
                final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
                var recordAsBytes : haxe.ds.Vector<Int> = null;
                var byteArrayInputStream : ByteArrayInputStream = null;
                var inputStream : DataInputStream = null;
                while (recordEnum.hasNextElement()) {
                    final id : Int = recordEnum.nextRecordId();
                    this.logUtil.putF(Std.string(new StringMaker().append(LOADING_ID).appendint(id)), this, this.commonStrings.LOAD);
                    recordAsBytes = this.tsUtil.getRecord(recordStore, id);
                    byteArrayInputStream = new ByteArrayInputStream(recordAsBytes);
                    inputStream = new DataInputStream(byteArrayInputStream);
                    while (inputStream.available() > 0) {
                        this.name = inputStream.readUTF();
                    }
                    this.nameBasicArrayList.add(smallIntegerSingletonFactory.getAt(id));
                }
            }
        } catch (e : haxe.Exception) {
            this.save(abeClientInformation, gameInfo, this.name);
            this.logUtil.putF(Std.string(new StringMaker().append(this.commonStrings.EXCEPTION_LABEL).append(ExceptionUtil.getInstance().getStackTrace(e))), this, this.commonStrings.LOAD);
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            try {
                if (recordStore != null) {
                    PreLogUtil.put("Closing RecordStore", this, this.commonStrings.LOAD);
                    recordStore.closeRecordStore();
                }
            } catch (e : RecordStoreException) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.LOAD, e);
            }
        }
        return this.name;
    }

    public function save(abeClientInformation : AbeClientInformationInterface, gameInfo : GameInfo, name : String) : Void {
        var recordStore : RecordStore = NullRecordStore.NULL_RECORD_STORE;
        try {
            this.logUtil.putF(Std.string(new StringMaker().append("Saving: ").append(name)), this, this.commonStrings.SAVE);
            recordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true);
            final byteArrayOutputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            final outputStream : DataOutputStream = new DataOutputStream(byteArrayOutputStream);
            outputStream.writeUTF(name);
            final savedGameBytes : haxe.ds.Vector<Int> = byteArrayOutputStream.toByteArray();
            recordStore.addRecord(savedGameBytes, 0, savedGameBytes.length);
            this.name = name;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.SAVE, e);
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            try {
                if (recordStore != null) {
                    PreLogUtil.put("Closing RecordStore", this, this.commonStrings.SAVE);
                    recordStore.closeRecordStore();
                }
            } catch (e : RecordStoreException) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.SAVE, e);
            }
        }
    }

    public function new() {
    }
}

