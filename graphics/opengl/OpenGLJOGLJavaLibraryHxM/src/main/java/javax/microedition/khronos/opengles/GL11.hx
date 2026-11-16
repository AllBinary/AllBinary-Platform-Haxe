// Generated Code Do Not Modify
package javax.microedition.khronos.opengles;


interface GL11 extends javax.microedition.khronos.opengles.GL10 {
    function glBindBuffer(target : Int, buffer : Int) : Void;

    function glBufferData(target : Int, size : Int, data : jre.nio.Buffer, usage : Int) : Void;

    function glBufferSubData(target : Int, offset : Int, size : Int, data : jre.nio.Buffer) : Void;

    function glClipPlanef(...args : Dynamic) : Dynamic;

    function glClipPlanef_int_floatArray_int(plane : Int, equation : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glClipPlanef_int_FloatBuffer(plane : Int, equation : jre.nio.FloatBuffer) : Void;

    function glColor4ub(red : Int, green : Int, blue : Int, alpha : Int) : Void;

    function glColorPointer(size : Int, type : Int, stride : Int, offset : Int) : Void;

    function glDeleteBuffers(...args : Dynamic) : Dynamic;

    function glDeleteBuffers_int_intArray_int(n : Int, buffers : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glDeleteBuffers_int_IntBuffer(n : Int, buffers : jre.nio.IntBuffer) : Void;

    function glDrawElements(mode : Int, count : Int, type : Int, offset : Int) : Void;

    function glGenBuffers(...args : Dynamic) : Dynamic;

    function glGenBuffers_int_intArray_int(n : Int, buffers : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glGenBuffers_int_IntBuffer(n : Int, buffers : jre.nio.IntBuffer) : Void;

    function glGetBufferParameteriv(...args : Dynamic) : Dynamic;

    function glGetBufferParameteriv_int_int_intArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glGetBufferParameteriv_int_int_IntBuffer(target : Int, pname : Int, params : jre.nio.IntBuffer) : Void;

    function glGetClipPlanef(...args : Dynamic) : Dynamic;

    function glGetClipPlanef_int_floatArray_int(pname : Int, eqn : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glGetClipPlanef_int_FloatBuffer(pname : Int, eqn : jre.nio.FloatBuffer) : Void;

    function glGetFloatv(...args : Dynamic) : Dynamic;

    function glGetFloatv_int_floatArray_int(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glGetFloatv_int_FloatBuffer(pname : Int, params : jre.nio.FloatBuffer) : Void;

    function glGetLightfv(...args : Dynamic) : Dynamic;

    function glGetLightfv_int_int_floatArray_int(light : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glGetLightfv_int_int_FloatBuffer(light : Int, pname : Int, params : jre.nio.FloatBuffer) : Void;

    function glGetMaterialfv(...args : Dynamic) : Dynamic;

    function glGetMaterialfv_int_int_floatArray_int(face : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glGetMaterialfv_int_int_FloatBuffer(face : Int, pname : Int, params : jre.nio.FloatBuffer) : Void;

    function glGetTexEnviv(...args : Dynamic) : Dynamic;

    function glGetTexEnviv_int_int_intArray_int(env : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glGetTexEnviv_int_int_IntBuffer(env : Int, pname : Int, params : jre.nio.IntBuffer) : Void;

    function glGetTexParameterfv(...args : Dynamic) : Dynamic;

    function glGetTexParameterfv_int_int_floatArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glGetTexParameterfv_int_int_FloatBuffer(target : Int, pname : Int, params : jre.nio.FloatBuffer) : Void;

    function glGetTexParameteriv(...args : Dynamic) : Dynamic;

    function glGetTexParameteriv_int_int_intArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glGetTexParameteriv_int_int_IntBuffer(target : Int, pname : Int, params : jre.nio.IntBuffer) : Void;

    function glIsBuffer(buffer : Int) : Bool;

    function glIsEnabled(cap : Int) : Bool;

    function glIsTexture(texture : Int) : Bool;

    function glNormalPointer(type : Int, stride : Int, offset : Int) : Void;

    function glPointParameterf(pname : Int, param : Float) : Void;

    function glPointParameterfv(...args : Dynamic) : Dynamic;

    function glPointParameterfv_int_floatArray_int(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glPointParameterfv_int_FloatBuffer(pname : Int, params : jre.nio.FloatBuffer) : Void;

    function glTexCoordPointer(size : Int, type : Int, stride : Int, offset : Int) : Void;

    function glTexEnvi(target : Int, pname : Int, param : Int) : Void;

    function glTexEnviv(...args : Dynamic) : Dynamic;

    function glTexEnviv_int_int_intArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glTexEnviv_int_int_IntBuffer(target : Int, pname : Int, params : jre.nio.IntBuffer) : Void;

    function glTexParameterfv(...args : Dynamic) : Dynamic;

    function glTexParameterfv_int_int_floatArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glTexParameterfv_int_int_FloatBuffer(target : Int, pname : Int, params : jre.nio.FloatBuffer) : Void;

    function glTexParameteri(target : Int, pname : Int, param : Int) : Void;

    function glTexParameteriv(...args : Dynamic) : Dynamic;

    function glTexParameteriv_int_int_intArray_int(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glTexParameteriv_int_int_IntBuffer(target : Int, pname : Int, params : jre.nio.IntBuffer) : Void;

    function glVertexPointer(size : Int, type : Int, stride : Int, offset : Int) : Void;

}

// Java interface constants of GL11
class GL11Fields {
    public static final GL_ACTIVE_TEXTURE : Int = 34016;
    public static final GL_ADD_SIGNED : Int = 34164;
    public static final GL_ALPHA_SCALE : Int = 3356;
    public static final GL_ALPHA_TEST_FUNC : Int = 3009;
    public static final GL_ALPHA_TEST_REF : Int = 3010;
    public static final GL_ARRAY_BUFFER : Int = 34962;
    public static final GL_ARRAY_BUFFER_BINDING : Int = 34964;
    public static final GL_BLEND_DST : Int = 3040;
    public static final GL_BLEND_SRC : Int = 3041;
    public static final GL_BUFFER_ACCESS : Int = 35003;
    public static final GL_BUFFER_SIZE : Int = 34660;
    public static final GL_BUFFER_USAGE : Int = 34661;
    public static final GL_CLIENT_ACTIVE_TEXTURE : Int = 34017;
    public static final GL_CLIP_PLANE0 : Int = 12288;
    public static final GL_CLIP_PLANE1 : Int = 12289;
    public static final GL_CLIP_PLANE2 : Int = 12290;
    public static final GL_CLIP_PLANE3 : Int = 12291;
    public static final GL_CLIP_PLANE4 : Int = 12292;
    public static final GL_CLIP_PLANE5 : Int = 12293;
    public static final GL_COLOR_ARRAY_BUFFER_BINDING : Int = 34968;
    public static final GL_COLOR_ARRAY_POINTER : Int = 32912;
    public static final GL_COLOR_ARRAY_SIZE : Int = 32897;
    public static final GL_COLOR_ARRAY_STRIDE : Int = 32899;
    public static final GL_COLOR_ARRAY_TYPE : Int = 32898;
    public static final GL_COLOR_CLEAR_VALUE : Int = 3106;
    public static final GL_COLOR_WRITEMASK : Int = 3107;
    public static final GL_COMBINE : Int = 34160;
    public static final GL_COMBINE_ALPHA : Int = 34162;
    public static final GL_COMBINE_RGB : Int = 34161;
    public static final GL_CONSTANT : Int = 34166;
    public static final GL_COORD_REPLACE_OES : Int = 34914;
    public static final GL_CULL_FACE_MODE : Int = 2885;
    public static final GL_CURRENT_COLOR : Int = 2816;
    public static final GL_CURRENT_NORMAL : Int = 2818;
    public static final GL_CURRENT_TEXTURE_COORDS : Int = 2819;
    public static final GL_DEPTH_CLEAR_VALUE : Int = 2931;
    public static final GL_DEPTH_FUNC : Int = 2932;
    public static final GL_DEPTH_RANGE : Int = 2928;
    public static final GL_DEPTH_WRITEMASK : Int = 2930;
    public static final GL_DOT3_RGB : Int = 34478;
    public static final GL_DOT3_RGBA : Int = 34479;
    public static final GL_DYNAMIC_DRAW : Int = 35048;
    public static final GL_ELEMENT_ARRAY_BUFFER : Int = 34963;
    public static final GL_ELEMENT_ARRAY_BUFFER_BINDING : Int = 34965;
    public static final GL_FRONT_FACE : Int = 2886;
    public static final GL_GENERATE_MIPMAP : Int = 33169;
    public static final GL_GENERATE_MIPMAP_HINT : Int = 33170;
    public static final GL_INTERPOLATE : Int = 34165;
    public static final GL_LINE_WIDTH : Int = 2849;
    public static final GL_LOGIC_OP_MODE : Int = 3056;
    public static final GL_MATRIX_MODE : Int = 2976;
    public static final GL_MAX_CLIP_PLANES : Int = 3378;
    public static final GL_MODELVIEW_MATRIX : Int = 2982;
    public static final GL_MODELVIEW_MATRIX_FLOAT_AS_INT_BITS_OES : Int = 35213;
    public static final GL_MODELVIEW_STACK_DEPTH : Int = 2979;
    public static final GL_NORMAL_ARRAY_BUFFER_BINDING : Int = 34967;
    public static final GL_NORMAL_ARRAY_POINTER : Int = 32911;
    public static final GL_NORMAL_ARRAY_STRIDE : Int = 32895;
    public static final GL_NORMAL_ARRAY_TYPE : Int = 32894;
    public static final GL_OPERAND0_ALPHA : Int = 34200;
    public static final GL_OPERAND0_RGB : Int = 34192;
    public static final GL_OPERAND1_ALPHA : Int = 34201;
    public static final GL_OPERAND1_RGB : Int = 34193;
    public static final GL_OPERAND2_ALPHA : Int = 34202;
    public static final GL_OPERAND2_RGB : Int = 34194;
    public static final GL_POINT_DISTANCE_ATTENUATION : Int = 33065;
    public static final GL_POINT_FADE_THRESHOLD_SIZE : Int = 33064;
    public static final GL_POINT_SIZE : Int = 2833;
    public static final GL_POINT_SIZE_ARRAY_BUFFER_BINDING_OES : Int = 35743;
    public static final GL_POINT_SIZE_ARRAY_OES : Int = 35740;
    public static final GL_POINT_SIZE_ARRAY_POINTER_OES : Int = 35212;
    public static final GL_POINT_SIZE_ARRAY_STRIDE_OES : Int = 35211;
    public static final GL_POINT_SIZE_ARRAY_TYPE_OES : Int = 35210;
    public static final GL_POINT_SIZE_MAX : Int = 33063;
    public static final GL_POINT_SIZE_MIN : Int = 33062;
    public static final GL_POINT_SPRITE_OES : Int = 34913;
    public static final GL_POLYGON_OFFSET_FACTOR : Int = 32824;
    public static final GL_POLYGON_OFFSET_UNITS : Int = 10752;
    public static final GL_PREVIOUS : Int = 34168;
    public static final GL_PRIMARY_COLOR : Int = 34167;
    public static final GL_PROJECTION_MATRIX : Int = 2983;
    public static final GL_PROJECTION_MATRIX_FLOAT_AS_INT_BITS_OES : Int = 35214;
    public static final GL_PROJECTION_STACK_DEPTH : Int = 2980;
    public static final GL_RGB_SCALE : Int = 34163;
    public static final GL_SAMPLE_BUFFERS : Int = 32936;
    public static final GL_SAMPLE_COVERAGE_INVERT : Int = 32939;
    public static final GL_SAMPLE_COVERAGE_VALUE : Int = 32938;
    public static final GL_SAMPLES : Int = 32937;
    public static final GL_SCISSOR_BOX : Int = 3088;
    public static final GL_SHADE_MODEL : Int = 2900;
    public static final GL_SRC0_ALPHA : Int = 34184;
    public static final GL_SRC0_RGB : Int = 34176;
    public static final GL_SRC1_ALPHA : Int = 34185;
    public static final GL_SRC1_RGB : Int = 34177;
    public static final GL_SRC2_ALPHA : Int = 34186;
    public static final GL_SRC2_RGB : Int = 34178;
    public static final GL_STATIC_DRAW : Int = 35044;
    public static final GL_STENCIL_CLEAR_VALUE : Int = 2961;
    public static final GL_STENCIL_FAIL : Int = 2964;
    public static final GL_STENCIL_FUNC : Int = 2962;
    public static final GL_STENCIL_PASS_DEPTH_FAIL : Int = 2965;
    public static final GL_STENCIL_PASS_DEPTH_PASS : Int = 2966;
    public static final GL_STENCIL_REF : Int = 2967;
    public static final GL_STENCIL_VALUE_MASK : Int = 2963;
    public static final GL_STENCIL_WRITEMASK : Int = 2968;
    public static final GL_SUBTRACT : Int = 34023;
    public static final GL_TEXTURE_BINDING_2D : Int = 32873;
    public static final GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING : Int = 34970;
    public static final GL_TEXTURE_COORD_ARRAY_POINTER : Int = 32914;
    public static final GL_TEXTURE_COORD_ARRAY_SIZE : Int = 32904;
    public static final GL_TEXTURE_COORD_ARRAY_STRIDE : Int = 32906;
    public static final GL_TEXTURE_COORD_ARRAY_TYPE : Int = 32905;
    public static final GL_TEXTURE_MATRIX : Int = 2984;
    public static final GL_TEXTURE_MATRIX_FLOAT_AS_INT_BITS_OES : Int = 35215;
    public static final GL_TEXTURE_STACK_DEPTH : Int = 2981;
    public static final GL_VERTEX_ARRAY_BUFFER_BINDING : Int = 34966;
    public static final GL_VERTEX_ARRAY_POINTER : Int = 32910;
    public static final GL_VERTEX_ARRAY_SIZE : Int = 32890;
    public static final GL_VERTEX_ARRAY_STRIDE : Int = 32892;
    public static final GL_VERTEX_ARRAY_TYPE : Int = 32891;
    public static final GL_VIEWPORT : Int = 2978;
    public static final GL_WRITE_ONLY : Int = 35001;
}

