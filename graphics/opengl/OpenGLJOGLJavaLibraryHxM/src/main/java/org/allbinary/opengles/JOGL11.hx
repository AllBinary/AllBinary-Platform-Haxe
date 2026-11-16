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
    public function new(...args : Dynamic) {
        if (args.length == 1) {
            final gl : GL = args[0];
            {
                final gl : GL = gl;
                final gl2 : com.jogamp.opengl.GL2 = (cast gl : com.jogamp.opengl.GL2);
                super(gl, gl2);
            }
            this._newJOGL110(gl);
        }
        else if (args.length == 2) {
            final gl : GL = args[0];
            final gl2 : com.jogamp.opengl.GL2 = args[1];
            super(gl, gl2);
            this._newJOGL111(gl, gl2);
        }
    }

    private function _newJOGL110(gl : GL) : Void {
        this._newJOGL111(gl, (cast gl : com.jogamp.opengl.GL2));
    }

    private function _newJOGL111(gl : GL, gl2 : com.jogamp.opengl.GL2) : Void {
        this.gl11 = getJOGLGL();
    }

    public function glBindBuffer(target : Int, buffer : Int) : Void {
        this.gl11.glBindBuffer(target, buffer);
    }

    public function glBufferData(target : Int, size : Int, data : jre.nio.Buffer, usage : Int) : Void {
        this.gl11.glBufferData(target, size, data, usage);
    }

    public function glBufferSubData(target : Int, offset : Int, size : Int, data : jre.nio.Buffer) : Void {
        this.gl11.glBufferSubData(target, offset, size, data);
    }

    public function glClipPlanef(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glClipPlanef_int_floatArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glClipPlanef_int_FloatBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glClipPlanef");
    }

    public function glClipPlanef_int_floatArray_int(plane : Int, equation : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glClipPlanef(plane, equation, offset);
    }

    public function glClipPlanef_int_FloatBuffer(plane : Int, equation : jre.nio.FloatBuffer) : Void {
        this.gl11.glClipPlanef(plane, equation);
    }

    public function glColor4ub(red : Int, green : Int, blue : Int, alpha : Int) : Void {
        this.gl11.glColor4ub(red, green, blue, alpha);
    }

    public override function glColorPointer(size : Int, type : Int, stride : Int, offset : Int) : Void {
        this.gl11.glColorPointer(size, type, stride, offset);
    }

    public function glDeleteBuffers(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glDeleteBuffers_int_intArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glDeleteBuffers_int_IntBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glDeleteBuffers");
    }

    public function glDeleteBuffers_int_intArray_int(n : Int, buffers : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glDeleteBuffers(n, buffers, offset);
    }

    public function glDeleteBuffers_int_IntBuffer(n : Int, buffers : jre.nio.IntBuffer) : Void {
        this.gl11.glDeleteBuffers(n, buffers);
    }

    public override function glDrawElements(mode : Int, count : Int, type : Int, offset : Int) : Void {
        this.gl11.glDrawElements(mode, count, type, offset);
    }

    public function glGenBuffers(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glGenBuffers_int_intArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glGenBuffers_int_IntBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGenBuffers");
    }

    public function glGenBuffers_int_intArray_int(n : Int, buffers : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glGenBuffers(n, buffers, offset);
    }

    public function glGenBuffers_int_IntBuffer(n : Int, buffers : jre.nio.IntBuffer) : Void {
        this.gl11.glGenBuffers(n, buffers);
    }

    public function glGetBufferParameteriv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glGetBufferParameteriv_int_int_intArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glGetBufferParameteriv_int_int_IntBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGetBufferParameteriv");
    }

    public function glGetBufferParameteriv_int_int_intArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glGetBufferParameteriv(target, pname, params, offset);
    }

    public function glGetBufferParameteriv_int_int_IntBuffer(target : Int, pname : Int, params : jre.nio.IntBuffer) : Void {
        this.gl11.glGetBufferParameteriv(target, pname, params);
    }

    public function glGetClipPlanef(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glGetClipPlanef_int_floatArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glGetClipPlanef_int_FloatBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGetClipPlanef");
    }

    public function glGetClipPlanef_int_floatArray_int(pname : Int, eqn : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glGetClipPlanef(pname, eqn, offset);
    }

    public function glGetClipPlanef_int_FloatBuffer(pname : Int, eqn : jre.nio.FloatBuffer) : Void {
        this.gl11.glGetClipPlanef(pname, eqn);
    }

    public function glGetFloatv(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glGetFloatv_int_floatArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glGetFloatv_int_FloatBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGetFloatv");
    }

    public function glGetFloatv_int_floatArray_int(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glGetFloatv(pname, params, offset);
    }

    public function glGetFloatv_int_FloatBuffer(pname : Int, params : jre.nio.FloatBuffer) : Void {
        this.gl11.glGetFloatv(pname, params);
    }

    public function glGetLightfv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glGetLightfv_int_int_floatArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glGetLightfv_int_int_FloatBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGetLightfv");
    }

    public function glGetLightfv_int_int_floatArray_int(light : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glGetLightfv(light, pname, params, offset);
    }

    public function glGetLightfv_int_int_FloatBuffer(light : Int, pname : Int, params : jre.nio.FloatBuffer) : Void {
        this.gl11.glGetLightfv(light, pname, params);
    }

    public function glGetMaterialfv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glGetMaterialfv_int_int_floatArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glGetMaterialfv_int_int_FloatBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGetMaterialfv");
    }

    public function glGetMaterialfv_int_int_floatArray_int(face : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glGetMaterialfv(face, pname, params, offset);
    }

    public function glGetMaterialfv_int_int_FloatBuffer(face : Int, pname : Int, params : jre.nio.FloatBuffer) : Void {
        this.gl11.glGetMaterialfv(face, pname, params);
    }

    public function glGetTexEnviv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glGetTexEnviv_int_int_intArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glGetTexEnviv_int_int_IntBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGetTexEnviv");
    }

    public function glGetTexEnviv_int_int_intArray_int(env : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glGetTexEnviv(env, pname, params, offset);
    }

    public function glGetTexEnviv_int_int_IntBuffer(env : Int, pname : Int, params : jre.nio.IntBuffer) : Void {
        this.gl11.glGetTexEnviv(env, pname, params);
    }

    public function glGetTexParameterfv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glGetTexParameterfv_int_int_floatArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glGetTexParameterfv_int_int_FloatBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGetTexParameterfv");
    }

    public function glGetTexParameterfv_int_int_floatArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glGetTexParameterfv(target, pname, params, offset);
    }

    public function glGetTexParameterfv_int_int_FloatBuffer(target : Int, pname : Int, params : jre.nio.FloatBuffer) : Void {
        this.gl11.glGetTexParameterfv(target, pname, params);
    }

    public function glGetTexParameteriv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glGetTexParameteriv_int_int_intArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glGetTexParameteriv_int_int_IntBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glGetTexParameteriv");
    }

    public function glGetTexParameteriv_int_int_intArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glGetTexParameteriv(target, pname, params, offset);
    }

    public function glGetTexParameteriv_int_int_IntBuffer(target : Int, pname : Int, params : jre.nio.IntBuffer) : Void {
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

    public override function glNormalPointer(type : Int, stride : Int, offset : Int) : Void {
        this.gl11.glNormalPointer(type, stride, offset);
    }

    public function glPointParameterf(pname : Int, param : Float) : Void {
        this.gl11.glPointParameterf(pname, param);
    }

    public function glPointParameterfv(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            this.glPointParameterfv_int_floatArray_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.glPointParameterfv_int_FloatBuffer(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glPointParameterfv");
    }

    public function glPointParameterfv_int_floatArray_int(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glPointParameterfv(pname, params, offset);
    }

    public function glPointParameterfv_int_FloatBuffer(pname : Int, params : jre.nio.FloatBuffer) : Void {
        this.gl11.glPointParameterfv(pname, params);
    }

    public override function glTexCoordPointer(size : Int, type : Int, stride : Int, offset : Int) : Void {
        this.gl11.glTexCoordPointer(size, type, stride, offset);
    }

    public function glTexEnvi(target : Int, pname : Int, param : Int) : Void {
        this.gl11.glTexEnvi(target, pname, param);
    }

    public function glTexEnviv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glTexEnviv_int_int_intArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glTexEnviv_int_int_IntBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glTexEnviv");
    }

    public function glTexEnviv_int_int_intArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glTexEnviv(target, pname, params, offset);
    }

    public function glTexEnviv_int_int_IntBuffer(target : Int, pname : Int, params : jre.nio.IntBuffer) : Void {
        this.gl11.glTexEnviv(target, pname, params);
    }

    public function glTexParameterfv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glTexParameterfv_int_int_floatArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glTexParameterfv_int_int_FloatBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glTexParameterfv");
    }

    public function glTexParameterfv_int_int_floatArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl11.glTexParameterfv(target, pname, params, offset);
    }

    public function glTexParameterfv_int_int_FloatBuffer(target : Int, pname : Int, params : jre.nio.FloatBuffer) : Void {
        this.gl11.glTexParameterfv(target, pname, params);
    }

    public override function glTexParameteri(target : Int, pname : Int, param : Int) : Void {
        this.gl11.glTexParameteri(target, pname, param);
    }

    public function glTexParameteriv(...args : Dynamic) : Dynamic {
        if (args.length == 4) {
            this.glTexParameteriv_int_int_intArray_int(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 3) {
            this.glTexParameteriv_int_int_IntBuffer(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: glTexParameteriv");
    }

    public function glTexParameteriv_int_int_intArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glTexParameteriv(target, pname, params, offset);
    }

    public function glTexParameteriv_int_int_IntBuffer(target : Int, pname : Int, params : jre.nio.IntBuffer) : Void {
        this.gl11.glTexParameteriv(target, pname, params);
    }

    public function glTexParameterxv(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl11.glTexParameteriv(target, pname, params, offset);
    }

    public override function glVertexPointer(size : Int, type : Int, stride : Int, offset : Int) : Void {
        this.gl11.glVertexPointer(size, type, stride, offset);
    }

}

