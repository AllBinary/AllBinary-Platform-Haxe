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

import org.allbinary.business.advertisement.GameAdStateFactory;
import org.allbinary.game.GameAdState;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.graphics.opengles.CurrentDisplayableFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

class BaseGameBehavior extends DemoGameBehavior {
    private static final instanceC : BaseGameBehavior = new BaseGameBehavior();
    public static function getInstance() : DemoGameBehavior {
        return BaseGameBehavior.instanceC;
    }

    // throws Exception
    public override function init() : Void {
        final gameAdState : GameAdState = GameAdStateFactory.getInstance().getCurrentInstance();
        gameAdState.playingAdState();
    }

    public override function pause(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        final features : Features = Features.getInstance();
        if (features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL_AS_GAME_THREAD)) {
            final currentDisplayableFactory : CurrentDisplayableFactory = CurrentDisplayableFactory.getInstance();
            currentDisplayableFactory.setRunnable(allBinaryGameCanvas.gamePauseRunnable);
        }
    }

    public override function unPause(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        if (Features.getInstance().isDefault(OpenGLFeatureFactory.getInstance().OPENGL_AS_GAME_THREAD)) {
            final currentDisplayableFactory : CurrentDisplayableFactory = CurrentDisplayableFactory.getInstance();
            currentDisplayableFactory.setRunnable(allBinaryGameCanvas.gameRunnable);
            currentDisplayableFactory.setDisplayable(allBinaryGameCanvas);
        }
    }

    // throws Exception
    public override function updateTouch(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.updateTouch2();
    }

    // throws Exception
    public override function updateScreenButtonPaintable(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.updateScreenButtonPaintable2();
    }

    // throws Exception
    public override function setGameState(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.updateGameState();
    }

    public override function removeAllGameKeyInputListeners(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.removeAllGameKeyInputListeners2();
    }

    // throws Exception
    public override function updateEndGameProcessor(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.updateEndGameProcessor2();
    }

    // throws Exception
    public override function buildGame(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.buildGame2();
    }

    // throws Exception
    public override function run(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.run2();
    }

    // throws Exception
    public override function setHighScore(abeClientInformation : AbeClientInformationInterface, allBinaryGameCanvas : AllBinaryGameCanvas, name : String, score : haxe.Int64, autoSubmit : Bool, isLast : Bool) : Void {
        allBinaryGameCanvas.setHighScore2(abeClientInformation, name, score, autoSubmit, isLast);
    }

    public function new() {
        super();
    }
}

