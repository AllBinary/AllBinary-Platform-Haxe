// Generated Code Do Not Modify
package javax.microedition.khronos.opengles;

//import java.nio.Buffer;
//import java.nio.FloatBuffer;
//import java.nio.IntBuffer;

interface GL10 extends GL {
    function glActiveTexture(texture : Int) : Void;

    function glAlphaFunc(func : Int, ref : Float) : Void;

    function glBindTexture(target : Int, texture : Int) : Void;

    function glBlendFunc(sfactor : Int, dfactor : Int) : Void;

    function glClear(mask : Int) : Void;

    function glClearColor(red : Float, green : Float, blue : Float, alpha : Float) : Void;

    function glClearDepthf(depth : Float) : Void;

    function glClearStencil(s : Int) : Void;

    function glClientActiveTexture(texture : Int) : Void;

    function glColor4f(red : Float, green : Float, blue : Float, alpha : Float) : Void;

    function glColorMask(red : Bool, green : Bool, blue : Bool, alpha : Bool) : Void;

    function glColorPointer(size : Int, type : Int, stride : Int, pointer : Buffer) : Void;

    function glCompressedTexImage2D(target : Int, level : Int, internalformat : Int, width : Int, height : Int, border : Int, imageSize : Int, data : Buffer) : Void;

