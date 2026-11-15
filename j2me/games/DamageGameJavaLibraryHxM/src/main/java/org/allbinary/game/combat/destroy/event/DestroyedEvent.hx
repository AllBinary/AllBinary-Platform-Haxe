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
package org.allbinary.game.combat.destroy.event;

import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.game.displayable.canvas.NullGameCanvas;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class DestroyedEvent extends AllBinaryEventObject {
    private var allBinaryGameCanvas : AllBinaryGameCanvas = NullGameCanvas.getInstance();
    private var allBinaryLayerInterface : AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;
    public function new(combatGameCanvas : AllBinaryGameCanvas) {
        super(DestroyedEventHandler.getInstance());
        this.setAllBinaryGameCanvas(combatGameCanvas);
    }

    public function getAllBinaryGameCanvas() : AllBinaryGameCanvas {
        return this.allBinaryGameCanvas;
    }

    public function getLayerInterface() : AllBinaryLayer {
        return this.allBinaryLayerInterface;
    }

    private function setAllBinaryGameCanvas(allBinaryGameCanvas : AllBinaryGameCanvas) : Void {
        this.allBinaryGameCanvas = allBinaryGameCanvas;
    }

    public function setLayerInterfaceForCircularStaticPool(allBinaryLayerInterface : AllBinaryLayer) : Void {
        this.allBinaryLayerInterface = allBinaryLayerInterface;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("DestroyedEvent: \n");
        stringBuffer.append("AllBinaryLayerInterface: ");
        stringBuffer.append(Std.string(this.allBinaryLayerInterface));
        stringBuffer.append("\nAllBinaryGameCanvas: ");
        stringBuffer.append(StringUtil.getInstance().toString(this.getAllBinaryGameCanvas()));
        return Std.string(stringBuffer);
    }

}

