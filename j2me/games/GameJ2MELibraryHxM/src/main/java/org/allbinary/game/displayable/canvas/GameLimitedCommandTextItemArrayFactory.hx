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
package org.allbinary.game.displayable.canvas;

import org.allbinary.graphics.form.item.CommandTextItemArrayFactory;
import org.allbinary.graphics.form.item.LimitCommandsVisitor;

class GameLimitedCommandTextItemArrayFactory {
    private static final instance : GameLimitedCommandTextItemArrayFactory = new GameLimitedCommandTextItemArrayFactory();
    private final commandTextItemArrayFactory : CommandTextItemArrayFactory = new CommandTextItemArrayFactory(new LimitCommandsVisitor());
    public static function getInstance() : GameLimitedCommandTextItemArrayFactory {
        return GameLimitedCommandTextItemArrayFactory.instance;
    }

    public function getCommandTextItemArrayFactory() : CommandTextItemArrayFactory {
        return this.commandTextItemArrayFactory;
    }

    public function new() {
    }
}

