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
import org.allbinary.graphics.paint.NullPaintable;

class BaseMenuBehavior {
    private static final instance : BaseMenuBehavior = new BaseMenuBehavior();
    public static function getInstance() : BaseMenuBehavior {
        return BaseMenuBehavior.instance;
    }

    // throws Exception
    public function onDisplayChangeEvent(allBinaryGameCanvas : AllBinaryGameCanvas, displayChangeEvent : DisplayChangeEvent) : Void {
    }

    public function initSpecialPaint(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        allBinaryGameCanvas.setNonBotPaintableP(NullPaintable.getInstance());
    }

    // throws Exception
    public function initMenu(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    // throws Exception
    public function updateMenu(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    // throws Exception
    public function popupMenu(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    public function closeMenu(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
    }

    public function new() {
    }
}

