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
package org.allbinary.game.midlet;


class DemoGameMidletStateFactory {
    private static var STATE : DemoGameMidletStateFactory = new DemoGameMidletStateFactory();
    public final NONE : DemoGameMidletState = new DemoGameMidletState();
    public final START_DEMO : DemoGameMidletState = new DemoGameMidletState();
    public final START_GAME : DemoGameMidletState = new DemoGameMidletState();
    public final START_INPUT_MAPPING : DemoGameMidletState = new DemoGameMidletState();
    public function new() {
    }

    public static function getInstance() : DemoGameMidletStateFactory {
        return DemoGameMidletStateFactory.STATE;
    }

}

