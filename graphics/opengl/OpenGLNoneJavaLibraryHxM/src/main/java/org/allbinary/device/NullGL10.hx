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
package org.allbinary.device;

import javax.microedition.khronos.opengles.GL10;
import jre.nio.Buffer;
import jre.nio.FloatBuffer;
import jre.nio.IntBuffer;
import org.allbinary.logic.string.StringUtil;

class NullGL10 implements GL10 {
    public static final NULL_GL10 : NullGL10 = new NullGL10();
    public function glActiveTexture(texture : Int) : Void {
        return;
    }

    public function glAlphaFunc(func : Int, ref : Float) : Void {
        return;
    }

    public function glBindTexture(target : Int, texture : Int) : Void {
        return;
    }

    public function glBlendFunc(sfactor : Int, dfactor : Int) : Void {
        return;
    }

    public function glClear(mask : Int) : Void {
        return;
    }

    public function glClearColor(red : Float, green : Float, blue : Float, alpha : Float) : Void {
        return;
    }

    public function glClearDepthf(depth : Float) : Void {
        return;
    }

    public function glClearStencil(s : Int) : Void {
        return;
    }

    public function glClientActiveTexture(texture : Int) : Void {
        return;
    }

    public function glColor4f(red : Float, green : Float, blue : Float, alpha : Float) : Void {
        return;
    }

    public function glColorMask(red : Bool, green : Bool, blue : Bool, alpha : Bool) : Void {
        return;
    }

    public function glColorPointer(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glColorPointer_int_int_int_Buffer(args[0], args[1], args[2], args[3]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glColorPointer");
    }

    public function glColorPointer_int_int_int_Buffer(size : Int, type : Int, stride : Int, pointer : Buffer) : Void {
        return;
    }

    public function glCompressedTexImage2D(target : Int, level : Int, internalformat : Int, width : Int, height : Int, border : Int, imageSize : Int, data : Buffer) : Void {
        return;
    }

    public function glCompressedTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, width : Int, height : Int, format : Int, imageSize : Int, data : Buffer) : Void {
        return;
    }

    public function glCopyTexImage2D(target : Int, level : Int, internalformat : Int, x : Int, y : Int, width : Int, height : Int, border : Int) : Void {
        return;
    }

