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
package org.allbinary.input.automation.module.game.skill;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class GameSkill {
    private static var hashMap : HashMap = StdUtil.getInstance().createHashMap();
    private var gameSkillType : GameSkillType = null;
    private var extra : String = null;
    private var time : Int = 0;
    private var vector : BasicArrayList;
    private final GAME_SKILL_LABEL : String = "GameSkill: ";
    private final EXTRA_LABEL : String = "Extra: ";
    private final TIME_LABEL : String = "Time: ";
    public function new(gameSkillType : GameSkillType, extra : String, time : Int) {
        this.setGameSkillType(gameSkillType);
        this.setExtra(extra);
        this.setTime(time);
        this.vector = new BasicArrayListD();
        GameSkill.hashMap.put(new StringMaker().append(this.getGameSkillType().getName()).append(CommonSeps.getInstance().SPACE).append(extra).toString(), this);
    }

    public function getGameSkillType() : GameSkillType {
        return this.gameSkillType;
    }

    public function setGameSkillType(gameSkillType : GameSkillType) : Void {
        this.gameSkillType = gameSkillType;
    }

    public function getExtra() : String {
        return this.extra;
    }

    public function setExtra(extra : String) : Void {
        this.extra = extra;
    }

    public function getTime() : Int {
        return this.time;
    }

    public function setTime(time : Int) : Void {
        this.time = time;
    }

    public function addProperty(gameSkillPropertyInterface : GameSkillPropertyInterface) : Void {
        this.vector.add(gameSkillPropertyInterface);
    }

    public function getProperties() : BasicArrayList {
        return this.vector;
    }

    public static function getInstance(gameSkillType : GameSkillType, extra : String) : GameSkill {
        return (cast GameSkill.hashMap.get(new StringMaker().append(gameSkillType.getName()).append(CommonSeps.getInstance().SPACE).append(extra).toString()) : GameSkill);
    }

    public function toString() : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.GAME_SKILL_LABEL);
        stringBuffer.append(this.getGameSkillType().toString());
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(this.EXTRA_LABEL);
        stringBuffer.append(this.getExtra());
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(this.TIME_LABEL);
        stringBuffer.appendlong(haxe.Int64.ofInt(this.getTime()));
        return stringBuffer.toString();
    }

}

