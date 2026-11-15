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
package org.allbinary.game.input.event;

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class GameKeyEvent extends AllBinaryEventObject {
    public static function createEvent(anyType : Any, sourceId : Int, key : Int) : GameKeyEvent {
        return new GameKeyEvent(anyType, sourceId, 0, 0, key, false);
    }

    public static final NONE : GameKeyEvent = new GameKeyEvent(NullUtil.getInstance().NULL_OBJECT, -1, -1, -1, -1, false);
    private final sourceId : Int;
    private var repeated : Bool = false;
    private var key : Int;
    private var gameActionKey : Int = 0;
    private var originalKey : Int = 0;
    public function new(anyType : Any, sourceId : Int, originalKey : Int, gameActionKey : Int, key : Int, repeated : Bool) {
        super(anyType);
        this.sourceId = sourceId;
        this.setOriginalKey(originalKey);
        this.key = key;
        this.setGameActionKey(gameActionKey);
        this.setRepeatEvents(repeated);
    }

    public function init(anyType : Any) : Void {
        this.setSource(anyType);
    }

    private function setRepeatEvents(repeated : Bool) : Void {
        this.repeated = repeated;
    }

    public function hasRepeatEvents() : Bool {
        return this.repeated;
    }

    public function getKey() : Int {
        return this.key;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("\nKey: ");
        stringBuffer.appendint(this.getKey());
        return Std.string(stringBuffer);
    }

    public function getOriginalKey() : Int {
        return this.originalKey;
    }

    public function setOriginalKey(originalKey : Int) : Void {
        this.originalKey = originalKey;
    }

    public function getGameActionKey() : Int {
        return this.gameActionKey;
    }

    public function setGameActionKey(gameActionKey : Int) : Void {
        this.gameActionKey = gameActionKey;
    }

    public function getSourceId() : Int {
        return this.sourceId;
    }

}