    public function glCopyTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, x : Int, y : Int, width : Int, height : Int) : Void {
        return;
    }

    public function glCullFace(mode : Int) : Void {
        return;
    }

    public function glDeleteTextures(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glDeleteTextures_int_intArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glDeleteTextures_int_IntBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glDeleteTextures");
    }

    public function glDeleteTextures_int_intArray_int(n : Int, textures : haxe.ds.Vector<Int>, offset : Int) : Void {
        return;
    }

    public function glDeleteTextures_int_IntBuffer(n : Int, textures : IntBuffer) : Void {
        return;
    }

    public function glDepthFunc(func : Int) : Void {
        return;
    }

    public function glDepthMask(flag : Bool) : Void {
        return;
    }

    public function glDepthRangef(zNear : Float, zFar : Float) : Void {
        return;
    }

    public function glDisable(cap : Int) : Void {
        return;
    }

    public function glDisableClientState(array : Int) : Void {
        return;
    }

    public function glDrawArrays(mode : Int, first : Int, count : Int) : Void {
        return;
    }

    public function glDrawElements(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glDrawElements_int_int_int_Buffer(args[0], args[1], args[2], args[3]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glDrawElements");
    }

    public function glDrawElements_int_int_int_Buffer(mode : Int, count : Int, type : Int, indices : Buffer) : Void {
        return;
    }

    public function glEnable(cap : Int) : Void {
        return;
    }

    public function glEnableClientState(array : Int) : Void {
        return;
    }

    public function glFinish() : Void {
        return;
    }

    public function glFlush() : Void {
        return;
    }

    public function glFogf(pname : Int, param : Float) : Void {
        return;
    }

    public function glFogfv(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glFogfv_int_floatArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glFogfv_int_FloatBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glFogfv");
    }

    public function glFogfv_int_floatArray_int(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glFogfv_int_FloatBuffer(pname : Int, params : FloatBuffer) : Void {
        return;
    }

    public function glFrontFace(mode : Int) : Void {
        return;
    }

    public function glFrustumf(left : Float, right : Float, bottom : Float, top : Float, zNear : Float, zFar : Float) : Void {
        return;
    }

    public function glGenTextures(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glGenTextures_int_intArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glGenTextures_int_IntBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGenTextures");
    }

    public function glGenTextures_int_intArray_int(n : Int, textures : haxe.ds.Vector<Int>, offset : Int) : Void {
        return;
    }

    public function glGenTextures_int_IntBuffer(n : Int, textures : IntBuffer) : Void {
        return;
    }

    public function glGetError() : Int {
        return 0;
    }

    public function glGetIntegerv(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glGetIntegerv_int_intArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glGetIntegerv_int_IntBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGetIntegerv");
    }

    public function glGetIntegerv_int_intArray_int(pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        return;
    }

    public function glGetIntegerv_int_IntBuffer(pname : Int, params : IntBuffer) : Void {
        return;
    }

    public function glGetString(name : Int) : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function glHint(target : Int, mode : Int) : Void {
        return;
    }

    public function glLightModelf(pname : Int, param : Float) : Void {
        return;
    }

    public function glLightModelfv(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glLightModelfv_int_floatArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glLightModelfv_int_FloatBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glLightModelfv");
    }

    public function glLightModelfv_int_floatArray_int(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glLightModelfv_int_FloatBuffer(pname : Int, params : FloatBuffer) : Void {
        return;
    }

    public function glLightf(light : Int, pname : Int, param : Float) : Void {
        return;
    }

    public function glLightfv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glLightfv_int_int_floatArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glLightfv_int_int_FloatBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glLightfv");
    }

    public function glLightfv_int_int_floatArray_int(light : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glLightfv_int_int_FloatBuffer(light : Int, pname : Int, params : FloatBuffer) : Void {
        return;
    }

    public function glLineWidth(width : Float) : Void {
        return;
    }

    public function glLoadIdentity() : Void {
        return;
    }

    public function glLoadMatrixf(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            this.glLoadMatrixf_floatArray_int(args[0], args[1]);
            return null;
        }
        if (args.length == 1) {
            this.glLoadMatrixf_FloatBuffer(args[0]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glLoadMatrixf");
    }

    public function glLoadMatrixf_floatArray_int(m : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glLoadMatrixf_FloatBuffer(m : FloatBuffer) : Void {
        return;
    }

    public function glLogicOp(opcode : Int) : Void {
        return;
    }

    public function glMaterialf(face : Int, pname : Int, param : Float) : Void {
        return;
    }

    public function glMaterialfv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glMaterialfv_int_int_floatArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glMaterialfv_int_int_FloatBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glMaterialfv");
    }

    public function glMaterialfv_int_int_floatArray_int(face : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glMaterialfv_int_int_FloatBuffer(face : Int, pname : Int, params : FloatBuffer) : Void {
        return;
    }

    public function glMatrixMode(mode : Int) : Void {
        return;
    }

    public function glMultMatrixf(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            this.glMultMatrixf_floatArray_int(args[0], args[1]);
            return null;
        }
        if (args.length == 1) {
            this.glMultMatrixf_FloatBuffer(args[0]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glMultMatrixf");
    }

    public function glMultMatrixf_floatArray_int(m : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glMultMatrixf_FloatBuffer(m : FloatBuffer) : Void {
        return;
    }

    public function glMultiTexCoord4f(target : Int, s : Float, t : Float, r : Float, q : Float) : Void {
        return;
    }

    public function glNormal3f(nx : Float, ny : Float, nz : Float) : Void {
        return;
    }

    public function glNormalPointer(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glNormalPointer_int_int_Buffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glNormalPointer");
    }

    public function glNormalPointer_int_int_Buffer(type : Int, stride : Int, pointer : Buffer) : Void {
        return;
    }

    public function glOrthof(left : Float, right : Float, bottom : Float, top : Float, zNear : Float, zFar : Float) : Void {
        return;
    }

    public function glPixelStorei(pname : Int, param : Int) : Void {
        return;
    }

    public function glPointSize(size : Float) : Void {
        return;
    }

    public function glPolygonOffset(factor : Float, units : Float) : Void {
        return;
    }

    public function glPopMatrix() : Void {
        return;
    }

    public function glPushMatrix() : Void {
        return;
    }

    public function glReadPixels(x : Int, y : Int, width : Int, height : Int, format : Int, type : Int, pixels : Buffer) : Void {
        return;
    }

    public function glRotatef(angle : Float, x : Float, y : Float, z : Float) : Void {
        return;
    }

    public function glRotatex(angle : Int, x : Int, y : Int, z : Int) : Void {
        return;
    }

    public function glSampleCoverage(value : Float, invert : Bool) : Void {
        return;
    }

    public function glScalef(x : Float, y : Float, z : Float) : Void {
        return;
    }

    public function glScalex(x : Int, y : Int, z : Int) : Void {
        return;
    }

    public function glScissor(x : Int, y : Int, width : Int, height : Int) : Void {
        return;
    }

    public function glShadeModel(mode : Int) : Void {
        return;
    }

    public function glStencilFunc(func : Int, ref : Int, mask : Int) : Void {
        return;
    }

    public function glStencilMask(mask : Int) : Void {
        return;
    }

    public function glStencilOp(fail : Int, zfail : Int, zpass : Int) : Void {
        return;
    }

    public function glTexCoordPointer(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glTexCoordPointer_int_int_int_Buffer(args[0], args[1], args[2], args[3]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glTexCoordPointer");
    }

    public function glTexCoordPointer_int_int_int_Buffer(size : Int, type : Int, stride : Int, pointer : Buffer) : Void {
        return;
    }

    public function glTexEnvf(target : Int, pname : Int, param : Float) : Void {
        return;
    }

    public function glTexEnvfv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glTexEnvfv_int_int_floatArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glTexEnvfv_int_int_FloatBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glTexEnvfv");
    }

    public function glTexEnvfv_int_int_floatArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glTexEnvfv_int_int_FloatBuffer(target : Int, pname : Int, params : FloatBuffer) : Void {
        return;
    }

    public function glTexImage2D(target : Int, level : Int, internalformat : Int, width : Int, height : Int, border : Int, format : Int, type : Int, pixels : Buffer) : Void {
        return;
    }

    public function glTexParameterf(target : Int, pname : Int, param : Float) : Void {
        return;
    }

    public function glTexParameteri(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glTexParameteri_int_int_int(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glTexParameteri");
    }

    public function glTexParameteri_int_int_int(target : Int, pname : Int, param : Int) : Void {
        return;
    }

    public function glTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, width : Int, height : Int, format : Int, type : Int, pixels : Buffer) : Void {
        return;
    }

    public function glTranslatef(x : Float, y : Float, z : Float) : Void {
        return;
    }

    public function glVertexPointer(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glVertexPointer_int_int_int_Buffer(args[0], args[1], args[2], args[3]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glVertexPointer");
    }

    public function glVertexPointer_int_int_int_Buffer(size : Int, type : Int, stride : Int, pointer : Buffer) : Void {
        return;
    }

    public function glViewport(x : Int, y : Int, width : Int, height : Int) : Void {
        return;
    }

    public function glBegin(i : Int) : Void {
        return;
    }

    public function glEnd() : Void {
        return;
    }

    public function glVertex3f(f : Float, f2 : Float, f3 : Float) : Void {
        return;
    }

    public function glPolygonMode(i : Int, i1 : Int) : Void {
        return;
    }

    public function new() {
    }
}

