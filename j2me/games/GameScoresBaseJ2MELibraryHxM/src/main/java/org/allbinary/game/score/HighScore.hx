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

//import java.io.ByteArrayOutputStream;
//import java.io.DataOutputStream;
import org.allbinary.game.GameInfo;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class HighScore {
    private final id : Int;
    private var name : String;
    private final gameInfo : GameInfo;
    private final score : haxe.Int64;
    private final scoreString : String;
    public function new(id : Int, name : String, gameInfo : GameInfo, score : haxe.Int64) {
        this.id = id;
        this.name = name;
        this.gameInfo = gameInfo;
        this.score = score;
        this.scoreString = Std.string(this.score);
    }

    public function getId() : Int {
        return this.id;
    }

    public function getName() : String {
        return this.name;
    }

    public function getScore() : haxe.Int64 {
        return this.score;
    }

    // throws Exception
    public function getAsBytes() : haxe.ds.Vector<Int> {
        final byteArrayOutputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
        final outputStream : DataOutputStream = new DataOutputStream(byteArrayOutputStream);
        outputStream.writeUTF(this.getName());
        outputStream.writeLong(this.getScore());
        return byteArrayOutputStream.toByteArray();
    }

    public function getGameInfo() : GameInfo {
        return this.gameInfo;
    }

    public function getScoreString() : String {
        return this.scoreString;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function toString() : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        return new StringMaker().append(this.name).append(commonSeps.COLON).appendlong(this.score).append(commonSeps.FORWARD_SLASH).append(this.scoreString).toString();
    }

}

