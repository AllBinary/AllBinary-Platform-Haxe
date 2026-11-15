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
package org.allbinary.game.graphics.hud;


class BasicHudFactory {
    private static final instance : BasicHudFactory = new BasicHudFactory();
    public static function getInstance() : BasicHudFactory {
        return BasicHudFactory.instance;
    }

    public function new() {
    }

    public final DIRECTION_EXCEPTION : String = "Only Horizontal Direction is Allowed Currently";
    public final VERTICAL : Int = 0;
    public final HORIZONTAL : Int = 1;
    public final BOTTOMLEFT : Int = 0;
    public final BOTTOMRIGHT : Int = 1;
    public final TOPLEFT : Int = 2;
    public final TOPRIGHT : Int = 3;
    public final BOTTOMCENTER : Int = 4;
    public final TOPCENTER : Int = 5;
    public final ABSOLUTE : Int = 6;
}

