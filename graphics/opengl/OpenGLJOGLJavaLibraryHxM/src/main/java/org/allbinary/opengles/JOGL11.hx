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
package org.allbinary.opengles;

import com.jogamp.opengl.GL;
import com.jogamp.opengl.GL2;

//JOGLEToKhronosGL11
class JOGL11 extends JOGL10 implements javax.microedition.khronos.opengles.GL11 {
    private final gl11 : GL2;
    public function new(gl : GL) {
        // this(gl, (cast gl : com.jogamp.opengl.GL2)) - Haxe has one constructor
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(gl : GL, gl2 : com.jogamp.opengl.GL2) {
        super(gl, gl2);
        this.gl11 = getJOGLGL();
    }

    public function glBindBuffer(target : Int, buffer : Int) : Void {
        this.gl11.glBindBuffer(target, buffer);
    }

    public function glBufferData(target : Int, size : Int, data : java.nio.Buffer, usage : Int) : Void {
        this.gl11.glBufferData(target, size, data, usage);
    }

    public function glBufferSubData(target : Int, offset : Int, size : Int, data : java.nio.Buffer) : Void {
        this.gl11.glBufferSubData(target, offset, size, data);
    }

    public function glClipPlanef(plane : Int, equation : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glClipPlanef(plane, equation, offset);
    }

    public function glClipPlanef(plane : Int, equation : java.nio.FloatBuffer) : Void {
        this.gl11.glClipPlanef(plane, equation);
    }

    public function glColor4ub(red : Int, green : Int, blue : Int, alpha : Int) : Void {
        this.gl11.glColor4ub(red, green, blue, alpha);
    }

    public function glColorPointer(size : Int, type : Int, stride : Int, offset : Int) : Void {
        this.gl11.glColorPointer(size, type, stride, offset);
    }

    public function glDeleteBuffers(n : Int, buffers : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glDeleteBuffers(n, buffers, offset);
    }

    public function glDeleteBuffers(n : Int, buffers : java.nio.IntBuffer) : Void {
        this.gl11.glDeleteBuffers(n, buffers);
    }

    public function glDrawElements(mode : Int, count : Int, type : Int, offset : Int) : Void {
        this.gl11.glDrawElements(mode, count, type, offset);
    }

    public function glGenBuffers(n : Int, buffers : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glGenBuffers(n, buffers, offset);
    }

    public function glGenBuffers(n : Int, buffers : java.nio.IntBuffer) : Void {
        this.gl11.glGenBuffers(n, buffers);
    }

    public function glGetBufferParameteriv(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glGetBufferParameteriv(target, pname, params, offset);
    }

    public function glGetBufferParameteriv(target : Int, pname : Int, params : java.nio.IntBuffer) : Void {
        this.gl11.glGetBufferParameteriv(target, pname, params);
    }

    public function glGetClipPlanef(pname : Int, eqn : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glGetClipPlanef(pname, eqn, offset);
    }

    public function glGetClipPlanef(pname : Int, eqn : java.nio.FloatBuffer) : Void {
        this.gl11.glGetClipPlanef(pname, eqn);
    }

    public function glGetFloatv(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glGetFloatv(pname, params, offset);
    }

    public function glGetFloatv(pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl11.glGetFloatv(pname, params);
    }

    public function glGetLightfv(light : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glGetLightfv(light, pname, params, offset);
    }

    public function glGetLightfv(light : Int, pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl11.glGetLightfv(light, pname, params);
    }

    public function glGetMaterialfv(face : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glGetMaterialfv(face, pname, params, offset);
    }

    public function glGetMaterialfv(face : Int, pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl11.glGetMaterialfv(face, pname, params);
    }

    public function glGetTexEnviv(env : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glGetTexEnviv(env, pname, params, offset);
    }

    public function glGetTexEnviv(env : Int, pname : Int, params : java.nio.IntBuffer) : Void {
        this.gl11.glGetTexEnviv(env, pname, params);
    }

    public function glGetTexParameterfv(target : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glGetTexParameterfv(target, pname, params, offset);
    }

    public function glGetTexParameterfv(target : Int, pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl11.glGetTexParameterfv(target, pname, params);
    }

    public function glGetTexParameteriv(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glGetTexParameteriv(target, pname, params, offset);
    }

    public function glGetTexParameteriv(target : Int, pname : Int, params : java.nio.IntBuffer) : Void {
        this.gl11.glGetTexParameteriv(target, pname, params);
    }

    public function glIsBuffer(buffer : Int) : Bool {
        return this.gl11.glIsBuffer(buffer);
    }

    public function glIsEnabled(cap : Int) : Bool {
        return this.gl11.glIsEnabled(cap);
    }

    public function glIsTexture(texture : Int) : Bool {
        return this.gl11.glIsTexture(texture);
    }

    public function glNormalPointer(type : Int, stride : Int, offset : Int) : Void {
        this.gl11.glNormalPointer(type, stride, offset);
    }

    public function glPointParameterf(pname : Int, param : Float) : Void {
        this.gl11.glPointParameterf(pname, param);
    }

    public function glPointParameterfv(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glPointParameterfv(pname, params, offset);
    }

    public function glPointParameterfv(pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl11.glPointParameterfv(pname, params);
    }

    public function glTexCoordPointer(size : Int, type : Int, stride : Int, offset : Int) : Void {
        this.gl11.glTexCoordPointer(size, type, stride, offset);
    }

    public function glTexEnvi(target : Int, pname : Int, param : Int) : Void {
        this.gl11.glTexEnvi(target, pname, param);
    }

    public function glTexEnviv(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glTexEnviv(target, pname, params, offset);
    }

    public function glTexEnviv(target : Int, pname : Int, params : java.nio.IntBuffer) : Void {
        this.gl11.glTexEnviv(target, pname, params);
    }

    public function glTexParameterfv(target : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glTexParameterfv(target, pname, params, offset);
    }

    public function glTexParameterfv(target : Int, pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl11.glTexParameterfv(target, pname, params);
    }

    public function glTexParameteri(target : Int, pname : Int, param : Int) : Void {
        this.gl11.glTexParameteri(target, pname, param);
    }

    public function glTexParameteriv(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glTexParameteriv(target, pname, params, offset);
    }

    public function glTexParameteriv(target : Int, pname : Int, params : java.nio.IntBuffer) : Void {
        this.gl11.glTexParameteriv(target, pname, params);
    }

    public function glTexParameterxv(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glTexParameteriv(target, pname, params, offset);
    }

    public function glVertexPointer(size : Int, type : Int, stride : Int, offset : Int) : Void {
        this.gl11.glVertexPointer(size, type, stride, offset);
    }

}

