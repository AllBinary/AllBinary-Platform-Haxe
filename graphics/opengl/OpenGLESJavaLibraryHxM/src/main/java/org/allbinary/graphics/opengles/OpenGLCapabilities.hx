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

//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.khronos.opengles.GL11;
import org.allbinary.AndroidUtil;
import org.allbinary.image.opengles.OpenGLESGL10ImageFactory;
import org.allbinary.image.opengles.OpenGLESGL11VBOImageFactory;
import org.allbinary.image.opengles.OpenGLImageSpecificFactory;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.logic.communication.log.LogUtil;

class OpenGLCapabilities {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : OpenGLCapabilities = new OpenGLCapabilities();
    public static function getInstance() : OpenGLCapabilities {
        return OpenGLCapabilities.instance;
    }

    public final CUSTOM_GL_SURFACE_VIEW : Bool = true;
    private final stringUtil : StringUtil = StringUtil.getInstance();
    private var initialized : Bool = false;
    private var glVersionString : String = this.stringUtil.EMPTY_STRING;
    private var glShaderVersionString : String = this.stringUtil.EMPTY_STRING;
    public var shaderVersion : Int = 0;
    private var glRenderer : String = this.stringUtil.EMPTY_STRING;
    private var glVendor : String = this.stringUtil.EMPTY_STRING;
    private var glExtensions : String = this.stringUtil.EMPTY_STRING;
    private var possiblyAccelerated : Bool = false;
    private var acceleratedString : String = this.stringUtil.EMPTY_STRING;
    public var maxTextureSize : Int = 64;
    public final VERSION_1_0 : String = "1.0";
    public final VERSION_1_1 : String = "1.1";
    public final VERSION_2_0 : String = "2.0";
    public final VERSION_3_0 : String = "3.0";
    public final VERSION_3_1 : String = "3.1";
    public final VERSION_3_2 : String = "3.2";
    public final VERSION_HIGHER_THAN_EXISTS : String = "999.999";
    public final VERSION_UNK : String = "Unk";
    public final GL_EXT_GPU_SHADER_100 : String = "GL_ARB_shading_language_100";
    public final GL_EXT_GPU_SHADER4 : String = "GL_EXT_gpu_shader4";
    private var glVersion : String = this.glVersionString;
    public var glInstanceVersion : String = this.VERSION_UNK;
    private var glExtensionDrawTexture : Bool = false;
    private var glThreedDrawTexture : Bool = false;
    private var glExtensionGPUShader4 : Bool = false;
    private var glExtensionGPUShader100 : Bool = false;
    private var vertexBufferObjectSupport : Bool = false;
    public function new() {
    }

    public function isInitialized() : Bool {
        return this.initialized;
    }

    private function requireInitialization() : Void {
    }

