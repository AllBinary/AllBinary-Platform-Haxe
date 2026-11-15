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
package org.allbinary.game.health;

//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Graphics;
import min3d.core.ColorBufferList;
import min3d.core.Number3dBufferList;
import min3d.objectPrimitives.Rectangle;
import min3d.vos.Number3d;
import org.allbinary.device.OpenGLESGraphics;
import org.allbinary.graphics.threed.min3d.renderer.Object3dProcessor;
import org.allbinary.graphics.threed.min3d.renderer.Object3dProcessorUtil;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.view.ViewPositionBase;

class HealthBarThreedAnimation extends HealthBarAnimation {
    private var rectangle : Rectangle;
    private final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
    public function new(layerInterface : AllBinaryLayer, location : Int) {
        super(layerInterface, location);
        this.basicColor = this.basicColorFactory.GREEN;
        this.colorP = Std.int(this.basicColor);
        this.rectangle = new Rectangle(0, 0, 1, 1, this.basicColor);
        this.rectangle.setDoubleSidedEnabled(true);
        this.rectangle.setNormalsEnabled(false);
        this.rectangle.setTexturesEnabled(false);
    }

    private function updateColor() : Void {
        var colorBufferList : ColorBufferList = this.rectangle.getVertices().getColor4BufferList();
        var size : Int = colorBufferList.size();
        {
            var index : Int = size;
            while (--index >= 0) {
            colorBufferList.set(index, this.basicColor);
            }
        }
    }

    private function updateSize() : Void {
        final number3dBufferList : Number3dBufferList = this.rectangle.getVertices().getPointsOnFacesNumber3dBufferList();
        var width : Int = this.x2;
        var height : Int = this.thickness * 2;
        var segsH : Int = 1;
        var segsW : Int = 1;
        var row : Int = 0;
        var col : Int = 0;
        var w : Float = Std.int(width / segsW);
        var h : Float = Std.int(height / segsH);
        var width5 : Float = width / 2.0;
        var height5 : Float = height / 2.0;
        var index : Int = 0;
        for (row in 0...segsH + 1) {
            for (col in 0...segsW + 1) {
                number3dBufferList.set(index++, col * w - width5, row * h - height5, 0.0);
            }
        }
    }

    public function onHealthChange(newX2 : Int) : Void {
        super.onHealthChange(newX2);
        this.updateColor();
        this.updateSize();
    }

    private final object3dProcessor : Object3dProcessor = Object3dProcessorUtil.getInstance().getInstanceObject3dProcessor();
    public function paintThreedXYZ(graphics : Graphics, x : Int, y : Int, z : Int) : Void {
        final openGLESGraphics : OpenGLESGraphics = (cast graphics : OpenGLESGraphics);
        final gl : GL10 = openGLESGraphics.getGl10();
        final viewPosition : ViewPositionBase = this.allbinaryLayer.getViewPosition();
        final positionNumber3d : Number3d = this.rectangle.getPosition();
        positionNumber3d.x = -(viewPosition.getX());
        positionNumber3d.z = -(viewPosition.getY());
        positionNumber3d.y = viewPosition.getZ() + this.allbinaryLayer.getHeight();
        this.object3dProcessor.drawObject(gl, this.rectangle);
    }

}

