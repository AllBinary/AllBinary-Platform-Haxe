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

import org.allbinary.graphics.displayable.event.DisplayChangeEvent;

class InGameMenuBehavior extends BaseMenuBehavior {
    private static final instanceC : InGameMenuBehavior = new InGameMenuBehavior();
    public static function getInstance() : InGameMenuBehavior {
        return InGameMenuBehavior.instanceC;
    }

    // throws Exception
    public override function onDisplayChangeEvent(allBinaryGameCanvas : AllBinaryGameCanvas, displayChangeEvent : DisplayChangeEvent) : Void {
        allBinaryGameCanvas.updateMenuFromEvent(displayChangeEvent);
    }

    public override function initSpecialPaint(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.setNonBotPaintableP(new GameCanvasNonBotPaintable(allBinaryGameCanvas));
    }

    // throws Exception
    public override function initMenu(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.initMenu2();
    }

    // throws Exception
    public override function updateMenu(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.initMenu2();
    }

    // throws Exception
    public override function popupMenu(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.popupMenu2();
    }

    public override function closeMenu(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.closeMenu2();
    }

    public function new() {
        super();
    }
}

