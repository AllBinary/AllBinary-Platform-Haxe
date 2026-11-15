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
package org.allbinary.android.activity;

import android.app.Activity;
import android.view.MotionEvent;
import android.view.View;
import org.allbinary.android.GenericMotionEventVerifyInterface;
import org.allbinary.game.configuration.event.GameFeatureEvent;
import org.allbinary.game.configuration.event.GameFeatureListenerInterface;
import org.allbinary.game.configuration.event.GameInitializedEvent;
import org.allbinary.game.configuration.event.GameInitializedListenerInterface;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class MidletActivityBase extends Activity implements GameFeatureListenerInterface implements GameInitializedListenerInterface implements SimpleProgressActivityInterface implements KeyInputViewCompositeInterface implements GenericMotionEventVerifyInterface {
    public override function onGameFeatureChange(gameFeatureEvent : GameFeatureEvent) : Void {
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
    }

    public override function onGameInitialized(gameInitializedEvent : GameInitializedEvent) : Void {
    }

    // throws Exception
    public override function onSetProgress(value : Int, text : String) : Void {
    }

    // throws Exception
    public override function onDismissProgress(animationSequence : haxe.ds.Vector<Int>) : Void {
    }

    // throws Exception
    public override function onShowProgress(indeterminate : Bool, animationSequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getRootView() : View {
        throw new haxe.Exception();
    }

    public override function getView() : View {
        throw new haxe.Exception();
    }

    public override function setKeyInputView(keyInputView : View) : Void {
    }

    public override function onGenericMotionEvent(event : MotionEvent) : Bool {
        throw new haxe.Exception();
    }

    public function new() {
        super();
    }
}