    function glCompressedTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, width : Int, height : Int, format : Int, imageSize : Int, data : Buffer) : Void;

    function glCopyTexImage2D(target : Int, level : Int, internalformat : Int, x : Int, y : Int, width : Int, height : Int, border : Int) : Void;

    function glCopyTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, x : Int, y : Int, width : Int, height : Int) : Void;

    function glCullFace(mode : Int) : Void;

    function glDeleteTextures(...args : Dynamic) : Dynamic;

    function glDeleteTextures_int_intArray_int(n : Int, textures : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glDeleteTextures_int_IntBuffer(n : Int, textures : IntBuffer) : Void;

    function glDepthFunc(func : Int) : Void;

    function glDepthMask(flag : Bool) : Void;

    function glDepthRangef(zNear : Float, zFar : Float) : Void;

    function glDisable(cap : Int) : Void;

    function glDisableClientState(array : Int) : Void;

    function glDrawArrays(mode : Int, first : Int, count : Int) : Void;

    function glDrawElements(mode : Int, count : Int, type : Int, indices : Buffer) : Void;

    function glEnable(cap : Int) : Void;

    function glEnableClientState(array : Int) : Void;

    function glFinish() : Void;

    function glFlush() : Void;

    function glFogf(pname : Int, param : Float) : Void;

    function glFogfv(...args : Dynamic) : Dynamic;

    function glFogfv_int_floatArray_int(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glFogfv_int_FloatBuffer(pname : Int, params : FloatBuffer) : Void;

    function glFrontFace(mode : Int) : Void;

    function glFrustumf(left : Float, right : Float, bottom : Float, top : Float, zNear : Float, zFar : Float) : Void;

    function glGenTextures(...args : Dynamic) : Dynamic;

    function glGenTextures_int_intArray_int(n : Int, textures : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glGenTextures_int_IntBuffer(n : Int, textures : IntBuffer) : Void;

    function glGetError() : Int;

    function glGetIntegerv(...args : Dynamic) : Dynamic;

    function glGetIntegerv_int_intArray_int(pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glGetIntegerv_int_IntBuffer(pname : Int, params : IntBuffer) : Void;

    function glGetString(name : Int) : String;

    function glHint(target : Int, mode : Int) : Void;

    function glLightModelf(pname : Int, param : Float) : Void;

    function glLightModelfv(...args : Dynamic) : Dynamic;

    function glLightModelfv_int_floatArray_int(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glLightModelfv_int_FloatBuffer(pname : Int, params : FloatBuffer) : Void;

    function glLightf(light : Int, pname : Int, param : Float) : Void;

    function glLightfv(...args : Dynamic) : Dynamic;

    function glLightfv_int_int_floatArray_int(light : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glLightfv_int_int_FloatBuffer(light : Int, pname : Int, params : FloatBuffer) : Void;

    function glLineWidth(width : Float) : Void;

    function glLoadIdentity() : Void;

    function glLoadMatrixf(...args : Dynamic) : Dynamic;

    function glLoadMatrixf_floatArray_int(m : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glLoadMatrixf_FloatBuffer(m : FloatBuffer) : Void;

    function glLogicOp(opcode : Int) : Void;

    function glMaterialf(face : Int, pname : Int, param : Float) : Void;

    function glMaterialfv(...args : Dynamic) : Dynamic;

    function glMaterialfv_int_int_floatArray_int(face : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glMaterialfv_int_int_FloatBuffer(face : Int, pname : Int, params : FloatBuffer) : Void;

    function glMatrixMode(mode : Int) : Void;

    function glMultMatrixf(...args : Dynamic) : Dynamic;

    function glMultMatrixf_floatArray_int(m : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glMultMatrixf_FloatBuffer(m : FloatBuffer) : Void;

    function glMultiTexCoord4f(target : Int, s : Float, t : Float, r : Float, q : Float) : Void;

    function glNormal3f(nx : Float, ny : Float, nz : Float) : Void;

    function glNormalPointer(type : Int, stride : Int, pointer : Buffer) : Void;

    function glOrthof(left : Float, right : Float, bottom : Float, top : Float, zNear : Float, zFar : Float) : Void;

    function glPixelStorei(pname : Int, param : Int) : Void;

    function glPointSize(size : Float) : Void;

    function glPolygonOffset(factor : Float, units : Float) : Void;

    function glPopMatrix() : Void;

    function glPushMatrix() : Void;

    function glReadPixels(x : Int, y : Int, width : Int, height : Int, format : Int, type : Int, pixels : Buffer) : Void;

    function glRotatef(angle : Float, x : Float, y : Float, z : Float) : Void;

    function glRotatex(angle : Int, x : Int, y : Int, z : Int) : Void;

    function glSampleCoverage(value : Float, invert : Bool) : Void;

    function glScalef(x : Float, y : Float, z : Float) : Void;

    function glScalex(x : Int, y : Int, z : Int) : Void;

    function glScissor(x : Int, y : Int, width : Int, height : Int) : Void;

    function glShadeModel(mode : Int) : Void;

    function glStencilFunc(func : Int, ref : Int, mask : Int) : Void;

    function glStencilMask(mask : Int) : Void;

    function glStencilOp(fail : Int, zfail : Int, zpass : Int) : Void;

    function glTexCoordPointer(size : Int, type : Int, stride : Int, pointer : Buffer) : Void;

    function glTexEnvf(target : Int, pname : Int, param : Float) : Void;

    function glTexEnvfv(...args : Dynamic) : Dynamic;

    function glTexEnvfv_int_int_floatArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glTexEnvfv_int_int_FloatBuffer(target : Int, pname : Int, params : FloatBuffer) : Void;

    function glTexImage2D(target : Int, level : Int, internalformat : Int, width : Int, height : Int, border : Int, format : Int, type : Int, pixels : Buffer) : Void;

    function glTexParameterf(target : Int, pname : Int, param : Float) : Void;

    function glTexParameteri(target : Int, pname : Int, param : Int) : Void;

    function glTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, width : Int, height : Int, format : Int, type : Int, pixels : Buffer) : Void;

    function glTranslatef(x : Float, y : Float, z : Float) : Void;

    function glVertexPointer(size : Int, type : Int, stride : Int, pointer : Buffer) : Void;

    function glViewport(x : Int, y : Int, width : Int, height : Int) : Void;

    function glBegin(i : Int) : Void;

    function glEnd() : Void;

    function glVertex3f(f : Float, f2 : Float, f3 : Float) : Void;

    function glPolygonMode(i : Int, i1 : Int) : Void;

}

// Java interface constants of GL10
class GL10Fields {
    public static final GL_ADD : Int = 260;
    public static final GL_ALIASED_LINE_WIDTH_RANGE : Int = 33902;
    public static final GL_ALIASED_POINT_SIZE_RANGE : Int = 33901;
    public static final GL_ALPHA : Int = 6406;
    public static final GL_ALPHA_BITS : Int = 3413;
    public static final GL_ALPHA_TEST : Int = 3008;
    public static final GL_ALWAYS : Int = 519;
    public static final GL_AMBIENT : Int = 4608;
    public static final GL_AMBIENT_AND_DIFFUSE : Int = 5634;
    public static final GL_AND : Int = 5377;
    public static final GL_AND_INVERTED : Int = 5380;
    public static final GL_AND_REVERSE : Int = 5378;
    public static final GL_BACK : Int = 1029;
    public static final GL_BLEND : Int = 3042;
    public static final GL_BLUE_BITS : Int = 3412;
    public static final GL_BYTE : Int = 5120;
    public static final GL_CCW : Int = 2305;
    public static final GL_CLAMP_TO_EDGE : Int = 33071;
    public static final GL_CLEAR : Int = 5376;
    public static final GL_COLOR_ARRAY : Int = 32886;
    public static final GL_COLOR_BUFFER_BIT : Int = 16384;
    public static final GL_COLOR_LOGIC_OP : Int = 3058;
    public static final GL_COLOR_MATERIAL : Int = 2903;
    public static final GL_COMPRESSED_TEXTURE_FORMATS : Int = 34467;
    public static final GL_CONSTANT_ATTENUATION : Int = 4615;
    public static final GL_COPY : Int = 5379;
    public static final GL_COPY_INVERTED : Int = 5388;
    public static final GL_CULL_FACE : Int = 2884;
    public static final GL_CW : Int = 2304;
    public static final GL_DECAL : Int = 8449;
    public static final GL_DECR : Int = 7683;
    public static final GL_DEPTH_BITS : Int = 3414;
    public static final GL_DEPTH_BUFFER_BIT : Int = 256;
    public static final GL_DEPTH_TEST : Int = 2929;
    public static final GL_DIFFUSE : Int = 4609;
    public static final GL_DITHER : Int = 3024;
    public static final GL_DONT_CARE : Int = 4352;
    public static final GL_DST_ALPHA : Int = 772;
    public static final GL_DST_COLOR : Int = 774;
    public static final GL_EMISSION : Int = 5632;
    public static final GL_EQUAL : Int = 514;
    public static final GL_EQUIV : Int = 5385;
    public static final GL_EXP : Int = 2048;
    public static final GL_EXP2 : Int = 2049;
    public static final GL_EXTENSIONS : Int = 7939;
    public static final GL_FALSE : Int = 0;
    public static final GL_FASTEST : Int = 4353;
    public static final GL_FIXED : Int = 5132;
    public static final GL_FLAT : Int = 7424;
    public static final GL_FLOAT : Int = 5126;
    public static final GL_FOG : Int = 2912;
    public static final GL_FOG_COLOR : Int = 2918;
    public static final GL_FOG_DENSITY : Int = 2914;
    public static final GL_FOG_END : Int = 2916;
    public static final GL_FOG_HINT : Int = 3156;
    public static final GL_FOG_MODE : Int = 2917;
    public static final GL_FOG_START : Int = 2915;
    public static final GL_FRONT : Int = 1028;
    public static final GL_FRONT_AND_BACK : Int = 1032;
    public static final GL_GEQUAL : Int = 518;
    public static final GL_GREATER : Int = 516;
    public static final GL_GREEN_BITS : Int = 3411;
    public static final GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES : Int = 35739;
    public static final GL_IMPLEMENTATION_COLOR_READ_TYPE_OES : Int = 35738;
    public static final GL_INCR : Int = 7682;
    public static final GL_INVALID_ENUM : Int = 1280;
    public static final GL_INVALID_OPERATION : Int = 1282;
    public static final GL_INVALID_VALUE : Int = 1281;
    public static final GL_INVERT : Int = 5386;
    public static final GL_KEEP : Int = 7680;
    public static final GL_LEQUAL : Int = 515;
    public static final GL_LESS : Int = 513;
    public static final GL_LIGHT_MODEL_AMBIENT : Int = 2899;
    public static final GL_LIGHT_MODEL_TWO_SIDE : Int = 2898;
    public static final GL_LIGHT0 : Int = 16384;
    public static final GL_LIGHT1 : Int = 16385;
    public static final GL_LIGHT2 : Int = 16386;
    public static final GL_LIGHT3 : Int = 16387;
    public static final GL_LIGHT4 : Int = 16388;
    public static final GL_LIGHT5 : Int = 16389;
    public static final GL_LIGHT6 : Int = 16390;
    public static final GL_LIGHT7 : Int = 16391;
    public static final GL_LIGHTING : Int = 2896;
    public static final GL_LINE_LOOP : Int = 2;
    public static final GL_LINE_SMOOTH : Int = 2848;
    public static final GL_LINE_SMOOTH_HINT : Int = 3154;
    public static final GL_LINE_STRIP : Int = 3;
    public static final GL_LINEAR : Int = 9729;
    public static final GL_LINEAR_ATTENUATION : Int = 4616;
    public static final GL_LINEAR_MIPMAP_LINEAR : Int = 9987;
    public static final GL_LINEAR_MIPMAP_NEAREST : Int = 9985;
    public static final GL_LINES : Int = 1;
    public static final GL_LUMINANCE : Int = 6409;
    public static final GL_LUMINANCE_ALPHA : Int = 6410;
    public static final GL_MAX_ELEMENTS_INDICES : Int = 33001;
    public static final GL_MAX_ELEMENTS_VERTICES : Int = 33000;
    public static final GL_MAX_LIGHTS : Int = 3377;
    public static final GL_MAX_MODELVIEW_STACK_DEPTH : Int = 3382;
    public static final GL_MAX_PROJECTION_STACK_DEPTH : Int = 3384;
    public static final GL_MAX_TEXTURE_SIZE : Int = 3379;
    public static final GL_MAX_TEXTURE_STACK_DEPTH : Int = 3385;
    public static final GL_MAX_TEXTURE_UNITS : Int = 34018;
    public static final GL_MAX_VIEWPORT_DIMS : Int = 3386;
    public static final GL_MODELVIEW : Int = 5888;
    public static final GL_MODULATE : Int = 8448;
    public static final GL_MULTISAMPLE : Int = 32925;
    public static final GL_NAND : Int = 5390;
    public static final GL_NEAREST : Int = 9728;
    public static final GL_NEAREST_MIPMAP_LINEAR : Int = 9986;
    public static final GL_NEAREST_MIPMAP_NEAREST : Int = 9984;
    public static final GL_NEVER : Int = 512;
    public static final GL_NICEST : Int = 4354;
    public static final GL_NO_ERROR : Int = 0;
    public static final GL_NOOP : Int = 5381;
    public static final GL_NOR : Int = 5384;
    public static final GL_NORMAL_ARRAY : Int = 32885;
    public static final GL_NORMALIZE : Int = 2977;
    public static final GL_NOTEQUAL : Int = 517;
    public static final GL_NUM_COMPRESSED_TEXTURE_FORMATS : Int = 34466;
    public static final GL_ONE : Int = 1;
    public static final GL_ONE_MINUS_DST_ALPHA : Int = 773;
    public static final GL_ONE_MINUS_DST_COLOR : Int = 775;
    public static final GL_ONE_MINUS_SRC_ALPHA : Int = 771;
    public static final GL_ONE_MINUS_SRC_COLOR : Int = 769;
    public static final GL_OR : Int = 5383;
    public static final GL_OR_INVERTED : Int = 5389;
    public static final GL_OR_REVERSE : Int = 5387;
    public static final GL_OUT_OF_MEMORY : Int = 1285;
    public static final GL_PACK_ALIGNMENT : Int = 3333;
    public static final GL_PALETTE4_R5_G6_B5_OES : Int = 35730;
    public static final GL_PALETTE4_RGB5_A1_OES : Int = 35732;
    public static final GL_PALETTE4_RGB8_OES : Int = 35728;
    public static final GL_PALETTE4_RGBA4_OES : Int = 35731;
    public static final GL_PALETTE4_RGBA8_OES : Int = 35729;
    public static final GL_PALETTE8_R5_G6_B5_OES : Int = 35735;
    public static final GL_PALETTE8_RGB5_A1_OES : Int = 35737;
    public static final GL_PALETTE8_RGB8_OES : Int = 35733;
    public static final GL_PALETTE8_RGBA4_OES : Int = 35736;
    public static final GL_PALETTE8_RGBA8_OES : Int = 35734;
    public static final GL_PERSPECTIVE_CORRECTION_HINT : Int = 3152;
    public static final GL_POINT_SMOOTH : Int = 2832;
    public static final GL_POINT_SMOOTH_HINT : Int = 3153;
    public static final GL_POINTS : Int = 0;
    public static final GL_POINT_FADE_THRESHOLD_SIZE : Int = 33064;
    public static final GL_POINT_SIZE : Int = 2833;
    public static final GL_POLYGON_OFFSET_FILL : Int = 32823;
    public static final GL_POLYGON_SMOOTH_HINT : Int = 3155;
    public static final GL_POSITION : Int = 4611;
    public static final GL_PROJECTION : Int = 5889;
    public static final GL_QUADRATIC_ATTENUATION : Int = 4617;
    public static final GL_RED_BITS : Int = 3410;
    public static final GL_RENDERER : Int = 7937;
    public static final GL_REPEAT : Int = 10497;
    public static final GL_REPLACE : Int = 7681;
    public static final GL_RESCALE_NORMAL : Int = 32826;
    public static final GL_RGB : Int = 6407;
    public static final GL_RGBA : Int = 6408;
    public static final GL_SAMPLE_ALPHA_TO_COVERAGE : Int = 32926;
    public static final GL_SAMPLE_ALPHA_TO_ONE : Int = 32927;
    public static final GL_SAMPLE_COVERAGE : Int = 32928;
    public static final GL_SCISSOR_TEST : Int = 3089;
    public static final GL_SET : Int = 5391;
    public static final GL_SHININESS : Int = 5633;
    public static final GL_SHORT : Int = 5122;
    public static final GL_SMOOTH : Int = 7425;
    public static final GL_SMOOTH_LINE_WIDTH_RANGE : Int = 2850;
    public static final GL_SMOOTH_POINT_SIZE_RANGE : Int = 2834;
    public static final GL_SPECULAR : Int = 4610;
    public static final GL_SPOT_CUTOFF : Int = 4614;
    public static final GL_SPOT_DIRECTION : Int = 4612;
    public static final GL_SPOT_EXPONENT : Int = 4613;
    public static final GL_SRC_ALPHA : Int = 770;
    public static final GL_SRC_ALPHA_SATURATE : Int = 776;
    public static final GL_SRC_COLOR : Int = 768;
    public static final GL_STACK_OVERFLOW : Int = 1283;
    public static final GL_STACK_UNDERFLOW : Int = 1284;
    public static final GL_STENCIL_BITS : Int = 3415;
    public static final GL_STENCIL_BUFFER_BIT : Int = 1024;
    public static final GL_STENCIL_TEST : Int = 2960;
    public static final GL_SUBPIXEL_BITS : Int = 3408;
    public static final GL_TEXTURE : Int = 5890;
    public static final GL_TEXTURE_2D : Int = 3553;
    public static final GL_TEXTURE_COORD_ARRAY : Int = 32888;
    public static final GL_TEXTURE_ENV : Int = 8960;
    public static final GL_TEXTURE_ENV_COLOR : Int = 8705;
    public static final GL_TEXTURE_ENV_MODE : Int = 8704;
    public static final GL_TEXTURE_MAG_FILTER : Int = 10240;
    public static final GL_TEXTURE_MIN_FILTER : Int = 10241;
    public static final GL_TEXTURE_WRAP_S : Int = 10242;
    public static final GL_TEXTURE_WRAP_T : Int = 10243;
    public static final GL_TEXTURE0 : Int = 33984;
    public static final GL_TEXTURE1 : Int = 33985;
    public static final GL_TEXTURE2 : Int = 33986;
    public static final GL_TEXTURE3 : Int = 33987;
    public static final GL_TEXTURE4 : Int = 33988;
    public static final GL_TEXTURE5 : Int = 33989;
    public static final GL_TEXTURE6 : Int = 33990;
    public static final GL_TEXTURE7 : Int = 33991;
    public static final GL_TEXTURE8 : Int = 33992;
    public static final GL_TEXTURE9 : Int = 33993;
    public static final GL_TEXTURE10 : Int = 33994;
    public static final GL_TEXTURE11 : Int = 33995;
    public static final GL_TEXTURE12 : Int = 33996;
    public static final GL_TEXTURE13 : Int = 33997;
    public static final GL_TEXTURE14 : Int = 33998;
    public static final GL_TEXTURE15 : Int = 33999;
    public static final GL_TEXTURE16 : Int = 34000;
    public static final GL_TEXTURE17 : Int = 34001;
    public static final GL_TEXTURE18 : Int = 34002;
    public static final GL_TEXTURE19 : Int = 34003;
    public static final GL_TEXTURE20 : Int = 34004;
    public static final GL_TEXTURE21 : Int = 34005;
    public static final GL_TEXTURE22 : Int = 34006;
    public static final GL_TEXTURE23 : Int = 34007;
    public static final GL_TEXTURE24 : Int = 34008;
    public static final GL_TEXTURE25 : Int = 34009;
    public static final GL_TEXTURE26 : Int = 34010;
    public static final GL_TEXTURE27 : Int = 34011;
    public static final GL_TEXTURE28 : Int = 34012;
    public static final GL_TEXTURE29 : Int = 34013;
    public static final GL_TEXTURE30 : Int = 34014;
    public static final GL_TEXTURE31 : Int = 34015;
    public static final GL_TRIANGLE_FAN : Int = 6;
    public static final GL_TRIANGLE_STRIP : Int = 5;
    public static final GL_TRIANGLES : Int = 4;
    public static final GL_TRUE : Int = 1;
    public static final GL_UNPACK_ALIGNMENT : Int = 3317;
    public static final GL_UNSIGNED_BYTE : Int = 5121;
    public static final GL_UNSIGNED_SHORT : Int = 5123;
    public static final GL_UNSIGNED_SHORT_4_4_4_4 : Int = 32819;
    public static final GL_UNSIGNED_SHORT_5_5_5_1 : Int = 32820;
    public static final GL_UNSIGNED_SHORT_5_6_5 : Int = 33635;
    public static final GL_VENDOR : Int = 7936;
    public static final GL_VERSION : Int = 7938;
    public static final GL_VERTEX_ARRAY : Int = 32884;
    public static final GL_XOR : Int = 5382;
    public static final GL_ZERO : Int = 0;
}