    public function initCapabilities(gl : GL10) : Void {
        final METHOD_NAME : String = "initGLCapabilities";
        try {
            final features : Features = Features.getInstance();
            final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
            final openGLImageSpecificFactory : OpenGLImageSpecificFactory = OpenGLImageSpecificFactory.getInstance();
            final stringBuffer : StringMaker = new StringMaker();
            this.glVersionString = gl.glGetString(GL10.GL_VERSION);
            final GL_SHADING_LANGUAGE_VERSION : Int = 0x8b8c;
            this.glShaderVersionString = gl.glGetString(GL_SHADING_LANGUAGE_VERSION);
            if (this.glShaderVersionString == null) {
                this.glShaderVersionString = this.stringUtil.EMPTY_STRING;
            }
            try {
                if (this.glShaderVersionString != null && this.glShaderVersionString.indexOf(".".code) >= 0) {
                    final startIndex : Int = this.glShaderVersionString.lastIndexOf(" ".code);
                    if (startIndex >= 0) {
                        this.glShaderVersionString = this.glShaderVersionString.substring(startIndex + 1);
                    }
                    this.shaderVersion = Std.parseInt(StringTools.replace(this.glShaderVersionString, CommonSeps.getInstance().PERIOD, StringUtil.getInstance().EMPTY_STRING));
                }
            } catch (e : haxe.Exception) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, METHOD_NAME, e);
            }
            this.glRenderer = gl.glGetString(GL10.GL_RENDERER);
            this.glVendor = gl.glGetString(GL10.GL_VENDOR);
            this.glExtensions = gl.glGetString(GL10.GL_EXTENSIONS);
            if (this.glExtensions.indexOf(this.GL_EXT_GPU_SHADER_100) >= 0) {
                this.glExtensionGPUShader100 = true;
            } else {
                this.glExtensionGPUShader100 = false;
            }
            if (this.glExtensions.indexOf(this.GL_EXT_GPU_SHADER4) >= 0) {
                this.glExtensionGPUShader4 = true;
            } else {
                this.glExtensionGPUShader4 = false;
            }
            if (this.glRenderer == null) {
                this.glRenderer = this.stringUtil.EMPTY_STRING;
            }
            if (this.glRenderer.toLowerCase().indexOf("pixelflinger") >= 0) {
                this.acceleratedString = "Probably Not for " + this.glRenderer;
                this.possiblyAccelerated = false;
            } else {
                this.acceleratedString = "Probably for " + this.glRenderer;
                this.possiblyAccelerated = true;
            }
            this.glExtensionDrawTexture = false;
            if (this.glVersionString == null) {
                this.glVersionString = this.stringUtil.EMPTY_STRING;
                this.glVersion = this.VERSION_UNK;
            } else if (this.glVersionString.indexOf(" 1.0") >= 0) {
                this.glVersion = this.VERSION_1_0;
            } else if (this.glVersionString.indexOf(" 1.1") >= 0) {
                this.glVersion = this.VERSION_1_1;
            } else {
                this.glVersion = this.VERSION_UNK;
            }
            if (Std.isOfType(gl, GL11)) {
                this.glInstanceVersion = this.VERSION_1_1;
            } else if (Std.isOfType(gl, GL10)) {
                this.glInstanceVersion = this.VERSION_1_0;
            }
            if (this.glVendor == null) {
                this.glVendor = this.stringUtil.EMPTY_STRING;
            }
            if (this.glExtensions == null) {
                this.glExtensions = this.stringUtil.EMPTY_STRING;
            }
            if (this.possiblyAccelerated) {
                PreLogUtil.put(new StringMaker().append("VBO:?").appendboolean((this.glInstanceVersion == this.VERSION_1_1)).append("||").appendboolean(this.isExtension(openGLFeatureFactory.OPENGL_VERTEX_BUFFER_OBJECT)).toString(), this, METHOD_NAME);
                if ((this.glInstanceVersion == this.VERSION_1_1 || this.isExtension(openGLFeatureFactory.OPENGL_VERTEX_BUFFER_OBJECT))) {
                    if (AndroidUtil.isAndroid()) {
                        PreLogUtil.put("VBO implementation was detected, but disabled by default for Android", this, METHOD_NAME);
                    } else {
                        PreLogUtil.put("VBO implementation was detected, but disabled for now", this, METHOD_NAME);
                    }
                }
            }
            final stringUtil : StringUtil = StringUtil.getInstance();
            if (features.isDefault(openGLFeatureFactory.OPENGL_AUTO_SELECT)) {
                if (this.vertexBufferObjectSupport) {
                    openGLImageSpecificFactory.setImageFactory(new OpenGLESGL11VBOImageFactory());
                } else {
                    stringBuffer.append("OpenGL is on but ");
                    stringBuffer.append(stringUtil.toString(openGLFeatureFactory.OPENGL_DRAW_TEXTURE));
                    stringBuffer.append(" was not available");
                    PreLogUtil.put(stringBuffer.toString(), this, METHOD_NAME);
                    openGLImageSpecificFactory.setImageFactory(new OpenGLESGL10ImageFactory());
                }
            } else {
                stringBuffer.append(stringUtil.toString(openGLFeatureFactory.OPENGL_AUTO_SELECT));
                stringBuffer.append(" is not on");
                PreLogUtil.put(stringBuffer.toString(), this, METHOD_NAME);
                openGLImageSpecificFactory.setImageFactory(new OpenGLESGL10ImageFactory());
            }
            final maxTextureSizeArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) 0]);
            gl.glGetIntegerv(GL10.GL_MAX_TEXTURE_SIZE, maxTextureSizeArray, 0);
            this.maxTextureSize = maxTextureSizeArray[0];
            this.initialized = true;
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, METHOD_NAME, e);
        }
    }

    private function isExtension(gameFeature : OpenGLFeature) : Bool {
        var index : Int = this.glExtensions.indexOf(gameFeature.getName());
        if (index >= 0) {
            return true;
        } else {
            return false;
        }
    }

    public function isGlExtensionDrawTexture() : Bool {
        this.requireInitialization();
        return this.glExtensionDrawTexture;
    }

    public function isGlExtensionGPUShader100() : Bool {
        return this.glExtensionGPUShader100;
    }

    public function isGlExtensionGPUShader4() : Bool {
        this.requireInitialization();
        return this.glExtensionGPUShader4;
    }

    public function getGlVersion() : String {
        this.requireInitialization();
        return this.glVersion;
    }

    public function getGlVersionString() : String {
        this.requireInitialization();
        return this.glVersionString;
    }

    public function getGlShaderVersion() : String {
        this.requireInitialization();
        return this.glShaderVersionString;
    }

    public function isGlThreedDrawTexture() : Bool {
        this.requireInitialization();
        return this.glThreedDrawTexture;
    }

    public function getGlRenderer() : String {
        this.requireInitialization();
        return this.glRenderer;
    }

    public function isVertexBufferObjectSupport() : Bool {
        this.requireInitialization();
        return this.vertexBufferObjectSupport;
    }

    public function isTextureSizeValid(widthAndHeight : Int) : Bool {
        this.requireInitialization();
        if (this.maxTextureSize >= widthAndHeight) {
            return true;
        }
        return false;
    }

    public function toString() : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("GL_VERSION: ");
        stringBuffer.append(this.glVersionString);
        stringBuffer.append(" GL_SHADING_LANGUAGE_VERSION: ");
        stringBuffer.append(this.glShaderVersionString);
        stringBuffer.append(" GL_RENDERER: ");
        stringBuffer.append(this.glRenderer);
        stringBuffer.append(" GL_VENDOR: ");
        stringBuffer.append(this.glVendor);
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(" Is Accelerated: ");
        stringBuffer.append(this.acceleratedString);
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(" VBO Support: ");
        stringBuffer.appendboolean(this.isVertexBufferObjectSupport());
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(" Max Texture Size: ");
        stringBuffer.appendint(this.maxTextureSize);
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(" GL_EXTENSIONS: ");
        try {
            var tokenizer : Tokenizer = new Tokenizer(commonSeps.SPACE);
            var list : BasicArrayList = tokenizer.getTokensFromString(this.glExtensions, new BasicArrayListD());
            final size : Int = list.size();
            for (index in 0...size) {
                stringBuffer.append(commonSeps.NEW_LINE);
                stringBuffer.append(this.stringUtil.toString(list.objectArray[index]));
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putOE(commonStrings.EXCEPTION, this, commonStrings.TOSTRING, e);
        }
        return stringBuffer.toString();
    }

}

