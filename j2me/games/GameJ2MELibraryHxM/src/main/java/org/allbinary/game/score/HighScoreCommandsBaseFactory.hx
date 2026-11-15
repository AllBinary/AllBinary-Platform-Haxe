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
package org.allbinary.game.score;

import javax.microedition.lcdui.Command;
import org.allbinary.J2MEUtil;
import org.allbinary.logic.communication.log.LogUtil;

class HighScoreCommandsBaseFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final HIGH_SCORE_COMMANDS : haxe.ds.Vector<Command>;
    public function new(HIGH_SCORE_COMMANDS : haxe.ds.Vector<Command>) {
        this.HIGH_SCORE_COMMANDS = HIGH_SCORE_COMMANDS;
    }

    public function isHighScoreCommand(command : Command) : Bool {
        {
            var index : Int = this.HIGH_SCORE_COMMANDS.length - 1;
            while (index >= 0) {
            if (command == this.HIGH_SCORE_COMMANDS[index]) {
                return true;
            }
                index--;
            }
        }
        return false;
    }

    // throws Exception
    public function getIndex(command : Command) : Int {
        {
            var index : Int = this.HIGH_SCORE_COMMANDS.length - 1;
            while (index >= 0) {
            if (command == this.HIGH_SCORE_COMMANDS[index]) {
                return index;
            }
                index--;
            }
        }
        throw new jre.lang.JavaException("No Such Command");
    }

}

