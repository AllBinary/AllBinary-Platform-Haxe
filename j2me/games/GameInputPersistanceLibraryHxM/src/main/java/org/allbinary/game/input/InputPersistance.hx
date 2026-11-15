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

//import java.io.ByteArrayInputStream;
//import java.io.ByteArrayOutputStream;
//import java.io.DataInputStream;
//import java.io.DataOutputStream;
//import javax.microedition.rms.RecordEnumeration;
//import javax.microedition.rms.RecordStore;
import org.allbinary.TsUtil;
import org.allbinary.game.configuration.persistance.BasicPersitance;
import org.allbinary.game.configuration.persistance.NullRecordComparator;
import org.allbinary.game.configuration.persistance.NullRecordFilter;
import org.allbinary.game.configuration.persistance.NullRecordStore;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.HashtableUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

//GameInputPersistanceLibrary
class InputPersistance extends BasicPersitance {
    private final tsUtil : TsUtil = TsUtil.getInstance();
    private final hashtableUtil : HashtableUtil = HashtableUtil.getInstance();
    public function new(name : String) {
        super(name);
    }

    // throws Exception
    public function loadAll(abeClientInformation : AbeClientInformationInterface) : Void {
        var recordStore : RecordStore = NullRecordStore.NULL_RECORD_STORE;
        try {
            recordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true);
            final recordEnum : RecordEnumeration = recordStore.enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true);
            var gameActionInputId : haxe.Int64 = haxe.Int64.ofInt(0);
            var inputId : haxe.Int64 = haxe.Int64.ofInt(0);
            var gameActionInput : Input = null;
            var input : Input = null;
            var hashtable : ABHashtable<Any, Any> = null;
            final gameKeyFactory : GameKeyMappingFactory = GameKeyMappingFactory.getInstance();
            final stringBuffer : StringMaker = new StringMaker();
            final inputFactory : InputFactory = InputFactory.getInstance();
            final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
            final stdUtil : StdUtil = StdUtil.getInstance();
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
                    hashtable = stdUtil.createHashtable();
                    var value : Int = 0;
                    while (inputStream.available() > 0) {
                        final gameActionInputIdAsString : String = inputStream.readUTF();
                        value = Std.parseInt(gameActionInputIdAsString);
                        gameActionInputId = haxe.Int64.ofInt(value);
                        inputStream.readUTF();
                        value = Std.parseInt(inputStream.readUTF());
                        inputId = haxe.Int64.ofInt(value);
                        gameActionInput = gameKeyFactory.getGameKey(haxe.Int64.toInt(gameActionInputId));
                        input = inputFactory.getInstanceById(haxe.Int64.toInt(inputId));
                        if (input == inputFactory.NO_INPUT || gameActionInput == null) {
                            stringBuffer.delete(0, stringBuffer.length());
                            if (input == inputFactory.NO_INPUT) {
                                stringBuffer.append(this.persistanceStrings.ERROR_LOADING_ID);
                                stringBuffer.appendlong(inputId);
                                stringBuffer.append(this.persistanceStrings.GAME_ACTION_INPUT);
                                stringBuffer.appendlong(gameActionInputId);
                                PreLogUtil.put(stringBuffer.toString(), this, this.persistanceStrings.LOAD_ALL);
                            }
                            if (gameActionInput == null) {
                                stringBuffer.delete(0, stringBuffer.length());
                                stringBuffer.append(this.persistanceStrings.ERROR_LOADING);
                                stringBuffer.appendlong(gameActionInputId);
                                stringBuffer.append(this.persistanceStrings.ID);
                                stringBuffer.appendlong(inputId);
                                PreLogUtil.put(stringBuffer.toString(), this, this.persistanceStrings.LOAD_ALL);
                            }
                        } else {
                        }
                        hashtable.put(input, gameActionInput);
                    }
                    this.valueList.add(hashtable);
                    this.idList.add(smallIntegerSingletonFactory.getAt(id));
                } else {
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
            final stringBuffer : StringMaker = new StringMaker();
            PreLogUtil.put(stringBuffer.append(this.persistanceStrings.SAVING).append(StringUtil.getInstance().toString(hashtable)).toString(), this, this.commonStrings.SAVE);
            recordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true);
            var byteArrayOutputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            var outputStream : DataOutputStream = new DataOutputStream(byteArrayOutputStream);
            var gameActionInput : Input = null;
            var list : BasicArrayList = null;
            var input : Input = null;
            var savedGameBytes : haxe.ds.Vector<Int> = null;
            final commonSeps : CommonSeps = CommonSeps.getInstance();
            final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
            final inputObjectArray : haxe.ds.Vector<Any> = this.hashtableUtil.getKeysAsArray(hashtable);
            final size : Int = inputObjectArray.length;
            for (index in 0...size) {
                gameActionInput = (cast inputObjectArray[index] : Input);
                list = (cast hashtable.get((cast inputObjectArray[index] : Any)) : BasicArrayList);
                for (index2 in 0...list.size()) {
                    final gameActionInputIdAsString : String = smallIntegerSingletonFactory.getAt(gameActionInput.getId()).toString();
                    outputStream.writeUTF(gameActionInputIdAsString);
                    outputStream.writeUTF(commonSeps.EQUALS);
                    input = (cast list.objectArray[index2] : Input);
                    final inputIdAsString : String = smallIntegerSingletonFactory.getAt(input.getId()).toString();
                    outputStream.writeUTF(inputIdAsString);
                }
            }
            savedGameBytes = byteArrayOutputStream.toByteArray();
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

}

