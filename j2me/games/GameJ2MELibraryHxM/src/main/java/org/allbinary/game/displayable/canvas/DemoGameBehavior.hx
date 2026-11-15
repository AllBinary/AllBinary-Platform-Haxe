/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

import org.allbinary.game.GameTypeFactory;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;

class DemoGameBehavior {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : DemoGameBehavior = new DemoGameBehavior();
    public static function getInstance() : DemoGameBehavior {
        return DemoGameBehavior.instance;
    }

    // throws Exception
    public function init() : Void {
    }

    public function pause(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    public function unPause(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    // throws Exception
    public function updateTouch(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    // throws Exception
    public function updateScreenButtonPaintable(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.setTouchPaintableP(NullPaintable.getInstance());
    }

    // throws Exception
    public function setGameState(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    public function removeAllGameKeyInputListeners(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    // throws Exception
    public function updateEndGameProcessor(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    // throws Exception
    public function buildGame(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    // throws Exception
    public function run(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(GameTypeFactory.getInstance().BOT.toString(), this, commonStrings.RUN);
    }

    // throws Exception
    public function setHighScore(abeClientInformation : AbeClientInformationInterface, allBinaryGameCanvas : AllBinaryGameCanvas, name : String, score : haxe.Int64, autoSubmit : Bool, isLast : Bool) : Void {
    }

    public function new() {
    }
}

