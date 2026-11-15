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

//import java.io.ByteArrayInputStream;
//import java.io.DataInputStream;
//import java.io.EOFException;
//import java.io.IOException;
//import javax.microedition.rms.RecordComparator;
//import javax.microedition.rms.RecordEnumeration;
//import javax.microedition.rms.RecordStore;
//import javax.microedition.rms.RecordStoreException;
//import javax.microedition.rms.RecordStoreNotFoundException;
import org.allbinary.TsUtil;
import org.allbinary.game.GameInfo;
import org.allbinary.game.configuration.persistance.NullRecordComparator;
import org.allbinary.game.configuration.persistance.NullRecordFilter;
import org.allbinary.game.configuration.persistance.NullRecordStore;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.persistance.PlatformRecordIdUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class RecordStoreHighScores extends HighScores {
    private static final hashTable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final platformRecordIdUtil : PlatformRecordIdUtil = PlatformRecordIdUtil.getInstance();
    private final tsUtil : TsUtil = TsUtil.getInstance();
    private final RECORD_ID : String = "_HS";
    private final MAXHIGHSCORES : Int = 100;
    private final gameInfo : GameInfo;
    private final abeClientInformation : AbeClientInformationInterface;
    private final recordComparatorInterface : RecordComparator;
    public function new(abeClientInformation : AbeClientInformationInterface, gameInfo : GameInfo, name : String, heading : String, columnTwoHeading : String, recordComparatorInterface : RecordComparator) {
        super(name, heading, columnTwoHeading);
        this.abeClientInformation = abeClientInformation;
        this.gameInfo = gameInfo;
        this.recordComparatorInterface = recordComparatorInterface;
        this.load();
    }

    // synchronized
    public static function getInstance(abeClientInformation : AbeClientInformationInterface, gameInfo : GameInfo, highScoreName : String, heading : String, columnTwoHeading : String, recordComparatorInterface : RecordComparator) : HighScores {
        final highScoresCanBeNull : Any = RecordStoreHighScores.hashTable.get((cast highScoreName : Any));
        if (highScoresCanBeNull == null) {
            final highScores : HighScores = new RecordStoreHighScores(abeClientInformation, gameInfo, highScoreName, heading, columnTwoHeading, recordComparatorInterface);
            RecordStoreHighScores.hashTable.put(highScores.getName(), highScores);
            return highScores;
        }
        return (cast highScoresCanBeNull : HighScores);
    }

    private function getRecordId(abeClientInformation : AbeClientInformationInterface) : String {
        return this.platformRecordIdUtil.getRecordId(abeClientInformation, new StringMaker().append(CommonSeps.getInstance().UNDERSCORE).append(this.getName()).append(this.RECORD_ID).toString());
    }

    // synchronized
    public override function addHighScore(newHighScore : HighScore) : Void {
        var recordStore : RecordStore = NullRecordStore.NULL_RECORD_STORE;
        try {
            this.logUtil.putF(new StringMaker().append("Adding HighScore: ").appendlong(haxe.Int64.ofInt(newHighScore.getScore())).toString(), this, this.commonStrings.ADD);
            if (this.isTooManyHighScores()) {
                this.logUtil.putF("Removing Lowest Score", this, this.commonStrings.ADD);
                this.removeLowestHighScore();
            }
            recordStore = RecordStore.openRecordStore(this.getRecordId(this.abeClientInformation), true);
            final highScoreBytes : haxe.ds.Vector<Int> = newHighScore.getAsBytes();
            final recordId : Int = recordStore.addRecord(highScoreBytes, 0, highScoreBytes.length);
            this.load();
        } catch (e : RecordStoreException) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.ADD, e);
        } catch (e : IOException) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.ADD, e);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.ADD, e);
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            try {
                if (recordStore != null) {
                    PreLogUtil.put("Closing RecordStore", this, this.commonStrings.ADD);
                    recordStore.closeRecordStore();
                }
            } catch (e : RecordStoreException) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.ADD, e);
            }
        }
    }

    private function removeLowestHighScore() : Void {
        var recordStore : RecordStore = NullRecordStore.NULL_RECORD_STORE;
        try {
            recordStore = RecordStore.openRecordStore(this.getRecordId(this.abeClientInformation), true);
            final recordEnum : RecordEnumeration = recordStore.enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true);
            final scoreComparator : ScoreComparator = ((cast this.recordComparatorInterface : ScoreComparator));
            var bestHighScore : HighScore = new HighScore(-1, "none", GameInfo.NONE, scoreComparator.getBestScore());
            var recordAsBytes : haxe.ds.Vector<Int> = null;
            var byteArrayInputStream : ByteArrayInputStream = null;
            var inputStream : DataInputStream = null;
            while (recordEnum.hasNextElement()) {
                final id : Int = recordEnum.nextRecordId();
                recordAsBytes = this.tsUtil.getRecord(recordStore, id);
                if (recordAsBytes != null) {
                    byteArrayInputStream = new ByteArrayInputStream(recordAsBytes);
                    inputStream = new DataInputStream(byteArrayInputStream);
                    final name : String = inputStream.readUTF();
                    final nextScore : haxe.Int64 = inputStream.readLong();
                    final nextCurrentHighScore : HighScore = new HighScore(id, name, GameInfo.NONE, nextScore);
                    if (this.recordComparatorInterface.compare(nextCurrentHighScore.getAsBytes(), bestHighScore.getAsBytes()) == RecordComparator.FOLLOWS) {
                        bestHighScore = nextCurrentHighScore;
                    }
                }
            }
            if (bestHighScore.getId() != -1) {
                this.logUtil.putF(new StringMaker().append("Removing Lowest HighScore: ").appendlong(haxe.Int64.ofInt(bestHighScore.getScore())).toString(), this, this.commonStrings.LOAD);
                recordStore.deleteRecord(bestHighScore.getId());
            }
        } catch (e : RecordStoreException) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "removeLowestHighScore", e);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "removeLowestHighScore", e);
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            try {
                if (recordStore != null) {
                    PreLogUtil.put("Closing RecordStore", this, "removeLowestHighScore");
                    recordStore.closeRecordStore();
                }
            } catch (e : RecordStoreException) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "removeLowestHighScore", e);
            }
        }
    }

    private function load() : Void {
        var recordStore : RecordStore = NullRecordStore.NULL_RECORD_STORE;
        try {
            recordStore = RecordStore.openRecordStore(this.getRecordId(this.abeClientInformation), true);
            this.setList(new BasicArrayListD());
            final recordEnum : RecordEnumeration = recordStore.enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true);
            var recordAsBytes : haxe.ds.Vector<Int> = null;
            var byteArrayInputStream : ByteArrayInputStream = null;
            var inputStream : DataInputStream = null;
            while (recordEnum.hasNextElement()) {
                final id : Int = recordEnum.nextRecordId();
                recordAsBytes = this.tsUtil.getRecord(recordStore, id);
                if (recordAsBytes != null) {
                    byteArrayInputStream = new ByteArrayInputStream(recordAsBytes);
                    inputStream = new DataInputStream(byteArrayInputStream);
                    try {
                        final name : String = inputStream.readUTF();
                        final score : haxe.Int64 = inputStream.readLong();
                        final newHighScore : HighScore = new HighScore(id, name, GameInfo.NONE, score);
                        final list : BasicArrayList = this.getList();
                        var size : Int = list.size();
                        var lastIndex : Int = size;
                        for (index in 0...size) {
                            final highScore : HighScore = (cast list.objectArray[index] : HighScore);
                            if (this.recordComparatorInterface.compare(newHighScore.getAsBytes(), highScore.getAsBytes()) == RecordComparator.PRECEDES) {
                                lastIndex = index;
                                break;
                            }
                        }
                        list.addAt(lastIndex, newHighScore);
                    } catch (e : EOFException) {
                        this.logUtil.put("EOF", this, this.commonStrings.LOAD, e);
                        throw e;
                    }
                }
            }
        } catch (e : RecordStoreNotFoundException) {
            this.logUtil.put("No High Scores", this, this.commonStrings.LOAD, e);
        } catch (e : RecordStoreException) {
            this.logUtil.put(this.commonStrings.UNKNOWN, this, this.commonStrings.LOAD, e);
        } catch (e : IOException) {
            this.logUtil.put(this.commonStrings.UNKNOWN, this, this.commonStrings.LOAD, e);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.UNKNOWN, this, this.commonStrings.LOAD, e);
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
    }

    private function isTooManyHighScores() : Bool {
        if (this.getList() != null && this.getList().size() < this.MAXHIGHSCORES) {
            return false;
        } else {
            this.logUtil.putF(new StringMaker().append("HighScores RecordStore Max Reached: ").appendint(this.MAXHIGHSCORES).toString(), this, "isTooManyHighScores");
            return true;
        }
    }

    // throws Exception
    // synchronized
    public override function isBestScore(newHighScore : HighScore) : Bool {
        try {
            if (!this.isTooManyHighScores()) {
                this.logUtil.putF("Slot Available for a High Score", this, "isBestScore");
                return true;
            } else {
                final list : BasicArrayList = this.getList();
                final size : Int = list.size();
                for (index in 0...size) {
                    final highScore : HighScore = (cast list.objectArray[index] : HighScore);
                    if (this.recordComparatorInterface.compare(newHighScore.getAsBytes(), highScore.getAsBytes()) == RecordComparator.FOLLOWS) {
                        this.logUtil.putF("Obtained a High Score", this, "isBestScore");
                        return true;
                    }
                }
            }
            this.logUtil.putF("Not a High Score", this, "isBestScore");
            return false;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.ADD, e);
            throw e;
        }
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(super.toString());
        final list : BasicArrayList = this.getList();
        final size : Int = list.size();
        for (index in 0...size) {
            final highScore : HighScore = (cast list.objectArray[index] : HighScore);
            stringBuffer.append(highScore.getScoreString());
            stringBuffer.append(CommonSeps.getInstance().COMMA_SEP);
        }
        return stringBuffer.toString();
    }

}

