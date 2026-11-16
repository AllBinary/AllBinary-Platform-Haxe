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
import jre.io.DataInputStream;
import jre.io.EOFException;
import jre.io.IOException;
import javax.microedition.rms.RecordComparator;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class ScoreComparator implements RecordComparator {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final isHighestBest : Bool;
    public function new(isHighestBest : Bool) {
        this.isHighestBest = isHighestBest;
    }

    public function getBestScore() : haxe.Int64 {
        return (this.isHighestBest ? Long.MAX_VALUE : 0);
    }

    public function compare(recordOne : haxe.ds.Vector<Int>, recordTwo : haxe.ds.Vector<Int>) : Int {
        final byteArrayInputStreamOne : ByteArrayInputStream = new ByteArrayInputStream(recordOne);
        final inputStreamOne : DataInputStream = new DataInputStream(byteArrayInputStreamOne);
        final byteArrayInputStreamTwo : ByteArrayInputStream = new ByteArrayInputStream(recordTwo);
        final inputStreamTwo : DataInputStream = new DataInputStream(byteArrayInputStreamTwo);
        var scoreOne : haxe.Int64 = 0;
        var scoreTwo : haxe.Int64 = 0;
        try {
            inputStreamOne.readUTF();
            inputStreamTwo.readUTF();
            scoreOne = inputStreamOne.readLong();
            scoreTwo = inputStreamTwo.readLong();
        } catch (e : EOFException) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "compare", e);
        } catch (e : IOException) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "compare", e);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "compare", e);
        }
        if (this.isHighestBest) {
            return this.getHighTooLow(scoreOne, scoreTwo);
        } else {
            return this.getLowTooHigh(scoreOne, scoreTwo);
        }
    }

    public function getHighTooLow(scoreOne : haxe.Int64, scoreTwo : haxe.Int64) : Int {
        if (scoreOne > scoreTwo) {
            return javax.microedition.rms.RecordComparator.RecordComparatorFields.PRECEDES;
        } else if (scoreOne < scoreTwo) {
            return javax.microedition.rms.RecordComparator.RecordComparatorFields.FOLLOWS;
        } else {
            return javax.microedition.rms.RecordComparator.RecordComparatorFields.EQUIVALENT;
        }
    }

    public function getLowTooHigh(scoreOne : haxe.Int64, scoreTwo : haxe.Int64) : Int {
        if (scoreOne < scoreTwo) {
            return javax.microedition.rms.RecordComparator.RecordComparatorFields.PRECEDES;
        } else if (scoreOne > scoreTwo) {
            return javax.microedition.rms.RecordComparator.RecordComparatorFields.FOLLOWS;
        } else {
            return javax.microedition.rms.RecordComparator.RecordComparatorFields.EQUIVALENT;
        }
    }

}

