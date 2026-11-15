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
package org.allbinary.business.advertisement;

import org.allbinary.game.GameType;
import org.allbinary.game.state.GameState;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;

class GameAdStateBase {
    public final adConfigurationP : AdConfiguration;
    public final advertisementsP : Advertisements = new Advertisements();
    public var okayToShowAdsP : Bool = false;
    public function new(adConfiguration : AdConfiguration) {
        this.adConfigurationP = adConfiguration;
    }

    public function initViewArray(viewArray : haxe.ds.Vector<Any>) : Void {
    }

    public function onStart(anyType : Any) : Void {
        this.init();
    }

    public function init() : Void {
    }

    public function isShowingAtLocation(location : Int) : Bool {
        return false;
    }

    public function isShowingAt() : Bool {
        return false;
    }

    public function show() : Void {
    }

    public function hide() : Void {
    }

    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public function processAdState(gameState : GameState, gameType : GameType) : Void {
    }

    public function processPageAdState() : Void {
    }

    // throws Exception
    public function playingAdState() : Void {
    }

    // throws Exception
    public function playingAdStateWH(width : Int, height : Int) : Void {
    }

    // throws Exception
    public function notPlayingAdState() : Void {
    }

    public function setGameIsReady(gameIsReady : Bool) : Void {
    }

    public function isGameIsReady() : Bool {
        return false;
    }

    public function getAdvertisements() : Advertisements {
        return this.advertisementsP;
    }

    public function getAdConfiguration() : AdConfiguration {
        return this.adConfigurationP;
    }

    public function isOkayToShowPageAd() : Bool {
        return false;
    }

    public function setOkayToShowAds(okayToShowAds : Bool) : Void {
        this.okayToShowAdsP = okayToShowAds;
    }

    public function isOkayToShowAds() : Bool {
        return this.okayToShowAdsP;
    }

    public function isEnabled() : Bool {
        return false;
    }

}

