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
package org.allbinary.game.layer.special;

import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.layer.AllBinaryLayerManager;

interface SpecialGameInputInterface extends PaintableInterface {
    // throws Exception
    function up() : Void;

    // throws Exception
    function down() : Void;

    // throws Exception
    function right() : Void;

    // throws Exception
    function left() : Void;

    // throws Exception
    function strafeLeft() : Void;

    // throws Exception
    function strafeRight() : Void;

    // throws Exception
    function fire(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void;

    // throws Exception
    function special1(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void;

    // throws Exception
    function special2(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void;

    // throws Exception
    function special3(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void;

    // throws Exception
    function special4(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void;

    // throws Exception
    function special5(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void;

}

