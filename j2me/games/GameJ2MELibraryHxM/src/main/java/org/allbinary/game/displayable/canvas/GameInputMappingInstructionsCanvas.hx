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

import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Graphics;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.paint.ColorFillBasePaintable;
import org.allbinary.game.paint.ColorFillPaintableFactory;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.draw.DrawStringUtil;
import org.allbinary.logic.string.StringUtil;

class GameInputMappingInstructionsCanvas extends GameCommandCanvas {
    public static final DISPLAY : Command = new Command("Help", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public static final CLOSE : Command = new Command("Close", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1);
    public static final NAME : String = "GameInputMappingInstructionsCanvas";
    private final drawStringUtil : DrawStringUtil = DrawStringUtil.getInstance();
    public final TITLE : String = "Input Instructions";
    private final instructions : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy(["Add Input Mapping:", "1. Select the desired action by generating a currently defined input for a given action.", "(Example: Press the '1' key to select the Fire action)", "2. Make the newly desired input for the selected action.", "(Example: Press 'f' to add it to the selected action)", "Note: If the input is already mapped to another action then it will not be added. You", "will need to deleted from the other action before adding it to another.", "Warning: Not all keys map for a given platform and show as Unknown.", StringUtil.getInstance().EMPTY_STRING, "Remove Input Mapping:", "1. Select the desired action by generating a currently defined input for a given action.", "(Example: Press the key '1' to select the Fire action)", "2. Select a mapped input for the selected action.", "(Example: Press the key '1' to select the '1' key input for the selected Fire action)", "3. Press the Delete Key."]);
    private var colorFillPaintable : ColorFillBasePaintable;
    private var anchor : Int = Anchor.TOP_LEFT;
    public function new(commandListener : CommandListener, allBinaryGameLayerManager : AllBinaryGameLayerManager) {
        super(commandListener, GameInputMappingInstructionsCanvas.NAME, allBinaryGameLayerManager.getBackgroundBasicColor(), allBinaryGameLayerManager.getForegroundBasicColor());
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.colorFillPaintable = ColorFillPaintableFactory.getInstance().getInstance(allBinaryGameLayerManager.getBackgroundBasicColor(), false);
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        this.removeAllCommands();
        this.addCommand(GameInputMappingInstructionsCanvas.CLOSE);
        this.setCommandListener(cmdListener);
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        this.colorFillPaintable.paint(graphics);
        var halfWidth : Int = this.displayInfo.getLastHalfWidth();
        var beginWidth : Int = (graphics.getFont().stringWidth(this.TITLE) >> 1);
        graphics.setColor(this.foregroundColor);
        graphics.drawString(this.TITLE, halfWidth - beginWidth, this.fontHeight, this.anchor);
        this.drawStringUtil.drawCenterStrings(graphics, this.instructions, this.displayInfo.getLastWidth(), this.fontHeight, halfWidth, 3 * this.fontHeight);
        super.paint(graphics);
    }

}

