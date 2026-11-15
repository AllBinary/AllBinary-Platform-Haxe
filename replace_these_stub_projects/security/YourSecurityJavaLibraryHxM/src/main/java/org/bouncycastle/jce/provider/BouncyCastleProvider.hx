// Generated Code Do Not Modify
package org.bouncycastle.jce.provider;

//import java.security.Provider;

class BouncyCastleProvider extends Provider {
    private static var info : String = "BouncyCastle Security Provider v1.41";
    public static var PROVIDER_NAME : String = "BC";
    public function new() {
        super(BouncyCastleProvider.PROVIDER_NAME, 1.41, BouncyCastleProvider.info);
    }

    public function setParameter(parameterName : String, parameter : Any) : Void {
    }

}

