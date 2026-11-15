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
package org.allbinary.game.configuration.event;

import org.allbinary.game.configuration.feature.Feature;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureUtil;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BaseChangedGameFeatureListener implements GameFeatureListenerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final gameFeatureUtil : GameFeatureUtil = GameFeatureUtil.getInstance();
    public final list : BasicArrayList = new BasicArrayListD();
    private var changed : Bool = true;
    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(CommonStrings.getInstance().NOT_IMPLEMENTED, this);
    }

    public function onGameFeatureChange(gameFeatureEvent : GameFeatureEvent) : Void {
        this.logUtil.putF(new StringMaker().append(this.gameFeatureUtil.GAME_FEATURE_CHANGED).append(gameFeatureEvent.getWhatChanged()).toString(), this, this.gameFeatureUtil.ON_GAME_FEATURE_CHANGE);
        this.list.add(gameFeatureEvent.getGameOption());
        this.setChanged(true);
    }

    public function add(gameFeature : Feature) : Void {
        this.list.add(gameFeature);
    }

    public function remove(gameFeature : Feature) : Void {
        this.list.remove(gameFeature);
    }

    public function setChanged(initialized : Bool) : Void {
        this.changed = initialized;
        if (!this.isChanged()) {
            this.list.clear();
        }
    }

    public function isChangedFeature(gameFeature : Feature) : Bool {
        final isChanged : Bool = this.list.contains(gameFeature);
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("GameFeature: ");
        stringBuffer.append(StringUtil.getInstance().toString(gameFeature));
        stringBuffer.append(" isFeature: ");
        stringBuffer.appendboolean(Features.getInstance().isFeature(gameFeature));
        stringBuffer.append(" isChanged: ");
        stringBuffer.appendboolean(isChanged);
        this.logUtil.putF(stringBuffer.toString(), this, "isChanged");
        return isChanged;
    }

    public function isChanged() : Bool {
        return this.changed;
    }

    public function new() {
    }
}

