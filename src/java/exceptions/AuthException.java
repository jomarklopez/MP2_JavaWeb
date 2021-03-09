
package exceptions;

public class AuthException extends Exception {
    public AuthException(String errorMessage) {
        super(errorMessage);
    }
}
