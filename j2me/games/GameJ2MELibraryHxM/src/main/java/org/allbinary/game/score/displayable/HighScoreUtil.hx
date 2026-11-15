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
package org.allbinary.game.score.displayable;

import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import org.allbinary.game.GameInfo;
import org.allbinary.game.score.HighScore;
import org.allbinary.game.score.HighScoreNamePersistanceSingleton;
import org.allbinary.game.score.HighScores;
import org.allbinary.game.score.HighScoresFactoryInterface;
import org.allbinary.game.score.HighScoresHelperBaseInterface;
import org.allbinary.game.score.HighScoresResultsListener;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;

class HighScoreUtil implements HighScoresResultsListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public static final SUBMIT_TEXTBOX_COMMAND : Command = new Command("Submit", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    private final highScoresFactoryInterface : HighScoresFactoryInterface;
    private var highScoresArray : haxe.ds.Vector<HighScores>;
    private final highScore : HighScore;
    private final abeClientInformation : AbeClientInformationInterface;
    private final gameInfo : GameInfo;
    private final highScoresHelper : HighScoresHelperBaseInterface;
    private var firstTime : Bool = true;
    public function new(highScoresFactoryInterface : HighScoresFactoryInterface, highScoresHelper : HighScoresHelperBaseInterface, abeClientInformation : AbeClientInformationInterface, gameInfo : GameInfo, cmdListener : CommandListener, name : String, highScore : HighScore) {
        this.highScoresFactoryInterface = highScoresFactoryInterface;
        this.highScoresHelper = highScoresHelper;
        this.highScoresArray = this.highScoresHelper.getHighScoresArray();
        this.highScore = highScore;
        this.abeClientInformation = abeClientInformation;
        this.gameInfo = gameInfo;
    }

    public function setHighScoresArray(highScoresArray : haxe.ds.Vector<HighScores>) : Void {
        this.highScoresArray = highScoresArray;
        this.firstTime = false;
        this.saveHighScore();
    }

    public function update(name : String) : Void {
        HighScoreNamePersistanceSingleton.getInstance().save(this.abeClientInformation, this.gameInfo, name);
        this.highScore.setName(name);
    }

    public function saveHighScore() : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(this.commonStrings.START).append(StringUtil.getInstance().toString(this.highScore))), this, "saveHighScore");
        final size : Int = this.highScoresArray.length;
        if (this.firstTime && size == 0) {
            this.logUtil.putF("Games canvas did not give us any HighScores", this, "saveHighScore");
            this.highScoresFactoryInterface.fetchHighScores(this.gameInfo, this);
            return;
        }
        var highScores : HighScores = null;
        var highScoresAsString : String = null;
        for (index in 0...size) {
            highScores = this.highScoresArray[index];
            highScores.addHighScore(this.highScore);
            highScoresAsString = Std.string(highScores);
            this.logUtil.putF(Std.string(new StringMaker().append("Added/Adding Score: ").append(highScoresAsString)), this, "saveHighScore");
        }
        this.highScoresHelper.setHighScoresArray(this.highScoresArray);
    }

    public function submit(myCanvas : MyCanvas) : Void {
        final commandListener : CommandListener = myCanvas.getCustomCommandListener();
        commandListener.commandAction(HighScoreUtil.SUBMIT_TEXTBOX_COMMAND, myCanvas);
    }

}

