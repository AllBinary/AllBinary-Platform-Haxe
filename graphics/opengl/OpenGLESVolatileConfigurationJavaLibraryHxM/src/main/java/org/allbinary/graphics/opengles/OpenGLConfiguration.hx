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
package org.allbinary.graphics.opengles;

import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.game.configuration.event.ChangedGameFeatureListener;
import org.allbinary.game.configuration.feature.Feature;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringUtil;

class OpenGLConfiguration {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : OpenGLConfiguration {
        if (OpenGLConfiguration.instance == NullUtil.getInstance().NULL_OBJECT) {
            OpenGLConfiguration.instance = new OpenGLConfiguration();
        }
        return (cast OpenGLConfiguration.instance : OpenGLConfiguration);
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var opengl : Bool = false;
    private var type : OpenGLFeature = OpenGLFeatureFactory.getInstance().OPENGL_AS_GAME_THREAD;
    private var imageColor : OpenGLFeature = OpenGLFeatureFactory.getInstance().IMAGE_COLOR_DEPTH_4444;
    private var color : OpenGLFeature = OpenGLFeatureFactory.getInstance().IMAGE_COLOR_DEPTH_4444;
    private var versionSelector : OpenGLFeature = OpenGLFeatureFactory.getInstance().OPENGL_AUTO_SELECT;
    public function new() {
    }

    public function write() : Void {
    }

    // throws Exception
    public function init() : Void {
        final features : Features = Features.getInstance();
        if (ChangedGameFeatureListener.getInstance().isChangedFeature(MainFeatureFactory.getInstance().STATIC)) {
            if (this.isOpenGL()) {
                if (!features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
                    this.logUtil.putF("Turning on OpenGL", this, this.commonStrings.INIT);
                    features.addDefault(OpenGLFeatureFactory.getInstance().OPENGL);
                    this.logUtil.putF("Using OpenGL Type Feature: " + this.getType(), this, this.commonStrings.INIT);
                    features.addDefault(this.getType());
                    this.logUtil.putF("Using OpenGL ImageColor Feature: " + this.getImageColor(), this, this.commonStrings.INIT);
                    features.addDefault(this.getImageColor());
                    this.logUtil.putF("Using OpenGL Color Feature: " + this.getColor(), this, this.commonStrings.INIT);
                    features.addDefault(this.getColor());
                    this.logUtil.putF("Using OpenGL Version Selector Feature: " + this.getVersionSelector(), this, this.commonStrings.INIT);
                    features.addDefault(this.getVersionSelector());
                }
            } else {
                this.logUtil.putF("OpenGL is Off", this, this.commonStrings.INIT);
            }
        } else {
            if (this.isOpenGL() && !features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
                PreLogUtil.put("OpenGL is set but not Enabled since Statics where not cleared (Reboot or Complete exit is Required)", this, this.commonStrings.INIT);
            }
        }
        PreLogUtil.put(this.toString(), this, this.commonStrings.INIT);
    }

    // throws Exception
    public function update(gameFeature : Feature, colorLocked : Bool) : Void {
        final features : Features = Features.getInstance();
        final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        var modified : Bool = false;
        if (gameFeature == openGLFeatureFactory.OPENGL) {
            if (features.isFeature(gameFeature)) {
                if (!this.isOpenGL()) {
                    this.setOpenGL(true);
                    modified = true;
                }
            } else {
                if (this.isOpenGL()) {
                    this.setOpenGL(false);
                    modified = true;
                }
            }
        }
        if (gameFeature == openGLFeatureFactory.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS || gameFeature == openGLFeatureFactory.OPENGL_AS_GAME_THREAD) {
            if (features.isFeature(gameFeature)) {
                if (gameFeature != this.getType()) {
                    this.setType((cast gameFeature : OpenGLFeature));
                    modified = true;
                }
            }
        }
        if (gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444 || gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_565 || gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_8888) {
            if (features.isFeature(gameFeature)) {
                if (this.getImageColor() != gameFeature) {
                    this.setImageColor((cast gameFeature : OpenGLFeature));
                    if (colorLocked) {
                        if (gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444) {
                            this.setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_4444);
                        } else if (gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_565) {
                            this.setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_565);
                        } else if (gameFeature == openGLFeatureFactory.IMAGE_COLOR_DEPTH_8888) {
                            this.setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_8888);
                        }
                    }
                    modified = true;
                }
            }
        }
        if (gameFeature == openGLFeatureFactory.OPENGL_COLOR_DEPTH_4444 || gameFeature == openGLFeatureFactory.OPENGL_COLOR_DEPTH_565 || gameFeature == openGLFeatureFactory.OPENGL_COLOR_DEPTH_8888) {
            if (features.isFeature(gameFeature)) {
                if (this.getColor() != gameFeature) {
                    this.setColor((cast gameFeature : OpenGLFeature));
                    modified = true;
                }
            }
        }
        if (gameFeature == openGLFeatureFactory.OPENGL_AUTO_SELECT || gameFeature == openGLFeatureFactory.OPENGL_MINIMUM) {
            if (features.isFeature(gameFeature)) {
                this.setVersionSelector((cast gameFeature : OpenGLFeature));
            }
            modified = true;
        }
    }

    public function setOpenGL(opengl : Bool) : Void {
        this.opengl = opengl;
    }

    public function isOpenGL() : Bool {
        return this.opengl;
    }

    public function setImageColor(imageColor : OpenGLFeature) : Void {
        this.imageColor = imageColor;
    }

    public function getImageColor() : OpenGLFeature {
        return this.imageColor;
    }

    public function setColor(color : OpenGLFeature) : Void {
        this.color = color;
    }

    public function getColor() : OpenGLFeature {
        return this.color;
    }

    public function setVersionSelector(versionSelector : OpenGLFeature) : Void {
        this.versionSelector = versionSelector;
    }

    public function getVersionSelector() : OpenGLFeature {
        return this.versionSelector;
    }

    public function setType(type : OpenGLFeature) : Void {
        this.type = type;
    }

    public function getType() : OpenGLFeature {
        return this.type;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        final stringUtil : StringUtil = StringUtil.getInstance();
        stringBuffer.append(" isOpenGL: ");
        stringBuffer.appendboolean(this.isOpenGL());
        stringBuffer.append(" VersionSelector: ");
        stringBuffer.append(stringUtil.toString(this.getVersionSelector()));
        stringBuffer.append(" Type: ");
        stringBuffer.append(stringUtil.toString(this.getType()));
        stringBuffer.append(" Image Color: ");
        stringBuffer.append(stringUtil.toString(this.getImageColor()));
        stringBuffer.append(" Color: ");
        stringBuffer.append(stringUtil.toString(this.getColor()));
        return stringBuffer.toString();
    }

}

