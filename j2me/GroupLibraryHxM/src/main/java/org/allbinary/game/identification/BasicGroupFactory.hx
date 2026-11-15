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
package org.allbinary.game.identification;

import org.allbinary.logic.NullUtil;

class BasicGroupFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : BasicGroupFactory {
        if (BasicGroupFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            BasicGroupFactory.instance = new BasicGroupFactory();
        }
        return (cast BasicGroupFactory.instance : BasicGroupFactory);
    }

    public final NAME : String = "GROUP_NAME";
    public final NO_SUCH_GROUP : String = "No Such Group: ";
    public final GOOD : Group = new Group("Good Guys", 0);
    public final ENEMY : Group = new Group("Bad Guys", 1);
    public final ENEMY_ON_LEVEL : Group = new Group("Bad Guys on Level", 2);
    public final NONE : Group = new Group("Not On A Team", 3);
    public final GOOD_ARRAY : haxe.ds.Vector<Group> = haxe.ds.Vector.fromArrayCopy([this.GOOD]);
    public final ENEMY_ARRAY : haxe.ds.Vector<Group> = haxe.ds.Vector.fromArrayCopy([this.ENEMY]);
    public final ENEMY_ON_LEVEL_ARRAY : haxe.ds.Vector<Group> = haxe.ds.Vector.fromArrayCopy([this.ENEMY, this.ENEMY_ON_LEVEL]);
    public final NONE_ARRAY : haxe.ds.Vector<Group> = haxe.ds.Vector.fromArrayCopy([this.NONE]);
    public function new() {
    }
}

