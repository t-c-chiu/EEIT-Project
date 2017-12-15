package login;


import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson.JacksonFactory;

public class IdTokenVerifierAndParser {
    private static final String GOOGLE_CLIENT_ID = "281482587669-99chdrvlekaavehkf82g2c90kn2hs67m.apps.googleusercontent.com";

    public static GoogleIdToken.Payload getPayload (String tokenString) throws Exception {

        JacksonFactory jacksonFactory = new JacksonFactory();
        GoogleIdTokenVerifier googleIdTokenVerifier =
                            new GoogleIdTokenVerifier(new NetHttpTransport(), jacksonFactory);

        GoogleIdToken token = GoogleIdToken.parse(jacksonFactory, tokenString);

        if (googleIdTokenVerifier.verify(token)) {
            GoogleIdToken.Payload payLoad = token.getPayload();
            if (!GOOGLE_CLIENT_ID.equals(payLoad.getAudience())) {
                throw new IllegalArgumentException("Audience mismatch");
            } else if (!GOOGLE_CLIENT_ID.equals(payLoad.getAuthorizedParty())) {
                throw new IllegalArgumentException("Client ID mismatch");
            }
            return payLoad;
        } else {
            throw new IllegalArgumentException("id token cannot be verified");
        }
    }
}
