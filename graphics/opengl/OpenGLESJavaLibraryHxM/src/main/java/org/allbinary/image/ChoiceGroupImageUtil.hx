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
package org.allbinary.image;

//import javax.microedition.khronos.opengles.GL;
//import javax.microedition.lcdui.ChoiceGroupImageFactory;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.game.configuration.feature.Features;

class ChoiceGroupImageUtil {
    private static final instance : ChoiceGroupImageUtil = new ChoiceGroupImageUtil();
    public static function getInstance() : ChoiceGroupImageUtil {
        return ChoiceGroupImageUtil.instance;
    }

    public function init() : Void {
        final features : Features = Features.getInstance();
        final choiceGroupFactory : ChoiceGroupImageFactory = ChoiceGroupImageFactory.getInstance();
        final imageArray : haxe.ds.Vector<Image> = choiceGroupFactory.getImageArray();
        if (features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
            final preResourceImageUtil : PreResourceImageUtil = PreResourceImageUtil.getInstance();
            final size : Int = imageArray.length;
            for (index in 0...size) {
                imageArray[index] = preResourceImageUtil.encapsulate(imageArray[index]);
            }
            choiceGroupFactory.init(imageArray);
        }
    }

    public function update(gl : GL) : Void {
        final features : Features = Features.getInstance();
        final choiceGroupFactory : ChoiceGroupImageFactory = ChoiceGroupImageFactory.getInstance();
        final imageArray : haxe.ds.Vector<Image> = choiceGroupFactory.getImageArray();
        if (features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
            final preResourceImageUtil : PreResourceImageUtil = PreResourceImageUtil.getInstance();
            final size : Int = imageArray.length;
            for (index in 0...size) {
                preResourceImageUtil.updateGL(gl, imageArray[index]);
            }
        }
        choiceGroupFactory.init(imageArray);
    }

    public function update(graphics : Graphics) : Void {
        final features : Features = Features.getInstance();
        final choiceGroupFactory : ChoiceGroupImageFactory = ChoiceGroupImageFactory.getInstance();
        final imageArray : haxe.ds.Vector<Image> = choiceGroupFactory.getImageArray();
        if (features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
            final preResourceImageUtil : PreResourceImageUtil = PreResourceImageUtil.getInstance();
            final size : Int = imageArray.length;
            for (index in 0...size) {
                preResourceImageUtil.update(graphics, imageArray[index]);
            }
        }
        choiceGroupFactory.init(imageArray);
    }

    public function new() {
    }
}

