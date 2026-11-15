/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.game.layer;

import org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHud;
import org.allbinary.game.combat.destroy.event.DestroyedEvent;
import org.allbinary.game.input.PlayerGameInput;
import org.allbinary.game.input.form.NullRTSFormInputFactory;
import org.allbinary.game.input.form.RTSFormInput;
import org.allbinary.game.layer.capital.Capital;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.media.audio.Sound;

class NullRTSLayer extends NullPathFindingLayer implements RTSPlayerLayerInterface {
    public static final NULL_RTS_LAYER : NullRTSLayer = new NullRTSLayer();
    public override function getName() : String {
        throw new haxe.Exception();
    }

    // throws Exception
    public override function processInput(layerManager : AllBinaryLayerManager) : Void {
        throw new haxe.Exception();
    }

    public override function initInputProcessors() : Void {
        throw new haxe.Exception();
    }

    public override function getGameNotificationHud() : GameNotificationHud {
        throw new haxe.Exception();
    }

    public override function getCurrentScrollSelectionForm() : ScrollSelectionForm {
        throw new haxe.Exception();
    }

    public override function setCurrentScrollSelectionForm(currentScrollSelectionForm : ScrollSelectionForm) : Void {
        throw new haxe.Exception();
    }

    public override function getBuildingScrollSelectionForm() : ScrollSelectionForm {
        throw new haxe.Exception();
    }

    public override function getPlayerGameInput() : PlayerGameInput {
        throw new haxe.Exception();
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public override function onDestroyed(destroyedEvent : DestroyedEvent) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public override function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        throw new haxe.Exception();
    }

    public override function getCapital() : Capital {
        throw new haxe.Exception();
    }

    public override function getRTSFormInput() : RTSFormInput {
        return NullRTSFormInputFactory.getInstance();
    }

    public override function add(sound : Sound) : Void {
        throw new haxe.Exception();
    }

    public override function getPlayerOwnedRTSLayers() : PlayerOwnedRTSLayers {
        throw new haxe.Exception();
    }

    public override function implmentsArtificialIntelligenceCompositeInterface() : Bool {
        throw new haxe.Exception();
    }

    public function new() {
        super();
    }
}

