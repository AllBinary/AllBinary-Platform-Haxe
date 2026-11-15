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

import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.TextField;
import org.allbinary.PostGameCommandFactory;
import org.allbinary.game.GameInfo;
import org.allbinary.game.score.HighScore;
import org.allbinary.game.score.HighScoresHelperBaseInterface;
import org.allbinary.game.score.HighScoresFactoryInterface;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.form.item.CustomTextBox;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.graphics.paint.SimpleTextPaintable;
import org.allbinary.input.event.VirtualKeyboardEventHandler;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.logic.system.os.OperatingSystemFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory;

class HighScoreTextBox extends CustomTextBox {
    private final virtualKeyboardEventHandler : VirtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance();
    private final highScoreUtil : HighScoreUtil;
    private final pleaseWait : Paintable;
    private var paintable : Paintable = NullPaintable.getInstance();
    public var submitted : Bool = false;
    public function new(highScoresFactoryInterface : HighScoresFactoryInterface, highScoresHelper : HighScoresHelperBaseInterface, abeClientInformation : AbeClientInformationInterface, gameInfo : GameInfo, cmdListener : CommandListener, name : String, highScore : HighScore, backgrounBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(cmdListener, "New High Score Enter Name:", name, 12, TextField.ANY, Font.getDefaultFont(), backgrounBasicColor, foregroundBasicColor);
        this.pleaseWait = new SimpleTextPaintable(this.commonStrings.PLEASE_WAIT, BasicColorFactory.getInstance().WHITE);
        this.highScoreUtil = new HighScoreUtil(highScoresFactoryInterface, highScoresHelper, abeClientInformation, gameInfo, cmdListener, name, highScore);
        final operatingSystemInterface : GenericOperatingSystem = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
        if (operatingSystemInterface.isOverScan()) {
            var username : String = InApplicationPurchaseFactory.getInstance().getUserName();
            this.getTextFieldItem().setString(username);
        }
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        this.removeAllCommands();
        PostGameCommandFactory.getInstance().addCommands(this);
        this.addCommand(HighScoreUtil.SUBMIT_TEXTBOX_COMMAND);
        this.setCommandListener(cmdListener);
    }

    public override function open() : Void {
        this.virtualKeyboardEventHandler.open();
        this.paintable = NullPaintable.getInstance();
        super.open();
    }

    // throws Exception
    public override function close() : Void {
        this.virtualKeyboardEventHandler.close();
        this.paintable = this.pleaseWait;
        this.repaintBehavior.onChangeRepaint(this);
        super.close();
        this.removeCommand(HighScoreUtil.SUBMIT_TEXTBOX_COMMAND);
        this.update();
        if (this.submitted) {
            this.highScoreUtil.saveHighScore();
        } else {
        }
        this.paintable = NullPaintable.getInstance();
        this.repaintBehavior.onChangeRepaint(this);
    }

    // throws Exception
    public override function update() : Void {
        final name : String = this.getTextFieldItem().getString();
        this.highScoreUtil.update(name);
        super.update();
    }

    public override function paint(graphics : Graphics) : Void {
        super.paint(graphics);
        this.paintable.paint(graphics);
    }

    public function saveHighScore() : Void {
        this.highScoreUtil.saveHighScore();
    }

    public override function submit() : Void {
        this.highScoreUtil.submit(this);
    }

}

