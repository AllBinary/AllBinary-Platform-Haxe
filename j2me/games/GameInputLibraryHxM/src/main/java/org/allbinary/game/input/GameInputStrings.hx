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
package org.allbinary.game.input;


class GameInputStrings {
    private static final instance : GameInputStrings = new GameInputStrings();
    public static function getInstance() : GameInputStrings {
        return GameInputStrings.instance;
    }

    public final PROCESS_INPUT : String = "processInput";
    public final KEY_PRESSED : String = "keyPressed";
    public final KEY_RELEASED : String = "keyReleased";
    public final KEY_REPEATED : String = "keyRepeated";
    public final ON_PRESS_GAME_KEY : String = "onPressGameKeyEvent";
    public final ON_DOWN_GAME_KEY : String = "onDownGameKeyEvent";
    public final ON_UP_GAME_KEY : String = "onUpGameKeyEvent";
    public final NO_KEY : String = "Key Code Not Mapped For Game: ";
    public final ADD_KEY_EVENT : String = "addGameKeyEvent";
    public final REMOVE_KEY_EVENT : String = "removeGameKeyEvent";
    public final STRAFE_LEFT : String = "strafeLeft";
    public final STRAFE_RIGHT : String = "strafeRight";
    public final PROCESS_MOTION_INPUT : String = "processMotionInput";
    public final UDPATE_CURRENT_TOUCH_INPUT_FACTORY : String = "updateCurrentTouchInputFactory";
    public final ENABLE_PLAYER_GAME_INPUTS : String = "Enabling PlayerGameInputs: ";
    public final ENABLE_PLAYER_GAME_INPUT : String = "Enabling PlayerGameInput: ";
    public function new() {
    }
}

