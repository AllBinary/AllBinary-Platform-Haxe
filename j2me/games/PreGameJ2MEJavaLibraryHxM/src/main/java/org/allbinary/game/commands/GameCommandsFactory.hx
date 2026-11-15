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
package org.allbinary.game.commands;

//import javax.microedition.lcdui.Command;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class GameCommandsFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : GameCommandsFactory {
        if (GameCommandsFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            GameCommandsFactory.instance = new GameCommandsFactory();
        }
        return (cast GameCommandsFactory.instance : GameCommandsFactory);
    }

    public final TOGGLE_FULLSCREEN : Command = new Command("Toggle FullScreen", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final TOGGLE_KEYBOARD : Command = new Command("Keyboard", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final SET_MENU_DISPLAYABLE : Command = new Command("Set Menu Displayable", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final APPLICATION_UPDATE : Command = new Command(CommonStrings.getInstance().UPDATE, StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final DISPLAY_ABOUT : Command = new Command(CanvasStrings.getInstance().ABOUT, StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2);
    public final OPEN_WEB_URL : Command = new Command("Open Web URL", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2);
    public final CLOSE_OPTIONS : Command = new Command("Back", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final DISPLAY_OPTIONS : Command = new Command(CanvasStrings.getInstance().OPTIONS, StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2);
    public final START_TRACE : Command = new Command("Start Trace", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final STOP_TRACE : Command = new Command("Stop Trace", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final DEFAULT_OPTIONS : Command = new Command("Default", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final SHOW_GAME_CANVAS : Command = new Command("Back to Game", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final CLOSE_AND_SHOW_GAME_CANVAS : Command = new Command("Back", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final QUIT_COMMAND : Command = new Command("Quit", StringUtil.getInstance().EMPTY_STRING, Command.STOP, 1);
    public final RESTART_COMMAND : Command = new Command("Restart", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 0);
    public final DISPLAY_SAVE_FORM : Command = new Command("Save To", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3);
    public final SAVE : Command = new Command("Save", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3);
    public final DISPLAY_LOAD_FORM : Command = new Command("Load", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3);
    public final LOAD_FILE : Command = new Command("Load File", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3);
    public final DELETE_FILE : Command = new Command("Delete File", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final EXIT_COMMAND : Command = new Command("Exit", StringUtil.getInstance().EMPTY_STRING, Command.EXIT, 2);
    public final EXIT_WITHOUT_PROGRESS_COMMAND : Command = new Command("Exit Without Progress", StringUtil.getInstance().EMPTY_STRING, Command.EXIT, 2);
    public final START_COMMAND : Command = new Command(CommonStrings.getInstance().START, StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final CONTINUE_COMMAND : Command = new Command("Continue", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final SELECT_COMMAND : Command = new Command("Select", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final FEATURE_UPDATE : Command = new Command("Feature Update", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public final BUY_COMMAND : Command = new Command("BUY", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public function new() {
    }

}

