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
package org.allbinary.game.ag.layer.weapon.mine;

import org.allbinary.game.layer.resources.BasicGameResources;
import org.allbinary.logic.NullUtil;

class MineWeaponResources extends BasicGameResources {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : MineWeaponResources {
        if (MineWeaponResources.instance == NullUtil.getInstance().NULL_OBJECT) {
            MineWeaponResources.instance = new MineWeaponResources();
        }
        return (cast MineWeaponResources.instance : MineWeaponResources);
    }

    public final DROP_TEXT_RESOURCE : String = "/mine_drop_text_20_by_20.png";
    public final DROP_RESOURCE : String = "/mine_drop_20_by_20.png";
    public final DROP_ICON_RESOURCE : String = "/mine_drop_icon_20_by_20.png";
    public function new() {
        super();
        final ROOT : String = "/mine";
        final SMALL : String = "_20_by_20.png";
        final MEDIUM : String = SMALL;
        final SIZE_FOUR : String = SMALL;
        final SIZE_FIVE : String = SMALL;
        final SIZE_SIX : String = SMALL;
        final SIZE : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX]);
        super.init(ROOT, SIZE);
    }

}

