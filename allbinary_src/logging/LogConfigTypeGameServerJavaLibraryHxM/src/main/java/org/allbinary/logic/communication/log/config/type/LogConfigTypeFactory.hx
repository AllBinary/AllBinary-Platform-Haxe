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
package org.allbinary.logic.communication.log.config.type;

import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;

class LogConfigTypeFactory {
    private static final instance : LogConfigTypeFactory = new LogConfigTypeFactory();
    public static function getInstance() : LogConfigTypeFactory {
        return LogConfigTypeFactory.instance;
    }

    private final NO_DESCRIPTION : String = "No Description";
    public final INIT_SERVER : LogConfigType = new LogConfigType("Init Server", this.NO_DESCRIPTION);
    public final LOBBY_SERVER : LogConfigType = new LogConfigType("Lobby Server", this.NO_DESCRIPTION);
    public final GAME_SERVER : LogConfigType = new LogConfigType("Game Server", this.NO_DESCRIPTION);
    public final GAME_SIMULATOR : LogConfigType = new LogConfigType("Game Simulator", this.NO_DESCRIPTION);
    public final CUSTOM_TYPES : LogConfigType = new LogConfigType("Custom Types", this.NO_DESCRIPTION);
    public function new() {
        LogConfigTypes.LOGGING.add(this.INIT_SERVER);
    }

}

