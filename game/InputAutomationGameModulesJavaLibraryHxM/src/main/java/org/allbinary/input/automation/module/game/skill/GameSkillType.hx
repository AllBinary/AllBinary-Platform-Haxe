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


class GameSkillType {
    public static var MANA : GameSkillType = new GameSkillType("Mana");
    public static var REPLENISH : GameSkillType = new GameSkillType("Replenish");
    public static var TIMED : GameSkillType = new GameSkillType("Timed");
    public static var ATTACK : GameSkillType = new GameSkillType("Attack");
    public static var TRANSPORT : GameSkillType = new GameSkillType("Transport");
    private final SPELL_GAME_SKILL_TYPE : String = "SpellGameSkillType: ";
    private var name : String = null;
    public function new(name : String) {
        this.setName(name);
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function toString() : String {
        return this.SPELL_GAME_SKILL_TYPE + this.getName();
    }

}

