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

//import java.io.Closeable;
//import java.io.DataInputStream;
//import java.io.InputStream;
//import java.io.OutputStream;
import org.allbinary.TsUtil;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.FileStreamFactory;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.FileFactory;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.game.configuration.event.ChangedGameFeatureListener;
import org.allbinary.game.configuration.feature.Feature;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.io.NullCloseable;

class OpenGLConfiguration {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : OpenGLConfiguration {
        if (OpenGLConfiguration.instance == NullUtil.getInstance().NULL_OBJECT) {
            OpenGLConfiguration.instance = new OpenGLConfiguration();
        }
        return (cast OpenGLConfiguration.instance : OpenGLConfiguration);
    }

    private final FILE : String = "OpenGLConfiguration.dat";
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final tsUtil : TsUtil = TsUtil.getInstance();
    private var opengl : Bool = false;
    private var type : OpenGLFeature = OpenGLFeatureFactory.getInstance().OPENGL_AS_GAME_THREAD;
    private var imageColor : OpenGLFeature = OpenGLFeatureFactory.getInstance().IMAGE_COLOR_DEPTH_4444;
    private var color : OpenGLFeature = OpenGLFeatureFactory.getInstance().IMAGE_COLOR_DEPTH_4444;
    private var versionSelector : OpenGLFeature = OpenGLFeatureFactory.getInstance().OPENGL_AUTO_SELECT;
    public function new() {
        try {
            if (FileFactory.getInstance().isFile(this.FILE)) {
                this.read();
            } else {
                this.write();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
        }
    }

    // throws Exception
    private function read() : Void {
        final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        final fileInputStreamFactory : FileStreamFactory = FileStreamFactory.getInstance();
        final fileInputStream : InputStream = fileInputStreamFactory.getFileInputStreamInstance(StringUtil.getInstance().EMPTY_STRING, this.FILE);
        final dataInputStream : DataInputStream = new DataInputStream(fileInputStream);
        final openGLValue : Int = dataInputStream.readInt();
        if (openGLValue == 0) {
            this.setOpenGL(false);
        } else if (openGLValue == 1) {
            this.setOpenGL(true);
        } else {
            throw new haxe.Exception("Invalid OpenGL Setting");
        }
        final version : String = dataInputStream.readUTF();
        if (this.tsUtil.compareTo(version, openGLFeatureFactory.OPENGL_AUTO_SELECT.getName()) == 0) {
            this.setVersionSelector(openGLFeatureFactory.OPENGL_AUTO_SELECT);
        } else if (this.tsUtil.compareTo(version, openGLFeatureFactory.OPENGL_MINIMUM.getName()) == 0) {
            this.setVersionSelector(openGLFeatureFactory.OPENGL_MINIMUM);
        } else {
            throw new haxe.Exception("OpenGLConfiguration: Error reading version selector: " + version);
        }
        final type : String = dataInputStream.readUTF();
        if (this.tsUtil.compareTo(type, openGLFeatureFactory.OPENGL_AS_GAME_THREAD.getName()) == 0) {
            this.setType(openGLFeatureFactory.OPENGL_AS_GAME_THREAD);
        } else if (this.tsUtil.compareTo(type, openGLFeatureFactory.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS.getName()) == 0) {
            this.setType(openGLFeatureFactory.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS);
        } else {
            throw new haxe.Exception("OpenGLConfiguration: Error reading image color");
        }
        final imageColor : String = dataInputStream.readUTF();
        if (this.tsUtil.compareTo(imageColor, openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444.getName()) == 0) {
            this.setImageColor(openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444);
        } else if (this.tsUtil.compareTo(imageColor, openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444.getName()) == 0) {
            this.setImageColor(openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444);
        } else if (this.tsUtil.compareTo(imageColor, openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444.getName()) == 0) {
            this.setImageColor(openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444);
        } else {
            throw new haxe.Exception("OpenGLConfiguration: Error reading image color: " + imageColor);
        }
        final color : String = dataInputStream.readUTF();
        if (this.tsUtil.compareTo(color, openGLFeatureFactory.OPENGL_COLOR_DEPTH_4444.getName()) == 0) {
            this.setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_4444);
        } else if (this.tsUtil.compareTo(color, openGLFeatureFactory.OPENGL_COLOR_DEPTH_565.getName()) == 0) {
            this.setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_565);
        } else if (this.tsUtil.compareTo(color, openGLFeatureFactory.OPENGL_COLOR_DEPTH_8888.getName()) == 0) {
            this.setColor(openGLFeatureFactory.OPENGL_COLOR_DEPTH_8888);
        } else {
            throw new haxe.Exception("OpenGLConfiguration: Error reading color: " + color);
        }
        PreLogUtil.put("Read Configuration: " + this.toString(), this, "read");
    }

    // throws Exception
    public function write() : Void {
        var closeable : Closeable = NullCloseable.NULL_CLOSEABLE;
        try {
            PreLogUtil.put("Write Configuration: " + this.toString(), this, "write");
            final fileInputStreamFactory : FileStreamFactory = FileStreamFactory.getInstance();
            final fileOutputStream : OutputStream = fileInputStreamFactory.getFileOutputStreamInstance(StringUtil.getInstance().EMPTY_STRING, this.FILE);
            final dataOutputStream : AbDataOutputStream = new AbDataOutputStream(fileOutputStream);
            closeable = dataOutputStream;
            if (this.isOpenGL()) {
                dataOutputStream.writeInt(1);
            } else {
                dataOutputStream.writeInt(0);
            }
            dataOutputStream.writeUTF(this.getVersionSelector().getName());
            dataOutputStream.writeUTF(this.getType().getName());
            dataOutputStream.writeUTF(this.getImageColor().getName());
            dataOutputStream.writeUTF(this.getColor().getName());
            dataOutputStream.flush();
        } catch (e : haxe.Exception) {
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(closeable);
        }
    }

    // throws Exception
    public function init() : Void {
        final features : Features = Features.getInstance();
        if (ChangedGameFeatureListener.getInstance().isChangedFeature(MainFeatureFactory.getInstance().STATIC)) {
            final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
            if (this.isOpenGL()) {
                if (features.isFeature(openGLFeatureFactory.OPENGL_2D) || features.isFeature(openGLFeatureFactory.OPENGL_3D) || features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D)) {
                    if (!features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
                        this.logUtil.putF("Turning on OpenGL as Default", this, this.commonStrings.INIT);
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
                    this.logUtil.putF("OpenGL is enabled, but this game does not support OpenGL (Probably from installing with the same package name from a game that had OpenGL available)", this, this.commonStrings.INIT);
                }
            } else {
                this.logUtil.putF("OpenGL is Off", this, this.commonStrings.INIT);
            }
        } else {
            if (this.isOpenGL() && !features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
                PreLogUtil.put("OpenGL is set but not Enabled since statics where not cleared (Reboot or Complete exit is Required)", this, this.commonStrings.INIT);
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
        if (modified) {
            this.write();
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

