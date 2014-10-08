/**
 * Created by abrashkin on 08.10.14.
 */
package {
import com.hurlant.math.BigInteger;

import flash.display.Sprite;

public class Application extends Sprite {

    private var g       : BigInteger;
    private var p       : BigInteger;
    private var nAlice  : BigInteger;
    private var nBob    : BigInteger;

    public function Application() {

        g       = new BigInteger("3");
        p       = new BigInteger("7221152031991558322935568090317202983"); //128 bit
        nAlice  = new BigInteger("7221152031991555862935568090317202983");//128 bit
        nBob    = new BigInteger("7269152031991555862935568090317202643"); //128 bit

        var secretKeyBob:BigInteger   = getSecretKeyBob( nAlice );
        var secretKeyAlice:BigInteger = getSecretKeyAlice( nBob );

        trace( "result:", secretKeyBob, secretKeyAlice );
    }

    public function getModifyKeyBob( numberBob:BigInteger ):BigInteger{
        return g.modPow( nBob, p );
    }

    public function getModifyKeyAlice( numberAlice:BigInteger ):BigInteger{
        return g.modPow( nAlice, p );
    }

    public function getSecretKeyAlice( nBob:BigInteger ):BigInteger{
        return getModifyKeyAlice(nAlice).modPow( nBob, p);
    }

    public function getSecretKeyBob( nAlice:BigInteger ):BigInteger{
        return getModifyKeyBob(nBob).modPow( nAlice, p);
    }

    public function testGetSecretKeyAlice():void{
        var res1 : BigInteger = g.modPow( nBob, p );
        var res2 : BigInteger = g.modPow( nAlice, p );

        trace( res1, res2 );
        trace( res2.modPow( nBob, p ) );
        trace( res1.modPow( nAlice, p ) );
    }


}
}
